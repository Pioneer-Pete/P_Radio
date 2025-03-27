#ifndef __MAIN_H
#define __MAIN_H

#define USE_STDPERIPH_DRIVER		//self-explanatory

#include <stm8s.h>
#include <stdio.h>					//in C:\Program Files (x86)\COSMIC\FSE_Compilers\CXSTM8\Hstm8

#include "hsi16_config.h"			//config for peripherals
#include "gpio_config.h"
#include "tim4_systick_config.h"
#include "uart1_config.h"

#endif

#ifdef USE_FULL_ASSERT

	void assert_failed(uint8_t* file, uint32_t line)
	{
		return(0);
	}
#endif