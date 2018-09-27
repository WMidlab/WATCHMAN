/*
 * reg_write.h
 *
 *  Created on: Jul 23, 2018
 *      Author: Jose Idlabs
 */

#ifndef SRC_REG_WRITE_H_
#define SRC_REG_WRITE_H_


#include <stdio.h>
#include <string.h>
#include "lwip/err.h"
#include "lwip/udp.h"
#include "xil_printf.h"

int reg_write(int write_addr, int reg_value, int* regmap);

#endif /* SRC_REG_WRITE_H_ */
