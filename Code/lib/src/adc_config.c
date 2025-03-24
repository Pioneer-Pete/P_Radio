#include "adc_config.h"

//these are example settings

void ADC_config(void)
{
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
	
	//floating input
	GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT);
	
	ADC1_DeInit(); 
	
	//single conversion, channel 3, cpu_clock/18
	//external trigger: trgo_tim1 enabled
	//right alligned
	//schmitt_trigger channel 3 disabled
	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D18, 
		ADC1_EXTTRIG_TIM, ENABLE, 
		ADC1_ALIGN_RIGHT, 
		ADC1_SCHMITTTRIG_CHANNEL3, DISABLE);
	
	//generate interrupt on end_of_conversion
	ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
	
	ADC1_Cmd(ENABLE);
}