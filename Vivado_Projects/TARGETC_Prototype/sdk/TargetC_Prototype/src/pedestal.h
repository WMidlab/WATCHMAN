#ifndef PEDESTAL_H   /* prevent circular inclusions */
#define PEDESTAL_h   /* by using protection macros */

/**
 * @file 	pedestal.h
 * @author	Jonathan Hendriks
 * @date	14th November 2018
 * @version 0.0
 */

#include <stdio.h>
#include "global.h"
//#include "interrupt.h"

/*** User Define ****************************************/

#define MAX_WINDOWS			512
#define MAX_CHANNELS		16
#define SAMPLES_PER_WINDOW 	32


/*** User Variables ****************************************/
	
static int pedestals[MAX_WINDOWS][MAX_CHANNELS][SAMPLES_PER_WINDOW];

/*** User Prototypes ****************************************/
void PedInitialize(void);
void PedCalculate(int *samples, int window, int reference, int rounds);
int PedSubstraction(int *value, int window, int channel, int sample);
void PedShow(int window);
#endif  /* end of protection macro */
