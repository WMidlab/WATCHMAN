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

	head = NULL;
	
	ControlRegisterWrite(TRIG_CLEAR_MASK,ENABLE);
	ControlRegisterWrite(TRIG_CLEAR_MASK,DISABLE);
	
    init_platform();
	platform_setup_interrupts();
	platform_enable_interrupts();
	PedInitialize();	// Pedestals initialization

    xil_printf("\n\r*** ************************** *** ");
    xil_printf("\n\r*** TARGETC : Testing Software *** \n\r");
    xil_printf("*** ************************** *** \n\r");

    // Test I2C
    status = DAC_LTC2657_initialize();
    if(status != XST_SUCCESS){
    	xil_printf("ERROR:\tFailure to initialize I2C DAC LT2657\r\n");
    }
   // status = DAC_LTC2657_SetChannelVoltage(CHANNEL_ALL,2.00);	//Vped = 1.25
    status = DAC_LTC2657_SetChannelVoltage(CHANNEL_H,2.00);	//Vped = 1.25
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
    SetTargetCRegisters();

    //GetTargetCStatus();

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

     xil_printf("\n\r*** Test Pattern Generator *** \n\r");
	TestPatternGenerator(0x505);
    sleep(1);

    TestPatternGenerator(0xA69);
	sleep(1);
	
	//TestPatternGenerator(0x555);
    sleep(1);

    //TestPatternGenerator(0x111);
	sleep(1);



// *** Vadjustement ***
/*
	int vadjp = 0, vadjn =0;

	xil_printf("\n\r*** MonTiming *** \n\r");
	xil_printf("\n\r Probe BB1 : SSTIN\n\r");
	xil_printf("\n\r Probe BB5 : MonTiming\n\r");

	sleep(1);


	int sw = 0;
	//SSTOUT OK
	xil_printf("SSTOUT OK \r\n");
	WriteReadBackRegister(TC_MONTIMING_REG, TC_MT_SSTOUT_MASK );
	sleep(3);

	xil_printf("SSPIN OK \r\n");
	WriteReadBackRegister(TC_MONTIMING_REG, TC_MT_SSPIN_MASK );
	sleep(3);


	xil_printf("SSPOUT OK \r\n");
	WriteReadBackRegister(TC_MONTIMING_REG, TC_MT_SSPOUT_MASK );
	sleep(3);


	xil_printf("WR1_ADDR_SYNC\t");
	WriteReadBackRegister(TC_MONTIMING_REG, TC_MT_WR1_ADDR_SYNC_MASK );
	sleep(3);

	xil_printf("WR_STRB1\t");
	WriteReadBackRegister(TC_MONTIMING_REG, TC_MT_WR_STRB1_MASK );
	sleep(3);

	xil_printf("WR2_ADDR_SYNC\t");
	WriteReadBackRegister(TC_MONTIMING_REG, TC_MT_WR2_ADDR_SYNC_MASK );
	sleep(3);

	xil_printf("WR_STRB2\t");
	WriteReadBackRegister(TC_MONTIMING_REG, TC_MT_WR_STRB2_MASK );
	sleep(3);
*/


/*	int LE = 0;
	int TE = 31;

	while((LE < 64)){
		//usleep(50000);
		WriteRegister(TC_WR_STRB2_LE_REG,		LE);
		WriteRegister(TC_WR_STRB2_TE_REG,		TE);
		usleep(500000);
		xil_printf("LE: %d\tTE: %d\r\n",LE,TE);
		LE ++;
		TE++;
	}
*/



