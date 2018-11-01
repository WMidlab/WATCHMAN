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

// Variables
XIic Iic;		  /* The instance of the IIC device */


//Prototypes
int DAC_LTC2657_initialize(float voltage);

#endif

