#ifndef __DS1307_CONFIG_H__
#define __DS1307_CONFIG_H__

#include <stm8s.h>

#define DS1307_ADDRESS 			0xD0

typedef enum
{
	DS1307_SECONDS 		= ((uint8_t) 0x00),
	DS1307_MINUTES 		= ((uint8_t) 0x01),
	DS1307_HOURS		= ((uint8_t) 0x02),
	DS1307_DAY			= ((uint8_t) 0x03),
	DS1307_DATE			= ((uint8_t) 0x04),
	DS1307_MONTH		= ((uint8_t) 0x05),
	DS1307_YEAR			= ((uint8_t) 0x06),
	DS1307_CONTROL		= ((uint8_t) 0x07)
}DS1307_Register_Typedef;

typedef enum
{
	DS1307_OUT			= ((uint8_t) 0x80),
	DS1307_SQWE			= ((uint8_t) 0x01),
	DS1307_DS_1HZ		= ((uint8_t) 0x00),
	DS1307_DS_4096HZ	= ((uint8_t) 0x01),
	DS1307_DS_8192HZ	= ((uint8_t) 0x02),
	DS1307_DS_32768HZ	= ((uint8_t) 0x03)
}DS1307_Bit_Typedef;


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


void DS1307_config(void);
void DS1307_read_data_time(date_time_t *ds1307);
void DS1307_write_data_time(date_time_t *ds1307);



#endif



//registers
//#define DS1307_SECONDS 			0x00
//#define DS1307_MINUTES 			0x01
//#define DS1307_HOURS			0x02
//#define DS1307_DAY				0x03
//#define DS1307_DATE				0x04
//#define DS1307_MONTH			0x05
//#define DS1307_YEAR				0x06
//#define DS1307_CONTROL			0x07

//bit definitions
//#define DS1307_OUT				0x80
//#define DS1307_SQWE				0x01
//#define DS1307_DS_1HZ			0x00
//#define DS1307_DS_4096HZ		0x01
//#define DS1307_DS_8192HZ		0x02
//#define DS1307_DS_32768HZ		0x03
