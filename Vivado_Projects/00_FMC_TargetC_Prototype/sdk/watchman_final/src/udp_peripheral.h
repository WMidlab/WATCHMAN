/**
 * @file 	interrupt.h
 * @author	Anthony Schluchin
 * @date	24th October 2018
 * @version 0.0
 */

#ifndef SRC_UDP_PERIPHERAL_H_
#define SRC_UDP_PERIPHERAL_H_

#include <stdio.h>
#include <string.h>
#include "lwip/err.h"
#include "lwip/udp.h"
#include "stdbool.h"
#include "time_hm.h"
#include "interrupt.h"
#include "TARGETC_RegisterMap.h"

#if defined (__arm__) || defined (__aarch64__)
#include "xil_printf.h"
#endif

/*** DEFINES *********************************************************/
/*********************************************************************/
/** @brief Length of protocol header (in bytes) */
#define BUF_HEADER_SIZE 	50 // frame's header: ethernet (14) + Ipv4(20) + UDP(8) = 42 -> 50
/** @brief Length maximum of frame data (in bytes) */
#define MAX_DATA_SIZE 		CHANNEL*SAMPLE*2+15 // payload int16_t is 2 bytes + header + frame's header
/** @brief Number of register send/received by UDP */
#define REGMAP_SIZE_UDP	128
/** @brief Length maximum of frame command (in bytes) */
#define MAX_CMD_SIZE	2*REGMAP_SIZE_UDP+20
/** @brief Port used for the command packet transmission*/
#define PORT_CMD		7
/** @brief Port used for the data packet transmission */
#define PORT_DATA		8

/*** Function prototypes *********************************************/
err_t transfer_data(char* frame, uint16_t length);
void udp_cmd_recv(void *arg, struct udp_pcb *pcb, struct pbuf *p, const ip_addr_t *addr, u16_t port);
int command_parser(struct pbuf *p, char* return_buf);
int setup_udp_settings(ip_addr_t pc_ipaddr);
void cleanup_udp(void);
void print_ip(char *msg, ip_addr_t *ip);
void print_ip_settings(ip_addr_t *ip, ip_addr_t *mask, ip_addr_t *gw);
/* defined by each RAW mode application */
void tcp_fasttmr(void);
void tcp_slowtmr(void);
int setup_pcb_data(ip_addr_t pc_ipaddr, uint16_t port);
int setup_pcb_cmd(ip_addr_t pc_ipaddr, uint16_t port);

#endif /* SRC_UDP_PERIPHERAL_H_ */
