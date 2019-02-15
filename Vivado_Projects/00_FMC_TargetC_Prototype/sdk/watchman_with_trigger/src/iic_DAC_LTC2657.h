/**
 * @file 	iic_DAC_LTC2657.h
 * @author	Anthony Schluchin
 * @date	15th December 2018
 * @version 0.0
 */

#ifndef IIC_DAC_LTC2657_H   /* prevent circular inclusions */
#define IIC_DAC_LTC2657_H   /* by using protection macros */

#include "xparameters.h"
#include "xil_cache.h"
#include "xscugic.h"
#include "xil_printf.h"
#include "xtime_l.h"
#include "xiic.h"

#include "global.h"

/*** DEFINES *********************************************************/
/*********************************************************************/
/** @brief Base address for device I2C (from xparameters.h) */
#define IIC_DEVICE_ID		XPAR_AXI_IIC_0_DEVICE_ID
/** @brief I2C address of the DAC */
#define IIC_SLAVE_ADDRESS	0x10
/** @brief Channel A register */
#define CHANNEL_A	0x00
/** @brief Channel B register */
#define CHANNEL_B	0x01
/** @brief Channel c register */
#define CHANNEL_C	0x02
/** @brief Channel D register */
#define CHANNEL_D	0x03
/** @brief Channel E register */
#define CHANNEL_E	0x04
/** @brief Channel F register */
#define CHANNEL_F	0x05
/** @brief Channel G register */
#define CHANNEL_G	0x06
/** @brief Channel H register */
#define CHANNEL_H	0x07
/** @brief All channels register */
#define CHANNEL_ALL	0x0F
/** @brief Channel A register */
#define DAC_GRP_0	CHANNEL_A
/** @brief Channel B register */
#define DAC_GRP_1	CHANNEL_B
/** @brief Channel C register */
#define DAC_GRP_2	CHANNEL_C
/** @brief Channel D register */
#define DAC_GRP_3	CHANNEL_D
/** @brief Channel H register */
#define DAC_VPED	CHANNEL_H




/*** Function prototypes *********************************************/
int DAC_LTC2657_initialize();
int DAC_LTC2657_SetChannelVoltage(int channel, float voltage);

#endif

