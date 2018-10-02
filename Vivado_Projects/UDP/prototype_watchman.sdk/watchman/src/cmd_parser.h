#include <stdio.h>
#include <string.h>
#include "lwip/err.h"
#include "lwip/udp.h"
#define MAX_ARRAY_SIZE 100
#include "xil_printf.h"

char* command_buffer[MAX_ARRAY_SIZE];
char return_buffer[MAX_ARRAY_SIZE][MAX_ARRAY_SIZE];

void command_parser(struct pbuf *p, int* regmap);
