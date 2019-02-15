/**
 * @file 	udp_peripheral.c
 * @author	Anthony Schluchin
 * @date	24th October 2018
 * @version 0.0
 */

#include "udp_peripheral.h"

/*********************** Global variables ****************/
/*********************************************************/
/** @brief UDP Protocol Control Block for data communication */
struct udp_pcb *pcb_data;
/** @brief UDP Protocol Control Block for command communication */
struct udp_pcb *pcb_cmd;
/** @brief Buffer structure used to send data packet */
struct pbuf *buf_data;
/** @brief Buffer structure used to send command packet */
struct pbuf *buf_cmd;

/**************** Extern global variables ****************/
/*********************************************************/
/** @brief Counter of the TTC */
extern volatile int count_ttcps_timer;
/** @brief Instance of AXI-DMA */
extern volatile int count_scu_timer;
/** @brief Number of bytes sent during streaming (trigger mode) */
extern int nbre_of_bytes;
/** @brief Flag reset when the user send the command "stop uC" */
extern volatile bool run_flag;
/** @brief Flag raised when the user send the command "start streaming" */
extern volatile bool stream_flag;
/** @brief Flag raised when the user send the command "get transfer function" */
extern volatile bool get_transfer_fct_flag;
/** @brief Flag raised when the user send the command "get 20 windows" */
extern volatile bool get_20_windows_flag;
/** @brief Array containing registers of AXI-lite */
extern int* regptr;
/** @brief Buffer used to send the command (50 bytes above it reserved for protocol header) */
extern char* frame_buf_cmd;

//******** To test the error detection********************/
/** @brief Flag raised when the user want to test the autonomous side of the system with a watchdog */
extern volatile bool simul_err_watchdog_flag;
/** @brief Flag raised when the user want to test the autonomous side of the system */
extern volatile bool simul_err_function_prob_flag;
/** @brief Flag raised when the user want to test the autonomous side of the system with a exception */
extern volatile bool simul_err_exception_flag;
/** @brief Flag raised when the user want to test the autonomous side of the system with a assertion */
extern volatile bool simul_err_assertion_flag;

/****************************************************************************/
/**
* @brief	Send a frame trought UDP
*
* @param	frame: pointer to the frame to send
* @param	length: size of the frame
*
* @return	type err_enum_t: enumaration from err.h file
*
* @note		frame must take in consideration the header ex:
* 			for a buffer of size 6
* 			char* test_array = (char *)malloc(6 + BUF_HEADER_SIZE);
* 			and then
* 			transfer_data(&test_array[BUF_HEADER_SIZE], 6)
*
****************************************************************************/
err_t transfer_data(char* frame, uint16_t length) {
	if(sizeof(frame) <= MAX_DATA_SIZE){
		buf_data->payload = frame;
		buf_data->tot_len = length;
		buf_data->len = length;
		return udp_send(pcb_data, buf_data);
	}
	else return ERR_BUF;
}

/****************************************************************************/
/**
* @brief	Send a frame trought UDP
*
* @param	frame: pointer to the frame to send
* @param	length: size of the frame
*
* @return	type err_enum_t: enumaration from err.h file
*
* @note		frame must take in consideration the header ex:
* 			for a buffer of size 6
* 			char* test_array = (char *)malloc(6 + BUF_HEADER_SIZE);
* 			and then
* 			transfer_data(&test_array[BUF_HEADER_SIZE], 6)
*
****************************************************************************/
err_t transfer_cmd(char* frame, uint16_t length) {
	if(sizeof(frame) <= MAX_CMD_SIZE){
		buf_cmd->payload = frame;
		buf_cmd->tot_len = length;
		buf_cmd->len = length;
		return udp_send(pcb_cmd, buf_cmd);
	}
	else return ERR_BUF;
}

/****************************************************************************/
/**
* @brief	callback when a command is received
*
* @param	arg: not used
* @param	pcb: UDP Protocol Control Block used to send the data.
* @param	p: pointer to the buffer containing the data received
* @param	addr: IP address of the destination
* @param	port: UDP port of the destination
*
* @return	None
*
* @note		-
*
****************************************************************************/
void udp_cmd_recv(void *arg, struct udp_pcb *pcb, struct pbuf *p, const ip_addr_t *addr, u16_t port)
{
	int length;
    if (p != NULL) {
    	frame_buf_cmd[0] = 0x55;
    	frame_buf_cmd[1] = 0xAA;

    	length = command_parser(p, frame_buf_cmd);
    	if(length > 0){
    		//send data back
    		frame_buf_cmd[length-2] = 0x33;
    		frame_buf_cmd[length-1] = 0xCC;
    		transfer_cmd(frame_buf_cmd, length);
		}
    	else xil_printf("ERROR with the command received\r\n");
    }
    //free(p);
    //pbuf_free(p);

}

