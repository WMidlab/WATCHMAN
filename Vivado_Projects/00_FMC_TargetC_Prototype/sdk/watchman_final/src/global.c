/**
 * @file 	global.c
 * @author	Anthony Schluchin
 * @date	28th November 2018
 * @version 0.0
 */

#include "global.h"

/*********************** Global variables ****************/
/*********************************************************/
/** @brief Pointer on the network interface */
struct netif *echo_netif;
/** @brief Counter of the TTC */
volatile int count_ttcps_timer;
/** @brief Counter of the SCU timer*/
volatile int count_scu_timer;
/** @brief Flag reset when the user send the command "stop uC" */
volatile bool run_flag;
/** @brief Flag raised when the user send the command "start streaming" */
volatile bool stream_flag;
/** @brief Flag raised when the user send the command "get transfer function" */
volatile bool get_transfer_fct_flag;
/** @brief Flag raised when the user send the command "get 20 windows" */
volatile bool get_20_windows_flag;
/** @brief Flag true when the list is empty (first_element = last_element) */
volatile bool empty_flag;
/** @brief Flag raised when the Triple Timer Counter overflows */
volatile bool flag_ttcps_timer;
/** @brief Flag raised when the SCU timer overflows*/
volatile bool flag_scu_timer;
/** @brief Instance of AXI-DMA */
XAxiDma AxiDmaInstance;
/** @brief Instance of the device watchdog */
XScuWdt WdtScuInstance;
/** @brief Flag raised when AXI-DMA has an error */
volatile bool flag_axidma_error;
/** @brief Flag raised when AXI-DMA has finished an transfer, in OnDemand mode */
volatile bool flag_axidma_rx_done;
/** @brief Array of flag, one for each PMT */
int flag_axidma_rx[4];
/** @brief Number of bytes sent during streaming (trigger mode) */
int nbre_of_bytes;
/** @brief Pointer on the first element of the list used in trigger mode */
data_list* first_element;
/** @brief Pointer on the last element of the list used in trigger mode */
data_list* last_element;
/** @brief Flag raised when the program has entered the while loop */
volatile bool flag_while_loop;
/** @brief Temporary buffer used to create the real buffer data (protocol header problem) */
char* frame_buf_tmp;
/** @brief Buffer used to send the data (50 bytes above it reserved for protocol header) */
char* frame_buf;
/** @brief Temporary buffer used to create the real buffer command (protocol header problem) */
char* frame_buf_cmd_tmp;
/** @brief Buffer used to send the command (50 bytes above it reserved for protocol header) */
char* frame_buf_cmd;
/** @brief Array containing registers of AXI-lite */
int* regptr;
/** @brief Array containing the pedestal correction for every sample */
uint16_t pedestal[512][16][32];
/** @brief Lookup table to correct the transfer function */
uint16_t lookup_table[2048];

//******** To test the error detection********************/
/** @brief Flag raised when the user want to test the autonomous side of the system with a watchdog */
volatile bool simul_err_watchdog_flag;
/** @brief Flag raised when the user want to test the autonomous side of the system with a function problem */
volatile bool simul_err_function_prob_flag;
/** @brief Flag raised when the user want to test the autonomous side of the system with a exception */
volatile bool simul_err_exception_flag;
/** @brief Flag raised when the user want to test the autonomous side of the system with a assertion */
volatile bool simul_err_assertion_flag;

/****************************************************************************/
/**
* @brief	Initiate all the global variables declared in global.h file
*
* @param	None
*
* @return	None
*
* @note		-
*
****************************************************************************/
int init_global_var(void){
	int i;

	count_ttcps_timer = 0;
	count_scu_timer = 0;
	run_flag = true;
	stream_flag = false;
	get_transfer_fct_flag = false;
	get_20_windows_flag = false;
	simul_err_watchdog_flag = false;
	simul_err_function_prob_flag = false;
	simul_err_exception_flag = false;
	simul_err_assertion_flag = false;
	empty_flag = true;
	nbre_of_bytes = 0;
	flag_ttcps_timer = false;
	flag_scu_timer = false;
	first_element = (data_list *)malloc(sizeof(data_list));
	if(!first_element){
		xil_printf("malloc for first_element failed in function, %s!\r\n", __func__);
		return XST_FAILURE;
	}
	first_element->previous = NULL;
	first_element->next = NULL;
	last_element = first_element;
	flag_while_loop = false;
	flag_axidma_error = false;
	flag_axidma_rx_done = false;
	for(i=0; i<4; i++) flag_axidma_rx[i] = 0;
	frame_buf_tmp = (char *)malloc(MAX_DATA_SIZE+BUF_HEADER_SIZE);
	if(!frame_buf_tmp){
		xil_printf("malloc for frame_buf_tmp failed in function, %s!\r\n", __func__);
		return XST_FAILURE;
	}
	frame_buf = &frame_buf_tmp[BUF_HEADER_SIZE];
	frame_buf_cmd_tmp = (char *)malloc(MAX_CMD_SIZE+BUF_HEADER_SIZE);
	if(!frame_buf_cmd_tmp){
		xil_printf("malloc for frame_buf_cmd_tmp failed in function, %s!\r\n", __func__);
		return XST_FAILURE;
	}
	frame_buf_cmd = &frame_buf_cmd_tmp[BUF_HEADER_SIZE];
	regptr = (int *)XPAR_TARGET_C_TOPLEVEL_SY_0_BASEADDR ; //XPAR_TARGETC_INTERFACE_IP_0_BASEADDR;
	for(i = TC_VDLYTUNE_REG; i<= LAST_REGISTER_ADDR; i++) regptr[i] = 0;
	return XST_SUCCESS;
}

/****************************************************************************/
/**
* @brief	Free memory from the mallocs done in function initt_global_var
*
* @param	None
*
* @return	None
*
* @note		-
*
****************************************************************************/
void cleanup_global_var(void){
	do{
		data_list* tmp = first_element->next;
		free(first_element);
		first_element = tmp;
	} while(first_element != NULL);
	free(frame_buf_tmp);
}

/****************************************************************************/
/**
* @brief	Function that resets the system (reboot only if program on SD card or in flash)
*
* @param	None
*
* @return	None
*
* @note		-
*
****************************************************************************/
void system_reset_hm(void){
	uint32_t reg;

	/* Read if registers are locked */
	reg = Xil_In32(SLCR_BASE_ADDRESS+SLCR_LOCKSTA) & LOCKSTA_MASK;
	/* If yes, unlock them */
	if(reg == 1) Xil_Out32(SLCR_BASE_ADDRESS+SLCR_UNLOCK_OFFSET, 0xDF0D);
	/* Reset the system */
	reg = Xil_In32(SLCR_BASE_ADDRESS+PSS_RST_CTRL);
	reg = reg | SOFT_RST_MASK;
	Xil_Out32(SLCR_BASE_ADDRESS+PSS_RST_CTRL, reg);
}
