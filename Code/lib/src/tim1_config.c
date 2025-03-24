#include "tim1_config.h"


void TIM1_config(void)
{
	TIM1_DeInit(); 

	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);	//16 MHz
	
	TIM1_TimeBaseInit(159, TIM1_COUNTERMODE_UP, 9999, 0);		//16 MHz / 160 / 10000 = 10 Hz
	TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);						//enable interrupt on overflow
	
	TIM1_Cmd(ENABLE);
}