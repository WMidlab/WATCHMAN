/******************************************************************************
*
* DMA Test
*
******************************************************************************/


#include <stdio.h>
#include "platform.h"
#include "xparameters.h"
#include "xil_printf.h"

#include "xscugic.h"
#include "xil_exception.h"

#include "xaxidma.h"

#include "AXIS_Peripheral.h"

#include "xtime_l.h"

/*** User Define ***************************************************************/

#define PACKETS 1000

#define RX_BUFFER_BASE (XPAR_PS7_DDR_0_S_AXI_BASEADDR + 0x00300000)

/*** Prototypes ***************************************************************/

static void RxIntrHandler(void *Callback);
static void TxIntrHandler(void *Callback);
static int XAxiDma_SimpleTransfer_Hej(XAxiDma *InstancePtr, UINTPTR BuffAddr, int LengthOfBytes);

static void XAxiDma_S2MM_DMASR(void);
static void XAxiDma_S2MM_DMACR(void);
void decToHexa(int n) ;

static void interrupt_AXIS_Register(void *CallBackRef);
/*** Variables - Global ******************************************************/

static XTime tStart, tEnd;

XAxiDma_Config *DMAConfig;
static XAxiDma AxiDma;

static XScuGic_Config *IntcConfig;	//INTC Interrupt Controller
static XScuGic Intc;
//static INTC Intc;	/* Instance of the Interrupt Controller */

volatile int RxDone;
volatile int TxDone;
volatile int Error;

//static int PtrData[PACKETS];
int *PtrData;

