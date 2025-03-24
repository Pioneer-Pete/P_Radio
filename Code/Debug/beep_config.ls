   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  44                     ; 5 void BEEP_Config(void)
  44                     ; 6 {
  46                     .text:	section	.text,new
  47  0000               _BEEP_Config:
  51                     ; 7 	CLK->PCKENR2 = CLK_PCKENR2_AWU;						//enable AWU- and BEEP-clock
  53  0000 350450ca      	mov	20682,#4
  54                     ; 8 	BEEP->CSR = 0x00;									//reset BEEP register
  56  0004 725f50f3      	clr	20723
  57                     ; 9 	BEEP->CSR |= 0x17;									//BEEPdiv = 25 	(250/25= 10000 Hz)
  59  0008 c650f3        	ld	a,20723
  60  000b aa17          	or	a,#23
  61  000d c750f3        	ld	20723,a
  62                     ; 10 	BEEP->CSR |= (uint8_t) (0x00 << 6);					//BEEPsel = 8	(10000/8= 1250 Hz)
  64  0010 c650f3        	ld	a,20723
  65                     ; 11 }
  68  0013 81            	ret
  91                     ; 13 void BEEP_On(void)
  91                     ; 14 {
  92                     .text:	section	.text,new
  93  0000               _BEEP_On:
  97                     ; 15 	BEEP->CSR |= (uint8_t) (0x01 << 5);//BEEP enable
  99  0000 721a50f3      	bset	20723,#5
 100                     ; 16 }
 103  0004 81            	ret
 126                     ; 18 void BEEP_Off(void)
 126                     ; 19 {
 127                     .text:	section	.text,new
 128  0000               _BEEP_Off:
 132                     ; 20 	BEEP->CSR &= (uint8_t) ~(0x01 << 5);			//BEEP disable
 134  0000 721b50f3      	bres	20723,#5
 135                     ; 21 }
 138  0004 81            	ret
 151                     	xdef	_BEEP_Off
 152                     	xdef	_BEEP_On
 153                     	xdef	_BEEP_Config
 172                     	end
