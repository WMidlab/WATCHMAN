/**
 * @file 	pedestal.c
 * @author	Anthony Schluchin
 * @date	18th December 2018
 * @version 0.0
 */

#include "pedestal.h"

/**************** Extern global variables ****************/
/*********************************************************/
/** @brief Array containing registers of AXI-lite */
extern int* regptr;
/** @brief Array containing the pedestal correction for every sample */
extern uint16_t pedestal[512][16][32];
/** @brief Flag raised when AXI-DMA has an error */
extern volatile bool flag_axidma_error;
/** @brief Flag raised when AXI-DMA has finished an transfer, in OnDemand mode */
extern volatile bool flag_axidma_rx_done;
/** @brief Flag raised when the Triple Timer Counter overflows */
extern volatile bool flag_ttcps_timer;
/** @brief Flag raised when the SCU timer overflows*/
extern volatile bool flag_scu_timer;
/** @brief Instance of the device watchdog */
extern XScuWdt WdtScuInstance;

/****************************************************************************/
/**
* @brief	Calculate the pedestal value for every memory location in the TARGET C
*
* @param	-
*
* @return	XST_SUCCESS or XST_FAILURE (defined in xstatus.h)
*
* @note		-
*
****************************************************************************/
int init_pedestals(void){
	uint64_t sqr_val[2][16][32];
	double rms[2][16][32];
	uint32_t data[2][16][32];
	int window, window_index;
	int timeout;
	int i,j,count,pair;

	/* Create an element for the DMA */
	data_list* tmp_ptr  = (data_list *)malloc(sizeof(data_list));
	if(!tmp_ptr){
		printf("malloc for tmp_ptr failed in function, %s!\r\n", __func__);
		return XST_FAILURE;
	}
	tmp_ptr->next = NULL;
	tmp_ptr->previous = NULL;

	/* To avoid small offset problem , read window by pair, so the address change every time */
	for(window_index=0; window_index<512; window_index+=2){
		for(pair=0; pair<2; pair++){
			for(i=0; i<16; i++){
				for(j=0; j<32; j++){
					data[pair][i][j] = 0;
					sqr_val[pair][i][j] = 0;
				}
			}
		}
		for(count=0; count<10; count++){
			window = window_index;
			for(pair=0; pair<2; pair++){		// do the pedestal on pair of window to avoid the small offset
				window += pair;
				/* Give the element's address to the DMA */
				XAxiDma_SimpleTransfer_hm((UINTPTR)tmp_ptr->data.data_array, SIZE_DATA_ARRAY_BYT);

				/* Initiate transfer and measure */
				regptr[TC_FSTWINDOW_REG] = window;
				regptr[TC_NBRWINDOW_REG] = 1;
				ControlRegisterWrite(SMODE_MASK ,ENABLE);
				ControlRegisterWrite(SS_TPG_MASK ,ENABLE);
				ControlRegisterWrite(WINDOW_MASK,ENABLE);
				usleep(50);
				ControlRegisterWrite(WINDOW_MASK,DISABLE); // PL side starts on falling edge

				/* Wait on DMA transfer to be done */
				timeout = 200000; // 10sec
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
				}while(timeout && (!flag_axidma_rx_done));

				/* Update the cache with the data written by the DMA */
				Xil_DCacheInvalidateRange((UINTPTR)tmp_ptr->data.data_array, SIZE_DATA_ARRAY_BYT);

				/* DMA did not respond */
				if(timeout <= 0){
					if(flag_axidma_rx_done) xil_printf("done \r\n");
					printf("\r\nwindow = %d | count = %d\r\n", window, count);
					printf("wdo_time: %d\r\n", (uint)tmp_ptr->data.data_struct.wdo_time);
					printf("PL_spare: %d\r\n", (uint)tmp_ptr->data.data_struct.PL_spare);
					printf("info: 0x%X\r\n", (uint)tmp_ptr->data.data_struct.info);
					printf("wdo_id: %d\r\n", (uint)tmp_ptr->data.data_struct.wdo_id);
					for(j=1; j<32; j++){
						for(i=0; i<16; i++){
							printf("%d\t", (uint)tmp_ptr->data.data_struct.data[i][j]);
						}
						printf("\r\n");
					}
					printf("Timeout on window %d: pedestal initialization failed!\r\n", window);
					return XST_FAILURE;
				}
				else flag_axidma_rx_done = false;

				/* Test the returned values */
				if(tmp_ptr->data.data_struct.wdo_id != window){
					printf("window id is wrong! window = %d | wdo_id = %d | pair = %d | count = %d\r\n", window, (uint)tmp_ptr->data.data_struct.wdo_id, pair, count);
					return XST_FAILURE;
				}
				else{
					/* If data valid, calculate the average */
					for(i=0; i<16; i++){
						for(j=0; j<32; j++) {
							data[pair][i][j] += tmp_ptr->data.data_struct.data[i][j];
							sqr_val[pair][i][j] += tmp_ptr->data.data_struct.data[i][j]*tmp_ptr->data.data_struct.data[i][j];
						}
					}
				}
				/* Release the DMA */
				ControlRegisterWrite(PSBUSY_MASK,DISABLE);
			}
		}

		window = window_index;
		for(pair=0; pair<2; pair++){
			window += pair;
			for(i=0; i<16; i++){
				for(j=0; j<32; j++){
					/* Divide the average by 10 to have the pedestal value */
					pedestal[window][i][j]= data[pair][i][j]/10;
					sqr_val[pair][i][j] = sqr_val[pair][i][j]/10;
					rms[pair][i][j] = sqrt(sqr_val[pair][i][j] - (pedestal[window][i][j]*pedestal[window][i][j]));
					//printf("%d, ",pedestal[window][i][j]);
				}
			}
//			if(window == 0){
//				printf("RMS values\r\n");
//				for(j=0; j<32; j++){
//					for(i=0; i<16; i++) printf("%lf\t", rms[pair][i][j]);
//					printf("\r\n");
//				}
//			}
		}
	}
	free(tmp_ptr);

	return XST_SUCCESS;
}
