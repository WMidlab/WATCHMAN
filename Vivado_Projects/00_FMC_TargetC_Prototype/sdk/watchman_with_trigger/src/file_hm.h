/**
 * @file 	log_file.h
 * @author	Anthony Schluchin
 * @date	13th November 2018
 * @version 0.0
 */

#ifndef SRC_FILE_HM_H_
#define SRC_FILE_HM_H_

#include <unistd.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>

#include "ff.h"
#include "time_hm.h"
#include "xil_printf.h"

/*** Function prototypes *********************************************/
FRESULT mount_sd_card(void);
FRESULT create_logfile(void);
FRESULT log_event(char *tmp_text, uint length);
FRESULT create_timefile(void);
FRESULT update_timefile(void);

#endif /* SRC_FILE_HM_H_ */
