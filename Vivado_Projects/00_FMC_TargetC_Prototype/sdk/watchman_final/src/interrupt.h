/**
 * @file 	interrupt.c
 * @author	Anthony Schluchin
 * @date	24th October 2018
 * @version 0.0
 */

#ifndef SRC_INTERRUPT_H_
#define SRC_INTERRUPT_H_


#include "xparameters.h"
#include "xparameters_ps.h"	/* defines XPAR values */
#include "xil_cache.h"
#include "xscugic.h"
#include "lwip/tcp.h"
#include "xil_printf.h"
#include "platform_config.h"
#include "netif/xadapter.h"
#include "xparameters.h"
#include "xscutimer.h"
#include "xttcps.h"
#include "xaxidma.h"
#include "xscuwdt.h"
#include "udp_peripheral.h"
#include "axis_peripheral.h"
#include "xtime_l.h"
#include "file_hm.h"

/*** DEFINES *********************************************************/
/*********************************************************************/
/** @brief Number of device GIC (from xparameters.h) */
#define INTC_DEVICE_ID		XPAR_SCUGIC_SINGLE_DEVICE_ID
/** @brief Base address for device SCU timer (from xparameters.h) */
#define TIMER_DEVICE_ID		XPAR_SCUTIMER_DEVICE_ID
/** @brief Base address for device GIC (from xparameters.h) */
#define INTC_BASE_ADDR		XPAR_SCUGIC_0_CPU_BASEADDR
/** @brief Base address for device GIC (from xparameters.h) */
#define INTC_DIST_BASE_ADDR	XPAR_SCUGIC_0_DIST_BASEADDR
/** @brief ID of SCU timer interrupt */
#define TIMER_IRPT_INTR		XPAR_SCUTIMER_INTR
/** @brief Number of device TTC (from xparameters.h) */
#define TTC_TICK_DEVICE_ID	XPAR_XTTCPS_0_DEVICE_ID
/** @brief ID of TTC interrupt */
#define TTC_TICK_INTR_ID	XPAR_XTTCPS_0_INTR
/** @brief Frequence for TTC */
#define TTCPS_TIMER_FREQ_HZ	1
/** @brief Base address for device wacthdog (from xparameters.h) */
#define WDT_DEVICE_ID		XPAR_SCUWDT_0_DEVICE_ID
/** @brief ID of watchdog interrupt */
#define WDT_IRPT_INTR		XPAR_SCUWDT_INTR
/** @brief Value to load in watchdog's counter (= 2sec | 0x13FFFFFF = 1sec)*/
#define WDT_LOAD_VALUE		0x27FFFFFE
/** @brief Value for reset counter of lwIP connection */
#define RESET_RX_CNTR_LIMIT	400

/*** Function prototypes *********************************************/
void assert_callback(const char8 *File, s32 Line);
void exception_callback(void *data);
void timer_scu_callback(XScuTimer * TimerInstance);
void timer_ttcps_callback(XTtcPs * TimerInstance);
void axidma_rx_callback(XAxiDma* AxiDmaInstance);
void wdt_scu_callback(XScuWdt *WdtInstance);
int setup_scu_timer_int(void);
int setup_ttcps_timer_int(void);
int setup_axidma_int(void);
int interrupts_initialization(void);
void enable_interrupts();
int devices_initialization();
void cleanup_interrupts(bool wdt_too);

/*** Type definition *************************************************/
/*********************************************************************/
/**
 * @brief Structure containing all the settings to set up the Triple Timer Counter
 */
typedef struct TmrCntrSetup_st{
	u32 OutputHz;		/**< Output frequency */
	XInterval Interval;	/**< Interval value */
	u8 Prescaler;		/**< Prescaler value */
	u32 Options;		/**< Option settings */
} TmrCntrSetup;

#endif /* SRC_INTERRUPT_H_ */
