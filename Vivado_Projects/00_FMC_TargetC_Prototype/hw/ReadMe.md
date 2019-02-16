# HW
Date: 15th of February 2019

Author: Jonathan Hendriks

Additionnal information, check [Master Thesis Jonathan Hendriks](WATCHMAN/Documentation/Master_Thesis/Hendriks_TM_2018-2019_S1.pdf)
For the unfinished of next step refer to [TODO.md](TODO.md)

## sim
Simulation files for various parts of the project :
- 	Round Buffer (TB_RoundBuffer.vhd)
- 	Full prototype (TARGETC_Prototype_TB_FIFO_AXIS.vhd)
- 	TARGETC internal
	-	Timing generator
	-	GCC 
	-	Sample Select
-	Asynchronous FIFO
-	Gray Code
	
## src
[TARGETC_TOPLEVEL.vhd](src/TARGETC_TOPLEVEL.vhd) is the top level of the system
### 98_Basic_Component
[afifoV2.vhdl](src/98_Basic_Component/afifoV2.vhdl) asynchronous FIFO

[clockcrossing_Buffer.vhdl](src/98_Basic_Component/clockcrossing_Buffer.vhd) Triple DFF for clock domain crossing.

[CNT_EN.vhdl](src/98_Basic_Component/CNT_EN.vhdl) Counter with enable

[counter.vhdl](src/98_Basic_Component/counter.vhdl) Counter 

[DFF.vhd](src/98_Basic_Component/DFF.vhd) D-Type Flip-Flop

[fifo.vhdl](src/98_Basic_Component/fifo.vhdl) synchronous FIFO

[iobuf.vhdl](src/98_Basic_Component/iobuf.vhd) Triple state IO buffer for I2C

### 99_Packages
[AXI_Lite_pkg.vhd](src/99_Packages/AXI_Lite_pkg.vhd)

[Register_pkg.vhd](src/99_Packages/Register_pkg.vhd)

[TARGETC_pkg.vhd](src/99_Packages/TARGETC_pkg.vhd) all information regarding records of bus, register map ID,  etc.

[WindowCPU_pkg.vhd](src/99_Packages/WindowCPU_pkg.vhd) CPU informaiton

### AXI_Stream_Interface
[AXI-STREAM_INTERFACE.vhdl](src/AXI_Stream_Interface/AXI-STREAM_INTERFACE.vhdl) interface between the FIFO Management unit and the AXI-DMA. It acts as a known buffer for the case where the DMA is not ready (STALL Mode). The last information from the FIFO Management are saved and then sent to the DMA.

### Clock_Management
[CLOCK_MANAGEMENT.vhd](src/Clock_Management/CLOCK_MANAGEMENT.vhd)

### Digitization_Readout
[READOUT_DIGITIZATION_SAMPLE](src/Digitization_Readout/READOUT_DIGITIZATION_SAMPLE.vhd)

### FiFo_Manager
[AddressDecoder](src/FiFo_Manager/AddressDecoder.vhdl) Address decoder for the read process 

[DataDecoder](src/FiFo_Manager/DataDecoder.vhdl) Data decode for the read process

[FIFO_MANAGER](src/FiFo_Manager/FIFO_MANAGER.vhdl) Top level for the FIFO Management

### Register_Handler
[REGISTER_HANDLER.vhd](src/Register_Handler/REGISTER_HANDLER.vhd) TARGETC Register interface

### Round_Buffer
[BitSelector.vhd](src/Round_Buffer/BitSelector.vhd) Bit 1-out-of-256 selection process using Hamming Code Correction 

[HammingDecoderV2.vhd](src/Round_Buffer/HammingDecoderV2.vhd) 16-Bit Hamming Code Correction

[BlockDelay.vhd](src/Round_Buffer/BlockDelay.vhd) Delay and accumulate

[CPU_CONTROLLERV3.vhd](src/Round_Buffer/CPU_CONTROLLERV3.vhd) Controller of the round buffer

[GrayDecoder.vhd](src/Round_Buffer/GrayDecoder.vhd)

[GrayEncoder.vhd](src/Round_Buffer/GrayEncoder.vhd)

[LookupTable_LE.vhd](src/Round_Buffer/LookupTable_LE.vhd)

[LookupTable_TE.vhd](src/Round_Buffer/LookupTable_TE.vhd)

[RoundBufferV6.vhd](src/Round_Buffer/RoundBufferV6.vhd)

[SingleTrigger.vhd](src/Round_Buffer/SingleTrigger.vhd)

[TRIGGER_CONTROLLER.vhd](src/Round_Buffer/TRIGGER_CONTROLLER.vhd)

[Window_BrainV2.vhd](src/Round_Buffer/Window_BrainV2.vhd) Window CPU component, this block is chained and a total of 256 elements are linked for finding the next address.

[WindowStoreV4.vhd](src/Round_Buffer/WindowStoreV4.vhd)

### TargetC_Control
[TARGETC_Control.vhd](src/TargetC_Control/TARGETC_Control.vhd)

