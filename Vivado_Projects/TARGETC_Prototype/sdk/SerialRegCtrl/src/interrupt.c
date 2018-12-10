#include "interrupt.h"


void platform_setup_interrupts(void)
{
	static XScuGic_Config *IntcConfig;
	int Status = XST_SUCCESS;

	SSVALID_intr_flg = 0;
	TPG_intr_flg = 0;

	// Setup AxiDMA
	Status = AxiDma_Initialize();
	if(Status != XST_SUCCESS){
		xil_printf("In %s: AxiDMA failed...\r\n",
		__func__);
		return Status;
	}

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
	
	//SSVALID Interrupt
	XScuGic_SetPriorityTriggerType(&Intc, XPAR_FABRIC_TARGETC_0_SSVALID_INTR_INTR, 0xA1, 0x3);
	
	//AXIDMA Interrupt
	XScuGic_SetPriorityTriggerType(&Intc, XPAR_FABRIC_AXI_DMA_0_S2MM_INTROUT_INTR, 0xA1, 0x3);
	
	Xil_ExceptionInit();

	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler)XScuGic_InterruptHandler,
			(void *)&Intc);
			
	
	//Connect Interruptions		
	Status = XScuGic_Connect(&Intc,	XPAR_FABRIC_TARGETC_0_SSVALID_INTR_INTR,
							(Xil_InterruptHandler)SSVALID_IntrHandler,
							&Intc);
	if (Status != XST_SUCCESS) {
		xil_printf("In %s: TIMER_IRPT_INTR failed...\r\n",
				__func__);
		return ;
	}
	
	Status = XScuGic_Connect(&Intc,	XPAR_FABRIC_AXI_DMA_0_S2MM_INTROUT_INTR,
							(Xil_InterruptHandler)AxiDMA_IntrHandler,
							&AxiDmaInstance);
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
	XScuGic_Enable(&Intc, XPAR_FABRIC_AXI_DMA_0_S2MM_INTROUT_INTR);

	XAxiDma_IntrEnable(&AxiDmaInstance, XAXIDMA_IRQ_IOC_MASK, XAXIDMA_DEVICE_TO_DMA);
	
	Xil_ExceptionEnableMask(XIL_EXCEPTION_IRQ);

	return;
}


void platform_cleanup_interrupts()
{
	XScuGic_Disable(&Intc, XPAR_FABRIC_TARGETC_0_SSVALID_INTR_INTR);
	
	XAxiDma_IntrDisable(&AxiDmaInstance, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);
	
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

			//printf("%d\t%d\t",regptr[TC_RDAD_ADDR_REG],regptr[TC_SS_SELECT_REG]);
			//printf("%d %d\t%d\t",test.oddeven,test.addr,test.sscnt);
			decToHexa(regptr[TC_RDAD_ADDR_REG]);
			xil_printf("\t");
			
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
int AxiDma_Initialize(void)
{
	int Status = XST_SUCCESS;
	XAxiDma_Config *ConfigPtr;

	ConfigPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_0_DEVICE_ID);
	if (ConfigPtr == NULL){
		xil_printf("In %s: AxiDMA Look up config failed...\r\n",
		__func__);
		return XST_FAILURE;
	}
	Status = XAxiDma_CfgInitialize(&AxiDmaInstance, ConfigPtr);
	if (Status != XST_SUCCESS) {
		xil_printf("In %s: AxiDMA Cfg initialization failed...\r\n",
		__func__);
		return Status;
	}

	Status = XAxiDma_Selftest(&AxiDmaInstance);
	if (Status != XST_SUCCESS) {
		xil_printf("In %s: AxiDMA Self test failed...\r\n",
		__func__);
		return Status;
	}

	Status = XAxiDma_HasSg(&AxiDmaInstance);
	if (Status != XST_SUCCESS){
		xil_printf("In %s: AxiDMA configured as SG mode...\r\n",
		__func__);
		return Status;
	}

	XAxiDma_Reset(&AxiDmaInstance);
	uint32_t reg = XAxiDma_ReadReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET, XAXIDMA_CR_OFFSET);
	XAxiDma_WriteReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET,XAXIDMA_CR_OFFSET, reg | XAXIDMA_CR_RESET_MASK);
	
	int TimeOutCnt = 5;
	while(TimeOutCnt){
		reg = XAxiDma_ReadReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET, XAXIDMA_CR_OFFSET);
		if((reg &  XAXIDMA_CR_RESET_MASK) == NULL) {
			break;
		}
		TimeOutCnt-=1;
		sleep(1);
	}

	if((reg &  XAXIDMA_CR_RESET_MASK) != NULL) {
		xil_printf("In %s: AxiDMA Reset failed...\r\n",
		__func__);
		return XST_FAILURE;
	}

	/* Disable MM2S Sied of AXI DMA */
	reg = XAxiDma_ReadReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_TX_OFFSET, XAXIDMA_CR_OFFSET);
	XAxiDma_WriteReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_TX_OFFSET,XAXIDMA_CR_OFFSET,reg & !XAXIDMA_CR_RUNSTOP_MASK);

	axidma_error = 0;
	axidma_rx_done = 0;
	return Status;
}

void AxiDMA_IntrHandler(XAxiDma* AxiDmaInst){
	uint32_t IrqStatus;

	/* Read pending interrupts */
	IrqStatus = XAxiDma_IntrGetIrq(AxiDmaInst, XAXIDMA_DEVICE_TO_DMA);

	/* Acknowledge pending interrupts */
	XAxiDma_IntrAckIrq(AxiDmaInst, IrqStatus, XAXIDMA_DEVICE_TO_DMA);

	/* If no interrupt is asserted, we do not do anything */
	if (!(IrqStatus & XAXIDMA_IRQ_ALL_MASK)) {
		return;
	}

	/*
	 * If error interrupt is asserted, raise error flag, reset the
	 * hardware to recover from the error, and return with no further
	 * processing.
	 */
	if ((IrqStatus & XAXIDMA_IRQ_ERROR_MASK)) {
		axidma_error = 1;
		return;
	}

	/* If completion interrupt is asserted, then set RxDone flag */
	if ((IrqStatus & XAXIDMA_IRQ_IOC_MASK)) {
		//transfer_data(PtrData, NBR_DATA*4);
		//XTime_GetTime(&tEnd_dma);
		axidma_rx_done = 1;
	}
}


void XAxiDma_SimpleTransfer_Hej(XAxiDma *InstancePtr, UINTPTR BuffAddr, int LengthOfBytes)
{
	uint32_t reg;

	XAxiDma_WriteReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET,XAXIDMA_DESTADDR_OFFSET, LOWER_32_BITS(BuffAddr));
	XAxiDma_WriteReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET,XAXIDMA_DESTADDR_MSB_OFFSET, 0);

	reg = XAxiDma_ReadReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET, XAXIDMA_CR_OFFSET);
	XAxiDma_WriteReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET,XAXIDMA_CR_OFFSET,reg | XAXIDMA_CR_RUNSTOP_MASK);

	XAxiDma_WriteReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET, XAXIDMA_BUFFLEN_OFFSET, LengthOfBytes);
}

