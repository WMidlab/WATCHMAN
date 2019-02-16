/**
 * @file 	global.h
 * @author	Anthony Schluchin
 * @date	28th November 2018
 * @version 0.0
 */

#ifndef SRC_GLOBAL_H_
#define SRC_GLOBAL_H_

#include <stdbool.h>
#include <inttypes.h>
#include "xaxidma.h"
#include "axis_peripheral.h"
#include "xparameters.h"
#include "TARGETC_RegisterMap.h"
#include "udp_peripheral.h"
#include "xil_io.h"

/*** DEFINES *********************************************************/
/*********************************************************************/
/** @brief Secure Configuration Lock register (SLCR) */
#define	SLCR_BASE_ADDRESS	XPAR_PS7_SLCR_0_S_AXI_BASEADDR
/** @brief SCLR write protection lock */
#define SLCR_LOCK_OFFSET	0x000000004
/** @brief Value to lock the sclr register (bit 0 to 15) */
#define LOCK_VALUE			0x767B
/** @brief SCLR write protection unlock */
#define SLCR_UNLOCK_OFFSET	0x000000008
/** @brief Value to unlock the sclr register (bit 0 to 15) */
#define UNLOCK_VALUE		0xDF0D
/** @brief Status of sclr registers (bit 0) */
#define SLCR_LOCKSTA		0x00000000C
/** @brief Mask for status of sclr registers (0 -> writeable / 1 -> protected) */
#define LOCKSTA_MASK		0x000000001
/** @brief Proccesing system software reset register */
#define PSS_RST_CTRL		0x000000200
/** @brief Proccesing system software reset signal (bit 0) */
#define SOFT_RST_MASK		0x000000001

/*** Function prototypes *********************************************/
int init_global_var(void);
void cleanup_global_var(void);
void system_reset_hm(void);

#endif /* SRC_GLOBAL_H_ */
