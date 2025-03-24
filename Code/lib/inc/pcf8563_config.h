#ifndef __PCF8563_CONFIG_H__
#define __PCF8563_CONFIG_H__

#include <stm8s.h>

//address
#define PCF8563_ADDRESS 		0xA2

//registers
#define PCF8563_CONTROL1 		0x00
#define PCF8563_CONTROL2 		0x01

#define PCF8563_SECONDS			0x02		//0 - 59	(in BCD)
#define PCF8563_MINUTES			0x03		//0 - 59 	(in BCD)
#define PCF8563_HOURS			0x04		//0 - 23	(in BCD)

#define PCF8563_DATE			0x05		//1 - 31	(in BCD)
#define PCF8563_WEEKDAYS		0x06		//0 - 6
#define PCF8563_MONTHS			0x07		//1 - 12	(in BCD)
#define PCF8563_YEARS			0x08		//0 - 99	(in BCD)

#define PCF8563_ALARM_MINUTE	0x09		//0 - 59 	(in BCD)
#define PCF8563_ALARM_HOUR		0x0A		//0 - 23 	(in BCD)
#define PCF8563_ALARM_DATE		0x0B		//0 - 31 	(in BCD)
#define PCF8563_ALARM_WEEKDAY	0x0C		//0 - 6


#define PCF8563_CLKOUT			0x0D		//0x00 : 32768, 0x01 : 1024, 0x02 : 32, 0x03 : 1 Hz
#define PCF8563_TIMER_CONTROL	0x0E		//0x00 : 4096,  0x01 : 64,   0x02 : 1,  0x03 : 1/60 Hz
#define PCF8563_TIMER_VALUE		0x0F		//0 - 0xFF







//bit definitions control register 1
#define PCF8563_TEST1_BIT		0x80		//0 : normal mode, 			1 : EXT_CLK test mode
#define PCF8563_STOP_BIT		0x20		//0 : RTC source clock runs
#define PCF8563_TESTC_BIT		0x08		//0 : power-on reset override facility is disabled

//bit definitions control register 2
#define PCF8563_TI_TP_BIT		0x10		//0 : INT is active when TF is active, 1 : pulses active
#define PCF8563_AF_BIT			0x08		//1 : ALARM is active
#define PCF8563_TF_BIT			0x04		// ???
#define PCF8563_AIE_BIT			0x02		//0 : alarm interrupt disabled, 1 : alarm interrupt enabled
#define PCF8563_TIE_BIT			0x01		//0 : timer interrupt disabled, 1 : timer interrupt enabled

//bit definitions PCF8563_SECONDS register
#define PCF8563_VL_BIT			0x80		//0 : reliable clock/calendar information is guaranteed
//											//1 : reliable clock/calendar information is no longer guaranteed

//bit definitions PCF8563_MONTH register
#define PCF8563_C_BIT			0x80		//0 : indicates the century is 20xx
//											//1 : indicates the century is 19xx

#define PCF8563_AE_BIT			0x80		//0 : alarm ENABLED, 			1 : alarm DISABLED

#define PCF8563_FE_BIT			0x80		//0 : clkout/timer DISABLED, 	1 : clkout/timer ENABLED




typedef struct 
{
	uint8_t second;
	uint8_t minute;
	uint8_t hour;
	uint8_t date;
	uint8_t weekday;
	uint8_t month;
	uint8_t year;
}date_time_t;


void PCF8563_config(void);
void PCF8563_read_data_time(date_time_t *pcf8563_ptr);
void PCF8563_write_data_time(date_time_t *pcf8563_ptr);



#endif
