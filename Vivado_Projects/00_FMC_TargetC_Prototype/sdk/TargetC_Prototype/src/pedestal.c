/**
 * @file 	Pedestal.c
 * @author	Jonathan Hendriks
 * @date	26th November 2018
 * @version 0.0
 */
#include "pedestal.h"
#include	"TARGETC_RegisterMap.h"



int init_pedestals(void){
	uint32_t data[16][32];
	int window = 0;
	int timeout;
	int i,j,count;
	int status = 0;

	struct ele_list_st *tmp_ptr;
	tmp_ptr  = malloc(sizeof(struct ele_list_st));

	axidma_flg = FALSE;

	if(!tmp_ptr){
		printf("malloc for tmp_ptr failed in function, %s!\r\n", __func__);
		return XST_FAILURE;
	}
	tmp_ptr->pnext = NULL;

	xil_printf("ADDRESS tmp_ptr : %d\r\n",tmp_ptr);
	for(window=0; window<512; window++){

		for(i=0; i<16; i++){
			for(j=0; j<32; j++) data[i][j] = 0;
		}
		for(count=0; count<10; count++){

			Xil_DCacheFlushRange(&(tmp_ptr->wdo), sizeof(struct window_st));

			XAxiDma_SimpleTransfer_Hej(&AxiDmaInstance,&(tmp_ptr->wdo), sizeof(struct window_st));

			GetTargetCStatus();
			ControlRegisterWrite(PSBUSY_MASK,DISABLE);
			//xil_printf("Counter AXIS: %d\r\n",regptr[TC_CNT_AXIS_REG]>>16);
			//99xil_printf("Counter NBR: %d\r\n",regptr[TC_CNT_AXIS_REG] & 0x0000FFFF);
			regptr[TC_FSTWINDOW_REG] = window;
			regptr[TC_NBRWINDOW_REG] = 1;
			ControlRegisterWrite(SMODE_MASK ,ENABLE);
			ControlRegisterWrite(SS_TPG_MASK ,ENABLE);
			ControlRegisterWrite(WINDOW_MASK,ENABLE);

			timeout = 200000;
			while(timeout && !(status & STORAGE_MASK)){
				status = GetTargetCStatus();
				timeout--;
			}
			if (timeout <= 0){
				printf("Timeout on Status Read %x:!\r\n", status);
				return XST_FAILURE;
			}
			ControlRegisterWrite(WINDOW_MASK,DISABLE); // PL side starts on falling edge
			timeout = 200000;
			while(timeout && (status & STORAGE_MASK)){
				status = GetTargetCStatus();
				timeout--;
			}
			if (timeout <= 0){
				printf("Timeout on Status Read %x:!\r\n", status);
				return XST_FAILURE;
			}

			timeout = 200000; // 10sec
			while(timeout && !axidma_rx_done){
				usleep(50);
				timeout--;
			}


			Xil_DCacheInvalidateRange(&(tmp_ptr->wdo), sizeof(struct window_st));

			if(timeout <= 0){
				for(int i=0; i<6; i++){
					xil_printf("Header%d:\t%d\r\n",i,tmp_ptr->wdo.header[i]);
				}
				xil_printf("Timeout on window %d: pedestal initialization failed!\r\n", window);
				xil_printf("Counter AXIS: %d\r\n",regptr[TC_CNT_AXIS_REG]>>16);
				xil_printf("Counter NBR: %d\r\n",regptr[TC_CNT_AXIS_REG] & 0x0000FFFF);
				return XST_FAILURE;
			}
			else axidma_rx_done = 0;

			if(tmp_ptr->wdo.header[5] != window){
				xil_printf("window id is wrong! window = %d | wdo_id = %d\r\n", window, (uint)tmp_ptr->wdo.header[5]);
				for(int i=0; i<6; i++){
					xil_printf("Header%d:\t%d\r\n",i,tmp_ptr->wdo.header[i]);
				}
				return XST_FAILURE;
			}
			else{
//				for(i=0; i<16; i++){
//					for(j=0; j<32; j++) data[i][j] += tmp_ptr->data.data_struct.data[i][j];
//				}

				for(int j=0; j<32; j++){
					for(int i=0; i<16; i++){
						data[i][j] += tmp_ptr->wdo.data[i*32+j];
					}
				}
			}
		/*	while(XAxiDma_Busy(&AxiDmaInstance,XAXIDMA_DEVICE_TO_DMA)){
				xil_printf("DMA Busy...\n\r");
				// if(XST_SUCCESS != XAxiDma_Resume(&AxiDmaInstance)){
				// 	xil_printf("Failed to resume\r\n");
				// }
				usleep(50);
			}
		*/
		}

		for(i=0; i<16; i++){
			for(j=0; j<32; j++){
				pedestal[window][i][j]= data[i][j]/10;
			}
		}
	}
	free(tmp_ptr);

	return XST_SUCCESS;
}