int main(){

	init_platform();
	
	Error = 0;
	RxDone = 0;

	xil_printf("\r\nDMA Test - Multiple Packets\r\n");
	
	
//*** Init the register in AXIS Peripheral ************************/
	int *regbank = XPAR_AXIS_TEST_COMPONENT_0_S00_AXI_BASEADDR;
	regbank[CONTROL_REG] = 0;			// Stop
	regbank[NBR_OF_PACKETS_REG] = 0;	// Nbr of packets = 0
	regbank[CONTENT_PACKET_1] = 0;		// Content of 1st packet = 0

	int Status;

	DMAConfig = XAxiDma_LookupConfig(XPAR_AXI_DMA_0_DEVICE_ID);
	if (!DMAConfig) {
		xil_printf("No config found for %d\r\n", XPAR_AXI_DMA_0_DEVICE_ID);

		return XST_FAILURE;
	}
	
	/* Initialize DMA engine */
	Status = XAxiDma_CfgInitialize(&AxiDma, DMAConfig);

	if (Status != XST_SUCCESS) {
		xil_printf("Initialization failed %d\r\n", Status);
		return XST_FAILURE;
	}

	if(XAxiDma_HasSg(&AxiDma)){
		xil_printf("Device configured as SG mode \r\n");
		return XST_FAILURE;
	}
	
	XAxiDma_Reset(&AxiDma);
	XAxiDma_WriteReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET,XAXIDMA_CR_OFFSET,XAxiDma_ReadReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET, XAXIDMA_CR_OFFSET)| XAXIDMA_CR_RESET_MASK);
	int TimeOutCnt = 5;
	while(TimeOutCnt){
		if(!(XAxiDma_ReadReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET, XAXIDMA_CR_OFFSET) &  XAXIDMA_CR_RESET_MASK)) {
			xil_printf("Reset XAxiDma Done\r\n");
			break;
		}
		TimeOutCnt-=1;
		sleep(1);
	}
	/* Set up Interrupt system  */
		
	IntcConfig = XScuGic_LookupConfig(XPAR_SCUGIC_0_DEVICE_ID);
	if (NULL == IntcConfig) {
		xil_printf("Look up FAILED\r\n");
		return XST_FAILURE;
	}

	//Status = XScuGic_CfgInitialize(&Intc, IntcConfig,IntcConfig->CpuBaseAddress);
	Status = XScuGic_CfgInitialize(&Intc, IntcConfig,IntcConfig->CpuBaseAddress);
	if (Status != XST_SUCCESS) {
		xil_printf("CfgINIT FAILED\r\n");
		return XST_FAILURE;
	}

	// set the priority to 0xA0 (highest 0xF8, lowest 0x00) and a trigger for a rising edge 0x3.
	XScuGic_SetPriorityTriggerType(&Intc, XPAR_FABRIC_AXIS_TEST_COMPONENT_0_S00_AXI_INTR_INTR, 0xA1, 0x3);
	XScuGic_SetPriorityTriggerType(&Intc, XPAR_FABRIC_AXI_DMA_0_S2MM_INTROUT_INTR, 0xA0, 0x3);
	
	/*
	 * Connect the device driver handler that will be called when an
	 * interrupt for the device occurs, the handler defined above performs
	 * the specific interrupt processing for the device.
	 */

	Status = XScuGic_Connect(&Intc, XPAR_FABRIC_AXI_DMA_0_S2MM_INTROUT_INTR,
				(Xil_InterruptHandler)RxIntrHandler,
				&AxiDma);
	if (Status != XST_SUCCESS) {
		return Status;
	}
	
	// 2nd Interrupt to connect
	Status = XScuGic_Connect(&Intc,	XPAR_FABRIC_AXIS_TEST_COMPONENT_0_S00_AXI_INTR_INTR,
							(Xil_ExceptionHandler)interrupt_AXIS_Register, 
							&Intc);
	if (Status != XST_SUCCESS) {
		xil_printf("FAILURE XScuGic_Connect\r\n");
		return XST_FAILURE;
	}
	/*Status = XScuGic_Connect(&Intc, XPAR_FABRIC_AXI_DMA_0_S2MM_INTROUT_INTR,
				(Xil_InterruptHandler)TxIntrHandler,
				&AxiDma);
	if (Status != XST_SUCCESS) {
		return Status;
	}*/

	XScuGic_Enable(&Intc, XPAR_FABRIC_AXI_DMA_0_S2MM_INTROUT_INTR);
	XScuGic_Enable(&Intc, XPAR_FABRIC_AXIS_TEST_COMPONENT_0_S00_AXI_INTR_INTR);

	/* Enable interrupts from the hardware */

	Xil_ExceptionInit();
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler)XScuGic_InterruptHandler,
			(void *)&Intc);

	Xil_ExceptionEnable();
	
	/* Disable MM2S Sied of AXI DMA */
	XAxiDma_WriteReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_TX_OFFSET,XAXIDMA_CR_OFFSET,XAxiDma_ReadReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_TX_OFFSET, XAXIDMA_CR_OFFSET)& !XAXIDMA_CR_RUNSTOP_MASK);
	
		/* Disable all interrupts before setup */

	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK,XAXIDMA_DMA_TO_DEVICE);
	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK,XAXIDMA_DEVICE_TO_DMA);
				
	/* Enable all interrupts */
	//XAxiDma_IntrEnable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);
	//XAxiDma_IntrEnable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	
	XAxiDma_WriteReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET,XAXIDMA_CR_OFFSET,XAxiDma_ReadReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET, XAXIDMA_CR_OFFSET)| XAXIDMA_IRQ_IOC_MASK);
	
	//int PacketsToSend = 0;
	// For loop
	for(int k= 1; k < 5 ; k++){
		PacketsToSend = PACKETS*k;
		regbank[NBR_OF_PACKETS_REG] = PacketsToSend;
		regbank[CONTENT_PACKET_1] = 100*k;
		
		if(regbank[NBR_OF_PACKETS_REG] != PacketsToSend){
			xil_printf("Error launding regbank[NBR_OF_PACKETS_REG]\r\n");
			break;
		}
		if(regbank[CONTENT_PACKET_1] != 100*k){
			xil_printf("Error launding regbank[CONTENT_PACKET_1]\r\n");
			break;
		}
		
		xil_printf("Packet N%d :\tNbr:%d\tContent%d\r\n",k,regbank[NBR_OF_PACKETS_REG],regbank[CONTENT_PACKET_1]);
		
		PtrData = malloc(sizeof(int)*PacketsToSend);
		if(PtrData == NULL){
			xil_printf("Malloc Failed\r\n");
			return XST_FAILURE;
		}
		else{
			for(int i=0; i < PacketsToSend;i++){
				PtrData[i] = i;
			}
		}
		
		Xil_DCacheFlushRange((UINTPTR)PtrData, PacketsToSend*sizeof(int));

		Status = XAxiDma_SimpleTransfer_Hej(&AxiDma,(UINTPTR)PtrData, (PacketsToSend*sizeof(int)));	
		if (Status == XST_FAILURE) {
			xil_printf("Failure\r\n");	
			return XST_FAILURE;
		}
		else if(Status == XST_INVALID_PARAM){
			xil_printf("Invalid\r\n");	
				return XST_INVALID_PARAM;
		}	
		
		//*** ResetTimer *************************/
		TimeOutCnt = 5;	
		
		//*** Start Transfer *********************/
		regbank[CONTROL_REG] = 1;		//Enable Axi Peripheral to start sending data
		
		while (!RxDone && !Error && TimeOutCnt) {
				/* NOP */
				sleep(1);
				TimeOutCnt--;
				xil_printf("...\r\n");
		}
		if(!TimeOutCnt){
			xil_printf(">> Time Out Reached 5sec\r\n");
		}
		else if(RxDone){
			xil_printf(">> RxDone Interrupt Caught\r\n");
			xil_printf("\tVerifying...");
			
			Xil_DCacheInvalidateRange((UINTPTR)PtrData, PacketsToSend*sizeof(int));
	
			int cst = regbank[CONTENT_PACKET_1];
			for(int a=0; a < PacketsToSend; a++){
				if(PtrData[a] != (a+cst)){
					xil_printf("FAILED\r\n");
					Error = 1;
					break;
				}
			}
						
			if(!Error){
				xil_printf("SUCCESS\r\n");
				printf("Output took %llu clock cycles.\n", 2*(tEnd - tStart));
 				printf("Output took %.2f us.\n",1.0 * (tEnd - tStart) / (COUNTS_PER_SECOND/1000000));
				printf("Bandwidth:%.2f Mbit/s\r\n",PacketsToSend*32/(1.0 * (tEnd - tStart) / (COUNTS_PER_SECOND/1000000)) );
			}
			else{
				for(int a=0; a < PacketsToSend; a++){
					decToHexa(&PtrData[a]);
					xil_printf("\tPtrData[%d]\t= %d\t (= %d)\r\n",a,PtrData[a],a+cst);
				}
			}
		}
		else if(Error){
			xil_printf(">> Error\r\n");
			break;
		}
		
		if(Error){
			xil_printf("General Error while Reading back values\r\n");
			break;
		}
		
		//regbank[NBR_OF_PACKETS_REG] = 0;
		regbank[CONTROL_REG] = 0;		//Enable Axi Peripheral to start sending data
		free(PtrData);
		
		Error = 0;
		RxDone = 0;
		xil_printf("\r\n");
		//sleep(1);
	}
	
	// Disable interrupts in the Processor.
	Xil_ExceptionDisable();
	XScuGic_Disconnect(&Intc, XPAR_FABRIC_AXI_DMA_0_S2MM_INTROUT_INTR);
	XScuGic_Disconnect(&Intc, XPAR_FABRIC_AXIS_TEST_COMPONENT_0_S00_AXI_INTR_INTR);

	xil_printf("*** END PROGRAM ***\r\n");

    cleanup_platform();
    return 0;
}

