
#ifndef GLOBAL_H   /* prevent circular inclusions */
#define GLOBAL_H   /* by using protection macros */

#include <stdio.h>
#include "xaxidma.h"

//#define DEBUG
//#define VERBOSE

#define ADRIAN 0
#define CHRIS 1
#define BRONSON 2
#define KEK 3


#define PARAMETERS ADRIAN
#define MAX_WINDOW 8
#define VPED_DIGITAL 1024
#define VPED_ANALOG 1.25

	int TPG_intr_flg;
	int SSVALID_intr_flg;
	int TC_ERROR_intr_flg;
	int axidma_error;
	int axidma_rx_done;
	int axi_dma_mult_flg;

	int axidma_flg;

	int samplecnt;

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
	struct ele_list_st *axiptr;

	int cntwindow;
	int NBRWINDOWS;

	uint16_t pedestal[512][16][32];

	static const char *banner[] = {
		"______________________________________________________________________________________",
		"                                                                                      ",
		"    ___________    _       _____     _________  ________  ___________    __________   ",
		"   |:::::::::::   |::     |::::::   |::::::::: |:::::::: |:::::::::::   |::::::::::   ",
		"   |:::::::::::  |::::    |:::::::  |::::::::: |:::::::: |:::::::::::   |::::::::::   ",
		"       |:::     |:: |::   |::   |:: |::   ____ |::___        |:::       |:::   |:::   ",
		"       |:::    |::___|::  |::___|:: |::  |:::: |:::::        |:::       |:::    ___  ",
		"       |:::   |:::::::::: |:::::::  |::____|:: |::______     |:::       |:::___|:::  ",
		"       |:::   |::     |:: |::  |::  |::::::::: |::::::::     |:::       |::::::::::  ",
		"       |:::   |::     |:: |::   |:: |::::::::: |::::::::     |:::       |:::::::::: ",
		"                                                                                    ",
		"   WATCHMAN Project - TARGET C ",
		"   University of Hawaii , Manoa",
		"______________________________________________________________________________________"};

#endif  /* end of protection macro */
