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


for(int i = 0; i<REGMAP_SIZE; i++)
	{
    	regmap[i]=10+i;
    }

}