/*	int LE = 4;
	int TE = 0;

	while((LE < 64)){
		//usleep(50000);
		WriteRegister(TC_WR1_ADDR_LE_REG,		LE);

		TE = 20;
		while((TE < 64)){

			WriteRegister(TC_WR1_ADDR_TE_REG,		TE);
			usleep(500000);
			xil_printf("LE: %d\tTE: %d\r\n",LE,TE);
			TE = TE + 1;

		}
		LE = LE + 1;

		xil_printf("\r\n");
		xil_printf("\r\n");
	}
*/
/*	xil_printf("\n\r*** MonTiming *** \n\r");
	sleep(5);

	WriteReadBackRegister(TC_MONTIMING_REG, TC_MT_WR2_ADDR_SYNC_MASK );

	LE = 0;
	TE = 0;
	while((LE < 64)){
		usleep(250000);
		WriteReadBackRegister(TC_WR2_ADDR_LE_REG,		LE);
		LE = LE + 1;
	}

*/

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
// TEST FIFO
/*	xil_printf("\r\n*** Test FIFO ***\r\n");
    NBRWINDOWS = 1;

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
*/
// STORAGE STREAM
//	status = DAC_LTC2657_setvoltage(1.25);


	//status = DAC_LTC2657_SetChannelVoltage(CHANNEL_H,1.25);	//Vped = 1.25


	//for(int i= 0; i < 20; i++){
	//	status = DAC_LTC2657_SetChannelVoltage(CHANNEL_A,1.1);
	//	status = DAC_LTC2657_SetChannelVoltage(CHANNEL_B,1.1);
		//status = DAC_LTC2657_SetChannelVoltage(CHANNEL_H,0.25*i);
		//WriteRegister(TC_ISEL_REG,2000+i*20);
		
		//status = DAC_LTC2657_setvoltage(1.25);

		//status = DAC_LTC2657_SetChannelVoltage(CHANNEL_H,1.25);	//Vped = 1.25
		//status = DAC_LTC2657_SetChannelVoltage(CHANNEL_A,1.50);
		//status = DAC_LTC2657_SetChannelVoltage(CHANNEL_B,1.50);

		//if(status != XST_SUCCESS){
		//	xil_printf("ERROR:\tFailure to initialize I2C DAC LT2657\r\n");
		//}
		xil_printf("******** Pedestal ANTHONY *************\r\n");
		
		uint32_t data[16][32];
		//int timeout;
		int flg_error = 0;

		struct ele_list_st* tmp_ptr = malloc(sizeof(struct ele_list_st));
		if(!tmp_ptr){
			printf("malloc for tmp_ptr failed!\r\n");
			return XST_FAILURE;
		}
		tmp_ptr->pnext = NULL;

		for(int window=0; window<512; window++){
//			for(int i=0; i<16; i++){
//				for(int j=0; j<32; j++) data[i][j] = 0;
//			}
			printf("Window:\t%d\r\n",window);
			for(int count=0; count<10; count++){
				
				Xil_DCacheFlushRange(&(tmp_ptr->wdo), sizeof(struct window_st));
				XAxiDma_SimpleTransfer_Hej(&AxiDmaInstance,&(tmp_ptr->wdo), sizeof(struct window_st));
				
				regptr[TC_FSTWINDOW_REG] = window;
				regptr[TC_NBRWINDOW_REG] = 1;
				
				ControlRegisterWrite(SMODE_MASK ,ENABLE);
				ControlRegisterWrite(SS_TPG_MASK ,ENABLE);
				ControlRegisterWrite(WINDOW_MASK,ENABLE);
				usleep(50);
				ControlRegisterWrite(WINDOW_MASK,DISABLE); // PL side starts on falling edge

				printf("%d ", count);
				
				timeout = 200000; // 10sec
				while(timeout && !axidma_rx_done){
					usleep(50);
					timeout--;
				}
				if(axidma_rx_done == 1){
					Xil_DCacheInvalidateRange(&(tmp_ptr->wdo), sizeof(struct window_st));
		
					
					/*for(int i=0; i<6; i++){
						xil_printf("Header%d:\t%d\r\n",i,tmp_ptr->wdo.header[i]);
					}
					for(int i=0; i<16; i++){
						printf("%d\t", tmp_ptr->wdo.data[i*32]);
					}
					printf("\r\n");
					*/
					if(timeout <= 0){
						printf("Timeout on window %d: pedestal initialization failed!\r\n", window);
						return XST_FAILURE;
					}
					else axidma_rx_done = 0;

				
					if(tmp_ptr->wdo.header[5] != window){
						printf(">>> ERROR !!! window id %d /= %d!\r\n",tmp_ptr->wdo.header[5],window);
						for(int i=0; i<6; i++){
							xil_printf("Header%d:\t%d\r\n",i,tmp_ptr->wdo.header[i]);
						}
						flg_error = 1;
					}
					else{
					//	for(int i=0; i<16; i++){
					//		for(int j=0; j<32; j++) data[i][j] += tmp_ptr->wdo.data[i*32+j];
					//	}
					}
				}
				else{
					xil_printf("Timeout\r\n");
					flg_error = 1;
				}

				if(flg_error) break;
			}
			printf("\r\n");

			if(flg_error) break;
			sleep(1);
		}
		
		free(tmp_ptr);

		xil_printf("\r\n*** Pedestal Finished ***\r\n");

