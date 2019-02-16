/**
 * @file 	TARGETC_RegisterMap.c
 * @author	Jonathan Hendriks
 * @date	14th November 2018
 * @version 0.0
 */

#include "TARGETC_RegisterMap.h"

/**************** Extern global variables ****************/
/*********************************************************/
/** @brief Array containing registers of AXI-lite */
extern int* regptr;

/** **********************************************************
 * @brief 	Set the TargetC Registers to default value using AXI Lite control
 *
 * @param	-
 *
 * @return	status
 *
 * @note	-
 *
 ************************************************************* */
void SetTargetCRegisters(void){

	for(int i=0; i<64; i++){
		WriteRegister(TC_VDLYTUNE_REG + i,	0);
	}
//	*** TARGETC Register Initial Values
	WriteRegister(TC_SSTOUTFB_REG,		0x03a);

	WriteRegister(TC_SSPIN_LE_REG,		9);	//TEST with SSPIN
	WriteRegister(TC_SSPIN_TE_REG,		40);

	WriteRegister(TC_WR_STRB2_LE_REG,	54);
	WriteRegister(TC_WR_STRB2_TE_REG,	21);

	WriteRegister(TC_WR2_ADDR_LE_REG,	30);
	WriteRegister(TC_WR2_ADDR_TE_REG,	61);

	WriteRegister(TC_WR_STRB1_LE_REG,	15);
	WriteRegister(TC_WR_STRB1_TE_REG,	46);

	WriteRegister(TC_WR1_ADDR_LE_REG,	0);
	WriteRegister(TC_WR1_ADDR_TE_REG,	29);

	WriteRegister(TC_VQBUFF_REG,	1100);
	WriteRegister(TC_QBIAS_REG,		0);
	WriteRegister(TC_VTRIMT_REG,	0x4d8);

	WriteRegister(TC_VBIAS_REG,		0x4B0);	//

	WriteRegister(TC_VAPBUFF_REG,	0x3D9);	// 985(10)
	//WriteRegister(TC_VADJP_REG,		0x480);	// 1152
	WriteRegister(TC_VADJP_REG,		1020);

	WriteRegister(TC_VANBUFF_REG,	0x426);	// 1062
	//WriteRegister(TC_VADJN_REG,		0x8BB);	// 2235
	WriteRegister(TC_VADJN_REG,		2430);	//2420 - 2450

	WriteRegister(TC_SBBIAS_REG,	0x78E);
	
	WriteRegister(TC_VDISCH_REG,	0);
	//WriteRegister(TC_ISEL_REG,		2600);
	WriteRegister(TC_ISEL_REG,	0x8fc);	// 2300 good for Vped around 512

	WriteRegister(TC_DBBIAS_REG,	0x690);

	// Initial Base Value
	WriteRegister(TC_CMPBIAS2_REG,	0x2D6); //726
	WriteRegister(TC_PUBIAS_REG,	0xBCA);	//3018
	WriteRegister(TC_CMPBIASIN_REG,	0x654); //1620

	WriteRegister(TC_MISCDIG_REG,	0);		//nRD_EN, nWR1_Enable nWR2_Enable are set to
	WriteRegister(TC_MONTIMING_REG,	0);		//INIT MonTiming PASS disable

	xil_printf("TragetC's registers initialized!\r\n");
}

/****************************************************************************/
/**
* @brief	In VERBOSE mode, print the status bit
*
* @param	-
*
* @return	-
*
* @note		-
*
****************************************************************************/
void GetTargetCStatus(){
	xil_printf(">> STATUS:\t ");
	decToHexa(regptr[TC_STATUS_REG] );
	//xil_printf(" :");
#ifdef VERBOSE
	if(regptr[TC_STATUS_REG] & BUSY_MASK)	xil_printf("\t BUSY_MASK");
	if(regptr[TC_STATUS_REG] & LOCKED_MASK)	xil_printf("\t LOCKED_MASK");
	if(regptr[TC_STATUS_REG] & STORAGE_MASK)	xil_printf("\t STORAGE_MASK");
	if(regptr[TC_STATUS_REG] & SSVALID_MASK)	xil_printf("\t SSVALID_MASK");

	//if(regptr[TC_STATUS_REG] & RESET_MASK)	xil_printf("\t RESET_MASK");

#endif
	xil_printf("\r\n");
}

