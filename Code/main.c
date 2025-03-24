#include "main.h"

#define F_CLK 16000000 / 32  // Define the clock frequency (16MHz)

#define N_A6S  (F_CLK / 1865)  // A#6
#define N_A6   (F_CLK / 1760)
#define N_G6   (F_CLK / 1568)
#define N_F6S  (F_CLK / 1480)  // F#6
#define N_F6   (F_CLK / 1397)
#define N_E6   (F_CLK / 1319)
#define N_D6S  (F_CLK / 1245)  // D#6
#define N_D6   (F_CLK / 1175)
#define N_C6S  (F_CLK / 1109)  // C#6
#define N_C6   (F_CLK / 1046)
#define N_B5   (F_CLK / 988)
#define N_A5S  (F_CLK / 932)  // A#5
#define N_A5   (F_CLK / 880)
#define N_G5S  (F_CLK / 831)  // G#5
#define N_G5   (F_CLK / 784)
#define N_F5S  (F_CLK / 740)  // F#5
#define N_F5   (F_CLK / 698)
#define N_E5   (F_CLK / 659)
#define N_D5S  (F_CLK / 622)  // D#5
#define N_D5   (F_CLK / 587)
#define N_C5S  (F_CLK / 554)  // C#5
#define N_C5   (F_CLK / 523)
#define N_B4   (F_CLK / 494)
#define N_A4S  (F_CLK / 466)  // A#4
#define N_A4   (F_CLK / 440)
#define N_G4S  (F_CLK / 415)  // G#4
#define N_G4   (F_CLK / 392)
#define N_F4S  (F_CLK / 370)  // F#4
#define N_F4   (F_CLK / 349)
#define N_E4   (F_CLK / 330)
#define N_D4S  (F_CLK / 311)  // D#4
#define N_D4   (F_CLK / 294)
#define N_0    0

