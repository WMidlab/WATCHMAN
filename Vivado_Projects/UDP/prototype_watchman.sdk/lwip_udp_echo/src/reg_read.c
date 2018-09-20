/*
 * reg_read.c
 *
 *  Created on: Jul 27, 2018
 *      Author: Jose Idlabs
 *
 * This function takes an integer for the address to be read and the pointer corresponding to the beginning of the int array
 * where the regmap is located. reg_read returns the value of that register.
 * Only register addresses 0-9 can be read to prevent memory leaks.
 */

#include "reg_read.h"

int reg_read(int read_addr, int* regmap){

		printf("reading: \n");

		if (read_addr < 10 && read_addr > -1){
		printf("reg: %d value: %d \n", read_addr, regmap[read_addr]);
		}


		return regmap[read_addr];
}
