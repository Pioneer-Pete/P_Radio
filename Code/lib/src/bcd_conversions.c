#include "bcd_conversions.h"


uint8_t BCD2DEC(uint8_t bcd)
{
	return (uint8_t) ((uint8_t) (bcd & 0xF) + ((uint8_t) (bcd >> 4) * 10));
}

uint8_t DEC2BCD(uint8_t dec) 
{
	return (uint8_t) ((uint8_t) (dec % 10) | ((uint8_t) (dec / 10) << 4));
}
