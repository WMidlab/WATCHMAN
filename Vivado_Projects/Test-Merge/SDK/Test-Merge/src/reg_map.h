/*
 * reg_map.h
 *
 *  Created on: Jul 27, 2018
 *      Author: Jose Idlabs
 */

#ifndef SRC_REG_MAP_H_
#define SRC_REG_MAP_H_
#include <stdio.h>
#include <string.h>
#include "lwip/err.h"
#include "lwip/udp.h"
#include "xil_printf.h"

#define REGMAP_SIZE 10

void reg_map(int regmap[]);

#endif /* SRC_REG_MAP_H_ */
