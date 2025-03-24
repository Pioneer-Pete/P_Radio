#include "spi_config.h"


void SPI_config(void)
{
	GPIO_Init(SPI_CE_PORT, SPI_CE_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);	//spi_nss (ce)
	
	GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);		//spi_sck
	GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_HIGH_FAST);		//spi_mosi
	GPIO_Init(GPIOC, GPIO_PIN_7, GPIO_MODE_IN_PU_NO_IT);			//spi_miso
	
	
	
	SPI_DeInit(); 
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
	SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_2, SPI_MODE_MASTER, 
		SPI_CLOCKPOLARITY_HIGH, SPI_CLOCKPHASE_1EDGE, SPI_DATADIRECTION_1LINE_TX, 
		SPI_NSS_SOFT, 0x00);

	SPI_Cmd(ENABLE);
	
	GPIO_WriteHigh(SPI_CE_PORT, SPI_CE_PIN);			//PA3 used for NSS (CE)
}


void SPI_send_byte(uint8_t data)
{
	GPIO_WriteLow(SPI_CE_PORT, SPI_CE_PIN);
	
	while(!SPI_GetFlagStatus(SPI_FLAG_TXE));
	SPI_SendData(data);
	while(SPI_GetFlagStatus(SPI_FLAG_BSY));
	
	GPIO_WriteHigh(SPI_CE_PORT, SPI_CE_PIN);
}


void SPI_sendword(uint16_t data)
{
	GPIO_WriteLow(SPI_CE_PORT, SPI_CE_PIN);
	
	while(!SPI_GetFlagStatus(SPI_FLAG_TXE));
	SPI_SendData((uint8_t) (data >> 8));
	while(!SPI_GetFlagStatus(SPI_FLAG_TXE));
	SPI_SendData((uint8_t) (data & 0x00FF));
	while(SPI_GetFlagStatus(SPI_FLAG_BSY));
	
	GPIO_WriteHigh(SPI_CE_PORT, SPI_CE_PIN);
}

uint16_t SPI_read_byte(void)
{
	uint16_t data = 0xFF00;						//FF00 --> no data
	
	if (SPI_GetFlagStatus(SPI_FLAG_RXNE))
	{
		GPIO_WriteLow(SPI_CE_PORT, SPI_CE_PIN);
		data = 0x0000 | SPI_ReceiveData();
		GPIO_WriteHigh(SPI_CE_PORT, SPI_CE_PIN);
	}
	return data;								//00xx --> xx = received data
}