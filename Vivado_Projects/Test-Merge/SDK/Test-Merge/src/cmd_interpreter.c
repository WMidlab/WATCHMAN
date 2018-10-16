#include "cmd_interpreter.h"
#include "reg_read.h"
#include "reg_write.h"

void command_interpreter(char** command_buffer, int** regmap ){

		printf("Command Interpreter\n");


		reg_read( 1, regmap );
		reg_write( 1, 2, regmap );


}
