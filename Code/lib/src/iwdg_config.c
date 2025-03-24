#include "iwdg_config.h"

//these are example settings
//the Independent Watchdog uses the LSI divided by 2 --> 64 kHz
//to reload the timer call IWDG_ReloadCounter();

void IWDG_config(void)
{
	IWDG_Enable();
	IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
	IWDG_SetPrescaler(IWDG_Prescaler_256);					//64kHz / 256 = 250Hz
	IWDG_SetReload(255);									//250 Hz / 256 --> 1.024 seconds
	IWDG_WriteAccessCmd(IWDG_WriteAccess_Disable);
}

