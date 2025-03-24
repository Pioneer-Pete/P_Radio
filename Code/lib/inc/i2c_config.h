#ifndef __I2C_CONFIG_H__
#define __I2C_CONFIG_H__

#include <stm8s.h>

#define OWN_ADDRESS 0x00

void I2C_config(void);
void I2C_sendbyte_reg8(uint8_t dev_address, uint8_t reg8_register, uint8_t databyte);
uint8_t I2C_readbyte_reg8(uint8_t dev_address, uint8_t reg8_register);

void I2C_sendarray_reg8(uint8_t dev_address, uint8_t reg8_register,  uint8_t *data_array, uint8_t datalength);
void I2C_readarray_reg8(uint8_t dev_address, uint16_t reg8_register, uint8_t *data_array, uint8_t datalength);

void I2C_sendbyte_reg16(uint8_t dev_address, uint16_t reg16_register, uint8_t databyte);
uint8_t I2C_readbyte_reg16(uint8_t dev_address, uint16_t reg16_register);

void I2C_sendarray_reg16(uint8_t dev_address, uint16_t reg16_register,  uint8_t *data_array, uint8_t datalength);
void I2C_readarray_reg16(uint8_t dev_address, uint16_t reg16_register, uint8_t *data_array, uint8_t datalength);



#endif