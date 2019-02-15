/**
 * @file 	time_hm.c
 * @author	Anthony Schluchin
 * @date	9th November 2018
 * @version 0.0
 */

#include "time_hm.h"

/*********************** Global variables ****************/
/*********************************************************/
/** @brief Variable which contain the offset time. It can be changed with settime_hmr*/
time_cplt offset_time = {
	.year = 2000,
	.month = 1,
	.day = 1,
	.hour = 0,
	.minute = 0,
	.second = 0,
	.milisecond = 0
	};

/** @brief Variable which contain the offset of the General Timer when the time was set */
uint64_t offset_counter = 0;
/** @bried "Constant" wich contain the number of day for every month (ex: january = day_per_mont[1]) */
int day_per_month[13] = {(int)NULL, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

/****************************************************************************/
/**
* @brief	Get the time (year, month, day, hour,...) depending on the offset.
*
* @param	t: Pointer to the time_cplt structure wich will return the current
* 				time.
*
* @return	None.
*
* @note		None.
*
****************************************************************************/
void gettime_hm(time_cplt* t){
	XTime time;
	XTime_GetTime(&time);

	time = time - offset_counter;					// difference counter
	time = (time / (COUNTS_PER_SECOND/1000));	// time in ms

	time = time + offset_time.milisecond;		// add the ms of the timestamp offset
	t->milisecond = time % 1000; 				// recalculate the ms of the timestamp
	time -= t->milisecond;						// subtract the result, now time is in sec

	time = (time / 1000) + offset_time.second;	// add the sec of the timestamp offset
	t->second = time % 60;						// recalculate the sec of the timestamp
	time -= t->second;							// subtract the result, now time is in min

	time = (time / 60) + offset_time.minute;	// add the min of the timestamp offset
	t->minute = time % 60;						// recalculate the min of the timestamp
	time -= t->minute;							// subtract the result, now time is in hour

	time = (time / 60) + offset_time.hour;		// add the hour of the timestamp offset
	t->hour = time % 24;						// recalculate the hour of the timestamp
	time -= t->hour;							// subtract the result, time is still in hour
	time = time / 24;							// now time is in day

	// if it is a leap year, adapt the list containing the number of day per month
	if(isALeapYear(t->year)) day_per_month[2] = 29;
	else day_per_month[2] = 28;

	// start from the offset date
	t->day = offset_time.day;
	t->month = offset_time.month;
	t->year = offset_time.year;

	// add the time in day to the timestamp
	while(time > 0){
		t->day++;
		if(t->day > day_per_month[t->month]){
			t->day = 1;
			t->month++;
			if(t->month > 12){
				t->month = 1;
				t->year++;
				if(isALeapYear(t->year)) day_per_month[2] = 29;
				else day_per_month[2] = 28;
			}
		}
		time--;
	}
}

/****************************************************************************/
/**
* @brief	Set the time (year, month, day, hour,...) meaning set the offset.
*
* @param	t: Pointer to the time_cplt structure wich will be written in the
* 				global offset value
*
* @return	None.
*
* @note		When this function, we need to save the state of the Global Timer
* 			Counter Register (XTime_GetTime)
*
****************************************************************************/
void settime_hm(time_cplt* t){
	offset_time.milisecond = t->milisecond % 1000;
	offset_time.second = t->second % 60;
	offset_time.minute = t->minute % 60;
	offset_time.hour = t->hour % 24;

	offset_time.year = t->year;
	if((t->month > 0) && (t->month <= 12)) offset_time.month = t->month;
	if(isALeapYear(offset_time.year)) day_per_month[2] = 29;
	else day_per_month[2] = 28;
	if((t->day > 0) && (t->day <= day_per_month[t->month])) offset_time.day = t->day;

	XTime_GetTime(&offset_counter);
}


/****************************************************************************/
/**
* @brief	Return if the year is leap or not
*
* @param	year: the year to be tested
*
* @return	- True: if the year is leap
* 			- False: if the year is not leap
*
* @note		None.
*
****************************************************************************/
bool isALeapYear(int year){
	bool ret;
	/*
	 * https://en.wikipedia.org/wiki/Leap_year
	 * if (year is not divisible by 4) then (it is a common year)
	 * else if (year is not divisible by 100) then (it is a leap year)
	 * else if (year is not divisible by 400) then (it is a common year)
	 * else (it is a leap year)
	 */
	if((year % 4) != 0) ret = false;
	else{
		if((year % 100) != 0) ret = true;
		else{
			if((year % 400) != 0) ret = false;
			else ret = true;
		}
	}
	return ret;
}

/****************************************************************************/
/**
* @brief	Add 2.5sec to the clock time
*
* @param	None
*
* @return	None
*
* @note		Specially used to compensate the delay due to a reboot with the wdt
*
****************************************************************************/
void addtime(void){
	time_cplt t;
	gettime_hm(&t);
	t.milisecond += 500;
	if(t.milisecond >= 1000){
		t.milisecond = t.milisecond%1000;
		t.second++;
	}
	t.second += 2;
	if(t.second >= 60){
		t.second = t.second%60;
		t.minute++;
		if(t.minute >= 60){
			t.minute = t.minute%60;
			t.hour++;
			if(t.hour >= 24){
				t.hour = t.hour%24;
				t.day++;
				if(isALeapYear(t.year)) day_per_month[2] = 29;
				else day_per_month[2] = 28;
				if(t.day > day_per_month[t.month]){
					t.day = 1;
					t.month++;
					if(t.month > 12){
						t.month = 1;
						t.year++;
					}
				}
			}
		}
	}
	settime_hm(&t);
}

/****************************************************************************/
/**
* @brief	Convert string to time_cplt
*
* @param	time_str: the time in string to convert
* @param	time: pointer to the time converted
*
* @return	None
*
* @note		The string to convert should be like this: "dd.mm.yyyy @ hh:mm:ss"
*
****************************************************************************/
void stringtotime(char* time_str, time_cplt* time){
	int i;
	for(i=0; i<21; i++) time_str[i] -= 48;
	time->day = time_str[0]*10 + time_str[1];
	time->month = time_str[3]*10 + time_str[4];
	time->year = time_str[6]*1000 + time_str[7]*100 + time_str[8]*10 + time_str[9];
	time->hour = time_str[13]*10 + time_str[14];
	time->minute = time_str[16]*10 + time_str[17];
	time->second = time_str[19]*10 + time_str[20];
	time->milisecond = 0;
}

