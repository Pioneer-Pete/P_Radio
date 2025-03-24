#include "pcf8563_config.h"
#include "i2c_config.h"
#include "bcd_conversions.h"



void PCF8563_config(void)
{
	I2C_sendbyte_reg8(PCF8563_ADDRESS, PCF8563_CONTROL1, 0x00);
	I2C_sendbyte_reg8(PCF8563_ADDRESS, PCF8563_CONTROL2, 0x00);
}


void PCF8563_read_data_time(date_time_t *pcf8563_ptr)
{
	uint8_t i2c_buff[8];
	
	I2C_readarray_reg8(PCF8563_ADDRESS, PCF8563_SECONDS, i2c_buff, 7);
	
	pcf8563_ptr->second  = BCD2DEC((uint8_t) (i2c_buff[0] & 0x7F));
	pcf8563_ptr->minute  = BCD2DEC((uint8_t) (i2c_buff[1] & 0x7F));
	pcf8563_ptr->hour    = BCD2DEC((uint8_t) (i2c_buff[2] & 0x3F));
	pcf8563_ptr->date    = BCD2DEC((uint8_t) (i2c_buff[3] & 0x3F));
	pcf8563_ptr->weekday =         (uint8_t) (i2c_buff[4] & 0x03);
	pcf8563_ptr->month   = BCD2DEC((uint8_t) (i2c_buff[5] & 0x1F));
	pcf8563_ptr->year    = BCD2DEC((uint8_t) (i2c_buff[6] & 0xFF));
}

void PCF8563_write_data_time(date_time_t *pcf8563_ptr)
{
	uint8_t i2c_buff[8];
	
	i2c_buff[0] = DEC2BCD(pcf8563_ptr->second);
	i2c_buff[1] = DEC2BCD(pcf8563_ptr->minute);
	i2c_buff[2] = DEC2BCD(pcf8563_ptr->hour);
	i2c_buff[3] = pcf8563_ptr->date;
	i2c_buff[4] = DEC2BCD(pcf8563_ptr->weekday);
	i2c_buff[5] = DEC2BCD(pcf8563_ptr->month);
	i2c_buff[6] = DEC2BCD(pcf8563_ptr->year);
	
	
	I2C_sendarray_reg8(PCF8563_ADDRESS, PCF8563_SECONDS, i2c_buff, 7);
}