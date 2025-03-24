#include "tim4_systick_config.h"

//at 16 MHz cpu clock it produces a systick of 1 kHz (1 ms)
//it needs the TIM4 interrupt routine

volatile uint8_t countflag;
volatile uint32_t millis;


void TIM4_SYSTICK_config(void)
{
	TIM4_DeInit(); 
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
	TIM4_TimeBaseInit(TIM2_PRESCALER_128, 124);		//16 MHz / 128 / 125 = 1000 Hz
	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);			//interrupt on overflow
	TIM4_Cmd(ENABLE);
}

void DELAY_ms(uint32_t delay_ms)					//function that waits for "delay_ms" milliseconds
{
	while (delay_ms)
	{
		if (countflag)								//countflag is set every ms
		{
			countflag = 0;
			delay_ms--;
		}
	}
}

void DELAY_us(uint32_t delay_us)					//function that waits for approx "delay_us" microseconds
{
	volatile uint32_t microseconds;
	microseconds = delay_us / USFACTOR;
	while (microseconds-- > 0);
}