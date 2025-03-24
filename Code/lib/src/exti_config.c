#include "exti_config.h"

//these are example settings

void EXTI_config(void)
{
	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_PU_IT);						//enable exti on PD3

	EXTI_DeInit();
    EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_FALL_ONLY);	//interrupt on falling edge
    //EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
}