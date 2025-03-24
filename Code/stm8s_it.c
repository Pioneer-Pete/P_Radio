#include "stm8s_it.h"

#ifdef _COSMIC_

INTERRUPT_HANDLER(NonHandledInterrupt, 25)
{

}
#endif


INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
{

}


INTERRUPT_HANDLER(TLI_IRQHandler, 0)

{

}


INTERRUPT_HANDLER(AWU_IRQHandler, 1)
{
	/*
	if (AWU->CSR & AWU_CSR_AWUF);				//wakeup occured (flag is reset by reading it)
	*/
}


INTERRUPT_HANDLER(CLK_IRQHandler, 2)
{

}


INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
{

}


INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
{

}


INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
{

}


INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
{

}


INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
{

}

#if defined (STM8S903) || defined (STM8AF622x) 

 INTERRUPT_HANDLER(EXTI_PORTF_IRQHandler, 8)
 {

 }
#endif

#if defined (STM8S208) || defined (STM8AF52Ax)

 INTERRUPT_HANDLER(CAN_RX_IRQHandler, 8)
 {

 }


 INTERRUPT_HANDLER(CAN_TX_IRQHandler, 9)
 {

 }
#endif


INTERRUPT_HANDLER(SPI_IRQHandler, 10)
{

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//tim1 interrupt was here

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
{

}

#if defined (STM8S903) || defined (STM8AF622x)

 INTERRUPT_HANDLER(TIM5_UPD_OVF_BRK_TRG_IRQHandler, 13)
 {

 }
 

 INTERRUPT_HANDLER(TIM5_CAP_COM_IRQHandler, 14)
 {

 }

#else

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//tim2 interrupt was here

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

 INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 {

 }
#endif

#if defined (STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8S105) || \
    defined(STM8S005) ||  defined (STM8AF62Ax) || defined (STM8AF52Ax) || defined (STM8AF626x)

 INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 {

 }


 INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 {

 }
#endif







#if defined (STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8S103) || \
    defined (STM8S003) || defined(STM8S001) || defined (STM8AF62Ax) || defined (STM8AF52Ax) || defined (STM8S903)

INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
{
	
	uint8_t tmp;
	
	if (UART1->SR & UART1_SR_TXE)
	{
		if (UART1_txhead == UART1_txtail)
		{
			UART1->CR2 &= (uint8_t) ~UART1_CR2_TIEN;//disable TXE-irq: tx buffer empty
		}
		else
		{
			tmp = (uint8_t) ((UART1_txtail + 1) & UART1_txbuff_mask);
			UART1_txtail = tmp;
			UART1->DR = UART1_txbuff[tmp];			//send next byte from tx buffer
		}
	}
	
}



 INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 {
	
	uint8_t tmp;
	uint8_t data;
	 
	if (UART1->SR & UART1_SR_RXNE)
	{
		UART1_rxerror = 0;
		data = (uint8_t) UART1->DR;
		tmp = (uint8_t) ((UART1_rxhead + 1) & UART1_rxbuff_mask);
		
		if (tmp == UART1_rxtail)					//buffer full!
		{
			UART1_rxerror = 1;
		}
		else
		{
			UART1_rxbuff[tmp] = data;
			UART1_rxhead = tmp;
		}
	}
	
 }
#endif











#if defined(STM8AF622x)

 INTERRUPT_HANDLER(UART4_TX_IRQHandler, 17)
 {

 }


 INTERRUPT_HANDLER(UART4_RX_IRQHandler, 18)
 {

 }
#endif


INTERRUPT_HANDLER(I2C_IRQHandler, 19)
{

}

#if defined(STM8S105) || defined(STM8S005) ||  defined (STM8AF626x)

 INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 {

 }


 INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
 {

 }
#endif

#if defined(STM8S207) || defined(STM8S007) || defined(STM8S208) || defined (STM8AF52Ax) || defined (STM8AF62Ax)

 INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
 {

 }


 INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
 {

 }
#endif

#if defined(STM8S207) || defined(STM8S007) || defined(STM8S208) || defined (STM8AF52Ax) || defined (STM8AF62Ax)

 INTERRUPT_HANDLER(ADC2_IRQHandler, 22)
 {

 }
#else

 INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 {
	 /*
	uint16_t temph = 0;
	uint8_t templ = 0;
	uint8_t i = 0;
	
	if (ADC1->CSR & ADC1_CSR_EOC)
	{
		ADC1->CSR &= (uint8_t) ~ADC1_CSR_EOC;			//this also erases the channel number 
		ADC1->CSR |= (uint8_t) (ADC1_nr_of_channels - 1);//so must be rewritten (RM0016 pag.428) 

		for (i = 2; i < (ADC1_nr_of_channels); i++)		//ch0 and ch1 do not exist on stm8f003f3
		{
			templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(i << 1) + 1);
			temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(i << 1));
			ADC1_result[i] = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
		}
		ADC1_conv_ready = 1;
	}
	*/
 }
#endif

#if defined (STM8S903) || defined (STM8AF622x)

INTERRUPT_HANDLER(TIM6_UPD_OVF_TRG_IRQHandler, 23)
 {

 }

#else

 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 {
	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
	millis++;
	countflag = 1;																	//every ms set to 1
 }

#endif


INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
{

}
