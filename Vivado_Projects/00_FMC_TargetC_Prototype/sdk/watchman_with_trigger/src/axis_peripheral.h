/**
 * @file 	axis_peripheral.h
 * @author	Anthony Schluchin
 * @date	24th October 2018
 * @version 0.0
 */

#ifndef SRC_AXIS_PERIPHERAL_H_
#define SRC_AXIS_PERIPHERAL_H_

#include <stdio.h>
#include <unistd.h>
#include <errno.h>
#include <stdlib.h>

#include "xaxidma.h"
#include "xparameters.h"
#include "interrupt.h"
#include "xtime_l.h"
#include "xstatus.h"
#include "data_analysis.h"
#include "TARGETC_RegisterMap.h"
#include "file_hm.h"
#include "xscuwdt.h"

/*** DEFINES *********************************************************/
/*********************************************************************/
/** @brief Data frame contains extracted features (for the receipter) */
#define FEATURES_ID			0
/** @brief Data frame contains the full waveform (for the receipter) */
#define FULL_WAVEFORM_ID	1

/*** Function prototypes *********************************************/
void XAxiDma_SimpleTransfer_hm(UINTPTR BuffAddr, int LengthOfBytes);
void dma_received_data(int pmt);
int test_TPG(void);

#endif /* SRC_AXIS_PERIPHERAL_H_ */
