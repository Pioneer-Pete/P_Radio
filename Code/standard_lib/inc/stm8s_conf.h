#ifndef __STM8S_CONF_H
#define __STM8S_CONF_H

#include "stm8s.h"

#if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) ||\
    defined(STM8S001) || defined(STM8S903) || defined (STM8AF626x)
#include "stm8s_adc1.h" 
#endif

#if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined (STM8AF52Ax) ||\
    defined (STM8AF62Ax)
 #include "stm8s_adc2.h"
#endif

#include "stm8s_awu.h"
#include "stm8s_beep.h"

#if defined (STM8S208) || defined (STM8AF52Ax)
 #include "stm8s_can.h"
#endif

#include "stm8s_clk.h"
#include "stm8s_exti.h"
#include "stm8s_flash.h"
#include "stm8s_gpio.h"
#include "stm8s_i2c.h"
#include "stm8s_itc.h"
#include "stm8s_iwdg.h"
#include "stm8s_rst.h"
#include "stm8s_spi.h"
#include "stm8s_tim1.h"

				/* if NOT defined STM8S903 */
#ifndef STM8S903
 #include "stm8s_tim2.h"
#endif 

#if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) ||defined(STM8S105) ||\
    defined(STM8S005) ||  defined (STM8AF52Ax) || defined (STM8AF62Ax) || defined (STM8AF626x)
 #include "stm8s_tim3.h"
#endif

#ifndef STM8S903
 #include "stm8s_tim4.h"
#endif

#ifdef STM8S903
 #include "stm8s_tim5.h"
 #include "stm8s_tim6.h"
#endif

#if defined(STM8S208) ||defined(STM8S207) || defined(STM8S007) ||defined(STM8S103) ||\
    defined(STM8S003) ||defined(STM8S001) || defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 #include "stm8s_uart1.h"
#endif

#if defined(STM8S105) || defined(STM8S005) ||  defined (STM8AF626x)
 #include "stm8s_uart2.h"
#endif

#if defined(STM8S208) ||defined(STM8S207) || defined(STM8S007) || defined (STM8AF52Ax) ||\
    defined (STM8AF62Ax)
 #include "stm8s_uart3.h"
#endif

#include "stm8s_wwdg.h"




#ifdef  USE_FULL_ASSERT


#define assert_param(expr) ((expr) ? (void)0 : assert_failed((uint8_t *)__FILE__, __LINE__))

void assert_failed(uint8_t* file, uint32_t line);
#else
#define assert_param(expr) ((void)0)
#endif

#endif