// Note array 
const uint16_t notes[] = {
  (uint16_t) N_D4,  (uint16_t) N_D4,  (uint16_t) N_0,   (uint16_t) N_D4,  (uint16_t) N_F4S, (uint16_t) N_F4S, (uint16_t) N_0,   (uint16_t) N_F4S, (uint16_t) N_G4,  (uint16_t) N_0,   (uint16_t) N_G4,  (uint16_t) N_B4,  (uint16_t) N_0,   (uint16_t) N_B4,  (uint16_t) N_A4,  (uint16_t) N_0,   
  (uint16_t) N_F4S, (uint16_t) N_F4S, (uint16_t) N_0,   (uint16_t) N_F4S, (uint16_t) N_G4,  (uint16_t) N_G4,  (uint16_t) N_0,   (uint16_t) N_G4,  (uint16_t) N_A4,  (uint16_t) N_A4,  (uint16_t) N_0,   (uint16_t) N_B4,  (uint16_t) N_G6,  (uint16_t) N_F6S, (uint16_t) N_A4,  (uint16_t) N_E6,  
  (uint16_t) N_D4,  (uint16_t) N_D4,  (uint16_t) N_F6S, (uint16_t) N_D4,  (uint16_t) N_F4S, (uint16_t) N_F4S, (uint16_t) N_D5,  (uint16_t) N_F4S, (uint16_t) N_G4,  (uint16_t) N_0,   (uint16_t) N_G4,  (uint16_t) N_B4,  (uint16_t) N_G6,  (uint16_t) N_F6S, (uint16_t) N_A4,  (uint16_t) N_E6,  
  (uint16_t) N_D4,  (uint16_t) N_D4,  (uint16_t) N_F6S, (uint16_t) N_D4,  (uint16_t) N_D6,  (uint16_t) N_F4S, (uint16_t) N_E6,  (uint16_t) N_A5,  (uint16_t) N_G4,  (uint16_t) N_0,   (uint16_t) N_G4,  (uint16_t) N_B4,  (uint16_t) N_0,   (uint16_t) N_B4,  (uint16_t) N_A4,  (uint16_t) N_0,   
  (uint16_t) N_E6,  (uint16_t) N_D5,  (uint16_t) N_F6S, (uint16_t) N_G6,  (uint16_t) N_G5,  (uint16_t) N_E6,  (uint16_t) N_E6,  (uint16_t) N_0,   (uint16_t) N_C6S, (uint16_t) N_C5S, (uint16_t) N_D6,  (uint16_t) N_E6,  (uint16_t) N_E5,  (uint16_t) N_A5,  (uint16_t) N_A4,  (uint16_t) N_0,   
  (uint16_t) N_A5,  (uint16_t) N_A5,  (uint16_t) N_A5,  (uint16_t) N_D4,  (uint16_t) N_F4S, (uint16_t) N_F4S, (uint16_t) N_D5,  (uint16_t) N_F4S, (uint16_t) N_G4,  (uint16_t) N_0,   (uint16_t) N_G4,  (uint16_t) N_B4,  (uint16_t) N_G6,  (uint16_t) N_F6S, (uint16_t) N_A4,  (uint16_t) N_E6,  
  (uint16_t) N_D4,  (uint16_t) N_D4,  (uint16_t) N_F6S, (uint16_t) N_D4,  (uint16_t) N_F4S, (uint16_t) N_F4S, (uint16_t) N_D5,  (uint16_t) N_F4S, (uint16_t) N_G4,  (uint16_t) N_0,   (uint16_t) N_G4,  (uint16_t) N_B4,  (uint16_t) N_G6,  (uint16_t) N_F6S, (uint16_t) N_A4,  (uint16_t) N_E6,  
  (uint16_t) N_D4,  (uint16_t) N_D4,  (uint16_t) N_F6S, (uint16_t) N_D4,  (uint16_t) N_D6,  (uint16_t) N_F4S, (uint16_t) N_E6,  (uint16_t) N_A5,  (uint16_t) N_G4,  (uint16_t) N_0,   (uint16_t) N_G4,  (uint16_t) N_B4,  (uint16_t) N_0,   (uint16_t) N_B4,  (uint16_t) N_A4,  (uint16_t) N_0,   
  (uint16_t) N_E6,  (uint16_t) N_D5,  (uint16_t) N_F6S, (uint16_t) N_G6,  (uint16_t) N_G5,  (uint16_t) N_E6,  (uint16_t) N_E6,  (uint16_t) N_0,   (uint16_t) N_C6S, (uint16_t) N_C5S, (uint16_t) N_D6,  (uint16_t) N_E6,  (uint16_t) N_E5,  (uint16_t) N_A5,  (uint16_t) N_A4,  (uint16_t) N_0,   
  (uint16_t) N_A5S, (uint16_t) N_A5S, (uint16_t) N_A4S, (uint16_t) N_D6,  (uint16_t) N_D6,  (uint16_t) N_D5,  (uint16_t) N_F6,  (uint16_t) N_F6,  (uint16_t) N_F6,  (uint16_t) N_0,   (uint16_t) N_A6,  (uint16_t) N_A6S, (uint16_t) N_A6,  (uint16_t) N_F6,  (uint16_t) N_D6,  (uint16_t) N_0,   
  (uint16_t) N_A5S, (uint16_t) N_A5S, (uint16_t) N_E5,  (uint16_t) N_C6S, (uint16_t) N_C6S, (uint16_t) N_C5S, (uint16_t) N_E6,  (uint16_t) N_E6,  (uint16_t) N_E6,  (uint16_t) N_0,   (uint16_t) N_G6,  (uint16_t) N_A6,  (uint16_t) N_G6,  (uint16_t) N_E6,  (uint16_t) N_C6S, (uint16_t) N_0
};

volatile uint8_t current_note = 0;

INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
{
	GPIO_WriteReverse(GPIOC, GPIO_PIN_7);		// toggle buzzer state
	TIM1->SR1 &= (uint8_t) ~TIM1_SR1_UIF;		// clear interrupt flag
}

 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
{
	if (notes[current_note] == 0) {
			TIM1_Cmd(DISABLE);  // stop TIM1 if the note is 0
	} else {
			TIM1_SetAutoreload(notes[current_note]);
			TIM1_Cmd(ENABLE);   // start TIM1
	}
	current_note = (current_note + 1) % 176;
	TIM2->SR1 &= (uint8_t) ~TIM2_SR1_UIF;		// clear interrupt flag
}

int main(void)
{
	disableInterrupts(); // disable interrupts temporarily
	GPIO_DeInit(GPIOC); // deinitialize port C
  
	GPIO_Init (GPIOC, GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_SLOW); //Declare PC7 as a default low push-pull output pin
	
	TIM1_TimeBaseInit(1, TIM1_COUNTERMODE_UP, notes[0], 0);
	TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);
	TIM1->CR1 |= TIM1_CR1_ARPE; // enable shadow register for period
	TIM1_Cmd(ENABLE);
	
	TIM2_TimeBaseInit(TIM2_PRESCALER_256, ((uint16_t) (F_CLK / 512)));
	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
	TIM2_Cmd(ENABLE);

	enableInterrupts(); // re-enable interrupts
		
  while (1)
  {
		// do nothing
  }
}