//important! check CKAWUSEL option bit

#include "beep_config.h"

void BEEP_Config(void)
{
	CLK->PCKENR2 = CLK_PCKENR2_AWU;						//enable AWU- and BEEP-clock
	BEEP->CSR = 0x00;									//reset BEEP register
	BEEP->CSR |= 0x17;									//BEEPdiv = 25 	(250/25= 10000 Hz)
	BEEP->CSR |= (uint8_t) (0x00 << 6);					//BEEPsel = 8	(10000/8= 1250 Hz)
}

void BEEP_On(void)
{
	BEEP->CSR |= (uint8_t) (0x01 << 5);//BEEP enable
}

void BEEP_Off(void)
{
	BEEP->CSR &= (uint8_t) ~(0x01 << 5);			//BEEP disable
}