/*
 * data_test.h
 *
 *  Created on: Jul 30, 2018
 *      Author: Jose Idlabs
 */

#ifndef SRC_DATA_TEST_H_
#define SRC_DATA_TEST_H_
#include <stdio.h>
#include <string.h>
#include "lwip/err.h"
#include "lwip/udp.h"
#include "xil_printf.h"

#define CHANNEL 16
#define WINDOW 4
#define SAMPLE 32
#define MAX_STREAM_SIZE 10000

void data_test(int data[CHANNEL][WINDOW][SAMPLE]);
void data_rand(int data[CHANNEL][WINDOW][SAMPLE], int a);
void data_format(int data[CHANNEL][WINDOW][SAMPLE], char stream[], int stream_size, int a);



#endif /* SRC_DATA_TEST_H_ */
