#ifndef TARGETC_REGISTERMAP_H   /* prevent circular inclusions */
#define TARGETC_REGISTERMAP_H   /* by using protection macros */

/**
 * @file 	TARGETC_RegisterMap.h
 * @author	Jonathan Hendriks
 * @date	14th November 2018
 * @version 0.0
 */

#include <stdio.h>
#include "xil_printf.h"
#include "global.h"
#include "utility.h"

/*** DEFINES *********************************************************/
/*********************************************************************/

/** Definition of Registers **/
//Register Map for PCLK clock instance inside the ASIC value to send to C_TC_ADDR_REG
// ------------------------------------------------------
//	Register Map Target C
//	Date : 9th October 2018
// ------------------------------------------------------
/** @brief  DAC Fine tune for delay cells 1 to 62, TC_VDLYTUNE_REG is the base address */
#define TC_VDLYTUNE_REG		1

/** @brief  TARGETC Timing Generator parameter for SSTOUT Feedback */
#define TC_SSTOUTFB_REG			65

/** @brief  TARGETC Timing Generator parameter for SSPIN Leading Edge (LE) */
#define TC_SSPIN_LE_REG			66
/** @brief  TARGETC Timing Generator parameter for SSPIN Trailling Edge (TE) */
#define TC_SSPIN_TE_REG			67
/** @brief  TARGETC Timing Generator parameter for Write Strobe 2 Leading Edge (LE) */
#define TC_WR_STRB2_LE_REG		68
/** @brief  TARGETC Timing Generator parameter for Write Strobe 2 Trailling Edge (TE)*/
#define TC_WR_STRB2_TE_REG		69
/** @brief  TARGETC Timing Generator parameter for Write 2 Address Leading Edge (LE) */
#define TC_WR2_ADDR_LE_REG		70
/** @brief  TARGETC Timing Generator parameter for Write 2 Address Trailling Edge (TE)*/
#define TC_WR2_ADDR_TE_REG		71
/** @brief  TARGETC Timing Generator parameter for Write Strobe 1 Leading Edge (LE) */
#define TC_WR_STRB1_LE_REG		72
/** @brief  TARGETC Timing Generator parameter for Write Strobe 1 Trailling Edge (TE)*/
#define TC_WR_STRB1_TE_REG		73
/** @brief  TARGETC Timing Generator parameter for Write 2 Address Leading Edge (LE) */
#define TC_WR1_ADDR_LE_REG		74
/** @brief  TARGETC Timing Generator parameter for Write 2 Address Trailling Edge (TE)*/
#define TC_WR1_ADDR_TE_REG		75

/** @brief  Monitor Timing Register*/
#define TC_MONTIMING_REG		76


	/** @brief  Monitor Timing Output Pin selection mask : PASS*/
	#define TC_MT_PASS_MASK		0x00000004
	/** @brief  Monitor Timing Output Pin selection mask : SSPOUT*/
	#define TC_MT_SSPOUT_MASK	0x00000000
	/** @brief  Monitor Timing Output Pin selection mask : SSTOUT*/
	#define TC_MT_SSTOUT_MASK	0x00000010
	/** @brief  Monitor Timing Output Pin selection mask : SSTOUTFB*/
	#define TC_MT_SSTOUTFB_MASK	0x00000020
	/** @brief  Monitor Timing Output Pin selection mask : SSPIN*/
	#define TC_MT_SSPIN_MASK	0x00000030
	/** @brief  Monitor Timing Output Pin selection mask : WR_STRB1*/
	#define TC_MT_WR_STRB1_MASK			0x00000040
	/** @brief  Monitor Timing Output Pin selection mask : WR1_ADDR*/
	#define TC_MT_WR1_ADDR_SYNC_MASK	0x00000050
	/** @brief  Monitor Timing Output Pin selection mask : WR_STRB2*/
	#define TC_MT_WR_STRB2_MASK			0x00000060
	/** @brief  Monitor Timing Output Pin selection mask : WR2_ADDR*/
	#define TC_MT_WR2_ADDR_SYNC_MASK	0x00000070
	/** @brief  Monitor Timing Output Pin selection mask : VDD (set High)*/
	#define TC_MT_VDD_MASK			0x00000080

