   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
 118                     ; 54 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 118                     ; 55 {
 120                     .text:	section	.text,new
 121  0000               _RST_GetFlagStatus:
 125                     ; 57   assert_param(IS_RST_FLAG_OK(RST_Flag));
 127                     ; 60   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 129  0000 c450b3        	and	a,20659
 130  0003 2603          	jrne	L6
 131  0005 4f            	clr	a
 132  0006 2002          	jra	L01
 133  0008               L6:
 134  0008 a601          	ld	a,#1
 135  000a               L01:
 138  000a 81            	ret
 173                     ; 69 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 173                     ; 70 {
 174                     .text:	section	.text,new
 175  0000               _RST_ClearFlag:
 179                     ; 72   assert_param(IS_RST_FLAG_OK(RST_Flag));
 181                     ; 74   RST->SR = (uint8_t)RST_Flag;
 183  0000 c750b3        	ld	20659,a
 184                     ; 75 }
 187  0003 81            	ret
 200                     	xdef	_RST_ClearFlag
 201                     	xdef	_RST_GetFlagStatus
 220                     	end
