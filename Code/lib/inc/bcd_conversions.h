#ifndef __BCD_CONVERSIONS_H__
#define __BCD_CONVERSIONS_H__

#include <stm8s.h>

//function converting binary_code_decimals to decimals
uint8_t BCD2DEC(uint8_t bcd);

//function converting decimals to binary_code_decimals
uint8_t DEC2BCD(uint8_t dec);



#endif