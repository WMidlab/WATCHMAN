
# TODO

## TARGETC
- [ ] SImulation of the ASIC

## Hardware
- [ ] Check all the Prototype board (same resistors, same capacitors, gain stages,...)

## Firmware (VHDL)
- [ ] Re-evaluate the firmware for the VHDL
- [ ] Trigger System in the file [CPU_CONTROLLERV3.vhd](hw/src/Round_Buffer/CPU_CONTROLLERV3.vhd)


> **IMPORTANT:**
> Trigger System - New Idea is to have the address saved with the trigger information and build a control system to readout this FIFO.

- [ ] Change the HP port for the ACP port in order to avoid cache issues