/****************************************************************************/
/**
* @brief	In VERBOSE mode, print the control bit
*
* @param	-
*
* @return	-
*
* @note		-
*
****************************************************************************/
void GetTargetCControl(){
	xil_printf(">> CONTROL:\t ");
	decToHexa(regptr[TC_CONTROL_REG] );
	//xil_printf(" :");

#ifdef VERBOSE
	if(regptr[TC_CONTROL_REG] & WRITE_MASK)	xil_printf("\t WRITE_MASK");
	if(regptr[TC_CONTROL_REG] & PCLK_MASK)	xil_printf("\t PCLK_MASK");
	if(regptr[TC_CONTROL_REG] & SCLK_MASK)	xil_printf("\t SCLK_MASK");
	if(regptr[TC_CONTROL_REG] & SIN_MASK)	xil_printf("\t SIN_MASK");

	if(regptr[TC_CONTROL_REG] & RAMP_MASK)	xil_printf("\t RAMP_MASK");
	if(regptr[TC_CONTROL_REG] & REGCLR_MASK)	xil_printf("\t REGCLR_MASK");
	if(regptr[TC_CONTROL_REG] & SS_INCR_MASK)	xil_printf("\t SS_INCR_MASK");
	if(regptr[TC_CONTROL_REG] & SS_TPG_MASK)	xil_printf("\t SS_TPG_MASK");

	if(regptr[TC_CONTROL_REG] & SS_RESET_MASK)	xil_printf("\t SS_RESET_MASK");
	if(regptr[TC_CONTROL_REG] & RDAD_MASK)	xil_printf("\t RDAD_MASK");
	if(regptr[TC_CONTROL_REG] & STARTSTORAGE_MASK)	xil_printf("\t STARTSTORAGE_MASK");
	if(regptr[TC_CONTROL_REG] & SSACK_MASK)	xil_printf("\t SSACK_MASK");

	if(regptr[TC_CONTROL_REG] & SWRESET_MASK)	xil_printf("\t SWRESET_MASK");
#endif
	xil_printf("\r\n");
}

/****************************************************************************/
/**
* @brief	Change a bit in the control register
*
* @param	mask: which to change
* @param	actionID: set with ENABLE, reset with DISABLE, initialized with INIT
*
* @return	-
*
* @note		-
*
****************************************************************************/
void ControlRegisterWrite(int mask, int actionID){

	//int* regptr = XPAR_TARGETC_0_TC_AXI_BASEADDR;
	if(actionID == ENABLE){
		regptr[TC_CONTROL_REG] = regptr[TC_CONTROL_REG] | mask;
	}
	else if (actionID == DISABLE){
		regptr[TC_CONTROL_REG] = regptr[TC_CONTROL_REG] & (0xFFFFFFFF^mask);
	}
	else if (actionID == INIT){
		regptr[TC_CONTROL_REG] =  0;
	}
	else{
		xil_printf("Error:\t%s\r\n\tNo valid argument {ENABLE/DISABLE}",__func__);
	}

	//DEBUG

#ifdef VERBOSE
	xil_printf(">> CONTROL:\t");

	if(regptr[TC_CONTROL_REG] & WRITE_MASK)	xil_printf("\t WRITE_MASK");
	if(regptr[TC_CONTROL_REG] & PCLK_MASK)	xil_printf("\t PCLK_MASK");
	if(regptr[TC_CONTROL_REG] & SCLK_MASK)	xil_printf("\t SCLK_MASK");
	if(regptr[TC_CONTROL_REG] & SIN_MASK)	xil_printf("\t SIN_MASK");

	if(regptr[TC_CONTROL_REG] & RAMP_MASK)	xil_printf("\t RAMP_MASK");
	if(regptr[TC_CONTROL_REG] & REGCLR_MASK)	xil_printf("\t REGCLR_MASK");
	if(regptr[TC_CONTROL_REG] & SS_INCR_MASK)	xil_printf("\t SS_INCR_MASK");
	if(regptr[TC_CONTROL_REG] & SS_TPG_MASK)	xil_printf("\t SS_TPG_MASK");

	if(regptr[TC_CONTROL_REG] & SS_RESET_MASK)	xil_printf("\t SS_RESET_MASK");
	if(regptr[TC_CONTROL_REG] & RDAD_MASK)	xil_printf("\t RDAD_MASK");
	if(regptr[TC_CONTROL_REG] & STARTSTORAGE_MASK)	xil_printf("\t STARTSTORAGE_MASK");
	if(regptr[TC_CONTROL_REG] & SSACK_MASK)	xil_printf("\t SSACK_MASK");

	if(regptr[TC_CONTROL_REG] & SWRESET_MASK)	xil_printf("\t SWRESET_MASK");
	xil_printf("\r\n");
#endif
}

