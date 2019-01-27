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

	struct ele_list_st *tmp_ptr;
	tmp_ptr  = malloc(sizeof(struct ele_list_st));
	
	axidma_flg = FALSE;
	
	if(!tmp_ptr){
		printf("malloc for tmp_ptr failed in function, %s!\r\n", __func__);
		return XST_FAILURE;
	}
	tmp_ptr->pnext = NULL;

	for(window=0; window<512; window++){
		for(i=0; i<16; i++){
			for(j=0; j<32; j++) data[i][j] = 0;
		}
		for(count=0; count<10; count++){
			Xil_DCacheFlushRange(&(tmp_ptr->wdo), sizeof(struct window_st));
			XAxiDma_SimpleTransfer_Hej(&AxiDmaInstance,&(tmp_ptr->wdo), sizeof(struct window_st));
			
			ControlRegisterWrite(PSBUSY_MASK,DISABLE);
			
			regptr[TC_FSTWINDOW_REG] = window;
			regptr[TC_NBRWINDOW_REG] = 1;
			ControlRegisterWrite(SMODE_MASK ,ENABLE);
			ControlRegisterWrite(SS_TPG_MASK ,ENABLE);
			ControlRegisterWrite(WINDOW_MASK,ENABLE);
			usleep(50);
			ControlRegisterWrite(WINDOW_MASK,DISABLE); // PL side starts on falling edge

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
				printf("Timeout on window %d: pedestal initialization failed!\r\n", window);
				return XST_FAILURE;
			}
			else axidma_rx_done = 0;

			if(tmp_ptr->wdo.header[5] != window){
				printf("window id is wrong! window = %d | wdo_id = %d\r\n", window, (uint)tmp_ptr->wdo.header[5]);
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

