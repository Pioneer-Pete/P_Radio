#include "ds1307_config.h"
#include "i2c_config.h"
#include "bcd_conversions.h"



void DS1307_config(void)
{
	uint8_t oscillator;

	oscillator = I2C_readbyte_reg8(DS1307_ADDRESS, DS1307_SECONDS);	//read oscillator status
	if (oscillator & 0x80) 											//if NOT running
	{
		I2C_sendbyte_reg8(DS1307_ADDRESS, DS1307_SECONDS, 0x00);	//send startbit
	}
	
	I2C_sendbyte_reg8(DS1307_ADDRESS, DS1307_CONTROL, 0x10);
}


void DS1307_read_data_time(date_time_t *ds1307)
{
	uint8_t i2c_buff[8];
	
	I2C_readarray_reg8(DS1307_ADDRESS, DS1307_SECONDS, i2c_buff, 7);
	
	ds1307->second = BCD2DEC((uint8_t) (i2c_buff[0] & 0x7F));
	ds1307->minute = BCD2DEC((uint8_t) (i2c_buff[1] & 0x7F));
	ds1307->hour 	= BCD2DEC((uint8_t) (i2c_buff[2] & 0x3F));
	ds1307->weekday = BCD2DEC((uint8_t) (i2c_buff[3] & 0x07));
	ds1307->date    = BCD2DEC((uint8_t) (i2c_buff[4] & 0x3F));
	ds1307->month   = BCD2DEC((uint8_t) (i2c_buff[5] & 0x1F));
	ds1307->year    = BCD2DEC((uint8_t) (i2c_buff[6] & 0xFF));
}

void DS1307_write_data_time(date_time_t *ds1307)
{
	uint8_t i2c_buff[8];
	
	i2c_buff[0] = DEC2BCD(ds1307->second);
	i2c_buff[1] = DEC2BCD(ds1307->minute);
	i2c_buff[2] = DEC2BCD(ds1307->hour);
	i2c_buff[3] = DEC2BCD(ds1307->weekday);
	i2c_buff[4] = DEC2BCD(ds1307->date);
	i2c_buff[5] = DEC2BCD(ds1307->month);
	i2c_buff[6] = DEC2BCD(ds1307->year);

	
	I2C_sendarray_reg8(DS1307_ADDRESS, DS1307_SECONDS, i2c_buff, 7);
}