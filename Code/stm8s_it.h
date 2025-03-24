#ifndef __STM8S_IT_H
#define __STM8S_IT_H

#include "main.h"


#ifdef _COSMIC_
 void _stext(void); /* RESET startup routine */
 INTERRUPT void NonHandledInterrupt(void);
#endif




#ifndef _RAISONANCE_
 INTERRUPT void TRAP_IRQHandler(void);
 INTERRUPT void TLI_IRQHandler(void);
 INTERRUPT void AWU_IRQHandler(void);
 INTERRUPT void CLK_IRQHandler(void);
 INTERRUPT void EXTI_PORTA_IRQHandler(void);
 INTERRUPT void EXTI_PORTB_IRQHandler(void);
 INTERRUPT void EXTI_PORTC_IRQHandler(void);
 INTERRUPT void EXTI_PORTD_IRQHandler(void);
 INTERRUPT void EXTI_PORTE_IRQHandler(void);
 INTERRUPT void SPI_IRQHandler(void);
 INTERRUPT void TIM1_CAP_COM_IRQHandler(void);
 INTERRUPT void TIM1_UPD_OVF_TRG_BRK_IRQHandler(void);
 INTERRUPT void I2C_IRQHandler(void);

#if defined(STM8S903) || defined(STM8AF622x)
 INTERRUPT void EXTI_PORTF_IRQHandler(void);
#endif


#if defined (STM8S208) || defined (STM8AF52Ax)
 INTERRUPT void CAN_RX_IRQHandler(void);
 INTERRUPT void CAN_TX_IRQHandler(void);
#endif


#if defined(STM8S903) || defined(STM8AF622x)
 INTERRUPT void TIM5_UPD_OVF_BRK_TRG_IRQHandler(void);
 INTERRUPT void TIM5_CAP_COM_IRQHandler(void);
#else
 INTERRUPT void TIM2_UPD_OVF_BRK_IRQHandler(void);
 INTERRUPT void TIM2_CAP_COM_IRQHandler(void);
#endif


#if defined (STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8S105) || \
    defined(STM8S005) ||  defined (STM8AF52Ax) || defined (STM8AF62Ax) || defined (STM8AF626x)
 INTERRUPT void TIM3_UPD_OVF_BRK_IRQHandler(void);
 INTERRUPT void TIM3_CAP_COM_IRQHandler(void);
#endif


#if defined (STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8S103) || \
    defined (STM8S001) || defined(STM8S003) ||  defined (STM8AF52Ax) || defined (STM8AF62Ax) || defined (STM8S903)
 INTERRUPT void UART1_TX_IRQHandler(void);
 INTERRUPT void UART1_RX_IRQHandler(void);
#endif


#if defined (STM8AF622x)
 INTERRUPT void UART4_TX_IRQHandler(void);
 INTERRUPT void UART4_RX_IRQHandler(void);
#endif
 

#if defined(STM8S105) || defined(STM8S005) ||  defined (STM8AF626x)
 INTERRUPT void UART2_RX_IRQHandler(void);
 INTERRUPT void UART2_TX_IRQHandler(void);
#endif 


#if defined(STM8S207) || defined(STM8S007) || defined(STM8S208) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 INTERRUPT void UART3_RX_IRQHandler(void);
 INTERRUPT void UART3_TX_IRQHandler(void);
#endif


#if defined(STM8S207) || defined(STM8S007) || defined(STM8S208) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 INTERRUPT void ADC2_IRQHandler(void);
#else
 INTERRUPT void ADC1_IRQHandler(void);
#endif


#if defined(STM8S903) || defined(STM8AF622x)
 INTERRUPT void TIM6_UPD_OVF_TRG_IRQHandler(void);
#else
 INTERRUPT void TIM4_UPD_OVF_IRQHandler(void);
#endif


 INTERRUPT void EEPROM_EEC_IRQHandler(void);
#endif /* _RAISONANCE_ */

#endif
