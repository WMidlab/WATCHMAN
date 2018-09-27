#include <stdio.h>
#include <string.h>
#include "cmd_parser.h"
#include "cmd_interpreter.h"

#include "lwip/err.h"
#include "lwip/udp.h"


struct udp_pcb * setup_send_data(struct udp_pcb *pcb, ip_addr_t pc_ipaddr){

	err_t err;
	unsigned port = 8;

	/* create new UDP PCB structure */
	pcb = udp_new_ip_type(IPADDR_TYPE_ANY);
	if (!pcb) {
		xil_printf("Error creating PCB. Out of Memory\n\r");
		return -1;
	}

	/* bind zynq to specified @port */
	err = udp_bind(pcb, IP_ANY_TYPE, port);

	/*connect zynq to pc @ip addr & port*/
	err = udp_connect(pcb, &pc_ipaddr, port);
	if (err != ERR_OK) {
		xil_printf("Unable to bind to port %d: err = %d\n\r", port, err);
		return -2;
	}
	return pcb;
}
