/**
 * @file 	log_file.c
 * @author	Anthony Schluchin
 * @date	13th November 2018
 * @version 0.0
 */

#include "file_hm.h"

/*********************** Global variables ****************/
/*********************************************************/
/** @brief String pointer to the logical drive numer */
char *Path = "0:/";
/** @brief Instance of the file system */
static FATFS FS_instance;
/** @brief String pointer to the log file name */
static char *log_filename = "log.txt";
/** @brief Instance of the log file */
static FIL log_file;
/** @brief String pointer to the time file name */
static char *time_filename = "time.txt";
/** @brief Instance of the time file */
static FIL time_file;

/****************************************************************************/
/**
* @brief	Mount the SD card
*
* @param	None
*
* @return	FRESULT: see enumeration in ff.h and possibility on note's website
*
* @note		the instance of the SD card must be static, that is why this function
* 			job is only to call another function
* 			http://elm-chan.org/fsw/ff/00index_e.html for informations abourt
* 			ff.c (Generic FAT Filesystem Module)
*
****************************************************************************/
FRESULT mount_sd_card(void)
{
	FRESULT result = f_mount(&FS_instance,Path, 1);
	if (result != FR_OK) printf("SD card mount failed, result = %d\r\n", result);

	return result;
}

/****************************************************************************/
/**
* @brief	Create the log file to save the log message. If file already exists,
* 			doesn't create a new one, but continues the existing one
*
* @param	None
*
* @return	FRESULT: see enumeration in ff.h and possibility on note's website
*
* @note		http://elm-chan.org/fsw/ff/00index_e.html for informations abourt
* 			ff.c (Generic FAT Filesystem Module)
*
****************************************************************************/
FRESULT create_logfile(void)
{
	FRESULT result;
	result = f_open(&log_file, log_filename, FA_CREATE_NEW | FA_WRITE | FA_READ);
	if(result == FR_EXIST){
		result = f_open(&log_file, log_filename, FA_OPEN_EXISTING | FA_WRITE | FA_READ);
		xil_printf("Open existing file\r\n");
	}
	else xil_printf("Open and created file\r\n");
	if(result != FR_OK) xil_printf("Create log file failed during f_open, result = %d\r\n", result);
	else {
		result = f_close(&log_file);
		if(result != FR_OK) xil_printf("Create log file failed during f_close, result = %d\r\n", result);
	}
	return result;
}

/****************************************************************************/
/**
* @brief	Write a log message in the log file with the date and hour
*
* @param	tmp_text: text to be written
* 			length: size of tmp_text (in bytes)
*
* @return	FRESULT: see enumeration in ff.h and possibility on note's website
*
* @note		http://elm-chan.org/fsw/ff/00index_e.html for informations abourt
* 			ff.c (Generic FAT Filesystem Module)
*
****************************************************************************/
FRESULT log_event(char *tmp_text, uint length)
{
	static int file_index = 0;
	FRESULT result;
	uint nbr_byte = 0;
	char text[300];
	time_cplt time;

	gettime_hm(&time); // get the time
	length += 26;
	if(length < 250){
		/* format the time in string */
		sprintf((char *)text, "%02d.%02d.%04d @ %02d:%02d:%02d : %s\r\n",  time.day, time.month, time.year, time.hour, time.minute, time.second, tmp_text);
		result = f_open(&log_file, log_filename,FA_WRITE);
		if(result != FR_OK) printf("Write log file failed during f_open, result = %d\r\n", result);
		else {
			/* index to end of file */
			file_index = file_size(&log_file);
			result = f_lseek(&log_file,file_index);
			if(result != FR_OK) printf("Write log file failed during f_lseek, result = %d\r\n", result);
			else{
				/* write string in file */
				result = f_write(&log_file, (const void*)text, length, &nbr_byte);
				if(result != FR_OK) printf("Write log file failed during f_write, result = %d\r\n", result);
				else{
					if(nbr_byte < length){
						result = FR_INT_ERR;
						printf("Write log file failed, disk full\r\n");
					}
					else{
						result = f_close(&log_file);
						if(result != FR_OK) printf("Write log file failed during f_close, result = %d\r\n", result);
						else xil_printf("%s\r\n", text);
					}
					//file_index += nbr_byte;
				}
			}
		}
	}
	else{
		result = FR_INVALID_PARAMETER;
		printf("Write log file failed, text too long\r\n");
	}
	return result;
}

