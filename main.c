#include "main.h"

#define EEPROM_STARTUP_DELAY_ADDR   ((uint32_t) FLASH_DATA_START_PHYSICAL_ADDRESS)

#define N_A6S  268  // A#6
#define N_A6   284  // A6
#define N_G6   318  // G6
#define N_F6S  337  // F#6
#define N_F6   357  // F6
#define N_E6   379  // E6
#define N_D6S  401  // D#6
#define N_D6   425  // D6
#define N_C6S  450  // C#6
#define N_C6   478  // C6
#define N_B5   506  // B5
#define N_A5S  536  // A#5
#define N_A5   568  // A5
#define N_G5S  601  // G#5
#define N_G5   637  // G5
#define N_F5S  675  // F#5
#define N_F5   716  // F5
#define N_E5   758  // E5
#define N_D5S  803  // D#5
#define N_D5   851  // D5
#define N_C5S  902  // C#5
#define N_C5   956  // C5
#define N_B4   1012 // B4
#define N_A4S  1072 // A#4
#define N_A4   1136 // A4
#define N_G4S  1204 // G#4
#define N_G4   1275 // G4
#define N_F4S  1351 // F#4
#define N_F4   1432 // F4
#define N_E4   1515 // E4
#define N_D4S  1607 // D#4
#define N_D4   1700 // D4
#define N_0    0    // Silence

// Note array 
const uint16_t notes[] = {
  N_D4,  N_D4,  N_0,   N_D4,  N_F4S, N_F4S, N_0,   N_F4S, N_G4,  N_0,   N_G4,  N_B4,  N_0,   N_B4,  N_A4,  N_0,   
  N_F4S, N_F4S, N_0,   N_F4S, N_G4,  N_G4,  N_0,   N_G4,  N_A4,  N_A4,  N_0,   N_B4,  N_G6,  N_F6S, N_A4,  N_E6,  
  N_D4,  N_D4,  N_F6S, N_D4,  N_F4S, N_F4S, N_D5,  N_F4S, N_G4,  N_0,   N_G4,  N_B4,  N_G6,  N_F6S, N_A4,  N_E6,  
  N_D4,  N_D4,  N_F6S, N_D4,  N_D6,  N_F4S, N_E6,  N_A5,  N_G4,  N_0,   N_G4,  N_B4,  N_0,   N_B4,  N_A4,  N_0,   
  N_E6,  N_D5,  N_F6S, N_G6,  N_G5,  N_E6,  N_E6,  N_0,   N_C6S, N_C5S, N_D6,  N_E6,  N_E5,  N_A5,  N_A4,  N_0,   
  N_A5,  N_A5,  N_A5,  N_D4,  N_F4S, N_F4S, N_D5,  N_F4S, N_G4,  N_0,   N_G4,  N_B4,  N_G6,  N_F6S, N_A4,  N_E6,  
  N_D4,  N_D4,  N_F6S, N_D4,  N_F4S, N_F4S, N_D5,  N_F4S, N_G4,  N_0,   N_G4,  N_B4,  N_G6,  N_F6S, N_A4,  N_E6,  
  N_D4,  N_D4,  N_F6S, N_D4,  N_D6,  N_F4S, N_E6,  N_A5,  N_G4,  N_0,   N_G4,  N_B4,  N_0,   N_B4,  N_A4,  N_0,   
  N_E6,  N_D5,  N_F6S, N_G6,  N_G5,  N_E6,  N_E6,  N_0,   N_C6S, N_C5S, N_D6,  N_E6,  N_E5,  N_A5,  N_A4,  N_0,   
  N_A5S, N_A5S, N_A4S, N_D6,  N_D6,  N_D5,  N_F6,  N_F6,  N_F6,  N_0,   N_A6,  N_A6S, N_A6,  N_F6,  N_D6,  N_0,   
  N_A5S, N_A5S, N_E5,  N_C6S, N_C6S, N_C5S, N_E6,  N_E6,  N_E6,  N_0,   N_G6,  N_A6,  N_G6,  N_E6,  N_C6S, N_0
};

volatile uint8_t current_note = 0;
volatile uint32_t startup_delay = 0;

/* Automatic wakeup unit interrupt */
INTERRUPT_HANDLER(AWU_IRQHandler, 1)
{
	if (AWU->CSR & AWU_CSR_AWUF);		// Reset flag by reading it
}

