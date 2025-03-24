#include "i2c_config.h"

//these are example settings for 100 kHz SCK speed


void I2C_config(void)
{
	GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_OD_HIZ_FAST);
	GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_FAST);
	
	I2C_DeInit(); 
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
	
	I2C_Init((uint32_t) I2C_MAX_STANDARD_FREQ, OWN_ADDRESS, I2C_DUTYCYCLE_2, I2C_ACK_CURR, 
		I2C_ADDMODE_7BIT, (uint8_t) (CLK_GetClockFreq() / 1000000));
		//the last value is the cpu clock frequency in MHz
		
	I2C_Cmd(ENABLE);
}


//*************************8 bit registers*******************************************

void I2C_sendbyte_reg8(uint8_t dev_address, uint8_t reg8_register, uint8_t databyte)
{
	I2C_GenerateSTART(ENABLE);													//startbit
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));						//master-mode?
	
	I2C_Send7bitAddress(dev_address, I2C_DIRECTION_TX);							//write-address
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));		//transmit-mode?
	
	I2C_SendData((uint8_t) reg8_register);										//reg8 register
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));	 				//byte is sent?
	
	I2C_SendData(databyte);														//send data byte
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));					//byte is sent?
	
	I2C_GenerateSTOP(ENABLE);													//stopbit
}


uint8_t I2C_readbyte_reg8(uint8_t dev_address, uint8_t reg8_register)
{
	uint8_t tmp = 0;
	
	I2C_GenerateSTART(ENABLE);													//startbit
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));						//master mode?
		
	I2C_Send7bitAddress(dev_address, I2C_DIRECTION_TX);							//write-address
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));		//transmit-mode?
	
	I2C_SendData((uint8_t) reg8_register);										//register
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));	 				//byte is sent?
		
	I2C_GenerateSTART(ENABLE);													//repeat startbit
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));						//master-mode?
		
	I2C_Send7bitAddress(dev_address, I2C_DIRECTION_RX);							//read-address
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));			//receiver-mode?
	
		
	I2C_AcknowledgeConfig(I2C_ACK_NONE);
	I2C_GenerateSTOP(ENABLE);													//stopbit
	while(I2C_GetFlagStatus( I2C_FLAG_RXNOTEMPTY) == RESET);
	tmp = I2C_ReceiveData();													//read byte
	//I2C_AcknowledgeConfig( I2C_ACK_CURR);
	
	return tmp;
}


void I2C_sendarray_reg8(uint8_t dev_address, uint8_t reg8_register,  uint8_t *data_array, uint8_t datalength)
{
	uint8_t i;
	
	i = 0;
	
	I2C_GenerateSTART(ENABLE);													//startbit
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));						//master-mode?
	
	I2C_Send7bitAddress(dev_address, I2C_DIRECTION_TX);							//write-address-of reg16
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));		//transmit-mode?
	
	I2C_SendData((uint8_t) reg8_register);										//reg8 register
	while(I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET);				//byte is sent?
	
	while (i < datalength)
	{
		I2C_SendData(data_array[i++]);											//send reg16 data byte
		while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));				//byte is sent?
	}
	I2C_GenerateSTOP(ENABLE);													//stopbit
}


void I2C_readarray_reg8(uint8_t dev_address, uint16_t reg8_register, uint8_t *data_array, uint8_t datalength)
{
	uint8_t i;
	
	i = 0;
	
	I2C_GenerateSTART(ENABLE);													//startbit
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));						//master mode?
		
	I2C_Send7bitAddress(dev_address, I2C_DIRECTION_TX);							//write-address-of reg16
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));		//transmit-mode?

	I2C_SendData((uint8_t) reg8_register);										//reg8 register
	while(I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET);				//byte is sent?
		
	I2C_GenerateSTART(ENABLE);													//repeat startbit
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));						//master-mode?
		
	I2C_Send7bitAddress(dev_address, I2C_DIRECTION_RX);							//read-address
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));			//receiver-mode?
	
	I2C_AcknowledgeConfig(I2C_ACK_CURR);	
	while (i < (datalength - 1))
	{
		while(I2C_GetFlagStatus( I2C_FLAG_RXNOTEMPTY) == RESET);
		data_array[i++] = I2C_ReceiveData();									//read byte
	}
	
	I2C_AcknowledgeConfig(I2C_ACK_NONE);
	I2C_GenerateSTOP(ENABLE);													//stopbit
	while(I2C_GetFlagStatus( I2C_FLAG_RXNOTEMPTY) == RESET);
	data_array[i] = I2C_ReceiveData();											//read last byte
}


//******************************16 bit registers*****************************************

