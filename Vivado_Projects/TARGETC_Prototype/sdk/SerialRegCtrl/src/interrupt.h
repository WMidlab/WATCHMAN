#ifndef INTERRUPT_H   /* prevent circular inclusions */
#define INTERRUPT_H   /* by using protection macros */

#include "xparameters.h"
#include "xil_cache.h"
#include "xscugic.h"
#include "xil_printf.h"
#include "xtime_l.h"

#include "global.h"
#include "TARGETC_RegisterMap.h"

#define INTC_DEVICE_ID		XPAR_SCUGIC_SINGLE_DEVICE_ID

// Variables


XScuGic Intc;


//extern int TPG_intr_flg;
//extern int SSVALID_intr_flg;


// Prototypes
void platform_setup_interrupts(void);
void platform_enable_interrupts(void);
void platform_cleanup_interrupts(void);

void SSVALID_IntrHandler(void);

#endif

