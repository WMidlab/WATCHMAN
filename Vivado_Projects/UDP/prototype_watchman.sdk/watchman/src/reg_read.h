/*
 * reg_read.h
 *
 *  Created on: Jul 23, 2018
 *      Author: Jose Idlabs
 */

#ifndef SRC_REG_READ_H_
#define SRC_REG_READ_H_

#include <stdio.h>
#include <string.h>
#include "lwip/err.h"
#include "lwip/udp.h"
#include "xil_printf.h"

int reg_read(int read_addr, int* regmap);

#endif /* SRC_REG_READ_H_ */
