#include "ds1337_config.h"
#include "i2c_config.h"
#include "bcd_conversions.h"

void DS1337_config(void)
{
	I2C_sendbyte_reg8(DS1337_ADDRESS, DS1337_CONTROL, 0x00);
}


void DS1337_read_data_time(date_time_t *ds1337)
{
	uint8_t i2c_buff[8];
	
	I2C_readarray_reg8(DS1337_ADDRESS, DS1337_SECONDS, i2c_buff, 7);
			
	ds1337->second = BCD2DEC((uint8_t) (i2c_buff[0] & 0x7F));
	ds1337->minute = BCD2DEC((uint8_t) (i2c_buff[1] & 0x7F));
	ds1337->hour 	= BCD2DEC((uint8_t) (i2c_buff[2] & 0x3F));
	ds1337->weekday = BCD2DEC((uint8_t) (i2c_buff[3] & 0x07));
	ds1337->date    = BCD2DEC((uint8_t) (i2c_buff[4] & 0x3F));
	ds1337->month   = BCD2DEC((uint8_t) (i2c_buff[5] & 0x1F));
	ds1337->year    = BCD2DEC((uint8_t) (i2c_buff[6] & 0xFF));
}

void DS1337_write_data_time(date_time_t *ds1337)
{
	uint8_t i2c_buff[8];
	
	i2c_buff[0] = DEC2BCD(ds1337->second);
	i2c_buff[1] = DEC2BCD(ds1337->minute);
	i2c_buff[2] = DEC2BCD(ds1337->hour);
	i2c_buff[3] = DEC2BCD(ds1337->weekday);
	i2c_buff[4] = DEC2BCD(ds1337->date);
	i2c_buff[5] = DEC2BCD(ds1337->month);
	i2c_buff[6] = DEC2BCD(ds1337->year);
	
	I2C_sendarray_reg8(DS1337_ADDRESS, DS1337_SECONDS, i2c_buff, 7);
}