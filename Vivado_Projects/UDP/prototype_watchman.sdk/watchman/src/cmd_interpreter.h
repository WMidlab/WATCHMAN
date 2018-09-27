/*
 * cmd_interpreter.h
 *
 *  Created on: Jul 20, 2018
 *      Author: Jose Idlabs
 */

#ifndef SRC_CMD_INTERPRETER_H_
#define SRC_CMD_INTERPRETER_H_
#include <stdio.h>
#include <string.h>
#include "lwip/err.h"
#include "lwip/udp.h"
#include "xil_printf.h"

void command_interpreter(char** command_buffer, int** regmap);

#endif /* SRC_CMD_INTERPRETER_H_ */