void I2C_sendbyte_reg16(uint8_t reg16_address, uint16_t reg16_register, uint8_t databyte)
{
	I2C_GenerateSTART(ENABLE);													//startbit
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));						//master-mode?
	
	I2C_Send7bitAddress(reg16_address, I2C_DIRECTION_TX);						//write-address-of reg16
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));		//transmit-mode?
	
	I2C_SendData((uint8_t) (reg16_register & 0xFF00) >> 8);						//reg16 register high
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));	 				//byte is sent?
	I2C_SendData((uint8_t) (reg16_register & 0x00FF));							//reg16 register low
	while(I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET);				//byte is sent?
	
	I2C_SendData(databyte);														//send data byte
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));					//byte is sent?
	
	I2C_GenerateSTOP(ENABLE);													//stopbit
}


uint8_t I2C_readbyte_reg16(uint8_t reg16_address, uint16_t reg16_register)
{
	uint8_t tmp = 0;
	
	I2C_GenerateSTART(ENABLE);													//startbit
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));						//master mode?
		
	I2C_Send7bitAddress(reg16_address, I2C_DIRECTION_TX);						//write-address-of reg16
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));		//transmit-mode?
	
	I2C_SendData((uint8_t) (reg16_register & 0xFF00) >> 8);						//reg16 register high
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));	 				//byte is sent?
	I2C_SendData((uint8_t) (reg16_register & 0x00FF));							//reg16 register low
	while(I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET);				//byte is sent?
		
	I2C_GenerateSTART(ENABLE);													//repeat startbit
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));						//master-mode?
		
	I2C_Send7bitAddress(reg16_address, I2C_DIRECTION_RX);						//read-address
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));			//receiver-mode?
	
		
	I2C_AcknowledgeConfig(I2C_ACK_NONE);
	I2C_GenerateSTOP(ENABLE);													//stopbit
	while(I2C_GetFlagStatus( I2C_FLAG_RXNOTEMPTY) == RESET);
	tmp = I2C_ReceiveData();													//read byte
	//I2C_AcknowledgeConfig( I2C_ACK_CURR);
	
	return tmp;
}



void I2C_sendarray_reg16(uint8_t reg16_address, uint16_t reg16_register,  uint8_t *data_array, uint8_t datalength)
{
	uint8_t i;
	
	i = 0;
	
	I2C_GenerateSTART(ENABLE);													//startbit
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));						//master-mode?
	
	I2C_Send7bitAddress(reg16_address, I2C_DIRECTION_TX);						//write-address-of reg16
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));		//transmit-mode?
	
	I2C_SendData((uint8_t) (reg16_register & 0xFF00) >> 8);						//reg16 register high
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));					//byte is sent?
	
	I2C_SendData((uint8_t) (reg16_register & 0x00FF));							//reg16 register low
	while(I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET);				//byte is sent?
	
	while (i < datalength)
	{
		I2C_SendData(data_array[i++]);											//send reg16 data byte
		while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));				//byte is sent?
	}
	I2C_GenerateSTOP(ENABLE);													//stopbit
}


void I2C_readarray_reg16(uint8_t reg16_address, uint16_t reg16_register, uint8_t *data_array, uint8_t datalength)
{
	uint8_t i;
	
	i = 0;
	
	I2C_GenerateSTART(ENABLE);													//startbit
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));						//master mode?
		
	I2C_Send7bitAddress(reg16_address, I2C_DIRECTION_TX);						//write-address-of reg16
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));		//transmit-mode?
	
	I2C_SendData((uint8_t) (reg16_register & 0xFF00) >> 8);						//reg16 register high
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));	 				//byte is sent?
	I2C_SendData((uint8_t) (reg16_register & 0x00FF));							//reg16 register low
	while(I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET);				//byte is sent?
		
	I2C_GenerateSTART(ENABLE);													//repeat startbit
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));						//master-mode?
		
	I2C_Send7bitAddress(reg16_address, I2C_DIRECTION_RX);						//read-address
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));			//receiver-mode?
	
	I2C_AcknowledgeConfig(I2C_ACK_CURR);	
	while (i < (datalength - 1))
	{
		while(I2C_GetFlagStatus( I2C_FLAG_RXNOTEMPTY) == RESET);
		data_array[i++] = I2C_ReceiveData();									//read byte
	}
	
	I2C_AcknowledgeConfig(I2C_ACK_NONE);
	I2C_GenerateSTOP(ENABLE);													//stopbit
	while(I2C_GetFlagStatus( I2C_FLAG_RXNOTEMPTY) == RESET);
	data_array[i] = I2C_ReceiveData();											//read last byte
}
