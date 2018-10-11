/*
 * reg_write.c
 *
 *  Created on: Jul 23, 2018
 *      Author: Jose Idlabs
 *
 * This function takes an integer for the address, a register value and the pointer corresponding to the beginning of the int array
 * where the regmap is located. reg_write will overwrite the value of that register address with reg_value.
 * Only register addresses 0-9 can be overwritten to prevent memory leaks.
 * There is another check so that only int values from 0-9999 can be written.
 */
#include "reg_write.h"

int reg_write(int write_addr, int reg_value, int* regmap){

		printf("reg_write! \n");

		if (write_addr < 10 && write_addr > -1)
		{
			if ( reg_value >-1 && reg_value < 9999)
			{
				regmap[write_addr]=reg_value;
				printf("reg: %d value: %d \n", write_addr, regmap[write_addr]);
//				pl_reg_map[write_addr] = reg_value;
			}
		}
		return 0;
}


