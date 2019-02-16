/**
 * @file 	time_hm.h
 * @author	Anthony Schluchin
 * @date	9th November 2018
 * @version 0.0
 */

#ifndef SRC_TIME_HM_H_
#define SRC_TIME_HM_H_

#include <stdbool.h>
#include "xtime_l.h"

/*** Type definition *************************************************/
/*********************************************************************/
/**
 * @brief Structure of the timestamp.
 */
// Structure to get or set the time
typedef struct time_cplt_st{
	int year;		/**< Contain the year */
	int month;		/**< Contain the month */
	int day;		/**< Contain the day of the month */
	int hour;		/**< Contain the hour (in 24h hour mode) */
	int minute;		/**< Contain the minutes */
	int second;		/**< Contain the second */
	int milisecond;	/**< Contain the millisecond */
} time_cplt;

/*** Function prototypes *********************************************/
void gettime_hm(time_cplt* t);
void settime_hm(time_cplt* t);
bool isALeapYear(int year);
void addtime(void);
void stringtotime(char* time_str, time_cplt* time);

#endif /* SRC_TIME_HM_H_ */
