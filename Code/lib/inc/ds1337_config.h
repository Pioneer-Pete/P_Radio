#ifndef __DS1337_CONFIG_H__
#define __DS1337_CONFIG_H__

#include <stm8s.h>

#define DS1337_ADDRESS 			0xD0

typedef enum
{
	DS1337_SECONDS 			= ((uint8_t) 0x00),
	DS1337_MINUTES 			= ((uint8_t) 0x01),
	DS1337_HOURS			= ((uint8_t) 0x02),
	DS1337_DAY				= ((uint8_t) 0x03),
	DS1337_DATE				= ((uint8_t) 0x04),
	DS1337_MONTH			= ((uint8_t) 0x05),
	DS1337_YEAR				= ((uint8_t) 0x06),

	DS1337_ALARM1_SECONDS	= ((uint8_t) 0x07),
	DS1337_ALARM1_MINUTES	= ((uint8_t) 0x08),
	DS1337_ALARM1_HOURS		= ((uint8_t) 0x09),
	DS1337_ALARM1_DATE_DAY	= ((uint8_t) 0x0A),

	DS1337_ALARM2_MINUTES	= ((uint8_t) 0x0B),
	DS1337_ALARM2_HOURS		= ((uint8_t) 0x0C),
	DS1337_ALARM2_DATE_DAY	= ((uint8_t) 0x0D),

	DS1337_CONTROL			= ((uint8_t) 0x0E),
	DS1337_STATUS			= ((uint8_t) 0x0F)
}DS1337_Register_Typedef;




typedef struct 
{
	uint8_t second;
	uint8_t minute;
	uint8_t hour;
	uint8_t weekday;
	uint8_t date;
	uint8_t month;
	uint8_t year;
} date_time_t;


void DS1337_config(void);
void DS1337_read_data_time(date_time_t *ds1337);
void DS1337_write_data_time(date_time_t *ds1337);



#endif



/*
struct date_time_t
{
	uint8_t seconds;
	uint8_t minutes;
	uint8_t hours;
	uint8_t day;
};

#define DS1337_SECONDS 			0x00
#define DS1337_MINUTES 			0x01
#define DS1337_HOURS			0x02
#define DS1337_DAY				0x03
#define DS1337_DATE				0x04
#define DS1337_MONTH			0x05
#define DS1337_YEAR				0x06

#define DS1337_ALARM1_SECONDS	0x07
#define DS1337_ALARM1_MINUTES	0x08
#define DS1337_ALARM1_HOURS		0x09
#define DS1337_ALARM1_DATE_DAY	0x0A

#define DS1337_ALARM2_MINUTES	0x0B
#define DS1337_ALARM2_HOURS		0x0C
#define DS1337_ALARM2_DATE_DAY	0x0D

#define DS1337_CONTROL			0x0E
#define DS1337_STATUS			0x0F


*/
