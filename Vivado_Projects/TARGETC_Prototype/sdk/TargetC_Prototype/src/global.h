
#ifndef GLOBAL_H   /* prevent circular inclusions */
#define GLOBAL_H   /* by using protection macros */

#include <stdio.h>
#include "xaxidma.h"

//#define DEBUG
//#define VERBOSE

#define MAX_WINDOW 8
	int TPG_intr_flg;
	int SSVALID_intr_flg;
	int TC_ERROR_intr_flg;
	int axidma_error; 
	int axidma_rx_done;
	
	int samplecnt;
	
	static int window[MAX_WINDOW*512];
	XAxiDma AxiDmaInstance;
	
//	struct window_st{
//		uint64_t wdotime;
//		uint64_t digtime;
//		uint32_t trig;
//		uint32_t wdonbr;
//		int data[512]; 
//	};

	struct window_st{
		//uint64_t wdotime;
		//uint64_t digtime;
		//uint32_t trig;
		//uint32_t wdonbr;
		int header[6];
		int data[512]; 
	};
	
	struct ele_list_st{
		struct window_st wdo;
		struct ele_list_st *pnext;
	};
	
	struct ele_list_st *head;
	
	struct ele_list_st *head2;

#endif  /* end of protection macro */
