#include "max7219_config.h"


void MAX7219_config(void)
{
	DELAY_ms(100);			//MAX7219 needs some time after power on

	SPI_sendword(0x0000);	//nop
	SPI_sendword(0x0C00);	//shutdown
	SPI_sendword(0x0000);	//nop

	SPI_sendword(0x0F00);	//testmode off
	SPI_sendword(0x0C01);	//normal operation
	SPI_sendword(0x09FF);	//bcd code B, all digits
	SPI_sendword(0x0A02);	//brightness
	SPI_sendword(0x0B07);	//all digits

	SPI_sendword(0x0100);	//digit1 = 0
	SPI_sendword(0x0200);	//digit2 = 0
	SPI_sendword(0x0300);	//digit3 = 0
	SPI_sendword(0x0400);	//digit4 = 0
	SPI_sendword(0x0500);	//digit5 = 0
	SPI_sendword(0x0600);	//digit6 = 0
	SPI_sendword(0x0700);	//digit7 = 0
	SPI_sendword(0x0800);	//digit8 = 0

}

void MAX7219_shownumber(uint32_t number, uint8_t decimal_point)
{
	uint32_t tmp;
	uint8_t i;

	tmp = number;
	for (i=1; i<9; i++)
	{
		if (i == decimal_point) SPI_sendword((uint16_t) ((i << 8) | ((tmp % 10) | 0x80)));
		else SPI_sendword((uint16_t) ((i << 8) | (tmp % 10)));

		tmp /= 10;
	}
}

void MAX7219_brightness(uint8_t brightness)
{
	if ((brightness < 1) || (brightness > 15)) brightness = 2;
	SPI_sendword(0x0A00 | brightness);
}
