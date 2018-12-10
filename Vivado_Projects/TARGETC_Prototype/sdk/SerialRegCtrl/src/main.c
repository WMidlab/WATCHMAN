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


/** @struct test_struct_t
 *  @brief This structure blah blah blah...
 */
struct test_struct_t{
  int a;                ///< Number of particals in the universe.
  int b;                ///< Number of particals in the universe.
  test_struct_t *next;  ///< Number of particals in the universe.
}


/** **********************************************************
 * @brief 	Test Verbosity Level Function
 *
 * @param	  void
 * @return  status
 * @note 	Voilaaaaa ! ;)
 ************************************************************* */
int test(void){
#ifdef DEBUG
   xil_printf("ID_DEBUG\r\n");
#elif defined VERBOSE
   xil_printf("ID_VERBOSE\r\n");
#else

   xil_printf("ID_ELSE\r\n");
#endif
	return 0;
}

/** **********************************************************
 * @brief 	Gray Code Encoding
 *
 * @param	  n The number to be encoded
 * @return	The nubmer encoded
 ************************************************************* */
int gray_encode(int n) {
    return n ^ (n >> 1);
}
/** **********************************************************
 * @brief 	Gray Code Decoding
 *
 * @param	  n the number to be decoded
 * @return	integer : the nubmer Decoded
 ************************************************************* */
int gray_decode(int n) {
    int p = n;
    while (n >>= 1) p ^= n;
    return p;
}

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

    init_platform();
	platform_setup_interrupts();
	platform_enable_interrupts();
	//test();


    xil_printf("\n\r*** ************************** *** ");
    xil_printf("\n\r*** TARGETC : Testing Software *** \n\r");
    xil_printf("*** ************************** *** \n\r");

    // Test I2C
    status = DAC_LTC2657_initialize(1.25);
    if(status != XST_SUCCESS){
    	xil_printf("ERROR:\tFailure to initialize I2C DAC LT2657\r\n");
    }
    xil_printf("DAC LT2657 ... OK\r\n");
    sleep(2);

    xil_printf("DLLlocked...");

	while(regptr[TC_STATUS_REG] & LOCKED_MASK != LOCKED_MASK){
		usleep(100000); //sleep 100ms
	}
	xil_printf("OK\r\n");
	xil_printf("\r\n");


	xil_printf("\n\r*** CONTROL *** \n\r");
	ControlRegisterWrite(NULL,INIT);
	GetTargetCControl();

	ControlRegisterWrite(SWRESET_MASK,DISABLE);

	GetTargetCControl();
	usleep(100000);

	ControlRegisterWrite(REGCLR_MASK,DISABLE);
    ControlRegisterWrite(SWRESET_MASK,ENABLE);
    GetTargetCControl();
 	usleep(100000);

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



// *** Vadjustement ***

