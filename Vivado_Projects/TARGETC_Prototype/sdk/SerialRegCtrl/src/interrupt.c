#include "interrupt.h"


void platform_setup_interrupts(void)
{
	static XScuGic_Config *IntcConfig;
	int Status = XST_SUCCESS;

	SSVALID_intr_flg = 0;
	TPG_intr_flg = 0;

	IntcConfig = XScuGic_LookupConfig(XPAR_SCUGIC_0_DEVICE_ID);
	if (IntcConfig == NULL){
		xil_printf("In %s: XScuGic Look up config failed...\r\n",
		__func__);
		return;
	}

	Status = XScuGic_CfgInitialize(&Intc, IntcConfig,IntcConfig->CpuBaseAddress);
	if (Status != XST_SUCCESS) {
		xil_printf("In %s: XScuGic Cfg initialization failed...\r\n",
		__func__);
		return;
	}

	// set the priority to 0xA0 (highest 0xF8, lowest 0x00) and a trigger for a rising edge 0x3.
	XScuGic_SetPriorityTriggerType(&Intc, XPAR_FABRIC_TARGETC_0_SSVALID_INTR_INTR, 0xA1, 0x3);
	
	Xil_ExceptionInit();

	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler)XScuGic_InterruptHandler,
			(void *)&Intc);

	Status = XScuGic_Connect(&Intc,	XPAR_FABRIC_TARGETC_0_SSVALID_INTR_INTR,
							(Xil_InterruptHandler)SSVALID_IntrHandler,
							&Intc);
	if (Status != XST_SUCCESS) {
		xil_printf("In %s: TIMER_IRPT_INTR failed...\r\n",
				__func__);
		return ;
	}


	return;
}


void platform_enable_interrupts()
{
	/*
	 * Enable non-critical exceptions.
	 */
	SSVALID_intr_flg = 0;
	TPG_intr_flg = 0; 
	TC_ERROR_intr_flg = 0;
	 
	XScuGic_Enable(&Intc, XPAR_FABRIC_TARGETC_0_SSVALID_INTR_INTR);

	Xil_ExceptionEnableMask(XIL_EXCEPTION_IRQ);

	return;
}


void platform_cleanup_interrupts()
{
	XScuGic_Disable(&Intc, XPAR_FABRIC_TARGETC_0_SSVALID_INTR_INTR);
	
	Xil_ICacheDisable();
	Xil_DCacheDisable();
	return;
}

// Uer Functions for interrupt handler
void SSVALID_IntrHandler(void){
	
	if((regptr[TC_STATUS_REG] & SSVALID_MASK) == SSVALID_MASK){
		//xil_printf(">> Interrupt \t");
		//Interrupt handler 
		if((regptr[TC_CONTROL_REG] & SS_TPG_MASK) == 0){
			TPG_intr_flg = 1;
			xil_printf("TPG %d\n\r",TPG_intr_flg);
		}
		else{
			SSVALID_intr_flg = 1;
			printf("%d\t",regptr[TC_RDAD_ADDR_REG]*32+regptr[TC_SS_SELECT_REG]);
			
			printf("%d\t",regptr[TC_eDO_CH0_REG]);
			printf("%d\t",regptr[TC_eDO_CH1_REG]);
			printf("%d\t",regptr[TC_eDO_CH2_REG]);
			printf("%d\r\n",regptr[TC_eDO_CH3_REG]);
			//SSVALID_intr_flg = 0;
			//ControlRegisterWrite(SSACK_MASK,DISABLE);
			samplecnt++;
			if(samplecnt > 511*32){
				TC_ERROR_intr_flg = 1;
				xil_printf("ERROR \r\n");
			}
		}
		//GetTargetCStatus();
		
		//Reading Sample
	//	printf("CH0:\t%d\r\n",regptr[TC_eDO_CH0_REG]);
	/*	decToHexa(regptr[TC_eDO_CH0_REG]);
		xil_printf("\t");
		decToBin(regptr[TC_eDO_CH0_REG]);
		xil_printf("\r\n");
		xil_printf("CH1:\t");
		decToHexa(regptr[TC_eDO_CH1_REG]);
		xil_printf("\t");
		decToBin(regptr[TC_eDO_CH1_REG]);
		xil_printf("\r\n");*/
		
		ControlRegisterWrite(SSACK_MASK,ENABLE);
		//GetTargetCStatus();
		
	}
	else{
		xil_printf("Error in Intterupt");
	}
	
	if(SSVALID_intr_flg){
		ControlRegisterWrite(SSACK_MASK,DISABLE);
		SSVALID_intr_flg = 0;
	}
}

