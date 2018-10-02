/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

#include <stdio.h>
#include <string.h>
#include "cmd_parser.h"
#include "cmd_interpreter.h"
#include "reg_map.h"
#include "data_test.h"
#include "lwip/err.h"
#include "lwip/udp.h"
#include "xparameters.h"
#define MAX_ARRAY_SIZE 100
#if defined (__arm__) || defined (__aarch64__)
#include "xil_printf.h"
#endif

int regmap[REGMAP_SIZE];
int *pl_reg_map =  XPAR_TEN_REG_MAP_0_S00_AXI_BASEADDR;

int data[CHANNEL][WINDOW][SAMPLE];
int data_saw[CHANNEL][WINDOW][SAMPLE];
char stream[MAX_STREAM_SIZE];

struct udp_pcb *potato_pcb;
struct pbuf *potato;

char return_load[10000];

int transfer_data(void) {

	//Send a header packet first
	//Create a "header" before the payload, format: head/test/<CHANNEL>/<WINDOW>/<SAMPLE>/<PAYLOAD>/end
	char channel_window_sample_size[10];

	memset(stream, 0, sizeof(stream));

	strcpy(stream, "head");
	strcat(stream, "/test");

	itoa(CHANNEL, channel_window_sample_size, 10);
	strcat(stream, "/");
	strcat(stream, channel_window_sample_size);

	itoa(WINDOW, channel_window_sample_size, 10);
	strcat(stream, "/");
	strcat(stream, channel_window_sample_size);

	itoa(SAMPLE, channel_window_sample_size, 10);
	strcat(stream, "/");
	strcat(stream, channel_window_sample_size);

	strcat(stream, "/");
	strcat(stream, "end");

	strncpy(potato->payload, stream, strlen(stream));
	potato->tot_len = strlen(stream);
	potato->len = strlen(stream);
	udp_send(potato_pcb, potato);

	for(int a = 0; a < CHANNEL ; a+=2){

		//clean the return stream
    	memset(stream, 0, sizeof(stream));
		if (pl_reg_map[0] == 1){
			data_format(data_saw, stream, MAX_STREAM_SIZE, a);
		}
		else if (pl_reg_map[0] != 1){
			data_rand(data, a);
			data_format(data, stream, MAX_STREAM_SIZE, a);
		}
		strncpy(potato->payload, stream, strlen(stream));
		potato->tot_len = strlen(stream);
		potato->len = strlen(stream);
		udp_send(potato_pcb, potato);
	}

	memset(stream, 0, sizeof(stream));

	strcpy(stream, "endS");
	strcat(stream, "/end");

	strncpy(potato->payload, stream, strlen(stream));
	potato->tot_len = strlen(stream);
	potato->len = strlen(stream);
	udp_send(potato_pcb, potato);

	return 0;
}

void print_app_header()
{
	xil_printf("\n\r\n\r-----lwIP UDP echo server ------\n\r");
	xil_printf("UDP packets sent to port 6001 will be echoed back\n\r");
}

void udp_echo_recv(void *arg, struct udp_pcb *pcb, struct pbuf *p, struct
					ip_addr *addr, u16_t port)
{

    if (p != NULL) {

    	//reset each buffer before each use
    	memset(return_buffer, 0, sizeof(return_buffer));
     	memset(return_load, 0, sizeof(return_load));

		strncpy(return_buffer[0], "head" , 4);

    	command_parser(p, pl_reg_map);

    	int count = 0;

    	for(int i = 0; strcmp(return_buffer[i], "end"); i++){
    		printf("Inside return_buffer[%d]: %s\n", i, return_buffer[i]);
    		count++;

    	}
    	printf("Inside command_buffer[%d]: %s\n", count, return_buffer[count]);

    	strcpy(return_load, return_buffer[0]);
    	for(int i = 1; i <= count; i++){
    		strcat(return_load, "/");
    		strcat(return_load, return_buffer[i]);
    		printf("Inside return_load: %s\n" , return_load);
    	}
    	printf("Length of load: %d\n", strlen(return_load));

        for(int k = 10; k < 15; k++){
        	printf("New pl_reg_map[%d]: %d\n", k, pl_reg_map[k]);
        }
    	p->payload = return_load;
    	p->len = strlen(return_load);
    	p->tot_len = strlen(return_load);
		udp_sendto(pcb, p, addr, port);
    	printf("###########END###########\n");

    }
    	free(p);

}


int start_application(ip_addr_t pc_ipaddr)
{
	struct udp_pcb *pcb;
	err_t err;
	unsigned port = 7;

	reg_map(pl_reg_map);

	data_test(data_saw);
//	data_format(data_saw, stream, MAX_STREAM_SIZE);
	for(int i = 0; i<REGMAP_SIZE; i++)
		{
	    	printf("App: regmap[%d] = %d\n", i, pl_reg_map[i]);
	    }


	/* create new UDP PCB structure */
	potato_pcb = setup_send_data(potato_pcb, pc_ipaddr);
	potato = pbuf_alloc(PBUF_TRANSPORT,5620,PBUF_RAM);
//	printf("the stream: %s length: %d\n", stream, strlen(stream));

	/* create new TCP PCB structure */
	pcb = udp_new_ip_type(IPADDR_TYPE_ANY);
	if (!pcb) {
		xil_printf("Error creating PCB. Out of Memory\n\r");
		return -1;
	}

	/* bind to specified @port */
	err = udp_bind(pcb, IP_ANY_TYPE, port);
	if (err != ERR_OK) {
		xil_printf("Unable to bind to port %d: err = %d\n\r", port, err);
		return -2;
	}
	udp_recv(pcb, udp_echo_recv, NULL);

	xil_printf("UDP echo server started @ port %d\n\r", port);


	return 0;
}