/*****************************************************************************/
/*
*
* This is the Interrupt Handler from AXI Lite Start signal
*
******************************************************************************/

static void interrupt_AXIS_Register(void *CallBackRef){
	XTime_GetTime(&tStart);
	//printf("<<Transfer Start\r\n");
}
/*****************************************************************************/
/*
*
* This is the DMA RX interrupt handler function
*
* It gets the interrupt status from the hardware, acknowledges it, and if any
* error happens, it resets the hardware. Otherwise, if a completion interrupt
* is present, then it sets the RxDone flag.
*
* @param	Callback is a pointer to RX channel of the DMA engine.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
static void RxIntrHandler(void *Callback)
{
	XTime_GetTime(&tEnd);

	u32 IrqStatus;
	int TimeOut;
	XAxiDma *AxiDmaInst = (XAxiDma *)Callback;
 	
	//Xil_DCacheInvalidateRange((UINTPTR)PtrData, PACKETS*sizeof(int));
	
	/* Read pending interrupts */
	IrqStatus = XAxiDma_IntrGetIrq(AxiDmaInst, XAXIDMA_DEVICE_TO_DMA);

	/* Acknowledge pending interrupts */
	XAxiDma_IntrAckIrq(AxiDmaInst, IrqStatus, XAXIDMA_DEVICE_TO_DMA);

	/*
	 * If no interrupt is asserted, we do not do anything
	 */
	if (!(IrqStatus & XAXIDMA_IRQ_ALL_MASK)) {
		return;
	}

	/*
	 * If error interrupt is asserted, raise error flag, reset the
	 * hardware to recover from the error, and return with no further
	 * processing.
	 */
	if ((IrqStatus & XAXIDMA_IRQ_ERROR_MASK)) {

		Error = 1;

		/* Reset could fail and hang
		 * NEED a way to handle this or do not call it??
		 */
		/*XAxiDma_Reset(AxiDmaInst);

		TimeOut = 10000;

		while (TimeOut) {
			if(XAxiDma_ResetIsDone(AxiDmaInst)) {
				break;
			}

			TimeOut -= 1;
		}
		*/
		return;
	}

	/*
	 * If completion interrupt is asserted, then set RxDone flag
	 */
	if ((IrqStatus & XAXIDMA_IRQ_IOC_MASK)) {
		RxDone = 1;
		
	}
}

