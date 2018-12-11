#ifndef IIC_DAC_LTC2657_H   /* prevent circular inclusions */
#define IIC_DAC_LTC2657_H   /* by using protection macros */

#include "xparameters.h"
#include "xil_cache.h"
#include "xscugic.h"
#include "xil_printf.h"
#include "xtime_l.h"
#include "xiic.h"

#include "global.h"


#define IIC_DEVICE_ID		XPAR_AXI_IIC_0_DEVICE_ID	//Xparameters Base Address

#define IIC_SLAVE_ADDRESS	0x10	// From Schematic of Jose

#define CHANNEL_A	0x00
#define CHANNEL_B	0x01
#define CHANNEL_C	0x02
#define CHANNEL_D	0x03
#define CHANNEL_E	0x04
#define CHANNEL_F	0x05
#define CHANNEL_G	0x06
#define CHANNEL_H	0x07
#define CHANNEL_ALL	0x0F



// Variables
XIic Iic;		  /* The instance of the IIC device */


//Prototypes
int DAC_LTC2657_initialize();
int DAC_LTC2657_setvoltage(float voltage);
int DAC_LTC2657_setchannelA( float voltage);
int DAC_LTC2657_setchannelB( float voltage);
int DAC_LTC2657_setVped( float voltage);

int DAC_LTC2657_SetChannelVoltage(int channel, float voltage);
#endif

