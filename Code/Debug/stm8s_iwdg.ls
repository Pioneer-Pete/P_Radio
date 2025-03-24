   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  79                     ; 48 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  79                     ; 49 {
  81                     .text:	section	.text,new
  82  0000               _IWDG_WriteAccessCmd:
  86                     ; 51   assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));
  88                     ; 53   IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
  90  0000 c750e0        	ld	20704,a
  91                     ; 54 }
  94  0003 81            	ret
 184                     ; 63 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 184                     ; 64 {
 185                     .text:	section	.text,new
 186  0000               _IWDG_SetPrescaler:
 190                     ; 66   assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));
 192                     ; 68   IWDG->PR = (uint8_t)IWDG_Prescaler;
 194  0000 c750e1        	ld	20705,a
 195                     ; 69 }
 198  0003 81            	ret
 232                     ; 78 void IWDG_SetReload(uint8_t IWDG_Reload)
 232                     ; 79 {
 233                     .text:	section	.text,new
 234  0000               _IWDG_SetReload:
 238                     ; 80   IWDG->RLR = IWDG_Reload;
 240  0000 c750e2        	ld	20706,a
 241                     ; 81 }
 244  0003 81            	ret
 267                     ; 89 void IWDG_ReloadCounter(void)
 267                     ; 90 {
 268                     .text:	section	.text,new
 269  0000               _IWDG_ReloadCounter:
 273                     ; 91   IWDG->KR = IWDG_KEY_REFRESH;
 275  0000 35aa50e0      	mov	20704,#170
 276                     ; 92 }
 279  0004 81            	ret
 302                     ; 99 void IWDG_Enable(void)
 302                     ; 100 {
 303                     .text:	section	.text,new
 304  0000               _IWDG_Enable:
 308                     ; 101   IWDG->KR = IWDG_KEY_ENABLE;
 310  0000 35cc50e0      	mov	20704,#204
 311                     ; 102 }
 314  0004 81            	ret
 327                     	xdef	_IWDG_Enable
 328                     	xdef	_IWDG_ReloadCounter
 329                     	xdef	_IWDG_SetReload
 330                     	xdef	_IWDG_SetPrescaler
 331                     	xdef	_IWDG_WriteAccessCmd
 350                     	end
