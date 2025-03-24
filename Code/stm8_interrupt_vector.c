#include "stm8s_it.h"


typedef void @far (*interrupt_handler_t)(void);


struct interrupt_vector {
	u8 interrupt_instruction;
	interrupt_handler_t interrupt_handler;
};


struct interrupt_vector const _vectab[] = {
	{0x82, (interrupt_handler_t)_stext}, /* RESET */
	{0x82, (interrupt_handler_t)TRAP_IRQHandler},
	{0x82, (interrupt_handler_t)TLI_IRQHandler},
	{0x82, (interrupt_handler_t)AWU_IRQHandler},
	{0x82, (interrupt_handler_t)CLK_IRQHandler},
	{0x82, (interrupt_handler_t)EXTI_PORTA_IRQHandler},
	{0x82, (interrupt_handler_t)EXTI_PORTB_IRQHandler},
	{0x82, (interrupt_handler_t)EXTI_PORTC_IRQHandler},
	{0x82, (interrupt_handler_t)EXTI_PORTD_IRQHandler},
	{0x82, (interrupt_handler_t)EXTI_PORTE_IRQHandler},
	
	
#if defined(STM8S208) || defined(STM8AF52Ax)
	{0x82, (interrupt_handler_t)CAN_RX_IRQHandler},
	{0x82, (interrupt_handler_t)CAN_TX_IRQHandler},
#elif defined(STM8S903) || defined(STM8AF622x)
	{0x82, (interrupt_handler_t)EXTI_PORTF_IRQHandler},
	{0x82, (interrupt_handler_t)NonHandledInterrupt},
#else
	{0x82, (interrupt_handler_t)NonHandledInterrupt},
	{0x82, (interrupt_handler_t)NonHandledInterrupt},
#endif
	{0x82, (interrupt_handler_t)SPI_IRQHandler},
	{0x82, (interrupt_handler_t)TIM1_UPD_OVF_TRG_BRK_IRQHandler},
	{0x82, (interrupt_handler_t)TIM1_CAP_COM_IRQHandler},
 
 
#if defined(STM8S903) || defined(STM8AF622x)
	{0x82, (interrupt_handler_t)TIM5_UPD_OVF_BRK_TRG_IRQHandler},
	{0x82, (interrupt_handler_t)TIM5_CAP_COM_IRQHandler},
#else
	{0x82, (interrupt_handler_t)TIM2_UPD_OVF_BRK_IRQHandler},
	{0x82, (interrupt_handler_t)TIM2_CAP_COM_IRQHandler},
#endif


#if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8S105) || \
    defined(STM8S005) ||  defined(STM8AF52Ax) || defined(STM8AF62Ax) || defined(STM8AF626x)
	{0x82, (interrupt_handler_t)TIM3_UPD_OVF_BRK_IRQHandler},
	{0x82, (interrupt_handler_t)TIM3_CAP_COM_IRQHandler},
#else
	{0x82, (interrupt_handler_t)NonHandledInterrupt},
	{0x82, (interrupt_handler_t)NonHandledInterrupt},
#endif
	
	
#if defined(STM8S105) || defined(STM8S005) || defined(STM8AF626x)
	{0x82, (interrupt_handler_t)NonHandledInterrupt},
	{0x82, (interrupt_handler_t)NonHandledInterrupt},
#elif defined (STM8AF622x)
	{0x82, (interrupt_handler_t)UART4_TX_IRQHandler},
	{0x82, (interrupt_handler_t)UART4_RX_IRQHandler},
#else	
	{0x82, (interrupt_handler_t)UART1_TX_IRQHandler},
	{0x82, (interrupt_handler_t)UART1_RX_IRQHandler},
#endif


	{0x82, (interrupt_handler_t)I2C_IRQHandler},


#if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || \
	defined(STM8AF52Ax) || defined(STM8AF62Ax)
	{0x82, (interrupt_handler_t)UART3_TX_IRQHandler},
	{0x82, (interrupt_handler_t)UART3_RX_IRQHandler},
#elif defined(STM8S105) || defined(STM8S005) || defined(STM8AF626x)
	{0x82, (interrupt_handler_t)UART2_TX_IRQHandler},
	{0x82, (interrupt_handler_t)UART2_RX_IRQHandler},
#else
	{0x82, (interrupt_handler_t)NonHandledInterrupt},
	{0x82, (interrupt_handler_t)NonHandledInterrupt},
#endif


#if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || \
	defined(STM8AF52Ax) || defined(STM8AF62Ax)
	{0x82, (interrupt_handler_t)ADC2_IRQHandler},
#else
	{0x82, (interrupt_handler_t)ADC1_IRQHandler},
#endif


#if defined(STM8S903) || defined(STM8AF622x)
	{0x82, (interrupt_handler_t)TIM6_UPD_OVF_TRG_IRQHandler},
#else
	{0x82, (interrupt_handler_t)TIM4_UPD_OVF_IRQHandler},
#endif

	{0x82, (interrupt_handler_t)EEPROM_EEC_IRQHandler},  /* irq24 - FLASH interrupt */
	{0x82, (interrupt_handler_t)NonHandledInterrupt}, /* irq25 - Reserved */
	{0x82, (interrupt_handler_t)NonHandledInterrupt}, /* irq26 - Reserved */
	{0x82, (interrupt_handler_t)NonHandledInterrupt}, /* irq27 - Reserved */
	{0x82, (interrupt_handler_t)NonHandledInterrupt}, /* irq28 - Reserved */
	{0x82, (interrupt_handler_t)NonHandledInterrupt}, /* irq29 - Reserved */

};
