/**
 * @file 	Pedestal.c
 * @author	Jonathan Hendriks
 * @date	26th November 2018
 * @version 0.0
 */
#include "pedestal.h"

/** **********************************************************
 * @brief 	Initialize the pedestals @ zero value
 *
 * @param	void
 * @return	void
 ************************************************************* */
void PedInitialize(void){
	for(int w=0; w< MAX_WINDOWS;w++){
		for(int c=0; c< MAX_CHANNELS;c++){
			for(int s=0; s< SAMPLES_PER_WINDOW;s++){
				pedestals[w][c][s] = 0;
			}
		}
	}
	xil_printf("Pedestal Init End \r\n");
}

/** **********************************************************
 * @brief 	Calculates the pedestal for a window and all samples
 *
 * @param	samples : pointer on the samples array received
 * @param	window 	: window of interest
 * @return	void
 ************************************************************* */
void PedCalculate(int *samples, int window, int reference, int rounds){

	static int round = 0;
	for(int s = 0; s<SAMPLES_PER_WINDOW;s++){
		for(int c = 0; c < MAX_CHANNELS; c++){
			pedestals[window][c][s] += samples[c*32+s];
			//pedestals[window][c][s] += reference-samples[c*32+s];
		}
	}
	
	
	round = round + 1;
	if(round >= rounds){
		// Pedestals Calculated
		round = 0;
		
		//Divid by the number of rounds
		for(int c = 0; c < MAX_CHANNELS; c++){
			for(int s = 0; s<SAMPLES_PER_WINDOW;s++){
				pedestals[window][c][s] = pedestals[window][c][s] / rounds;
				//pedestals[window][c][s] = reference - pedestals[window][c][s];
			}
		}
	}
	xil_printf("%d CH0 \t%d\t%d\r\n",round,samples[0],pedestals[0][0][0]);
	
}
/** **********************************************************
 * @brief 	Substract the pedestal from a sample
 *
 * @param	samples : pointer on the samples array received
 * @param	window 	: window of interest
 * @param	channel 	: channel of interest
 * @param	sample 	: sample of interest
 * @return	the value with the pedestal added
 ************************************************************* */
int PedSubstraction(int *value, int window, int channel, int sample){
	int ret = 0;
	ret = value[window*512+channel*32+sample] - pedestals[window][channel][sample];
	//ret = value[channel*32+sample] - pedestals[window][channel][sample];
	return ret;
}

/** **********************************************************
 * @brief 	Substract the pedestal from a sample
 *
 * @param	samples : pointer on the samples array received
 * @param	window 	: window of interest
 * @param	channel 	: channel of interest
 * @param	sample 	: sample of interest
 * @return	the value with the pedestal added
 ************************************************************* */
void PedShow(int window){
	xil_printf("CH0\tCH1\tCH2\tCH3\tCH4\tCH5\tCH6\tCH7\tCH8\tCH9\tCH10\tCH11\tCH12\tCH13\tCH14\tCH15\r\n");
			xil_printf("----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\t----\r\n");
	for(int sample=0; sample<32;sample++){
		xil_printf("%d\t",pedestals[window][0][sample]);
		xil_printf("%d\t",pedestals[window][1][sample]);
		xil_printf("%d\t",pedestals[window][2][sample]);
		xil_printf("%d\t",pedestals[window][3][sample]);
		
		xil_printf("%d\t",pedestals[window][4][sample]);
		xil_printf("%d\t",pedestals[window][5][sample]);
		xil_printf("%d\t",pedestals[window][6][sample]);
		xil_printf("%d\t",pedestals[window][7][sample]);
		
		xil_printf("%d\t",pedestals[window][8][sample]);
		xil_printf("%d\t",pedestals[window][9][sample]);
		xil_printf("%d\t",pedestals[window][10][sample]);
		xil_printf("%d\t",pedestals[window][11][sample]);
		
		xil_printf("%d\t",pedestals[window][12][sample]);
		xil_printf("%d\t",pedestals[window][13][sample]);
		xil_printf("%d\t",pedestals[window][14][sample]);
		xil_printf("%d\r\n",pedestals[window][15][sample]);

	}
}

