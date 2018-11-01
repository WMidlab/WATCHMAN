/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"


#include "global.h"
#include "iic_DAC_LTC2657.h" 
#include "TARGETC_RegisterMap.h"
#include "interrupt.h"



int test(){

#ifdef DEBUG
   xil_printf("ID_DEBUG\r\n");
#elif defined VERBOSE
   xil_printf("ID_VERBOSE\r\n");
#else
  
   xil_printf("ID_ELSE\r\n");
#endif
}

int main()
{
	int status;
	
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

    xil_printf("\n\r*** MonTiming *** \n\r");
	sleep(1);
	

	int sw = 0;
	
// *** Vadjustement ***

/*	int vadjp = 0, vadjn =0;
	
	//SSTOUT OK
	xil_printf("SSTOUT OK \r\n");
	WriteReadBackRegister(TC_MONTIMING_REG, TC_MT_SSTOUT_MASK );
	WriteRegister(TC_VADJP_REG,		1020);	//1010 - 1030
	WriteRegister(TC_VADJN_REG,		2430);	//2420 - 2450
	//sleep(3);	


	xil_printf("SSPIN OK \r\n");
	WriteReadBackRegister(TC_MONTIMING_REG, TC_MT_SSPIN_MASK );
	WriteRegister(TC_SSPIN_LE_REG,		9);
	WriteRegister(TC_SSPIN_TE_REG,		40);
	//sleep(3);

	
	xil_printf("SSPOUT OK \r\n");
	WriteReadBackRegister(TC_MONTIMING_REG, TC_MT_SSPOUT_MASK );
	//sleep(3);
	
		
	xil_printf("WR1_ADDR_SYNC\t");
	WriteRegister(TC_WR1_ADDR_LE_REG,		0);
	WriteRegister(TC_WR1_ADDR_TE_REG,		29);
	WriteReadBackRegister(TC_MONTIMING_REG, TC_MT_WR1_ADDR_SYNC_MASK );
	//sleep(3);
	
	xil_printf("WR_STRB1\t");
	WriteRegister(TC_WR_STRB1_LE_REG,		15);
	WriteRegister(TC_WR_STRB1_TE_REG,		46);
	WriteReadBackRegister(TC_MONTIMING_REG, TC_MT_WR_STRB1_MASK );
	//sleep(3);

	xil_printf("WR2_ADDR_SYNC\t");
	WriteRegister(TC_WR2_ADDR_LE_REG,		30);
	WriteRegister(TC_WR2_ADDR_TE_REG,		61);
	WriteReadBackRegister(TC_MONTIMING_REG, TC_MT_WR2_ADDR_SYNC_MASK );
	//sleep(3);

	xil_printf("WR_STRB2\t");
	WriteRegister(TC_WR_STRB2_LE_REG,		54);
	WriteRegister(TC_WR_STRB2_TE_REG,		21);
	WriteReadBackRegister(TC_MONTIMING_REG, TC_MT_WR_STRB2_MASK );
	//sleep(3);
*/
/*
	int LE = 0;
	int TE = 31;
	
	while((LE < 64)){
		//usleep(50000);
		WriteRegister(TC_WR_STRB2_LE_REG,		LE);
		WriteRegister(TC_WR_STRB2_TE_REG,		TE%64);
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


// *** STORAGE ***

	xil_printf("*** STORAGE ***\r\n");
   
	samplecnt = 0;
		
   	ControlRegisterWrite(SS_TPG_MASK,ENABLE);	// SAmple and not TPG
    ControlRegisterWrite(STARTSTORAGE_MASK,ENABLE);

    while((regptr[TC_STATUS_REG] & STORAGE_MASK) != STORAGE_MASK){
		usleep(1);
	}
	
	
	int timeout= 10;
	int tmp = 0;
	while(timeout){
		sleep(1);
		//if(SSVALID_intr_flg == 1){
		//	printf("%d\t%d\tCH0:\t%d\r\n",regptr[TC_RDAD_ADDR_REG],regptr[TC_SS_SELECT_REG],regptr[TC_eDO_CH0_REG]);
		//	SSVALID_intr_flg = 0;
		//	ControlRegisterWrite(SSACK_MASK,DISABLE);
		//}	
		if(tmp == samplecnt){
			timeout--;
			xil_printf("Timeout %d, ",timeout);
			GetTargetCStatus();
			GetTargetCControl();
		}
		else{
			timeout = 10;
		}
		tmp = samplecnt;
		
		if(TC_ERROR_intr_flg) break;
    }
	xil_printf("\r\nCnt : %d\r\n",samplecnt);


// END CLEANING UP
    xil_printf("\n\r*** ************************** ***");
        
    ControlRegisterWrite(STARTSTORAGE_MASK,DISABLE);
    ControlRegisterWrite(SWRESET_MASK,DISABLE);
	ControlRegisterWrite(REGCLR_MASK,ENABLE);

	platform_cleanup_interrupts();	
    cleanup_platform();


    xil_printf("\r\n***          Finished          ***\r\n");
    
    return 0;
}


