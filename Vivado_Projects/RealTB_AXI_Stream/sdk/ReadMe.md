# Software Explained 
Date : 		3rd October 2018<br>
Author :	Jonathan Hendriks

## AXI Test Component - Register Map

| N# 	| Register Name     | Description   |
| ---- 	| --------- 		| -----|
| 1		| Control Register	| Enable/Disable the start sequence for sending data to the AXI DMA Stream. After a start (=1), the register must reset (=0) |
| 2		| Number of Packers | Indicates the number of packets (32 bits) to be sent to the AXI DMA |
| 3		| Content of packet 1 | ONLY usefull in RAMP_MODE, see register 4.
| 4		| Mode 				| Modes available: <br> - **RAMP_MODE** : The data output is equal to the content of packet 1 + (0 to Number of packets -1). Outputting a ramp with offset content of packet 1 <br> - **SAW_MODE** : The data output is equal to a saw wave 0-1-2-3-4-0-1-2-3-...<br> - **BIT_MODE** : The data is output like binary 0-1-0-1-0-...

## Code 
[AXI DMA Documentation - GiHub](https://xilinx.github.io/embeddedsw.github.io/axidma/doc/html/api/index.html)<br>
[AXI DMA v.7.1 - LogiCORE IP Product Guide](https://www.xilinx.com/support/documentation/ip_documentation/axi_dma/v7_1/pg021_axi_dma.pdf)<br>

### Initialization - Phase 0


We are using the xaxidma for Xilinx, some functions are already available to use and setup the AXI DMA.
```c
#include "xaxidma.h"
```

#### Axi Lite Interface
The following code access the AXI-Lite bus between the Zynq and the AXIS_Test_Component to setup the registers
```c
int *regbank = XPAR_AXIS_TEST_COMPONENT_0_S00_AXI_BASEADDR; // Points to the beginning of the registers
regbank[CONTROL_REG] = 0;			//Control is disabled
regbank[NBR_OF_PACKETS_REG] = 0;
regbank[CONTENT_PACKET_1] = 0;
```

#### AXI DMA - INIT
First of all, we lookup if a hardware configuration for the device ID (provided by xparameters.h), then we initialize it, checking the return value Status.
```c
XAxiDma_Config *DMAConfig;
static XAxiDma AxiDma;
...
DMAConfig = XAxiDma_LookupConfig(XPAR_AXI_DMA_0_DEVICE_ID);
...
Status = XAxiDma_CfgInitialize(&AxiDma, DMAConfig);
```

The Axi DMA is then reset to (maybe PL was on before and has old configuration, better to start from scratch). The reset function is from xaxidma.h, then we have to make sure the axi dma component is reset by reading the S2MM DMA Control register.  The AXI DMA can work in different mode, the register change according to the mode used. Direct Mode is used in this project and only using S2MM (Stream to Memory Mapped). <br> 

To access a register we take the base address of the axi dma component by axi lite `XPAR_AXI_DMA_0_BASEADDR` + offset for S2MM `XAXIDMA_RX_OFFSET` and the register map in [xaxidma_hw.h](https://github.com/Xilinx/embeddedsw/blob/master/XilinxProcessorIPLib/drivers/axidma/src/xaxidma_hw.h).
 
```c
XAxiDma_Reset(&AxiDma);	//From xaxidma.h function to reset
XAxiDma_WriteReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET,XAXIDMA_CR_OFFSET,XAxiDma_ReadReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET, XAXIDMA_CR_OFFSET)| XAXIDMA_CR_RESET_MASK);
int TimeOutCnt = 5;
while(TimeOutCnt){	//Timeout for no response from AXI DMA - Safeguard
	if(!(XAxiDma_ReadReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET, XAXIDMA_CR_OFFSET) &  XAXIDMA_CR_RESET_MASK)) {
		break;
	}
	TimeOutCnt-=1;
	sleep(1);
}
```

#### Interrupt system 
The Interrupt controller built in the ARM processor is XSCUGIC for Generic Interrupt Controller. `XScuGic_LookupConfig` retrieves a pointer to the configuration table for a device driver. `XScuGic_CfgInitialize` initialize a specific interrupt controller instance/driver.
```c
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
```

The priority is not necessary but is good to take into consideration. The interrupt ID is the one found in the xparameters.h file.
```c
// set the priority to 0xA0 (highest 0xF8, lowest 0x00) and a trigger for a rising edge 0x3.
XScuGic_SetPriorityTriggerType(&Intc, XPAR_FABRIC_AXIS_TEST_COMPONENT_0_S00_AXI_INTR_INTR, 0xA1, 0x3);
XScuGic_SetPriorityTriggerType(&Intc, XPAR_FABRIC_AXI_DMA_0_S2MM_INTROUT_INTR, 0xA0, 0x3);
```

Connect the connection between the Int_Id of the interrupt source and the associated handler that is to run when the interrupt is recognized. Then enable the interrupt source provided by the interrupt ID.
```c
Status = XScuGic_Connect(&Intc, XPAR_FABRIC_AXI_DMA_0_S2MM_INTROUT_INTR,
			(Xil_InterruptHandler)RxIntrHandler,
			&AxiDma);
if (Status != XST_SUCCESS) {
	return Status;
}
Status = XScuGic_Connect(&Intc,	XPAR_FABRIC_AXIS_TEST_COMPONENT_0_S00_AXI_INTR_INTR,
						(Xil_ExceptionHandler)interrupt_AXIS_Register, 
						&Intc);
if (Status != XST_SUCCESS) {
	return XST_FAILURE;
}

XScuGic_Enable(&Intc, XPAR_FABRIC_AXI_DMA_0_S2MM_INTROUT_INTR);
XScuGic_Enable(&Intc, XPAR_FABRIC_AXIS_TEST_COMPONENT_0_S00_AXI_INTR_INTR);
```

Xil_Functions are ARM Cortex A53,A9,R5 specific exception related to APIs and interrupt hanbling.
```c
/* Enable interrupts from the hardware */

Xil_ExceptionInit();
Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
		(Xil_ExceptionHandler)XScuGic_InterruptHandler,
		(void *)&Intc);

Xil_ExceptionEnable();
```

#### AXI DMA - Interrupt system 
The AXI DMA must configured to run the interruption. First of all, all the MM2S is not used and can be disabled. Secondly all interrupts must be disabled. Next the interruption `XAXIDMA_IRQ_IOC_MASK` is enabled by reading and writing back the value with a mask.

```c
/* Disable MM2S Sied of AXI DMA */
XAxiDma_WriteReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_TX_OFFSET,XAXIDMA_CR_OFFSET,XAxiDma_ReadReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_TX_OFFSET, XAXIDMA_CR_OFFSET)& !XAXIDMA_CR_RUNSTOP_MASK);

/* Disable all interrupts before setup */
XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK,XAXIDMA_DMA_TO_DEVICE);
XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK,XAXIDMA_DEVICE_TO_DMA);

XAxiDma_WriteReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET,XAXIDMA_CR_OFFSET,XAxiDma_ReadReg(XPAR_AXI_DMA_0_BASEADDR+XAXIDMA_RX_OFFSET, XAXIDMA_CR_OFFSET)| XAXIDMA_IRQ_IOC_MASK);
```	

### Transfert - Phase 1
The transfert is triggered by writing a 1 to the control register of AXIS_Test_Component, but before doing this, the component must known how many packets it must generate and in which mode. Secondly the AXI DMA will receive these value and will need to know how many WORDS (byte = 8bits), it is going to receive and where in memory it must save them. These things must be set before starting the transfert
```c
regbank[NBR_OF_PACKETS_REG] = 100;	
regbank[CONTENT_PACKET_1] = 2000; 
regbank[MODE_REG] = RAMP_MODE;		// Data out : 2000, 2001, 2002, 2003, ... 2099

Status = XAxiDma_SimpleTransfer_Hej(&AxiDma,(UINTPTR)PtrData, (PACKETS*sizeof(int)));

regbank[CONTROL_REG] = 1; 	// Transfert Starts!
```

### Transfert Start Interrupt - Phase 2
This interruption is generated by AXIS_Test_Component right after the register is set. We could clear the register here for instance but no express need. The interrupt is caught.

```c
static void interrupt_AXIS_Register(void *CallBackRef){
	XTime_GetTime(&tStart);	// Save time of transaction start
	/* Nothing important to be done here */
}
```

### Transfert End Interrupt - Phase 3
This interruption is generated by AXI DMA when it finished writting the last data into the memory. The interrupt handler for this should look for which interrupt occured and if an error happened during transfer.
```c
static void RxIntrHandler(void *Callback)
{
	XTime_GetTime(&tEnd);	// Save time of transaction end

	u32 IrqStatus;
	int TimeOut;
	XAxiDma *AxiDmaInst = (XAxiDma *)Callback;
 	
	/* Read pending interrupts */
	IrqStatus = XAxiDma_IntrGetIrq(AxiDmaInst, XAXIDMA_DEVICE_TO_DMA);

	/* Acknowledge pending interrupts */
	XAxiDma_IntrAckIrq(AxiDmaInst, IrqStatus, XAXIDMA_DEVICE_TO_DMA);

	// If no interrupt is asserted, we do not do anything	
	if (!(IrqStatus & XAXIDMA_IRQ_ALL_MASK)) {
		return;
	}

	// If error interrupt is asserted, raise error flag
	if ((IrqStatus & XAXIDMA_IRQ_ERROR_MASK)) {
		Error = 1;
		return;
	}

	// If completion interrupt is asserted, then set RxDone flag
	if ((IrqStatus & XAXIDMA_IRQ_IOC_MASK)) {
		RxDone = 1;
		return;
	}
}
```

### Processing Data - Phase 4
> **VERY IMPORTANT**<br>
> The code line must be present before processing any data from the AXI DMA.
> `Xil_DCacheInvalidateRange((UINTPTR)PtrData, PACKETS*sizeof(int));`
> After the AXI DMA has written to the DDR, the cache must be invalidate for the data array (Pointer and Size).

The code for checking out the data is the following :

```c
Xil_DCacheInvalidateRange((UINTPTR)PtrData, PACKETS*sizeof(int));	// Very Important line

//Check out data in memory
...
```
The AXIS_Test_Component must be "reset" to allow a new transfer to the AXI DMA. This is done by reseting the control register to 0.

```c
regbank[CONTROL_REG] = 0;
```

### Clean-Up - Phase 5
Cleaning up the processor after the program is finished is critical (freeing memory space, disabling interruption,...).

```c
// Free Memory
free(PtrData);

// Disable interrupts in the AXI DMA
XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK,XAXIDMA_DMA_TO_DEVICE);
XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK,XAXIDMA_DEVICE_TO_DMA);
	
// Disable interrupts in the Processor.
Xil_ExceptionDisable();
XScuGic_Disconnect(&Intc, XPAR_FABRIC_AXI_DMA_0_S2MM_INTROUT_INTR);
XScuGic_Disconnect(&Intc, XPAR_FABRIC_AXIS_TEST_COMPONENT_0_S00_AXI_INTR_INTR);

```


