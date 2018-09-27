#include "cmd_parser.h"
#include "reg_read.h"
#include "reg_write.h"
#include "reg_map.h"
#include <stdlib.h>
#include "xparameters.h"

void command_parser(struct pbuf *p, int regmap[]){
	char* payload = p->payload;
	int cmd_buf_size = 0;
	const char delimiter[2] = "/";

	//Tokenize the string using delimiter
	char* token = strtok(payload, delimiter);

	command_buffer[cmd_buf_size] = token;
	cmd_buf_size++;
	int reg_addr, reg_val;
	while (token != NULL && cmd_buf_size < 1000) {

		token = strtok(NULL, delimiter);
		command_buffer[cmd_buf_size] = token;
		cmd_buf_size++;
	}

	int index_send_buffer = 2;
	char reg_val_string[100];


	command_buffer[cmd_buf_size] = NULL;

	for(int i = 0; i < cmd_buf_size; i++) printf("Inside cmd_buffer[%d]: %s\n", i, command_buffer[i] );

	//Goes through the command buffer and interprets each command
	for(int i = 2; i < cmd_buf_size-2; i++){

		printf("this: %s\n", command_buffer[i]);
		/*		Ping		*/
		if(strcmp(command_buffer[i],"ping") == 0){
			//Responds with pong
			strncpy(return_buffer[index_send_buffer], "pong", 4);
			printf("return_buffer for ping: %s\n", return_buffer[index_send_buffer]);
			index_send_buffer+= 1;
		}
		/*		Read		*/
		else if(strcmp(command_buffer[i],"read") == 0){
			//Responds with "read", <desired reg>, <value of reg>
			strncpy(return_buffer[index_send_buffer], "read", 4);
			strncpy(return_buffer[index_send_buffer+1], command_buffer[i+1], 100);
			reg_addr=strtol(command_buffer[i+1],NULL,10);
			itoa(reg_read(reg_addr, regmap), reg_val_string, 10);
			strncpy(return_buffer[index_send_buffer+2], reg_val_string, 4);
			printf("return_buffer for read:cmd: %s addr:%s val:%s \n",
					return_buffer[index_send_buffer], return_buffer[index_send_buffer+1] , return_buffer[index_send_buffer+2]);
			index_send_buffer += 3;
			i++;
		}
		/*		Read all		*/
		else if(strcmp(command_buffer[i],"rall") == 0){

			strncpy(return_buffer[index_send_buffer], "rall", 4);
			int a;
			for(a = 0; a<REGMAP_SIZE; a++)
				{
				itoa(reg_read(a, regmap), reg_val_string, 10);
				strncpy(return_buffer[index_send_buffer+1+a], reg_val_string, 4);
				printf("return_buffer for read:cmd-%s [a]=%d addr:%s val:%s \n",
				return_buffer[index_send_buffer+a], a, return_buffer[index_send_buffer+1+a] , return_buffer[index_send_buffer+2+a]);
				}
			index_send_buffer = index_send_buffer + a + 1 ;

		}
		/*		Write		*/
		else if(strcmp(command_buffer[i],"rite") == 0){
			//Responds with "rite", <desired reg>, <desired value>
			strncpy(return_buffer[index_send_buffer], "rite", 4);
			strncpy(return_buffer[index_send_buffer+1], command_buffer[i+1], 100);
			strncpy(return_buffer[index_send_buffer+2], command_buffer[i+2], 100);

			printf("return_buffer for rite:\ncmd-%s \naddr:%s \nval:%s \n",
								return_buffer[index_send_buffer], return_buffer[index_send_buffer+1] , return_buffer[index_send_buffer+2]);
			index_send_buffer += 3;
			reg_addr=strtol(command_buffer[i+1],NULL,10);
			reg_val=strtol(command_buffer[i+2],NULL,10);
			reg_write(reg_addr, reg_val, regmap);
			i+=2;

		}
		else{
			printf("%s is not a valid command\n", command_buffer[i]);
		}
		printf("Index: send_buf[%d]", index_send_buffer);

	}
	itoa(index_send_buffer-1, return_buffer[1], 10);
	strncpy(return_buffer[index_send_buffer], "end", 3);

}

