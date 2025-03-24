#ifndef __SPI_CONFIG_H__
#define __SPI_CONFIG_H__

#include <stm8s.h>

#define SPI_CE_PORT GPIOA
#define SPI_CE_PIN GPIO_PIN_3

void SPI_config(void);
void SPI_send_byte(uint8_t data);
void SPI_sendword(uint16_t data);
uint16_t SPI_read_byte(void);


#endif