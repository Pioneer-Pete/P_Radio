#ifndef __UART1_CONFIG_H__
#define __UART1_CONFIG_H__

#include <stm8s.h>

extern volatile uint8_t	UART1_rxbuff[];
extern volatile uint8_t	UART1_txbuff[];
extern volatile uint8_t	UART1_rxhead;
extern volatile uint8_t	UART1_rxtail;
extern volatile uint8_t	UART1_txhead;
extern volatile uint8_t	UART1_txtail;
extern volatile uint16_t UART1_rxerror;

extern const uint8_t UART1_rxbuff_size;
extern const uint8_t UART1_txbuff_size;
extern const uint8_t UART1_rxbuff_mask;
extern const uint8_t UART1_txbuff_mask;

void UART1_config(uint32_t baudrate);
uint16_t UART1_getc(void);
void UART1_putc(uint8_t);
void UART1_puts(char *s);
uint16_t UART1_available(void);
void UART1_flush(void);


#endif