/* Timer 1 interrupt */
INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
{
	GPIO_WriteReverse(GPIOC, GPIO_PIN_7);		// Toggle buzzer state
	TIM1->SR1 &= (uint8_t) ~TIM1_SR1_UIF;		// Clear interrupt flag
}

/* Timer 2 interrupt */
INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
{
	if (notes[current_note] == 0) {
		TIM1_Cmd(DISABLE);  // Stop TIM1 if the note is 0
	} else {
		TIM1_SetAutoreload(notes[current_note]);
		TIM1_Cmd(ENABLE);   // Start TIM1
	}
	current_note = (uint8_t) ((current_note + 1) % 176);
	TIM2->SR1 &= (uint8_t) ~TIM2_SR1_UIF;		// Clear interrupt flag
}

int main(void)
{
	/* Initialize GPIO */
	GPIO_DeInit(GPIOC);
	GPIO_Init (GPIOC, GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_SLOW); // Declare PC7 as a default low push-pull output pin
	
	/* Initialize clocks & AWU */
	CLK_HSECmd(DISABLE);											// Disable HSE
	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV8);	// HSI clock division 16MHz/8 = 2MHz
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);	// CPU clock division
	CLK_FastHaltWakeUpCmd(ENABLE);						// Set HSI as clock to use after HALT
	AWU_Init(AWU_TIMEBASE_30S);								// Initialize automatic wakeup unit to 30s
	
	/* Initialize timers */
	disableInterrupts();
	TIM1_TimeBaseInit(1, TIM1_COUNTERMODE_UP, notes[0], 0);
	TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);
	TIM1->CR1 |= TIM1_CR1_ARPE; // Enable shadow register for period
	TIM1_Cmd(ENABLE);
	TIM2_TimeBaseInit(TIM2_PRESCALER_16384, 15);
	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
	TIM2_Cmd(ENABLE);
	enableInterrupts();
	
	/* Verify system is running */
	while (current_note < 17) { // Play first few notes then disable timers
		__asm("WFI");
	}
	TIM1_Cmd(DISABLE);
	TIM2_Cmd(DISABLE);
	GPIO_DeInit(GPIOC);
	
	/* One-time startup delay */
	FLASH_Unlock(FLASH_MEMTYPE_DATA);																		// Unlock EEPROM
  startup_delay = *((volatile uint32_t*)EEPROM_STARTUP_DELAY_ADDR);		// Read startup_delay from EEPROM
	AWU_Cmd(ENABLE); 								// Enable automatic wakeup unit
	while (startup_delay < 1440) {	// 12*3600s/30s = 1440 30s AWU periods
	__asm("HALT"); 									// Enter low-power mode until automatic wakeup occurs
	startup_delay++;								// Increase period counter
	FLASH_ProgramWord(EEPROM_STARTUP_DELAY_ADDR, startup_delay);	// Write period counter to non-volitile memory
	}
	
	/* Disable stuff to save power */
	AWU_Cmd(DISABLE);																			// Disable automatic wakeup unit
	AWU_DeInit();																					// De-initialize automatic wakeup unit
	CLK_LSICmd(DISABLE);																	// Disable LSI
	CLK->PCKENR1 = CLK_PCKENR1_TIM1 | CLK_PCKENR1_TIM2;		// Enable only TIM1 and TIM2
	CLK->PCKENR2 = 0x00; 																	// Disable other peripherals
	
	/* Initialize GPIO again */
	GPIO_Init (GPIOC, GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_SLOW); // Declare PC7 as a default low push-pull output pin
	
	/* Initialize timers again */
	disableInterrupts();
	TIM1_TimeBaseInit(1, TIM1_COUNTERMODE_UP, notes[17], 0);
	TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);
	TIM1->CR1 |= TIM1_CR1_ARPE; // Enable shadow register for period
	TIM1_Cmd(ENABLE);
	TIM2_TimeBaseInit(TIM2_PRESCALER_16384, 15);
	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
	TIM2_Cmd(ENABLE);
	enableInterrupts();
	
	/* Begin playback */
	current_note = 17;
  while (1) {
		__asm("WFI"); // Enter low-power mode until an interrupt occurs
  }
}