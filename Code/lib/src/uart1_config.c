#include "uart1_config.h"

//these are example settings, set the buffer sizes to a sensible value


#define UART1_RXBUFF_SIZE 64            //max 256
#define UART1_TXBUFF_SIZE 64            //max 256

#define UART1_RXBUFF_MASK	(UART1_RXBUFF_SIZE - 1)
#define UART1_TXBUFF_MASK	(UART1_TXBUFF_SIZE - 1)

#if (UART1_RXBUFF_SIZE & UART1_RXBUFF_MASK)
#error RX BUFFER SIZE is not a power of 2
#endif
#if (UART1_TXBUFF_SIZE & UART1_TX_BUFF_MASK)
#error UART1 TXBUFF SIZE is not a power of 2
#endif

volatile uint8_t UART1_rxbuff[UART1_RXBUFF_SIZE];
volatile uint8_t UART1_txbuff[UART1_RXBUFF_SIZE];
volatile uint8_t UART1_rxhead = 0;
volatile uint8_t UART1_rxtail = 0;
volatile uint8_t UART1_txhead = 0;
volatile uint8_t UART1_txtail = 0;
volatile uint16_t UART1_rxerror = 0;

const uint8_t UART1_rxbuff_size = UART1_RXBUFF_SIZE;
const uint8_t UART1_txbuff_size = UART1_TXBUFF_SIZE;
const uint8_t UART1_rxbuff_mask = UART1_RXBUFF_MASK;
const uint8_t UART1_txbuff_mask = UART1_TXBUFF_MASK;




void UART1_config(uint32_t baudrate)
{
	GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);		//uart1_tx
	GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);			//uart1_rx
	
	
	UART1_DeInit(); 
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
	UART1_Init(baudrate, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO, 
		UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
	UART1_Cmd(ENABLE);
}


uint16_t UART1_getc(void)
{
	uint8_t tmp;
	uint16_t data;

	if (UART1_rxhead == UART1_rxtail) return(0); //no data available

	tmp = (uint8_t) ((UART1_rxtail + 1) & UART1_rxbuff_mask);
	UART1_rxtail = tmp;
	
	data = (uint16_t) ((UART1_rxerror << 8) | UART1_rxbuff[tmp]);
	return(data);
}


void UART1_putc(uint8_t data)
{
	uint8_t tmp;
	
	tmp = (uint8_t) ((UART1_txhead + 1) & UART1_txbuff_mask);
	while (tmp == UART1_txtail) {}                  //wait for free space in tx buffer
	UART1_txbuff[tmp] = data;
	UART1_txhead = tmp;
	UART1->CR2 |= (uint8_t) UART1_CR2_TIEN;			//enable TXE-irq
}


void UART1_puts(char *s)
{
	while (*s) UART1_putc(*s++);
}


uint16_t UART1_available(void)
{
	return (uint16_t) ((UART1_rxerror << 8) | ((UART1_rxbuff_mask + UART1_rxhead - UART1_rxtail)
		% UART1_rxbuff_mask));
}


void UART1_flush(void)
{
	UART1_rxhead = UART1_rxtail;
}