/****************************************************************************/
/**
* @brief	Create the time file to save the time. If file already exists,
* 			doesn't create a new one, but continues the existing one
*
* @param	None
*
* @return	FRESULT: see enumeration in ff.h and possibility on note's website
*
* @note		http://elm-chan.org/fsw/ff/00index_e.html for informations abourt
* 			ff.c (Generic FAT Filesystem Module)
*
****************************************************************************/
FRESULT create_timefile(void)
{
	FRESULT result;
	uint length = 0;
	uint nbr_byte = 0;
	char time_str[100];
	time_cplt time;

	result = f_open(&time_file, time_filename, FA_CREATE_NEW | FA_WRITE | FA_READ);
	if(result == FR_EXIST){
		xil_printf("Open existing file and updated the time\r\n");
		result = f_open(&time_file, time_filename, FA_OPEN_EXISTING | FA_WRITE | FA_READ);
		if(result != FR_OK) xil_printf("Create time file failed during f_open, result = %d\r\n", result);
		else {
			/* get time from timefile and add delay */
			length = 21;
			result = f_read(&time_file, time_str, length, &nbr_byte);
			time_str[21] = '\0'; // end of line
			if(result != FR_OK){
				printf("Create time file failed during f_read, result = %d\r\n", result);
				result = f_close(&time_file);
			}
			else{
				if(nbr_byte < length){
					result = FR_INT_ERR;
					printf("Create time file failed, nbr of byte read not enough\r\n");
				}
				else{
					result = f_close(&time_file);
					if(result != FR_OK) printf("Create time file failed during f_close, result = %d\r\n", result);
					else{
						/* set the time of the system with the backup time */
						stringtotime(time_str, &time);
						settime_hm(&time);
						//addtime(); // compensate caused by the reboot
					}
				}
			}
		}
	}
	else{
		xil_printf("Open and created file\r\n");
		if(result != FR_OK) xil_printf("Create time file failed during f_open, result = %d\r\n", result);
		else {
			result = f_close(&time_file);
			if(result != FR_OK) printf("Create time file failed during f_close, result = %d\r\n", result);
		}
	}
	return result;
}

/****************************************************************************/
/**
* @brief	Write the time in the time file to know when the wdt occurs
*
* @param	None
*
* @return	FRESULT: see enumeration in ff.h and possibility on note's website
*
* @note		http://elm-chan.org/fsw/ff/00index_e.html for informations abourt
* 			ff.c (Generic FAT Filesystem Module)
*
****************************************************************************/
FRESULT update_timefile(void)
{
	FRESULT result;
	uint length = 21;
	uint nbr_byte = 0;
	int file_index = 0;
	char text[100];
	time_cplt time;

	gettime_hm(&time);

	sprintf((char *)text, "%02d.%02d.%04d @ %02d:%02d:%02d",  time.day, time.month, time.year, time.hour, time.minute, time.second);
	//printf("update_timefile: %s\r\n", text);
	result = f_open(&time_file, time_filename,FA_WRITE);
	if(result != FR_OK) printf("Write time file failed during f_open, result = %d\r\n", result);
	else {
		/* index to beginning of file */
		result = f_lseek(&time_file,file_index);
		if(result != FR_OK) printf("Write time file failed during f_lseek, result = %d\r\n", result);
		else{
			/* write file */
			result = f_write(&time_file, (const void*)text, length, &nbr_byte);
			if(result != FR_OK) printf("Write time file failed during f_write, result = %d\r\n", result);
			else{
				if(nbr_byte < length){
					result = FR_INT_ERR;
					printf("Write time file failed, disk full\r\n");
				}
				else{
					result = f_close(&time_file);
					if(result != FR_OK) printf("Write time file failed during f_close, result = %d\r\n", result);
				}
			}
		}
	}

	return result;
}