/****************************************************************************
*
* This is the DMA Simple Packet Transfert Function
*
******************************************************************************/
static int XAxiDma_SimpleTransfer_Hej(XAxiDma *InstancePtr, UINTPTR BuffAddr, int LengthOfBytes){

	int n;
	//xil_printf("Addr:\t%d %d\r\n",LOWER_32_BITS(BuffAddr),UPPER_32_BITS(BuffAddr));
	
	XAxiDma_WriteReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET,XAXIDMA_DESTADDR_OFFSET, LOWER_32_BITS(BuffAddr));
	//XAxiDma_WriteReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET,XAXIDMA_DESTADDR_MSB_OFFSET, UPPER_32_BITS(BuffAddr));
	XAxiDma_WriteReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET,XAXIDMA_DESTADDR_MSB_OFFSET, 0);
	
/*	xil_printf("Reg Low:\t");
	n = XAxiDma_ReadReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET,XAXIDMA_DESTADDR_OFFSET);
	decToHexa(n);
	xil_printf("\r\n");	
	
	xil_printf("Reg High:\t");
	n = XAxiDma_ReadReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET,XAXIDMA_DESTADDR_MSB_OFFSET);
	decToHexa(n);
	xil_printf("\r\n");	
*/
	
	XAxiDma_WriteReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET,XAXIDMA_CR_OFFSET,XAxiDma_ReadReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET, XAXIDMA_CR_OFFSET)| XAXIDMA_CR_RUNSTOP_MASK);
	
	XAxiDma_WriteReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET, XAXIDMA_BUFFLEN_OFFSET, LengthOfBytes);	
	
}