/*	int vadjp = 0, vadjn =0;

	xil_printf("\n\r*** MonTiming *** \n\r");
	sleep(1);


	int sw = 0;
	//SSTOUT OK
	xil_printf("SSTOUT OK \r\n");
	WriteReadBackRegister(TC_MONTIMING_REG, TC_MT_SSTOUT_MASK );
	WriteRegister(TC_VADJP_REG,		1020);	//1010 - 1030
	WriteRegister(TC_VADJN_REG,		2430);	//2420 - 2450
	sleep(3);


	xil_printf("SSPIN OK \r\n");
	WriteReadBackRegister(TC_MONTIMING_REG, TC_MT_SSPIN_MASK );
	WriteRegister(TC_SSPIN_LE_REG,		9);
	WriteRegister(TC_SSPIN_TE_REG,		40);
	sleep(3);


	xil_printf("SSPOUT OK \r\n");
	WriteReadBackRegister(TC_MONTIMING_REG, TC_MT_SSPOUT_MASK );
	sleep(3);


	xil_printf("WR1_ADDR_SYNC\t");
	WriteRegister(TC_WR1_ADDR_LE_REG,		0);
	WriteRegister(TC_WR1_ADDR_TE_REG,		29);
	WriteReadBackRegister(TC_MONTIMING_REG, TC_MT_WR1_ADDR_SYNC_MASK );
	sleep(3);

	xil_printf("WR_STRB1\t");
	WriteRegister(TC_WR_STRB1_LE_REG,		15);
	WriteRegister(TC_WR_STRB1_TE_REG,		46);
	WriteReadBackRegister(TC_MONTIMING_REG, TC_MT_WR_STRB1_MASK );
	sleep(3);

	xil_printf("WR2_ADDR_SYNC\t");
	WriteRegister(TC_WR2_ADDR_LE_REG,		20);
	WriteRegister(TC_WR2_ADDR_TE_REG,		51);
	WriteReadBackRegister(TC_MONTIMING_REG, TC_MT_WR2_ADDR_SYNC_MASK );
	sleep(3);

	xil_printf("WR_STRB2\t");
	WriteRegister(TC_WR_STRB2_LE_REG,		32);
	WriteRegister(TC_WR_STRB2_TE_REG,		63);
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

/*	xil_printf("*** TestStream ***\r\n");
  	Xil_DCacheFlushRange((UINTPTR)window, 512*sizeof(int));
	XAxiDma_SimpleTransfer_Hej(&AxiDmaInstance,(UINTPTR)window, (512*sizeof(int)));
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

    ControlRegisterWrite(SMODE_MASK,DISABLE);

*/
// STORAGE STREAM
/*	xil_printf("*** Storage Stream ***\r\n");
  	Xil_DCacheFlushRange((UINTPTR)window, 512*sizeof(int));
	XAxiDma_SimpleTransfer_Hej(&AxiDmaInstance,(UINTPTR)window, (512*sizeof(int)));
    //switch to stream rather than normal Axi-Lite
    ControlRegisterWrite(SMODE_MASK ,ENABLE);

	samplecnt = 0;

   	ControlRegisterWrite(SS_TPG_MASK,ENABLE);	// SAmple and not TPG

    regptr[TC_FSTWINDOW_REG] = 0;
	regptr[TC_NBRWINDOW_REG] = 1;

    ControlRegisterWrite(WINDOW_MASK,ENABLE);


	timeout= 5;
	tmp = 0;
	while(timeout && !axidma_rx_done){
		sleep(1);
		xil_printf("... ");
		timeout--;
	}
	xil_printf("\r\n");
	ControlRegisterWrite(WINDOW_MASK,DISABLE);

	if(axidma_rx_done){
		Xil_DCacheInvalidateRange((UINTPTR)window, 512*sizeof(int));

		xil_printf("CH0\tCH1\tCH2\tCH3\tCH4\tCH5\tCH6\tCH7\tCH8\tCH9\tCH10\tCH11\tCH12\tCH13\tCH14\tCH15\r\n");
		for(int i=0; i<32;i++){
			xil_printf("%d\t",window[i]);
			xil_printf("%d\t",window[i+32]);
			xil_printf("%d\t",window[i+32*2]);
			xil_printf("%d\t",window[i+32*3]);

			xil_printf("%d\t",window[i+32*4]);
			xil_printf("%d\t",window[i+32*5]);
			xil_printf("%d\t",window[i+32*6]);
			xil_printf("%d\t",window[i+32*7]);

			xil_printf("%d\t",window[i+32*8]);
			xil_printf("%d\t",window[i+32*9]);
			xil_printf("%d\t",window[i+32*10]);
			xil_printf("%d\t",window[i+32*11]);

			xil_printf("%d\t",window[i+32*12]);
			xil_printf("%d\t",window[i+32*13]);
			xil_printf("%d\t",window[i+32*14]);
			xil_printf("%d\r\n",window[i+32*15]);
		}
		axidma_rx_done = 0;
	}
	else{
		xil_printf("No interrupts\r\n");
		Xil_DCacheInvalidateRange((UINTPTR)window, 512*sizeof(int));
		for(int i=0; i<32;i++){
			xil_printf("%d\t",window[i]);
			xil_printf("%d\t",window[i+32]);
			xil_printf("%d\t",window[i+32*2]);
			xil_printf("%d\t",window[i+32*3]);

			xil_printf("%d\t",window[i+32*4]);
			xil_printf("%d\t",window[i+32*5]);
			xil_printf("%d\t",window[i+32*6]);
			xil_printf("%d\t",window[i+32*7]);

			xil_printf("%d\t",window[i+32*8]);
			xil_printf("%d\t",window[i+32*9]);
			xil_printf("%d\t",window[i+32*10]);
			xil_printf("%d\t",window[i+32*11]);

			xil_printf("%d\t",window[i+32*12]);
			xil_printf("%d\t",window[i+32*13]);
			xil_printf("%d\t",window[i+32*14]);
			xil_printf("%d\r\n",window[i+32*15]);
		}
	}

    ControlRegisterWrite(SMODE_MASK,DISABLE);
	sleep(1);
*/
// *** STORAGE ***

	xil_printf("*** STORAGE ***\r\n");


	samplecnt = 0;

   	ControlRegisterWrite(SS_TPG_MASK,ENABLE);	// SAmple and not TPG

    //Setup AXI DMA


    regptr[TC_FSTWINDOW_REG] = 0;
	regptr[TC_NBRWINDOW_REG] = 1;

    ControlRegisterWrite(WINDOW_MASK,ENABLE);

	sleep(1);


	timeout= 5;
	tmp = 0;
	while(timeout){
		sleep(1);
		//if(SSVALID_intr_flg == 1){
		//	printf("%d\t%d\tCH0:\t%d\r\n",regptr[TC_RDAD_ADDR_REG],regptr[TC_SS_SELECT_REG],regptr[TC_eDO_CH0_REG]);
		//	SSVALID_intr_flg = 0;
		//	ControlRegisterWrite(SSACK_MASK,DISABLE);
		//}
		if(tmp == samplecnt){
			timeout--;
			xil_printf("Timeout %d\r\n",timeout);
			//GetTargetCStatus();
			//GetTargetCControl();
		}
		else{
			timeout = 5;
		}
		tmp = samplecnt;

		if(TC_ERROR_intr_flg) break;
    }
	xil_printf("\r\nCnt : %d\r\n",samplecnt);


// END CLEANING UP
    xil_printf("\n\r*** ************************** ***");

    ControlRegisterWrite(WINDOW_MASK,DISABLE);
    ControlRegisterWrite(SWRESET_MASK,DISABLE);
	ControlRegisterWrite(REGCLR_MASK,ENABLE);

	platform_cleanup_interrupts();
    cleanup_platform();


    xil_printf("\r\n***          Finished          ***\r\n");

    return 0;
}
