/**
 * @file 	main.c
 * @author	Jonathan Hendriks
 * @date	14th November 2018
 * @version 0.0
 *
 * @brief main for Watchman Prototype Readout.
 *
 * Detailed description here, if any.
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"


#include "global.h"
#include "iic_DAC_LTC2657.h"
#include "TARGETC_RegisterMap.h"
#include "interrupt.h"
#include "pedestal.h"


/** **********************************************************
 * @brief 	Main function
 *
 * @param	  none
 * @return	status
 ************************************************************* */
int main(void)
{
	int status;
	int timeout= 5;
	int tmp = 0;

	axidma_flg = FALSE;
	head = NULL;

	ControlRegisterWrite(TRIG_CLEAR_MASK,ENABLE);
	ControlRegisterWrite(TRIG_CLEAR_MASK,DISABLE);

    init_platform();
	platform_setup_interrupts();
	platform_enable_interrupts();

    // Banner TARGET C
	for(int i=0; i<14;++i){
		xil_printf("%s\r\n",banner[i]);
	}
	xil_printf("\r\n");

    // Test I2C
    status = DAC_LTC2657_initialize();
    if(status != XST_SUCCESS){
    	xil_printf("ERROR:\tFailure to initialize I2C DAC LT2657\r\n");
    }
   // status = DAC_LTC2657_SetChannelVoltage(CHANNEL_ALL,2.00);	//Vped = 1.25
    status = DAC_LTC2657_SetChannelVoltage(CHANNEL_H,VPED_ANALOG);	//Vped = 1.25
    status = DAC_LTC2657_SetChannelVoltage(CHANNEL_A,1.00);	//Vped = 1.25
    status = DAC_LTC2657_SetChannelVoltage(CHANNEL_B,1.00);	//Vped = 1.25
    status = DAC_LTC2657_SetChannelVoltage(CHANNEL_C,1.00);	//Vped = 1.25
    status = DAC_LTC2657_SetChannelVoltage(CHANNEL_D,1.00);	//Vped = 1.25
    if(status != XST_SUCCESS){
    	xil_printf("ERROR:\tFailure to set voltages I2C DAC LT2657\r\n");
    }
    xil_printf("DAC LT2657 ... OK\r\n");
    sleep(2);


	xil_printf("\n\r*** CONTROL *** \n\r");
	ControlRegisterWrite(NULL,INIT);
	GetTargetCControl();

	ControlRegisterWrite(SWRESET_MASK,DISABLE);
	GetTargetCControl();
	usleep(100000);
	GetTargetCStatus();
	ControlRegisterWrite(REGCLR_MASK,DISABLE);
    ControlRegisterWrite(SWRESET_MASK,ENABLE);
	ControlRegisterWrite(PSBUSY_MASK,DISABLE);
    GetTargetCControl();
 	usleep(100000);
 	GetTargetCStatus();

 	xil_printf("DLLlocked...");

	GetTargetCStatus();
	while((regptr[TC_STATUS_REG] & LOCKED_MASK) != LOCKED_MASK){
		sleep(1); //sleep 100ms
		GetTargetCStatus();
	}
	xil_printf("OK\r\n");
	xil_printf("\r\n");

	xil_printf("\n\r*** REGISTERS *** \n\r");
    //SetTargetCRegisters();
    SetTargetCRegisters_DLL();
	xil_printf("\n\r*** End REGISTERS *** \n\r");
    //GetTargetCStatus();

	xil_printf("*** Checking DLL ****\r\n");
	WriteRegister(TC_MONTIMING_REG, TC_MT_SSTOUTFB_MASK );
	sleep(1);

	WriteRegister(TC_VQBUFF_REG,	0);
	WriteRegister(TC_VANBUFF_REG,	1100);
	WriteRegister(TC_VADJN_REG,		2235);
	WriteRegister(TC_VQBUFF_REG,	1062);

	WriteRegister(TC_VANBUFF_REG,	0);
	// write_asic_direct_register(BS, carrier, asic, 178, 0)  # Vqbuff is Qbias buffer bias
	// write_asic_direct_register(BS, carrier, asic, 183, 1300)  # VANbuff # 1300 rec'd by Gary
	// write_asic_direct_register(BS, carrier, asic, 182, 1530)  # VadjN
	// write_asic_direct_register(BS, carrier, asic, 178, 1300)  # Vqbuff is Qbias buffer bias
	// write_asic_direct_register(BS, carrier, asic, 183, 0)  # VANbuff # 1300 rec'd by Gary
	xil_printf("FIGHT\r\n");
	sleep(5);
    //int* registers = XPAR_TARGETC_0_TC_AXI_BASEADDR;

/*	xil_printf("\n\r*** Testing ISEL *** \n\r");

    WriteReadBackRegister(TC_DBBIAS_REG,1100);

    int isel=0;
    xil_printf("Changing ISEL value\r\n");
    while(regptr[TC_ISEL_REG] <= 4096){
		WriteReadBackRegister(TC_ISEL_REG,isel);
		isel += 100;
	}

	isel=4000;
    while(regptr[TC_ISEL_REG] != 0){
		WriteReadBackRegister(TC_ISEL_REG,isel);
		isel -= 100;
	}
*/
	xil_printf("Test Pattern Register Write\r\n");
	WriteReadBackRegister(TC_TPG_REG, 0x123);
    // xil_printf("\n\r*** Test Pattern Generator *** \n\r");
	// //TestPatternGenerator(0x505);
    // sleep(1);
	//
    // //TestPatternGenerator(0xA69);
	// sleep(1);
	//
	// //TestPatternGenerator(0x555);
    // sleep(1);
	//
    // //TestPatternGenerator(0x111);
	// sleep(1);

	xil_printf("\n\r*** Pedestals *** \n\r");
	//init_pedestals();
  	xil_printf("\n\r*** End Pedestals *** \n\r");

	xil_printf("\n\r*** MonTiming *** \n\r");
	//MonTimingSet();
	xil_printf("\n\r*** End MonTiming *** \n\r");
	sleep(5);

// *** Test Stream ***

/*	xil_printf("\r\n*** TestStream ***\r\n");
  	Xil_DCacheFlushRange((UINTPTR)window, 512*sizeof(int));
	XAxiDma_SimpleTransfer_Hej(&AxiDmaInstance,(UINTPTR)window, (512*sizeof(int)));
    //switch to stream rather than normal Axi-Lite
    ControlRegisterWrite(SMODE_MASK | TESTSTREAM_MASK,ENABLE);
    ControlRegisterWrite(TESTSTREAM_MASK,DISABLE);
	regptr[TC_NBRWINDOW_REG] = 0;
	timeout= 5;
	tmp = 0;
	while(timeout && !axidma_rx_done){
		sleep(1);
		xil_printf("... ");
		timeout--;
	}
	xil_printf("\r\n");

	if(axidma_rx_done){
		Xil_DCacheInvalidateRange((UINTPTR)window, 512*sizeof(int));
		sleep(1);
		xil_printf("CH0\tCH1\tCH2\tCH3\tCH4\tCH5\tCH6\tCH7\tCH8\tCH9\tCH10\tCH11\tCH12\tCH13\tCH14\tCH15\r\n");
		for(int i=0; i<32;i++){
			printf("%d\t",window[i]);
			printf("%d\t",window[i+32]);
			printf("%d\t",window[i+32*2]);
			printf("%d\t",window[i+32*3]);

			printf("%d\t",window[i+32*4]);
			printf("%d\t",window[i+32*5]);
			printf("%d\t",window[i+32*6]);
			printf("%d\t",window[i+32*7]);

			printf("%d\t",window[i+32*8]);
			printf("%d\t",window[i+32*9]);
			printf("%d\t",window[i+32*10]);
			printf("%d\t",window[i+32*11]);

			printf("%d\t",window[i+32*12]);
			printf("%d\t",window[i+32*13]);
			printf("%d\t",window[i+32*14]);
			printf("%d\r\n",window[i+32*15]);
		}
		axidma_rx_done = 0;
	}
	else{
		xil_printf("No interrupts\r\n");
	}
	sleep(2);
    ControlRegisterWrite(SMODE_MASK,DISABLE);
	sleep(2);
*/
// Test Stream
	xil_printf("\r\n*** Test Stream ***\r\n");
    NBRWINDOWS = 1;
	axidma_flg = FALSE;
	head = malloc(sizeof(struct ele_list_st));
	if(head == NULL){
		printf("Fuck malloc\r\n");
	}
	head->pnext = NULL;

 	Xil_DCacheFlushRange(&(head->wdo), sizeof(struct window_st));
	XAxiDma_SimpleTransfer_Hej(&AxiDmaInstance,&(head->wdo), sizeof(struct window_st));

    //switch to stream rather than normal Axi-Lite
    ControlRegisterWrite(SMODE_MASK ,ENABLE);

	samplecnt = 0;
	ControlRegisterWrite(PSBUSY_MASK,DISABLE);
   	ControlRegisterWrite(SS_TPG_MASK,ENABLE);	// SAmple and not TPG

    regptr[TC_FSTWINDOW_REG] = 0;
	regptr[TC_NBRWINDOW_REG] = NBRWINDOWS;


    //switch to stream rather than normal Axi-Lite
    ControlRegisterWrite(SMODE_MASK | TESTSTREAM_MASK,ENABLE);
    ControlRegisterWrite(TESTSTREAM_MASK,DISABLE);

	timeout= 5;
	tmp = 0;
	while(timeout && !axidma_rx_done){
		sleep(1);
		xil_printf("... ");
		timeout--;
	}
	xil_printf("\r\n");

		if(axidma_rx_done){
			//sleep(1);
			Xil_DCacheInvalidateRange(&(head->wdo), sizeof(struct window_st));

			xil_printf("HEADER\r\n");
			xil_printf("------------\r\n");

//			xil_printf("Window Time :\t%d\r\n",head->wdo.wdotime);
//			xil_printf("Dig Time :\t%d\r\n",head->wdo.digtime);
//			xil_printf("Trigger :\t%d\r\n",head->wdo.trig);
//			xil_printf("Window Nbr :\t%d\r\n",head->wdo.wdonbr);

			for(int i=0; i<6; i++){
				xil_printf("Header%d:\t%d\r\n",i,head->wdo.header[i]);
			}
			xil_printf("CH0\tCH1\tCH2\tCH3\tCH4\tCH5\tCH6\tCH7\tCH8\tCH9\tCH10\tCH11\tCH12\tCH13\tCH14\tCH15\r\n");
			xil_printf("----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\r\n");
			xil_printf(">>>\r\n");
			for(int i=0; i<32;i++){

				xil_printf("%d\t",head->wdo.data[i]);
				xil_printf("%d\t",head->wdo.data[i + 32]);
				xil_printf("%d\t",head->wdo.data[i + 32*2]);
				xil_printf("%d\t",head->wdo.data[i + 32*3]);

				xil_printf("%d\t",head->wdo.data[i + 32*4]);
				xil_printf("%d\t",head->wdo.data[i + 32*5]);
				xil_printf("%d\t",head->wdo.data[i + 32*6]);
				xil_printf("%d\t",head->wdo.data[i + 32*7]);

				xil_printf("%d\t",head->wdo.data[i + 32*8]);
				xil_printf("%d\t",head->wdo.data[i + 32*9]);
				xil_printf("%d\t",head->wdo.data[i + 32*10]);
				xil_printf("%d\t",head->wdo.data[i + 32*11]);

				xil_printf("%d\t",head->wdo.data[i + 32*12]);
				xil_printf("%d\t",head->wdo.data[i + 32*13]);
				xil_printf("%d\t",head->wdo.data[i + 32*14]);
				xil_printf("%d\r\n",head->wdo.data[i + 32*15]);
			}
			xil_printf("<<<\r\n");
			xil_printf("\r\n");
			axidma_rx_done = 0;

		}
		else{
			xil_printf("No interrupts\r\n");
		}
	sleep(2);
	GetTargetCStatus();
    ControlRegisterWrite(SMODE_MASK,DISABLE);
	sleep(2);
	free(head);


// TEST FIFO
	xil_printf("\r\n*** Test FIFO ***\r\n");
    NBRWINDOWS = 1;
	axidma_flg = FALSE;
	head = malloc(sizeof(struct ele_list_st));
	if(head == NULL){
		printf("Fuck malloc\r\n");
	}
	head->pnext = NULL;

 	Xil_DCacheFlushRange(&(head->wdo), sizeof(struct window_st));
	XAxiDma_SimpleTransfer_Hej(&AxiDmaInstance,&(head->wdo), sizeof(struct window_st));

    //switch to stream rather than normal Axi-Lite
    ControlRegisterWrite(SMODE_MASK ,ENABLE);

	samplecnt = 0;
	ControlRegisterWrite(PSBUSY_MASK,DISABLE);
   	ControlRegisterWrite(SS_TPG_MASK,ENABLE);	// SAmple and not TPG

    regptr[TC_FSTWINDOW_REG] = 0;
	regptr[TC_NBRWINDOW_REG] = NBRWINDOWS;


    //switch to stream rather than normal Axi-Lite
    ControlRegisterWrite(SMODE_MASK | TESTFIFO_MASK,ENABLE);
    ControlRegisterWrite(TESTFIFO_MASK,DISABLE);

	timeout= 5;
	tmp = 0;
	while(timeout && !axidma_rx_done){
		sleep(1);
		xil_printf("... ");
		timeout--;
	}
	xil_printf("\r\n");

		if(axidma_rx_done){
			//sleep(1);
			Xil_DCacheInvalidateRange(&(head->wdo), sizeof(struct window_st));

			xil_printf("HEADER\r\n");
			xil_printf("------------\r\n");

//			xil_printf("Window Time :\t%d\r\n",head->wdo.wdotime);
//			xil_printf("Dig Time :\t%d\r\n",head->wdo.digtime);
//			xil_printf("Trigger :\t%d\r\n",head->wdo.trig);
//			xil_printf("Window Nbr :\t%d\r\n",head->wdo.wdonbr);

			for(int i=0; i<6; i++){
				xil_printf("Header%d:\t%d\r\n",i,head->wdo.header[i]);
			}
			xil_printf("CH0\tCH1\tCH2\tCH3\tCH4\tCH5\tCH6\tCH7\tCH8\tCH9\tCH10\tCH11\tCH12\tCH13\tCH14\tCH15\r\n");
			xil_printf("----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\r\n");
			xil_printf(">>>\r\n");
			for(int i=0; i<32;i++){

				xil_printf("%d\t",head->wdo.data[i]);
				xil_printf("%d\t",head->wdo.data[i + 32]);
				xil_printf("%d\t",head->wdo.data[i + 32*2]);
				xil_printf("%d\t",head->wdo.data[i + 32*3]);

				xil_printf("%d\t",head->wdo.data[i + 32*4]);
				xil_printf("%d\t",head->wdo.data[i + 32*5]);
				xil_printf("%d\t",head->wdo.data[i + 32*6]);
				xil_printf("%d\t",head->wdo.data[i + 32*7]);

				xil_printf("%d\t",head->wdo.data[i + 32*8]);
				xil_printf("%d\t",head->wdo.data[i + 32*9]);
				xil_printf("%d\t",head->wdo.data[i + 32*10]);
				xil_printf("%d\t",head->wdo.data[i + 32*11]);

				xil_printf("%d\t",head->wdo.data[i + 32*12]);
				xil_printf("%d\t",head->wdo.data[i + 32*13]);
				xil_printf("%d\t",head->wdo.data[i + 32*14]);
				xil_printf("%d\r\n",head->wdo.data[i + 32*15]);
			}
			xil_printf("<<<\r\n");
			xil_printf("\r\n");
			axidma_rx_done = 0;

		}
		else{
			xil_printf("No interrupts\r\n");
		}
	sleep(2);
	GetTargetCStatus();
    ControlRegisterWrite(SMODE_MASK,DISABLE);
	sleep(2);
	free(head);




		xil_printf("******** Multiple Window - Multiple Window *************\r\n");
		ControlRegisterWrite(SS_TPG_MASK ,DISABLE);
		//int timeout;
		int flg_error = 0;

		axi_dma_mult_flg = 0;
		NBRWINDOWS = 10;
		axidma_flg = TRUE;

		head = malloc(sizeof(struct ele_list_st));
		if(head == NULL){
			printf("Head Malloc - FAILED\r\n");
		}
		head->pnext = NULL;
		axiptr = head;
		printf("Head %d\t axiptr %d\r\n",head,axiptr);

		Xil_DCacheFlushRange(&(axiptr->wdo), sizeof(struct window_st));
		XAxiDma_SimpleTransfer_Hej(&AxiDmaInstance,&(axiptr->wdo), sizeof(struct window_st));
		for(int window=0; window<1; window+=1){
			printf("-> Head %d\t axiptr %d\r\n",head,axiptr);
			printf("-> Window:\t%d %d\r\n",window,NBRWINDOWS);

			ControlRegisterWrite(PSBUSY_MASK,DISABLE);

			regptr[TC_FSTWINDOW_REG] = window;
			regptr[TC_NBRWINDOW_REG] = NBRWINDOWS;

			ControlRegisterWrite(SMODE_MASK ,ENABLE);
			ControlRegisterWrite(SS_TPG_MASK ,ENABLE);
			//ControlRegisterWrite(SS_TPG_MASK ,DISABLE);

			ControlRegisterWrite(CPUMODE_MASK,DISABLE);
			ControlRegisterWrite(WINDOW_MASK,ENABLE);

			//Xil_DCacheFlushRange(&(axiptr->wdo), sizeof(struct window_st));
			Xil_DCacheFlushRange(&(head->wdo), sizeof(struct window_st));
			usleep(50);
			ControlRegisterWrite(WINDOW_MASK,DISABLE); // PL side starts on falling edge


			timeout = 200000; // 10sec
			while(timeout && !axi_dma_mult_flg){
				usleep(50);
				timeout--;
			}
			if(axi_dma_mult_flg){
				printf("Window:\t%d %d\r\n",window,NBRWINDOWS);
				for(int times=0;times<NBRWINDOWS;times++){
					xil_printf("Head%d\t%d\r\n",times,head);

					Xil_DCacheInvalidateRange(&(head->wdo), sizeof(struct window_st));
					Xil_DCacheInvalidateRange(&(axiptr->wdo), sizeof(struct window_st));

					for(int i=0; i<6; i++){
						xil_printf("Header%d:\t%d\t\t%d\r\n",i,head->wdo.header[i],axiptr->wdo.header[i]);
					}
					printf("\r\n");
						xil_printf("CH0\tCH1\tCH2\tCH3\tCH4\tCH5\tCH6\tCH7\tCH8\tCH9\tCH10\tCH11\tCH12\tCH13\tCH14\tCH15\r\n");
						xil_printf("----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\r\n");
						printf(">>>\r\n");
						//data_tmp = (uint16_t)(tmp_ptr->data.data_struct.data[i][j] + VPED_DIGITAL - pedestal[window][i][j]);
					//if(data_tmp > 2047) data_tmp = 2047;
						for(int j=0; j<32; j++){
							for(int i=0; i<15; i++){
								if(!(regptr[TC_CONTROL_REG] & SS_TPG_MASK))
									printf("0x%x\t", head->wdo.data[i*32+j]);
								else
									printf("%d\t", head->wdo.data[i*32+j]);
									//printf("%d\t", head->wdo.data[i*32+j]+ VPED_DIGITAL - pedestal[window][i][j]);


							}
							if(!(regptr[TC_CONTROL_REG] & SS_TPG_MASK))
								printf("0x%x\r\n", head->wdo.data[15*32+j]);
							else
								printf("%d\r\n", head->wdo.data[15*32+j]);
								//printf("%d\r\n", head->wdo.data[15*32+j]+ VPED_DIGITAL - pedestal[window][15][j]);

						}
						printf("<<<\r\n");
						printf("\r\n");

					struct ele_list_st *swapele;
					swapele = head;
					head = head->pnext;
					xil_printf("FREE:\t%d\t%d\r\n",head,swapele);
					//Xil_DCacheInvalidateRange(&(swapele->wdo), sizeof(struct window_st));
					free(swapele);
				}

				struct ele_list_st *testele;
				testele = head;
				xil_printf("check head:");
				while(testele){
					xil_printf("%d\t",testele);
					testele = testele->pnext;
				}
				printf("\r\n");
				axi_dma_mult_flg = 0;


			}
			else{
				xil_printf("Timeout\r\n");
				for(int i=0; i<6; i++){
					xil_printf("Header%d:\t%d\t\t%d\r\n",i,head->wdo.header[i],axiptr->wdo.header[i]);
				}

				flg_error = 1;
			}



			if(flg_error) break;
			printf("\r\n");

			printf("Window Busy?");
			while(regptr[TC_STATUS_REG] & WINDOWBUSY_MASK){
				usleep(100000); //sleep 100ms
				printf("... ");
			}
			printf("\r\n");
			sleep(3);
		}

		//free(head);
		//free(axiptr);

		xil_printf("\r\n*** Multiple Window Finished ***\r\n");


// END CLEANING UP
    xil_printf("\n\r*** ************************** ***");

	xil_printf("\r\nppp\r\n");
	//xil_printf("Pedestal Runs =\t%d\r\n",PEDROUNDS);
	xil_printf("ISEL =\t%d\r\n",regptr[TC_ISEL_REG]);
	xil_printf("ppp\r\n");

    ControlRegisterWrite(WINDOW_MASK,DISABLE);
    ControlRegisterWrite(SWRESET_MASK,DISABLE);
	ControlRegisterWrite(REGCLR_MASK,ENABLE);

	platform_cleanup_interrupts();
    cleanup_platform();

	free(axiptr);
	free(head);

    xil_printf("\r\n***          Finished          ***\r\n");

    return 0;
}