/****************************************************************************
*
* Read The bits of S2MM_DMACR Register
*
******************************************************************************/
static void XAxiDma_S2MM_DMACR(void){
	int Reg = XAxiDma_ReadReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET,XAXIDMA_CR_OFFSET);

	/* Register Set S2MM_DMACR
		0		RS
		1		n.a
		2		Reset
		3		KeyHole
		4 		Cyclic BD Enable
		5-11	n.a
		12		IOC_IrqEn
		13		Dly_IrqEn
		14		Err_IrqEn
		15		n.a
		16-23	IRQThreshold
		24-31	IRQDelay
	*/
	
	xil_printf(">> XAxiDma_S2MM_DMACR\r\n");
	xil_printf("\t%d\tRS\r\n",Reg & 0x00000001);
	xil_printf("\t%d\tReset\r\n",(Reg & 0x00000004)>>2);
	xil_printf("\t%d\tKeyHole\r\n",(Reg & 0x00000008)>>3);
	xil_printf("\t%d\tCyclic BD Enable\r\n",(Reg & 0x00000010)>>4);
	xil_printf("\t%d\tIOC_IrqEn\r\n",(Reg & 0x00001000)>>12);
	xil_printf("\t%d\tDly_IrqEn\r\n",(Reg & 0x00002000)>>13);
	xil_printf("\t%d\tErr_IrqEn\r\n",(Reg & 0x00004000)>>14);
	xil_printf("\t%d\tIRQThershold\r\n",(Reg & 0x00FF0000)>>16);
	xil_printf("\t%d\tIRQDelay\r\n",(Reg & 0xFF000000)>>24);
	
	
	
}
/****************************************************************************
*
* Read The bits of S2MM_DMASR Register
*
******************************************************************************/
static void XAxiDma_S2MM_DMASR(void){
	int Reg = XAxiDma_ReadReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET,XAXIDMA_SR_OFFSET);
	
	/* Register Set S2MM_DMASR
		0		Halted
		1		Idle
		2		n.a.
		3		SGincld
		4 		DMAIntErr
		5		DMASlvErr
		6		DMADecErr
		7		n.a.
		8		SGIntErr
		9		SGSlvErr
		10		SGDecErr
		11		n.a.
		12		IOC_Irq
		13		Dly_Irq
		14		Err_Irq
		15		n.a.
		16-23	IRQThresholdSts
		24-31	IRQDelaySts
	*/
	
	xil_printf(">> XAxiDma_S2MM_DMASR\r\n");
	xil_printf("\t%d\tHalted\r\n",Reg & 0x00000001);
	xil_printf("\t%d\tIdle\r\n",(Reg & 0x00000002)>>1);
	xil_printf("\t%d\tSGincld\r\n",(Reg & 0x00000008)>>3);
	xil_printf("\t%d\tDMAIntErr\r\n",(Reg & 0x00000010)>>4);
	xil_printf("\t%d\tDMASlvErr\r\n",(Reg & 0x00000020)>>5);
	xil_printf("\t%d\tDMADecErr\r\n",(Reg & 0x00000040)>>6);
	
	xil_printf("\t%d\tSGIntErr\r\n",(Reg & 0x00000100)>>8);
	xil_printf("\t%d\tSGSlvErr\r\n",(Reg & 0x00000200)>>9);
	xil_printf("\t%d\tSGDecErr\r\n",(Reg & 0x00000400)>>10);
	
	xil_printf("\t%d\tIOC_Irq\r\n",(Reg & 0x00001000)>>12);
	xil_printf("\t%d\tDly_Irq\r\n",(Reg & 0x00002000)>>13);
	xil_printf("\t%d\tErr_Irq\r\n",(Reg & 0x00004000)>>14);
	
	xil_printf("\t%d\tIRQThresholdSts\r\n",(Reg & 0x00FF0000)>>16);
	xil_printf("\t%d\tIRQDelaySts\r\n",(Reg & 0xFF000000)>>24);
		
}

void decToHexa(int n) 
{    
    // char array to store hexadecimal number 
    char hexaDeciNum[100]; 
      
    // counter for hexadecimal number array 
    int i = 0; 
    while(n!=0) 
    {    
        // temporary variable to store remainder 
        int temp  = 0; 
          
        // storing remainder in temp variable. 
        temp = n % 16; 
          
        // check if temp < 10 
        if(temp < 10) 
        { 
            hexaDeciNum[i] = temp + 48; 
            i++; 
        } 
        else
        { 
            hexaDeciNum[i] = temp + 55; 
            i++; 
        } 
          
        n = n/16; 
    } 
      
    // printing hexadecimal number array in reverse order 
    for(int j=i-1; j>=0; j--) 
        xil_printf("%c",hexaDeciNum[j]);
    
     
}
 

