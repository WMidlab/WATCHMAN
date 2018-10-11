/*
 * reg_map.c
 *
 *  Created on: Jul 27, 2018
 *      Author: Jose Idlabs
 */

#include "reg_map.h"
#include <stdio.h>

void reg_map(int regmap[]){

	printf("register map created! \n");
    int *pl_reg_map = 0x43C00000;


	for(int i = 0; i<REGMAP_SIZE; i++){
			regmap[i]=10+i;
	}
	for(int i = 0; i < 5; i++){
		pl_reg_map[i] = regmap[i];
	}



}
