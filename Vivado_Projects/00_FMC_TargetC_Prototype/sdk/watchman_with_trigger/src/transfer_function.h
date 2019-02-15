/**
 * @file 	transfer_function.h
 * @author	Anthony Schluchin
 * @date	16th January 2019
 * @version 0.0
 */

#ifndef SRC_TRANSFER_FUNCTION_H_
#define SRC_TRANSFER_FUNCTION_H_

#include "xstatus.h"
#include "data_analysis.h"
#include "xil_types.h"
#include "axis_peripheral.h"
#include "TARGETC_RegisterMap.h"
#include "iic_DAC_LTC2657.h"
#include "GMHeader.h"
#include "file_hm.h"
#include "xscuwdt.h"

/*** Function prototypes *********************************************/
int init_transfer_function(void);

#endif /* SRC_TRANSFER_FUNCTION_H_ */
