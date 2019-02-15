/**
 * @file 	get_1000_windows.c
 * @author	Anthony Schluchin
 * @date	21st January 2019
 * @version 0.0
 */


#include "get_15_windows.h"

/**************** Extern global variables ****************/
/*********************************************************/
/** @brief Array containing registers of AXI-lite */
extern int* regptr;
/** @brief Flag raised when AXI-DMA has an error */
extern volatile bool flag_axidma_error;
/** @brief Flag raised when AXI-DMA has finished an transfer, in OnDemand mode */
extern volatile bool flag_axidma_rx_done;
/** @brief Array containing the pedestal correction for every sample */
extern uint16_t pedestal[512][16][32];
/** @brief Buffer used to send the data (50 bytes above it reserved for protocol header) */
extern char* frame_buf;
/** @brief Lookup table to correct the transfer function */
extern uint16_t lookup_table[2048];
/** @brief Flag raised when the Triple Timer Counter overflows */
extern volatile bool flag_ttcps_timer;
/** @brief Flag raised when the SCU timer overflows*/
extern volatile bool flag_scu_timer;
/** @brief Instance of the device watchdog */
extern XScuWdt WdtScuInstance;

/****************************************************************************/
/**
* @brief	Recover 20 consecutive windows and send them to the computer
*
* @param	-
*
* @return	XST_SUCCESS or XST_FAILURE (defined in xstatus.h)
*
* @note		-
*
****************************************************************************/
int get_15_windows_fct(void){
	int window_start, window_nbr;
	int timeout;
	int window,i,j,index;
	uint16_t data_tmp;

	/* Create an element for the DMA */
	data_list* tmp_ptr  = (data_list *)malloc(sizeof(data_list));
	if(!tmp_ptr){
		printf("malloc for tmp_ptr failed in function, %s!\r\n", __func__);
		return XST_FAILURE;
	}
	tmp_ptr->next = NULL;
	tmp_ptr->previous = NULL;

	/* First window */
	window_start = 0;
	/* Number of windows */
	window_nbr = 15;

	/* Give the element's address to the DMA */
	XAxiDma_SimpleTransfer_hm((UINTPTR)tmp_ptr->data.data_array, SIZE_DATA_ARRAY_BYT);

	/* Initiate transfer and measure */
	regptr[TC_FSTWINDOW_REG] = window_start;
	regptr[TC_NBRWINDOW_REG] = window_nbr;
	ControlRegisterWrite(SMODE_MASK ,ENABLE);
	ControlRegisterWrite(SS_TPG_MASK ,ENABLE);
	ControlRegisterWrite(WINDOW_MASK,ENABLE);
	usleep(50);
	ControlRegisterWrite(WINDOW_MASK,DISABLE); // PL side starts on falling edge

	for(window =0; window<window_nbr; window++){
		if(window != 0) XAxiDma_SimpleTransfer_hm((UINTPTR)tmp_ptr->data.data_array, SIZE_DATA_ARRAY_BYT);

		/* Wait on DMA transfer to be done */
		timeout = 200000; // Timeout of 10 sec
		do{
			/* If needed, update timefile */
			if(flag_ttcps_timer){
				update_timefile();
				flag_ttcps_timer = false;
			}

			/* If needed, reload watchdog's counter */
			if(flag_scu_timer){
				XScuWdt_RestartWdt(&WdtScuInstance);
				flag_scu_timer = false;
			}

			/* The DMA had a problem */
			if(flag_axidma_error){
				printf("Error with DMA interrupt: TPG !\r\n");
				return XST_FAILURE;
			}

			usleep(50);
			timeout--;
		}while(timeout && !flag_axidma_rx_done);

		/* Update the cache with the data written by the DMA */
		Xil_DCacheInvalidateRange((UINTPTR)tmp_ptr->data.data_array, SIZE_DATA_ARRAY_BYT);

		/* DMA did not respond */
		if(timeout <= 0){
			printf("\r\nwindow = %d\r\n", window);
			printf("wdo_time: %d\r\n", (uint)tmp_ptr->data.data_struct.wdo_time);
			printf("PL_spare: %d\r\n", (uint)tmp_ptr->data.data_struct.PL_spare);
			printf("info: 0x%X\r\n", (uint)tmp_ptr->data.data_struct.info);
			printf("wdo_id: %d\r\n", (uint)tmp_ptr->data.data_struct.wdo_id);
			for(j=0; j<32; j++){
				for(i=0; i<16; i++){
					printf("%d\t", (uint)tmp_ptr->data.data_struct.data[i][j]);
				}
				printf("\r\n");
			}
			printf("Timeout on window %d: get 20 windows failed!\r\n", window);
			return XST_FAILURE;
		}
		else flag_axidma_rx_done = false;

		/* Test the returned values */
		if(tmp_ptr->data.data_struct.wdo_id != window){
			printf("window id is wrong! window = %d | wdo_id = %d\r\n", window, (uint)tmp_ptr->data.data_struct.wdo_id);
			return XST_FAILURE;
		}
		else{
			/* If data valid, send them to computer */
			index = 0;
			frame_buf[index++] = 0x55;
			frame_buf[index++] = 0xAA;
			frame_buf[index++] = (char)window;
			frame_buf[index++] = (char)(window >> 8);
			//printf("\r\n window = %d\r\n",window);
			for(i=0; i<16; i++){
				for(j=0; j<32; j++){
					/* Pedestal subtraction */
					data_tmp = (uint16_t)(tmp_ptr->data.data_struct.data[i][j] + VPED_DIGITAL - pedestal[window][i][j]);
					/* Transfer function correction */
					if(data_tmp > 2047) data_tmp = 2047;
					frame_buf[index++] = (char)lookup_table[data_tmp];
					frame_buf[index++] = (char)(lookup_table[data_tmp] >> 8);
					//printf("%d ", lookup_table[data_tmp]);
				}
				//printf("\r\n");
			}
			//printf("\r\n");
			frame_buf[index++] = 0x33;
			frame_buf[index++] = 0xCC;
			transfer_data(frame_buf, index);
		}
		/* Release the DMA */
		ControlRegisterWrite(PSBUSY_MASK,DISABLE);
	}

	free(tmp_ptr);

	return XST_SUCCESS;
}