/** @brief  DAC Voltage Bias for QBIAS, VTRIMT and VBIAS*/
#define TC_VQBUFF_REG			77
/** @brief  DAC Voltage Bias for the Delay Lock Loop (DLL) */
#define TC_QBIAS_REG			78
/** @brief  DAC Voltage for fine tune of SSTOUFB signal*/
#define TC_VTRIMT_REG			79
/** @brief  DAC Voltage for global fine tune of the Vdly1 to Vdly64, with base address TC_VDLYTUNE_REG*/
#define TC_VBIAS_REG			80
/** @brief  DAC Voltage bias for VADJP, 0 = disable*/
#define TC_VAPBUFF_REG			81
/** @brief  DAC Voltage for the DLL*/
#define TC_VADJP_REG			82
/** @brief  DAC Voltage bias for VADJN, 0 = disable*/
#define TC_VANBUFF_REG			83
/** @brief  DAC Voltage for the DLL*/
#define TC_VADJN_REG			84
/** @brief  DAC Voltage bias for Super Buffer and Registers*/
#define TC_SBBIAS_REG			85

/** @brief  DAC Voltage bias for the discharge of the Wilkinson compator capacitor*/
#define TC_VDISCH_REG			86
/** @brief  DAC Voltage bias for increasing/decreasing the slope charge of the Wilkinson capacitor*/
#define TC_ISEL_REG				87
/** @brief  DAC Voltage Bias for SSBIAS, VDISCH and ISEL*/
#define TC_DBBIAS_REG			88
/** @brief  DAC Voltage Bias for 2nd MosFET stage */
#define TC_CMPBIAS2_REG			89
/** @brief  DAC Voltage Bias for the Pull-Up MosFET  */
#define TC_PUBIAS_REG			90
/** @brief  DAC Voltage Bias for the current source of the Wilkinson Comparator */
#define TC_CMPBIASIN_REG		91
/** @brief  Miscellanous register */
#define TC_MISCDIG_REG			92
/** @brief  Test pattern generator Register */
#define TC_TPG_REG				128

/** PL-PS User registers **/
/** @brief  Programmable Logic (PL) control register */
#define TC_CONTROL_REG 		 129
	/** @brief  PL Control Mask : Write to TARGETC register */
	#define			WRITE_MASK		0x00000001
//	#define			PCLK_MASK		0x00000002
//	#define			SCLK_MASK		0x00000004
//	#define			SIN_MASK		0x00000008

//	#define			RAMP_MASK		0x00000010

	/** @brief  PL Control Mask : control over TARGETC Register Clear input (RegCLR) */
	#define			REGCLR_MASK		0x00000020
//	#define			SS_INCR_MASK	0x00000040
	/** @brief  PL Control Mask : control over TARGETC Sample Any Select input (Sampl_Any), 0 = TPG or 1 = Sample */
	#define			SS_TPG_MASK		0x00000080

//	#define			SS_RESET_MASK	0x00000100
//	#define			RDAD_MASK		0x00000200
	/** @brief  PL Control Mask : Sample and Readout of windows depending on the arguments in TC_FSTWINDOW_REG and TC_NBRWINDOW_REG*/
	#define			WINDOW_MASK		0x00000400
//	#define			SSACK_MASK		0x00000800

	/** @brief  PL Control Mask : Software reset for PL side, 0=enable, 1 disable*/
	#define			SWRESET_MASK	0x00001000
	/** @brief  PL Control Mask : Development bit for selection between interrupt mode, 0= each sample redout or 1=AXI-DMA*/
	#define			SMODE_MASK		0x00002000
	/** @brief  PL Control Mask : Test the stream by sending dummy data from AXI-Stream component*/
	#define			TESTSTREAM_MASK	0x00004000
	/** @brief  PL Control Mask : Test the FIFO manager by filling it with dummy data */
	#define			TESTFIFO_MASK	0x00008000
	/** @brief  PL Control Mask : processing system busy mask, to diable new transfer before it is ready*/
	#define			PSBUSY_MASK		0x00010000
	/** @brief  PL Control Mask : PL Running mode, 0=User Mode or 1 = Trigger mode*/
	#define			CPUMODE_MASK	0x00020000