/****************************************************************************/
/**
* @brief	Change the value of a TARGET register
*
* @param	regID: register ID
* @param	regData: new value to set
*
* @return	-
*
* @note		-
*
****************************************************************************/
void WriteRegister(int regID, int regData){
	if(regID <= TC_MISCDIG_REG || regID == TC_TPG_REG){
		ControlRegisterWrite(WRITE_MASK,DISABLE);

		regptr[regID] = regData;
		regptr[TC_ADDR_REG] = regID;

		ControlRegisterWrite(WRITE_MASK ,ENABLE);
		while(regptr[TC_STATUS_REG] & BUSY_MASK){
			usleep(100); //sleep 100ms
		}
		ControlRegisterWrite(WRITE_MASK,DISABLE);
	}
	else printf("Invalid register!\r\n");
}

/****************************************************************************/
/**
* @brief	Change the value of a TARGET register and reads it back
*
* @param	regID: register ID
* @param	regData: new value to set
*
* @return	-
*
* @note		Result is printed
*
****************************************************************************/
void WriteReadBackRegister(int regID, int regData){

	//int* regptr = XPAR_TARGETC_0_TC_AXI_BASEADDR;

	//regptr[TC_CONTROL_REG] = 0;
	ControlRegisterWrite(WRITE_MASK,DISABLE);

	regptr[regID] = regData;
	regptr[TC_ADDR_REG] = regID;

	ControlRegisterWrite(WRITE_MASK ,ENABLE);
	//regptr[TC_CONTROL_REG] = 1 | RAMP_MASK;

	while(regptr[TC_STATUS_REG] & BUSY_MASK){
		usleep(100000); //sleep 100ms
	}
	ControlRegisterWrite(WRITE_MASK,DISABLE);

	xil_printf("W:\tReg: ");
	decToHexa(regID);
	xil_printf("\tData: ");
	decToHexa(regData);
	xil_printf("\r\n");

	//Dummy Write
	ControlRegisterWrite(WRITE_MASK ,ENABLE);
	while(regptr[TC_STATUS_REG] & BUSY_MASK){
		usleep(100000); //sleep 100ms
	}
	ControlRegisterWrite(WRITE_MASK ,DISABLE);

	//xil_printf(">>\tRB:\tReg:%d\tData:%d\r\n",regptr[TC_DATA_OUT_REG]>>12,regptr[TC_DATA_OUT_REG] & 0x00000FFF);
	xil_printf("RB:\t%d\t",regptr[TC_DATA_OUT_REG]);
	decToHexa(regptr[TC_DATA_OUT_REG]);
	xil_printf("\r\n");
}