/*
		xil_printf("\r\n*** Storage Stream ***\r\n");
		//GetTargetCStatus();
		//GetTargetCControl();
		
		NBRWINDOWS = 1;

		head = malloc(sizeof(struct ele_list_st));
		if(head == NULL){
			printf("Head Malloc - FAILED\r\n");
		}
		head->pnext = NULL;
		axiptr = head;
		
		for(int i= 0; i< 512; i++){
			head->wdo.data[i] = i;
		}

	 	Xil_DCacheFlushRange(&(head->wdo), sizeof(struct window_st));
		XAxiDma_SimpleTransfer_Hej(&AxiDmaInstance,&(head->wdo), sizeof(struct window_st));
	  
	  	cntwindow = 0;
		samplecnt = 0;

		regptr[TC_FSTWINDOW_REG] = 6;
		regptr[TC_NBRWINDOW_REG] = NBRWINDOWS;

		ControlRegisterWrite(SMODE_MASK ,ENABLE);
		ControlRegisterWrite(SS_TPG_MASK ,ENABLE);
		ControlRegisterWrite(WINDOW_MASK,ENABLE);

		usleep(50);
		ControlRegisterWrite(WINDOW_MASK,DISABLE);
		
		timeout= 10;
		tmp = 0;
		while(timeout && !axidma_rx_done){
			sleep(1);
			xil_printf("%d...\r\n",cntwindow);
			timeout--;
		}
		xil_printf("\r\n");


		if(axidma_rx_done){
			//while(head->pnext != NULL){
				Xil_DCacheInvalidateRange(&(head->wdo), sizeof(struct window_st));
		
				xil_printf("HEADER\r\n");
				xil_printf("------------\r\n");
		
			
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
		
				//Increment List
//				tmp = head;
				
//				head = head->pnext;
//				free(tmp);
			//}
			
		}
		else{
			xil_printf("No interrupts\r\n");
		}

		axidma_rx_done = 0;
		
		free(head);		

		ControlRegisterWrite(SMODE_MASK,DISABLE);
		sleep(1);	

			if(regptr[TC_STATUS_REG] & TEST_0_MASK){
				xil_printf("T0\t");
			}
			if(regptr[TC_STATUS_REG] & TEST_1_MASK){
				xil_printf("T1\t");
			}
			if(regptr[TC_STATUS_REG] & TEST_2_MASK){
				xil_printf("T2\t");
			}
			if(regptr[TC_STATUS_REG] & TEST_3_MASK){
				xil_printf("T3\t");
			}
			if(regptr[TC_STATUS_REG] & TEST_4_MASK){
				xil_printf("T4\t");
			}
			if(regptr[TC_STATUS_REG] & TEST_5_MASK){
				xil_printf("T5\t");
			}
*/

// PEDESTAL SUBSTRACTION INIT WINDOW 0 only

/*	int PEDROUNDS = 20;
	
	status = DAC_LTC2657_SetChannelVoltage(CHANNEL_H,1.25); // VPED @ 1.25V
	
	xil_printf("\r\n*** Pedestal Calculation ***\r\n");
	
	for(int i= 0; i < PEDROUNDS; i++){

		NBRWINDOWS = 1;


	  	Xil_DCacheFlushRange((UINTPTR)window, NBRWINDOWS*512*sizeof(int));
		XAxiDma_SimpleTransfer_Hej(&AxiDmaInstance,(UINTPTR)window, (NBRWINDOWS*512*sizeof(int)));
		//switch to stream rather than normal Axi-Lite
		ControlRegisterWrite(SMODE_MASK ,ENABLE);

		samplecnt = 0;

	   	ControlRegisterWrite(SS_TPG_MASK,ENABLE);	// SAmple and not TPG

		regptr[TC_FSTWINDOW_REG] = 0;
		regptr[TC_NBRWINDOW_REG] = NBRWINDOWS;

		ControlRegisterWrite(WINDOW_MASK,ENABLE);


		timeout= 5;
		tmp = 0;
		while(timeout && !axidma_rx_done){
			usleep(500000);
			xil_printf("... ");
			timeout--;
		}
		xil_printf("\r\n");
		ControlRegisterWrite(WINDOW_MASK,DISABLE);

		if(axidma_rx_done){
			//sleep(1);
			Xil_DCacheInvalidateRange((UINTPTR)window, NBRWINDOWS*512*sizeof(int));

			PedCalculate(&window,0,512,PEDROUNDS);	// Pedestal Calculation for Window N°0
			
			axidma_rx_done = 0;

		}
		else{
			xil_printf("No interrupts\r\n");
		}

		ControlRegisterWrite(SMODE_MASK,DISABLE);
		sleep(1);
	}
	
	PedShow(0);
*/	

