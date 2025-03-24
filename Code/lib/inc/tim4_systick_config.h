#ifndef __TIM4_SYSTICK_CONFIG_H__
#define __TIM4_SYSTICK_CONFIG_H__

#include <stm8s.h>

#define USFACTOR 4

extern volatile uint8_t countflag;
extern volatile uint32_t millis;

void TIM4_SYSTICK_config(void);
void DELAY_ms(uint32_t delay_ms);
void DELAY_us(uint32_t delay_us);

#endif