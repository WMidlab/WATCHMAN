/**
 * @file 	transfer_function.c
 * @author	Anthony Schluchin
 * @date	16th January 2019
 * @version 0.0
 */

#include "transfer_function.h"

/**************** Extern global variables ****************/
/*********************************************************/
/** @brief Array containing registers of AXI-lite */
extern int* regptr;
/** @brief Flag raised when AXI-DMA has an error */
extern volatile bool flag_axidma_error;
/** @brief Flag raised when AXI-DMA has finished an transfer, in OnDemand mode */
extern volatile bool flag_axidma_rx_done;
/** @brief Array containing the pedestal correction for every sample */
extern uint16_t pedestal[512][16][32];
/** @brief Lookup table to correct the transfer function */
extern uint16_t lookup_table[2048];
/** @brief Flag raised when the Triple Timer Counter overflows */
extern volatile bool flag_ttcps_timer;
/** @brief Flag raised when the SCU timer overflows*/
extern volatile bool flag_scu_timer;
/** @brief Instance of the device watchdog */
extern XScuWdt WdtScuInstance;

/****************************************************************************/
/**
* @brief	Calculate the transfer fucntion lookup table
*
* @param	-
*
* @return	XST_SUCCESS or XST_FAILURE (defined in xstatus.h)
*
* @note		-
*
****************************************************************************/
int init_transfer_function(void){
	int timeout;
	int window, channel, sample, voltage;
	double data_tmp[11];
	GMtype_Data DataX, DataY;
	GMtype_Polynomial Polynomial;
	int range_min = 3;
	int range_max = 9;
	double y_voltage[2048];

	/* Create an element for the DMA */
	data_list* tmp_ptr  = (data_list *)malloc(sizeof(data_list));
	if(!tmp_ptr){
		printf("malloc for tmp_ptr failed in function, %s!\r\n", __func__);
		return XST_FAILURE;
	}
	tmp_ptr->next = NULL;
	tmp_ptr->previous = NULL;

	/* For 11 voltage between 0V and 2.5V */
	for(voltage=0; voltage< 11; voltage ++){
		data_tmp[voltage] = 0;
		/* Set the voltage k*0.25V to Vped */
		if(DAC_LTC2657_SetChannelVoltage(DAC_VPED, voltage*0.25) != XST_SUCCESS){
			xil_printf("DAC: setting vped voltage failed!\r\n");
			return XST_FAILURE;
		}

		for(window=0; window<512; window++){
			/* Give the element's address to the DMA */
			XAxiDma_SimpleTransfer_hm((UINTPTR)tmp_ptr->data.data_array, SIZE_DATA_ARRAY_BYT);

			/* Initiate transfer and measure */
			regptr[TC_FSTWINDOW_REG] = window;
			regptr[TC_NBRWINDOW_REG] = 1;
			ControlRegisterWrite(SMODE_MASK ,ENABLE);
			ControlRegisterWrite(SS_TPG_MASK ,ENABLE);
			ControlRegisterWrite(WINDOW_MASK,ENABLE);
			usleep(50);
			ControlRegisterWrite(WINDOW_MASK,DISABLE); // PL side starts on falling edge

			/* Wait on DMA transfer to be done */
			timeout = 200000; // Timeout of 10 sec
			do{
				/* If needed, update timefile */
				if(flag_ttcps_timer){
					update_timefile();
					flag_ttcps_timer = false;
				}

				/* If needed, reload watchdog's counter */
				if(flag_scu_timer){
					XScuWdt_RestartWdt(&WdtScuInstance);	// Reload the counter for the wdt
					flag_scu_timer = false;
				}

				/* The DMA had a problem */
				if(flag_axidma_error){
					printf("Error with DMA interrupt: TPG !\r\n");
					return XST_FAILURE;
				}

				usleep(50);
				timeout--;
			}while(timeout && !flag_axidma_rx_done);

			/* Update the cache with the data written by the DMA */
			Xil_DCacheInvalidateRange((UINTPTR)tmp_ptr->data.data_array, SIZE_DATA_ARRAY_BYT);

			/* DMA did not respond */
			if(timeout <= 0){
				printf("\r\nwindow = %d\r\n", window);
				printf("wdo_time: %d\r\n", (uint)tmp_ptr->data.data_struct.wdo_time);
				printf("PL_spare: %d\r\n", (uint)tmp_ptr->data.data_struct.PL_spare);
				printf("info: 0x%X\r\n", (uint)tmp_ptr->data.data_struct.info);
				printf("wdo_id: %d\r\n", (uint)tmp_ptr->data.data_struct.wdo_id);
				for(sample=0; sample<32; sample++){
					for(channel=0; channel<16; channel++){
						printf("%d\t", (uint)tmp_ptr->data.data_struct.data[channel][sample]);
					}
					printf("\r\n");
				}
				printf("Timeout on window %d: pedestal initialization failed!\r\n", window);
				return XST_FAILURE;
			}
			else flag_axidma_rx_done = false;

			/* Test the returned values */
			if(tmp_ptr->data.data_struct.wdo_id != window){
				printf("window id is wrong! voltage = %d | window = %d | wdo_id = %d\r\n", voltage, window, (uint)tmp_ptr->data.data_struct.wdo_id);
				printf("wdo_time: %d\r\n", (uint)tmp_ptr->data.data_struct.wdo_time);
				printf("PL_spare: %d\r\n", (uint)tmp_ptr->data.data_struct.PL_spare);
				printf("info: 0x%X\r\n", (uint)tmp_ptr->data.data_struct.info);
				return XST_FAILURE;
			}
			else{
				/* If data valid, save it for the average */
				for(channel=0; channel<16; channel++){
					/* ignore channel 3,7,11,15 they are broken on board 3 */
					if((channel != 3) && (channel != 7) && (channel != 11) && (channel != 15)){	// these channels are not working correctly on the prototype board 3
						for(sample=0; sample<32; sample++){
							data_tmp[voltage] += (double)(tmp_ptr->data.data_struct.data[channel][sample] + VPED_DIGITAL - pedestal[window][channel][sample]);
						}
					}
				}

			}
			/* Release the DMA */
			ControlRegisterWrite(PSBUSY_MASK,DISABLE);
		}
		//data_tmp[voltage] = data_tmp[voltage]/(512*16*32);
		data_tmp[voltage] = data_tmp[voltage]/(512*12*32);	// because 4 channels are not taken into account
	}
	free(tmp_ptr);

//	printf("data_tmp:\r\n[");
//	for(int i=0; i<10; i++) printf("%.17g, ", data_tmp[i]);
//	printf("%.17g]\r\n", data_tmp[10]);
	/* Prepare data for polynomial fitting */
	for(int i=range_min; i<range_max; i++) DataX.element[i-range_min] = data_tmp[i];
	DataX.size = range_max-range_min;
	DataY.size = range_max-range_min;
	for(int i=range_min; i<range_max; i++) DataY.element[i-range_min] = i*0.25;
//	printf("DataX:\r\n[");
//	for(int i=0; i<(DataX.size-1); i++) printf("%.17g, ", DataX.element[i]);
//	printf("%.17g]\r\n", DataX.element[DataX.size-1]);
//	printf("DataY:\r\n[");
//	for(int i=0; i<(DataY.size-1); i++) printf("%.17g, ", DataY.element[i]);
//	printf("%.17g]\r\n", DataY.element[DataY.size-1]);
	/* Fitting */
	Polynomial.degree = 3;
	for(int i=0; i<30; i++) Polynomial.coef[i] = 0;
	GM_PolyFit(DataX, DataY, &Polynomial);
//	printf("coefficient:\r\n[");
//	for(int i=0; i<(Polynomial.degree); i++) printf("%.17g, ",Polynomial.coef[i]);
//	printf("%.17g]\r\n",Polynomial.coef[3]);
//	printf("lookup table:\r\n[");
	/* Generate the lookup table */
	for(int i=0; i<2048; i++){
		y_voltage[i] = GM_SolvePolynomial(Polynomial, (double)i);
		lookup_table[i] = (uint16_t)(y_voltage[i]*2048/2.5);
	}
//	for(int i=0; i<2047; i++) printf("%d, ", lookup_table[i]);
//	printf("%d]\r\n", lookup_table[2047]);

	/* Set Vped voltage to the right voltage */
	if(DAC_LTC2657_SetChannelVoltage(DAC_VPED, VPED_ANALOG) != XST_SUCCESS){
		xil_printf("DAC: setting vped voltage failed!\r\n");
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}
