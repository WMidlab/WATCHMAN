
#ifndef GLOBAL_H   /* prevent circular inclusions */
#define GLOBAL_H   /* by using protection macros */

#include <stdio.h>
<<<<<<< HEAD
#include "xaxidma.h"
=======
>>>>>>> master

//#define DEBUG
//#define VERBOSE

	int TPG_intr_flg;
	int SSVALID_intr_flg;
	int TC_ERROR_intr_flg;
<<<<<<< HEAD
	int axidma_error; 
	int axidma_rx_done;
	
	int samplecnt;
	
	int window[512];
	XAxiDma AxiDmaInstance;

=======
	
	int samplecnt;
>>>>>>> master
#endif  /* end of protection macro */