/*	
	int NBRRUNS = 20;
	for(int i= 0; i < NBRRUNS; i++){

		NBRWINDOWS = 1;


	  	Xil_DCacheFlushRange((UINTPTR)window, NBRWINDOWS*512*sizeof(int));
		XAxiDma_SimpleTransfer_Hej(&AxiDmaInstance,(UINTPTR)window, (NBRWINDOWS*512*sizeof(int)));
		//switch to stream rather than normal Axi-Lite
		ControlRegisterWrite(SMODE_MASK ,ENABLE);

		samplecnt = 0;

	   	ControlRegisterWrite(SS_TPG_MASK,ENABLE);	// SAmple and not TPG

		regptr[TC_FSTWINDOW_REG] = 0;
		regptr[TC_NBRWINDOW_REG] = NBRWINDOWS;

		ControlRegisterWrite(WINDOW_MASK,ENABLE);


		timeout= 5;
		tmp = 0;
		while(timeout && !axidma_rx_done){
			usleep(500000);
			xil_printf("... ");
			timeout--;
		}
		xil_printf("\r\n");
		ControlRegisterWrite(WINDOW_MASK,DISABLE);

		if(axidma_rx_done){
			//sleep(1);
			Xil_DCacheInvalidateRange((UINTPTR)window, NBRWINDOWS*512*sizeof(int));

			xil_printf("CH0\tCH1\tCH2\tCH3\tCH4\tCH5\tCH6\tCH7\tCH8\tCH9\tCH10\tCH11\tCH12\tCH13\tCH14\tCH15\r\n");
			xil_printf("----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\r\n");
			xil_printf(">>>\r\n");
			for(int k=0; k <NBRWINDOWS ; k++){
				
				for(int s=0; s<32;s++){
					for(int c=0; c< 15; c++){
						xil_printf("%d\t",PedSubstraction(&window,0,c,s));
					}
					xil_printf("%d\r\n",PedSubstraction(&window,0,15,s));
				}
				xil_printf("<<<\r\n");
				xil_printf("\r\n");
			}
			axidma_rx_done = 0;

		}
		else{
			xil_printf("No interrupts\r\n");
		}

		ControlRegisterWrite(SMODE_MASK,DISABLE);
		sleep(1);
	}
*/	
/*	for(int i= 0; i < 10; i++){
		status = DAC_LTC2657_SetChannelVoltage(CHANNEL_H,0.25*i);
		sleep(1);
		//WriteRegister(TC_ISEL_REG,2000+i*20);
		
		//status = DAC_LTC2657_setvoltage(1.25);

		//status = DAC_LTC2657_SetChannelVoltage(CHANNEL_H,1.25);	//Vped = 1.25
		//status = DAC_LTC2657_SetChannelVoltage(CHANNEL_A,1.50);
		//status = DAC_LTC2657_SetChannelVoltage(CHANNEL_B,1.50);

		//if(status != XST_SUCCESS){
		//	xil_printf("ERROR:\tFailure to initialize I2C DAC LT2657\r\n");
		//}

		xil_printf("\r\n*** Storage Stream ***\r\n");

		NBRWINDOWS = 1;


	  	Xil_DCacheFlushRange((UINTPTR)window, NBRWINDOWS*512*sizeof(int));
		XAxiDma_SimpleTransfer_Hej(&AxiDmaInstance,(UINTPTR)window, (NBRWINDOWS*512*sizeof(int)));
		//switch to stream rather than normal Axi-Lite
		ControlRegisterWrite(SMODE_MASK ,ENABLE);

		samplecnt = 0;

	   	ControlRegisterWrite(SS_TPG_MASK,ENABLE);	// SAmple and not TPG

		regptr[TC_FSTWINDOW_REG] = 0;
		regptr[TC_NBRWINDOW_REG] = NBRWINDOWS;

		ControlRegisterWrite(WINDOW_MASK,ENABLE);


		timeout= 5;
		tmp = 0;
		while(timeout && !axidma_rx_done){
			usleep(500000);
			xil_printf("... ");
			timeout--;
		}
		xil_printf("\r\n");
		ControlRegisterWrite(WINDOW_MASK,DISABLE);

		if(axidma_rx_done){
			//sleep(1);
			Xil_DCacheInvalidateRange((UINTPTR)window, NBRWINDOWS*512*sizeof(int));

			xil_printf("CH0\tCH1\tCH2\tCH3\tCH4\tCH5\tCH6\tCH7\tCH8\tCH9\tCH10\tCH11\tCH12\tCH13\tCH14\tCH15\r\n");
			xil_printf("----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\r\n");
			xil_printf(">>>\r\n");
			for(int k=0; k <NBRWINDOWS ; k++){
				
				for(int s=0; s<32;s++){
					for(int c=0; c< 15; c++){
						xil_printf("%d\t",2048+PedSubstraction(&window,0,c,s));
					}
					xil_printf("%d\r\n",2048+PedSubstraction(&window,0,15,s));
				}
				xil_printf("<<<\r\n");
				xil_printf("\r\n");
			}
			axidma_rx_done = 0;

		}
		else{
			xil_printf("No interrupts\r\n");
		}

		ControlRegisterWrite(SMODE_MASK,DISABLE);
		sleep(1);
	}
*/

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


    xil_printf("\r\n***          Finished          ***\r\n");

    return 0;
}