/****************************************************************************/
/**
* @brief	Process the data received and report a command
*
* @param	p: pointer to the buffer containing the data received
* @param	return_buf: pointer to the data to be echoed back
*
* @return	-1 if there is a problem or the number of byte in return_bf
*
* @note		-
*
****************************************************************************/
int command_parser(struct pbuf *p, char* return_buf){
	char* payload = p->payload;
	uint16_t length = p->len;
	uint16_t start = 0;
	uint16_t end = 0;
	bool flag_start = false;
	bool flag_end = false;
	int i, regID;
	time_cplt offset_time;
	int regVal;

	while((start < (length-1)) && (flag_start == false)){
		if((payload[start] == 0x55) && (payload[start+1] == 0xAA)) flag_start = true;
		else start++;
	}

	while((end < (length-1)) && (flag_end == false)){
		if((payload[end] == 0x33) && (payload[end+1] == 0xCC)) flag_end = true;
		else end++;
	}

	if(flag_start && flag_end){
		return_buf[2] = payload[start+2];
		return_buf[3] = payload[start+3];
		switch(payload[start+2]){
			case 0: // cmd write all reg.
				if(start + 4 + 2*REGMAP_SIZE_UDP == end){
					regID = 1;
					for(i = 4; i < (4 + 2*REGMAP_SIZE_UDP); i += 2){
						if(regID <= TC_MISCDIG_REG || regID == TC_TPG_REG){
							regVal = payload[i]*256 + payload[i+1];
							WriteRegister(regID, regVal);
						}
						regID++;
					}
					xil_printf("Command write_all_reg received\r\n");
					return 6;
				}
				else return -1;
				break;
			case 1: // cmd read all reg
				if(start + 4 == end){
					regID = 1;
					for(i = 4; i < (4 + 2*REGMAP_SIZE_UDP); i += 2){
						return_buf[i] = (char)(regptr[regID] >> 8);
						return_buf[i+1] = (char)(regptr[regID]);
						regID++;
					}
					xil_printf("Command read_all_reg received\r\n");
					return (6 + 2*REGMAP_SIZE_UDP);
				}
				else return -1;
				break;
			case 2: // cmd ping
				if(start + 4 == end){
					xil_printf("Command ping received\r\n");
					return 6;
				}
				else return -1;
				break;
			case 3: // cmd start stream
				if(start + 4 == end){
					if(stream_flag){
						stream_flag = false;
						xil_printf("Command stop_stream received\r\n");
					}
					else{
						stream_flag = true;
						xil_printf("Command start_stream received\r\n");
						count_ttcps_timer = 0;
						count_scu_timer = 0;
						nbre_of_bytes = 0;
					}
					return 6;
				}
				else return -1;
				break;
			case 4: // cmd stop uC
				if(start + 4 == end){
					xil_printf("Command stop_uC received\r\n");
					run_flag = false;
					return 6;
				}
				else return -1;
				break;
			case 5: // set time
				if(start + 4 + 6 == end){
					offset_time.year = payload[4] + 2000;
					offset_time.month = payload[5];
					offset_time.day = payload[6];
					offset_time.hour = payload[7];
					offset_time.minute = payload[8];
					offset_time.second = payload[9];
					offset_time.milisecond = 0;
					settime_hm(&offset_time);
					xil_printf("Command settime received\r\n");
					return 6;
				}
				else return -1;
				break;
			case 6: // get data for the transfer function
				if(start + 4 == end){
					xil_printf("Command get_transfer_fct received\r\n");
					get_transfer_fct_flag = true;
					return 6;
				}
				else return -1;
				break;
			case 7: // get 15 windows
				if(start + 4 == end){
					xil_printf("Command get_15_windows received\r\n");
					get_20_windows_flag = true;
					return 6;
				}
				else return -1;
				break;
			case 8:	// error watchdog asked
				if(start + 4 == end){
					xil_printf("Command err_watchdog received\r\n");
					simul_err_watchdog_flag = true;
					return 6;
				}
				else return -1;
				break;
			case 9:	// error function problem asked
				if(start + 4 == end){
					xil_printf("Command err_function_prob received\r\n");
					simul_err_function_prob_flag = true;
					return 6;
				}
				else return -1;
				break;
			case 10:	// error exception asked
				if(start + 4 == end){
					xil_printf("Command err_exception received\r\n");
					simul_err_exception_flag = true;
					return 6;
				}
				else return -1;
				break;
			case 11:	// error assertion asked
				if(start + 4 == end){
					xil_printf("Command err_assertion received\r\n");
					simul_err_assertion_flag = true;
					return 6;
				}
				else return -1;
				break;
			default:
				return -1;

		}
	}
	else return -1;
}

