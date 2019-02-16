/**
 * @file 	transfer_function.h
 * @author	Anthony Schluchin
 * @date	7th January 2019
 * @version 0.0
 */

#ifndef SRC_GET_TRANSFER_FCT_H_
#define SRC_GET_TRANSFER_FCT_H_

#include "xstatus.h"
#include "data_analysis.h"
#include "xil_types.h"
#include "axis_peripheral.h"
#include "TARGETC_RegisterMap.h"
#include "iic_DAC_LTC2657.h"
#include "udp_peripheral.h"
#include "file_hm.h"
#include "xscuwdt.h"

/*** Function prototypes *********************************************/
int send_data_transfer_fct(void);


#endif /* SRC_GET_TRANSFER_FCT_H_ */
