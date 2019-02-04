#ifndef TARGETC_REGISTERMAP_H   /* prevent circular inclusions */
#define TARGETC_REGISTERMAP_H   /* by using protection macros */

/**
 * @file 	TARGETC_RegisterMap.h
 * @author	Jonathan Hendriks
 * @date	14th November 2018
 * @version 0.0
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xuartps_hw.h"
#include "global.h"
//#include "interrupt.h"

/*** Definition of Registers ****************************************/

	//Register Map for PCLK clock instance inside the ASIC value to send to C_TC_ADDR_REG
// ------------------------------------------------------
//	Register Map Target C
//	Date : 9th October 2018
// ------------------------------------------------------
#define TC_VDLYTUNE_REG		1

#define TC_SSTOUTFB_REG			65
#define TC_SSPIN_LE_REG			66
#define TC_SSPIN_TE_REG			67
#define TC_WR_STRB2_LE_REG		68
#define TC_WR_STRB2_TE_REG		69
#define TC_WR2_ADDR_LE_REG		70
#define TC_WR2_ADDR_TE_REG		71
#define TC_WR_STRB1_LE_REG		72
#define TC_WR_STRB1_TE_REG		73
#define TC_WR1_ADDR_LE_REG		74
#define TC_WR1_ADDR_TE_REG		75
#define TC_MONTIMING_REG		76
	//MonTiming Masks
	#define TC_MT_PASS_MASK		0x00000004

	#define TC_MT_SSPOUT_MASK	0x00000000
	#define TC_MT_SSTOUT_MASK	0x00000010
	#define TC_MT_SSTOUTFB_MASK	0x00000020
	#define TC_MT_SSPIN_MASK	0x00000030

	#define TC_MT_WR_STRB1_MASK			0x00000040
	#define TC_MT_WR1_ADDR_SYNC_MASK	0x00000050
	#define TC_MT_WR_STRB2_MASK			0x00000060
	#define TC_MT_WR2_ADDR_SYNC_MASK	0x00000070

	#define TC_MT_VDD_MASK			0x00000080


#define TC_VQBUFF_REG			77
#define TC_QBIAS_REG			78
#define TC_VTRIMT_REG			79

#define TC_VBIAS_REG			80

#define TC_VAPBUFF_REG			81
#define TC_VADJP_REG			82
#define TC_VANBUFF_REG			83
#define TC_VADJN_REG			84
#define TC_SBBIAS_REG			85
#define TC_VDISCH_REG			86
#define TC_ISEL_REG				87
#define TC_DBBIAS_REG			88

#define TC_CMPBIAS2_REG			89
#define TC_PUBIAS_REG			90
#define TC_CMPBIASIN_REG		91
#define TC_MISCDIG_REG			92

#define TC_TPG_REG				128

#define TC_CONTROL_REG 		 129
	//MASK for bits in TC_CONTROL_REG
	#define			WRITE_MASK		0x00000001
	#define			TRIG_CLEAR_MASK 0x00000002

	#define			PCLK_MASK		0x00000002
	#define			SCLK_MASK		0x00000004
	#define			SIN_MASK		0x00000008

	#define			RAMP_MASK		0x00000010
	#define			REGCLR_MASK		0x00000020
	#define			SS_INCR_MASK	0x00000040
	#define			SS_TPG_MASK		0x00000080

	#define			SS_RESET_MASK	0x00000100
	#define			RDAD_MASK		0x00000200
	#define			WINDOW_MASK		0x00000400
	#define			SSACK_MASK		0x00000800

	#define			SWRESET_MASK	0x00001000
	#define			SMODE_MASK		0x00002000	//SAMPLEMODE = 0, SSACK action else it's trhough AXI-DMA
	#define			TESTSTREAM_MASK	0x00004000
	#define			TESTFIFO_MASK	0x00008000

	#define			PSBUSY_MASK		0x00010000
	#define			CPUMODE_MASK	0x00020000

#define TC_STATUS_REG		130
	//MASK
	#define			BUSY_MASK		0x00000001
	#define			LOCKED_MASK		0x00000002
	#define			STORAGE_MASK	0x00000004
	#define			SSVALID_MASK	0x00000008
	//#define 		RESET_MASK		0x00000010
	#define			WINDOWBUSY_MASK	0x00000010

	#define			TEST_0_MASK		0x00000020
	#define			TEST_1_MASK		0x00000040
	#define			TEST_2_MASK		0x00000080
	#define			TEST_3_MASK		0x00000100
	#define			TEST_4_MASK		0x00000200
	#define			TEST_5_MASK		0x00000400

#define TC_ADDR_REG  		131
#define TC_DATA_OUT_REG		132

#define TC_eDO_CH0_REG		133
#define TC_eDO_CH1_REG		134
#define TC_eDO_CH2_REG		135
#define TC_eDO_CH3_REG		136

#define TC_eDO_CH4_REG		137
#define TC_eDO_CH5_REG		138
#define TC_eDO_CH6_REG		139
#define TC_eDO_CH7_REG		140

#define TC_eDO_CH8_REG		141
#define TC_eDO_CH9_REG		142
#define TC_eDO_CH10_REG		143
#define TC_eDO_CH11_REG		144

#define TC_eDO_CH12_REG		145
#define TC_eDO_CH13_REG		146
#define TC_eDO_CH14_REG		147
#define TC_eDO_CH15_REG		148

#define TC_RDAD_ADDR_REG	149
#define TC_SS_SELECT_REG	150

#define TC_FSTWINDOW_REG	151
#define TC_NBRWINDOW_REG	152

#define TC_WL_DIV_REG		153
	#define WL_CLK_100MHz	0x00000000
	#define WL_CLK_150MHz	0x00000001
	#define WL_CLK_200MHz	0x00000002
	#define WL_CLK_250MHz	0x00000003
	#define WL_CLK_300MHz	0x00000004


#define TC_CNT_AXIS_REG 154

#define TC_ADDRESS_READOUT_REG		155

	// Global Variables
	//static int* regptr = XPAR_TARGETC_0_TC_AXI_BASEADDR;
	//static int* regptr = XPAR_TARGETC_IP_PROTOTYPE_0_BASEADDR ; //XPAR_TARGETC_INTERFACE_IP_0_BASEADDR;
	static int* regptr = XPAR_TARGET_C_TOPLEVEL_SY_0_BASEADDR;

//	int TPG_intr_flg;
//	int SSVALID_intr_flg;

	// Prototypes
	int SetTargetCRegisters(void);
	int GetTargetCStatus();
	int GetTargetCControl();
	int ControlRegisterWrite(int mask, int actionID);
	int WriteRegister(int regID, int regData);
	int WriteReadBackRegister(int regID, int regData);
	int TestPatternGenerator(int tpg);
	void decToHexa(unsigned int n);
	void decToBin(unsigned int n);
	int MonTimingSet(void);
	int readinput0to63(void);
	int readinput0to4095(void);

#define ENABLE 		1
#define DISABLE 	0
#define INIT		2

#endif  /* end of protection macro */
