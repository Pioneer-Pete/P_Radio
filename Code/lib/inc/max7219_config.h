#ifndef __MAX7219_CONFIG_H__
#define __MAX7219_CONFIG_H__

#include <stm8s.h>
#include "spi_config.h"
#include "tim4_systick_config.h"


void MAX7219_config(void);
void MAX7219_shownumber(uint32_t number, uint8_t decimal_point);
void MAX7219_brightness(uint8_t brightness);

#endif