/****************************************************************************/
/**
* @brief	Setup all the settings for the UDP communication (data and command)
*
* @param	pc_ipaddr: IP address of the computer
*
* @return	0 if ok, negative values if there is a problem
*
* @note		-
*
****************************************************************************/
int setup_udp_settings(ip_addr_t pc_ipaddr)
{
	int ret = 0;
	/* Initialize the regmap for test */
	for(int i = 0; i<REGMAP_SIZE_UDP; i++) regptr[i] = i;


	/* create new UDP PCB structure for the data */
	ret = setup_pcb_data(pc_ipaddr, PORT_DATA);
	if(ret < 0){
		xil_printf("set up the pcb for data failed, in function %s returned: %d\r\n", __func__, ret);
		return ret;
	}
	buf_data = pbuf_alloc(PBUF_TRANSPORT,MAX_DATA_SIZE,PBUF_RAM);

	/* create new UDP PCB structure for the commands */
	ret = setup_pcb_cmd(pc_ipaddr, PORT_CMD);
	if(ret < 0){
		xil_printf("set up the pcb for command failed, in function %s returned: %d\r\n", __func__, ret);
		return ret;
	}
	buf_cmd = pbuf_alloc(PBUF_TRANSPORT,MAX_CMD_SIZE,PBUF_RAM);

	return ret;
}

/****************************************************************************/
/**
* @brief	Setup the UDP Protocol Control Block for the data frame
*
* @param	pc_ipaddr: IP address of the computer
* @param	port: UDP port of the computer used for the data
*
* @return	0 if ok, negative values if there is a problem
*
* @note		-
*
****************************************************************************/
int setup_pcb_data(ip_addr_t pc_ipaddr, uint16_t port){

	err_t err;

	/* create new UDP PCB structure */
	pcb_data = udp_new_ip_type(IPADDR_TYPE_ANY);
	if (!pcb_data) {
		xil_printf("Error creating PCB. Out of Memory\n\r");
		return -1;
	}

	/* bind zynq to specified @port */
	err = udp_bind(pcb_data, IP_ANY_TYPE, port); //bind = port we are listenning to (zynq input port)
	if (err != ERR_OK) {
		xil_printf("Unable to bind port %d: err = %d\n\r", port, err);
		return -2;
	}

	/*connect zynq to pc @ip addr & port*/
	err = udp_connect(pcb_data, &pc_ipaddr, port); // connect = the input port of the PC
	if (err != ERR_OK) {
		xil_printf("Unable to bind to port %d: err = %d\n\r", port, err);
		return -2;
	}

	return 0;
}

/****************************************************************************/
/**
* @brief	Setup the UDP Protocol Control Block for the command frame
*
* @param	pc_ipaddr: IP address of the computer
* @param	port: UDP port of the computer used for the command
*
* @return	0 if ok, negative values if there is a problem
*
* @note		-
*
****************************************************************************/
int setup_pcb_cmd(ip_addr_t pc_ipaddr, uint16_t port){
	err_t err;

	/* create new UDP PCB structure */
	pcb_cmd = udp_new_ip_type(IPADDR_TYPE_ANY);
	if (!pcb_cmd) {
		xil_printf("Error creating PCB. Out of Memory\n\r");
		return -1;
	}

	/* bind to specified @port */
	err = udp_bind(pcb_cmd, IP_ANY_TYPE, port);
	if (err != ERR_OK) {
		xil_printf("Unable to bind port %d: err = %d\n\r", port, err);
		return -2;
	}

	/*connect zynq to pc @ip addr & port*/
	err = udp_connect(pcb_cmd, &pc_ipaddr, port); // connect = the input port of the PC
	if (err != ERR_OK) {
		xil_printf("Unable to bind to port %d: err = %d\n\r", port, err);
		return -2;
	}

	/* connect the function udp_cmd_recv as the callback when a command is received*/
	udp_recv(pcb_cmd, udp_cmd_recv, NULL);
	return 0;
}

/****************************************************************************/
/**
* @brief	Disable and clean the UDP PCB for the data and the command
*
* @param	None
*
* @return	None
*
* @note		-
*
****************************************************************************/
void cleanup_udp(void){
	udp_disconnect(pcb_data);
	udp_remove(pcb_data);
	udp_remove(pcb_cmd);
}

/****************************************************************************/
/**
* @brief	Function to print an IP address with a message (used in debug mostly)
*
* @param	msg: pointer to the message to print before the IP address
* @param	ip: pointer to the IP address to print
*
* @return	None
*
* @note		-
*
****************************************************************************/
void print_ip(char *msg, ip_addr_t *ip)
{
	printf("%s", msg);
	printf("%d.%d.%d.%d\n\r", ip4_addr1(ip), ip4_addr2(ip),
			ip4_addr3(ip), ip4_addr4(ip));
}

/****************************************************************************/
/**
* @brief	Function to print all the settings of an Internet connection (used in debug mostly)
*
* @param	ip: pointer to the IP address to print
* @param	mask: pointer to the mask to print
* @param	gw: pointer to the gateway to print
*
* @return	None
*
* @note		-
*
****************************************************************************/
void print_ip_settings(ip_addr_t *ip, ip_addr_t *mask, ip_addr_t *gw)
{

	print_ip("Board IP: ", ip);
	print_ip("Netmask : ", mask);
	print_ip("Gateway : ", gw);
}
