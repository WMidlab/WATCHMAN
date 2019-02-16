/**
 * @file 	axis_peripheral.c
 * @author	Anthony Schluchin
 * @date	24th October 2018
 * @version 0.0
 */

#include "axis_peripheral.h"

/**************** Extern global variables ****************/
/*********************************************************/
/** @brief Pointer on the first element of the list used in trigger mode */
extern data_list* first_element;
/** @brief Pointer on the last element of the list used in trigger mode */
extern data_list* last_element;
/** @brief Buffer used to send the data (50 bytes above it reserved for protocol header) */
extern char* frame_buf;
/** @brief Array containing registers of AXI-lite */
extern int* regptr;
/** @brief Flag raised when AXI-DMA has an error */
extern volatile bool flag_axidma_error;
/** @brief Flag raised when AXI-DMA has finished an transfer, in OnDemand mode */
extern volatile bool flag_axidma_rx_done;
/** @brief Flag true when the list is empty (first_element = last_element) */
extern volatile bool empty_flag;
/** @brief Flag raised when the Triple Timer Counter overflows */
extern volatile bool flag_ttcps_timer;
/** @brief Flag raised when the SCU timer overflows*/
extern volatile bool flag_scu_timer;
/** @brief Instance of the device watchdog */
extern XScuWdt WdtScuInstance;

/****************************************************************************/
/**
* @brief	Pass the address to the DMA device with the number of bytes asked
*
* @param	BuffAddr: pointer on array to return the data
* @param	LengthOfBytes: Number of bytes to write in array
*
* @return	-
*
* @note		-
*
****************************************************************************/
void XAxiDma_SimpleTransfer_hm(UINTPTR BuffAddr, int LengthOfBytes)
{
	uint32_t reg;

	/* Update the memory with the value in the cache */
	Xil_DCacheFlushRange(BuffAddr, LengthOfBytes);
	/* Pass the memory address to the DMA */
	XAxiDma_WriteReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET,XAXIDMA_DESTADDR_OFFSET, LOWER_32_BITS(BuffAddr));
	XAxiDma_WriteReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET,XAXIDMA_DESTADDR_MSB_OFFSET, 0);
	/* Enable the DMA */
	reg = XAxiDma_ReadReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET, XAXIDMA_CR_OFFSET);
	XAxiDma_WriteReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET,XAXIDMA_CR_OFFSET,reg | XAXIDMA_CR_RUNSTOP_MASK);
	/* Pass the size of the memory location which will start the DMA */
	XAxiDma_WriteReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET, XAXIDMA_BUFFLEN_OFFSET, LengthOfBytes);
}

/****************************************************************************/
/**
* @brief	Process a complete waveform received by the DMA in trigger mode
*
* @param	pmt: ID of the pmt which triggered a pulse
*
* @return	-
*
* @note		-
*
****************************************************************************/
void dma_received_data(int pmt){
	data_list* tmp_first_element;
	data_list* tmp_last_element;
	data_list* tmp_last_element_next;
	data_list* next_ele;
	data_list* prev_ele;
	uint32_t info, mask;
	bool flag = true;
	char nbr_wdo = 1;
	uint16_t data[32*MAX_WINDOW];
	int ch, length, i;
	features_ext features;

	tmp_first_element = first_element;
	/* look for the first element (window) of the waveform */
	while(flag){
		info = tmp_first_element->data.data_struct.info;
		mask = 0x1 << (TRIG_SHIFT+pmt);
		if((info & mask) != 0) flag = false;
		else tmp_first_element = tmp_first_element->next;
	}

	/* look for the last element (window) of the waveform */
	flag = true;
	tmp_last_element = tmp_first_element;
	while(flag){
		info = tmp_last_element->data.data_struct.info;
		mask = 0x1 << (LAST_SHIFT+pmt);
		if((info & mask) != 0) flag = false;
		else{
			nbr_wdo++;
			tmp_last_element = tmp_last_element->next;
		}
	}

	/* Apply pedestal and transfer function correction and regroup all the data in one array */
	ch = correct_data(data, pmt, nbr_wdo, &info, tmp_first_element);
	mask = 0x1 << (TOO_LONG_SHIFT+pmt);
	length = 32 * nbr_wdo;
	if((info & mask) != 0){
		/* Send full wave form */
		printf("send full waveform/r/n");
		length = length*2;
		frame_buf[0] = 0x55;
		frame_buf[1] = 0xAA;
		frame_buf[2] = (char)(length+15);
		frame_buf[3] = (char)((length+15) >> 8);
		frame_buf[4] = (FULL_WAVEFORM_ID << 7) + (nbr_wdo << 4) + (ch);
		for(i=0; i<8; i++) frame_buf[5+i] = (char)(tmp_first_element->data.data_struct.wdo_time >> i*8);
		for(i=0; i<length; i++){
			frame_buf[13+i] = (char)data[i/2];
			i++;
			frame_buf[13+i] = (char)((int)data[i/2] >> 8);
		}
		frame_buf[length+13] = 0x33;
		frame_buf[length+14] = 0xCC;
		transfer_data(frame_buf, (length+15));
	}
	else{
		/* Find amplitude and time, and send features extracted */
		extract_features(data, length, &features);
		printf("amplitude = %d | time = %f\r\n", features.amplitude, features.time.time_fl);
		frame_buf[0] = 0x55;
		frame_buf[1] = 0xAA;
		frame_buf[2] = 21;
		frame_buf[3] = 0;
		frame_buf[4] = (FEATURES_ID << 7) + (nbr_wdo << 4) + (ch);
		for(i=0; i<8; i++) frame_buf[5+i] = (char)(tmp_first_element->data.data_struct.wdo_time >> (i*8));
		frame_buf[13] = (char)features.amplitude;
		frame_buf[14] = (char)(features.amplitude >> 8);
		for(i=0; i<4; i++) frame_buf[15+i] = (char)(features.time.time_t >> (i*8));
		frame_buf[19] = 0x33;
		frame_buf[20] = 0xCC;
		transfer_data(frame_buf, 21);
	}

	/* Remove element of waveform processed, only if they are now useless */
	tmp_last_element_next = tmp_last_element->next;
	do{
		mask = ~((0x1 << (TRIG_SHIFT+pmt)) + (0x1 << (LAST_SHIFT+pmt)) + (0x1 << (TOO_LONG_SHIFT+pmt)));
		info = tmp_first_element->data.data_struct.info & mask;
		if(!(info & (MASK_INFO << TRIG_SHIFT))){
			/* if tmp_first_element == first_element */
			if (tmp_first_element->previous == NULL){
				/* Removing first element */
				next_ele = tmp_first_element->next;
				next_ele->previous = NULL;
				/* Remove */
				free(tmp_first_element);
				/* Update first_element and ptr_first_element */
				first_element = next_ele;
				tmp_first_element = next_ele;
			}
			else{
				/* Removing middle element */
				next_ele = tmp_first_element->next;
				prev_ele = tmp_first_element->previous;
				/* Update */
				next_ele->previous = prev_ele;
				prev_ele->next = next_ele;
				/* Remove */
				free(tmp_first_element);
				/* Update */
				tmp_first_element = next_ele;
			}
		}
		else{
			tmp_first_element->data.data_struct.info = info;
			next_ele = tmp_first_element->next;
			tmp_first_element = next_ele;
		}
	}while(tmp_first_element != tmp_last_element_next);
	if(first_element == last_element) empty_flag = true;
	else empty_flag = false;
}

