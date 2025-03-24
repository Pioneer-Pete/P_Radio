   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  64                     ; 53 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  64                     ; 54 {
  66                     .text:	section	.text,new
  67  0000               _WWDG_Init:
  69  0000 89            	pushw	x
  70       00000000      OFST:	set	0
  73                     ; 56   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
  75                     ; 58   WWDG->WR = WWDG_WR_RESET_VALUE;
  77  0001 357f50d2      	mov	20690,#127
  78                     ; 59   WWDG->CR = (uint8_t)((uint8_t)(WWDG_CR_WDGA | WWDG_CR_T6) | (uint8_t)Counter);
  80  0005 9e            	ld	a,xh
  81  0006 aac0          	or	a,#192
  82  0008 c750d1        	ld	20689,a
  83                     ; 60   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
  85  000b 7b02          	ld	a,(OFST+2,sp)
  86  000d aa40          	or	a,#64
  87  000f a47f          	and	a,#127
  88  0011 c750d2        	ld	20690,a
  89                     ; 61 }
  92  0014 85            	popw	x
  93  0015 81            	ret
 127                     ; 69 void WWDG_SetCounter(uint8_t Counter)
 127                     ; 70 {
 128                     .text:	section	.text,new
 129  0000               _WWDG_SetCounter:
 133                     ; 72   assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));
 135                     ; 76   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 137  0000 a47f          	and	a,#127
 138  0002 c750d1        	ld	20689,a
 139                     ; 77 }
 142  0005 81            	ret
 165                     ; 86 uint8_t WWDG_GetCounter(void)
 165                     ; 87 {
 166                     .text:	section	.text,new
 167  0000               _WWDG_GetCounter:
 171                     ; 88   return(WWDG->CR);
 173  0000 c650d1        	ld	a,20689
 176  0003 81            	ret
 199                     ; 96 void WWDG_SWReset(void)
 199                     ; 97 {
 200                     .text:	section	.text,new
 201  0000               _WWDG_SWReset:
 205                     ; 98   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 207  0000 358050d1      	mov	20689,#128
 208                     ; 99 }
 211  0004 81            	ret
 246                     ; 108 void WWDG_SetWindowValue(uint8_t WindowValue)
 246                     ; 109 {
 247                     .text:	section	.text,new
 248  0000               _WWDG_SetWindowValue:
 252                     ; 111   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
 254                     ; 113   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
 256  0000 aa40          	or	a,#64
 257  0002 a47f          	and	a,#127
 258  0004 c750d2        	ld	20690,a
 259                     ; 114 }
 262  0007 81            	ret
 275                     	xdef	_WWDG_SetWindowValue
 276                     	xdef	_WWDG_SWReset
 277                     	xdef	_WWDG_GetCounter
 278                     	xdef	_WWDG_SetCounter
 279                     	xdef	_WWDG_Init
 298                     	end
