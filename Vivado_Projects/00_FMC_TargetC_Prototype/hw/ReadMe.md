# HW
Date: 15th of February 2019


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

### 99_Packages
### AXI_Stream_Interface
### Clock_Management
### Digitization_Readout
### FiFo_Manager
### Register_Handler
### Round_Buffer
### TargetC_Control


# TODO

## TARGETC
- [ ] SImulation of the ASIC

## Hardware
- [ ] Check all the Prototype board (same resistors, same capacitors, gain stages,...)

## Firmware (VHDL)
- [ ] Re-evaluate the firmware for the VHDL
- [ ] Trigger System in the file CPU_CONTROLLERV3.vhd [link](hw/src/Round_Buffer/CPU_CONTROLLERV3.vhd)


> **IMPORTANT:**
> Trigger System - New Idea is to have the address saved with the trigger information and build a control system to readout this FIFO.

## Software (in C)

