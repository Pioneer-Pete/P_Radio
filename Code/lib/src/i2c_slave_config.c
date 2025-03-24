#include "i2c_slave_config.h"

void I2C_slave_config(void)
{
	disableInterrupts();

	CLK->PCKENR1 |= CLK_PCKENR1_I2C;									//enable I2C Clock
	
	I2C_Init(I2C_MAX_STANDARD_FREQ, SLAVE_ADDRESS, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, 16);
	I2C_ITConfig((I2C_IT_TypeDef)(I2C_IT_ERR | I2C_IT_EVT | I2C_IT_BUF), ENABLE);
	//I2C_ITConfig((I2C_IT_TypeDef)(I2C_IT_EVT | I2C_IT_BUF), ENABLE);

	enableInterrupts();
}