/** @brief  Programmable Logic (PL) status register */
#define TC_STATUS_REG		130
	/** @brief  PL Status Mask : Write Register action status*/
	#define			BUSY_MASK		0x00000001
	/** @brief  PL Status Mask : Clock management system MMCM lock feedback*/
	#define			LOCKED_MASK		0x00000002
	/** @brief  PL Status Mask : Feedback of the sample and readout of Windows action (WINDOW_MASK in control register) */
	#define			STORAGE_MASK	0x00000004
	/** @brief  PL Status Mask : Sample Select valid signal, monitors new sample availibility */
	#define			SSVALID_MASK	0x00000008
	/** @brief  PL Status Mask : Monitor busy bit for the readout, digitization and sample readout processes*/
	#define			WINDOWBUSY_MASK	0x00000010
	
//	#define			TEST_0_MASK		0x00000020
//	#define			TEST_1_MASK		0x00000040
//	#define			TEST_2_MASK		0x00000080
//	#define			TEST_3_MASK		0x00000100
//	#define			TEST_4_MASK		0x00000200
//	#define			TEST_5_MASK		0x00000400


/** @brief  Address of register to be update in the TARGETC for a write register operation */
#define TC_ADDR_REG  		131
/** @brief  read back register for write register operation */
#define TC_DATA_OUT_REG		132

/** @brief  Sample readout for Channel 0 using SMODE=0 */
#define TC_eDO_CH0_REG		133
/** @brief  Sample readout for Channel 1 using SMODE=0 */
#define TC_eDO_CH1_REG		134
/** @brief  Sample readout for Channel 2 using SMODE=0 */
#define TC_eDO_CH2_REG		135
/** @brief  Sample readout for Channel 3 using SMODE=0 */
#define TC_eDO_CH3_REG		136


/** @brief  Sample readout for Channel 4 using SMODE=0 */
#define TC_eDO_CH4_REG		137
/** @brief  Sample readout for Channel 5 using SMODE=0 */
#define TC_eDO_CH5_REG		138
/** @brief  Sample readout for Channel 6 using SMODE=0 */
#define TC_eDO_CH6_REG		139
/** @brief  Sample readout for Channel 7 using SMODE=0 */
#define TC_eDO_CH7_REG		140
/** @brief  Sample readout for Channel 8 using SMODE=0 */

#define TC_eDO_CH8_REG		141
/** @brief  Sample readout for Channel 9 using SMODE=0 */
#define TC_eDO_CH9_REG		142
/** @brief  Sample readout for Channel 10 using SMODE=0 */
#define TC_eDO_CH10_REG		143
/** @brief  Sample readout for Channel 11 using SMODE=0 */
#define TC_eDO_CH11_REG		144
/** @brief  Sample readout for Channel 12 using SMODE=0 */

#define TC_eDO_CH12_REG		145
/** @brief  Sample readout for Channel 13 using SMODE=0 */
#define TC_eDO_CH13_REG		146
/** @brief  Sample readout for Channel 14 using SMODE=0 */
#define TC_eDO_CH14_REG		147
/** @brief  Sample readout for Channel 15 using SMODE=0 */
#define TC_eDO_CH15_REG		148

//#define TC_RDAD_ADDR_REG	149
//#define TC_SS_SELECT_REG	150


/** @brief  For windowr operation in User Mode (CPUMODE=0), this register specifies the first window from 0 to 511 */
#define TC_FSTWINDOW_REG	151
/** @brief  For window operation in User Mode (CPUMODE=0), this register specifies the number of window to be readout consecutively, MAXIMUM is 15 windows*/
#define TC_NBRWINDOW_REG	152

/** @brief Last register */
#define LAST_REGISTER_ADDR	153
//#define TC_WL_DIV_REG		153
//	#define WL_CLK_100MHz	0x00000000
//	#define WL_CLK_150MHz	0x00000001
//	#define WL_CLK_200MHz	0x00000002
//	#define WL_CLK_250MHz	0x00000003
//	#define WL_CLK_300MHz	0x00000004

/** Utility define **/
/** @brief  PL Control Register Mask enable action*/
#define ENABLE 		1
/** @brief  PL Control Register Mask disable action*/
#define DISABLE 	0
/** @brief  PL Control Register Mask INIT action*/
#define INIT		2

/*** Function prototypes *********************************************/
void SetTargetCRegisters(void);
void GetTargetCStatus();
void GetTargetCControl();
void ControlRegisterWrite(int mask, int actionID);
void WriteRegister(int regID, int regData);
void WriteReadBackRegister(int regID, int regData);

#endif  /* end of protection macro */