/****************************************************************************/
/**
* @brief	Test the TARGET with the Test Pattern Generator
*
* @param	-
*
* @return	XST_SUCCESS or XST_FAILURE (defined in xstatus.h)
*
* @note		-
*
****************************************************************************/
int test_TPG(void){
	int timeout,i,j;

	/* Create an element for the DMA */
	data_list* tmp_ptr  = (data_list *)malloc(sizeof(data_list));
	if(!tmp_ptr){
		printf("malloc for tmp_ptr failed in function, %s!\r\n", __func__);
		return XST_FAILURE;
	}
	tmp_ptr->next = NULL;
	tmp_ptr->previous = NULL;

	/* Give the element's address to the DMA */
	XAxiDma_SimpleTransfer_hm((UINTPTR)tmp_ptr->data.data_array, SIZE_DATA_ARRAY_BYT);

	/* Initiate the test */
	regptr[TC_FSTWINDOW_REG] = 10;
	regptr[TC_NBRWINDOW_REG] = 1;
	WriteRegister(TC_TPG_REG,	0x50A);	// TPG value

	ControlRegisterWrite(SMODE_MASK ,ENABLE);
	ControlRegisterWrite(SS_TPG_MASK ,DISABLE); // Enable mode TestPattern
	ControlRegisterWrite(WINDOW_MASK,ENABLE);
	usleep(50);
	ControlRegisterWrite(WINDOW_MASK,DISABLE); // PL side starts on falling edge

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
		usleep(50);
		timeout--;

		/* The DMA had a problem */
		if(flag_axidma_error){
			printf("Error with DMA interrupt: TPG !\r\n");
			return XST_FAILURE;
		}
	}while(timeout && !flag_axidma_rx_done);

	/* DMA did not respond */
	if(timeout <= 0){
		printf("Timeout: TPG failed!\r\n");
		return XST_FAILURE;
	}
	else flag_axidma_rx_done = false;

	/* Update the cache with the data written by the DMA */
	Xil_DCacheInvalidateRange((UINTPTR)tmp_ptr->data.data_array, SIZE_DATA_ARRAY_BYT);

	/* Test the returned values */
	if(tmp_ptr->data.data_struct.wdo_id == 10){
		for(j=0; j<32; j++){
			for(i=0; i<16; i++){
				if(tmp_ptr->data.data_struct.data[i][j] != 0x50A){
					/* Returned values wrong */
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
					printf("TPG failed: data wrong!\r\n");
					return XST_FAILURE;
				}
			}
		}
	}
	else{
		/* Window ID wrong */
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
		printf("TPG failed: window id wrong!\r\n");
		return XST_FAILURE;
	}
	free(tmp_ptr);

	/* Release the DMA */
	ControlRegisterWrite(PSBUSY_MASK,DISABLE);

	return XST_SUCCESS;
}
