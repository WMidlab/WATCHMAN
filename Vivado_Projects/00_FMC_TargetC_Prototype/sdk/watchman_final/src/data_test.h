/**
 * @file 	data_testp.c
 * @author	Anthony Schluchin
 * @date	28th September 2018
 * @version 0.0
 */

#ifndef SRC_DATA_TEST_H_
#define SRC_DATA_TEST_H_

#include <stdio.h>
#include <string.h>
#include "lwip/err.h"
#include "lwip/udp.h"
#include "xil_printf.h"


/*** Function prototypes *********************************************/
uint16_t made_frame(char stream[], uint16_t length);

#endif /* SRC_DATA_TEST_H_ */
