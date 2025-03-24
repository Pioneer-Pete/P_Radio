   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  49                     ; 4 void TIM1_config(void)
  49                     ; 5 {
  51                     .text:	section	.text,new
  52  0000               _TIM1_config:
  56                     ; 6 	TIM1_DeInit(); 
  58  0000 cd0000        	call	_TIM1_DeInit
  60                     ; 8 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);	//16 MHz
  62  0003 ae0701        	ldw	x,#1793
  63  0006 cd0000        	call	_CLK_PeripheralClockConfig
  65                     ; 10 	TIM1_TimeBaseInit(159, TIM1_COUNTERMODE_UP, 9999, 0);		//16 MHz / 160 / 10000 = 10 Hz
  67  0009 4b00          	push	#0
  68  000b ae270f        	ldw	x,#9999
  69  000e 89            	pushw	x
  70  000f 4b00          	push	#0
  71  0011 ae009f        	ldw	x,#159
  72  0014 cd0000        	call	_TIM1_TimeBaseInit
  74  0017 5b04          	addw	sp,#4
  75                     ; 11 	TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);						//enable interrupt on overflow
  77  0019 ae0101        	ldw	x,#257
  78  001c cd0000        	call	_TIM1_ITConfig
  80                     ; 13 	TIM1_Cmd(ENABLE);
  82  001f a601          	ld	a,#1
  83  0021 cd0000        	call	_TIM1_Cmd
  85                     ; 14 }
  88  0024 81            	ret
 101                     	xdef	_TIM1_config
 102                     	xref	_TIM1_ITConfig
 103                     	xref	_TIM1_Cmd
 104                     	xref	_TIM1_TimeBaseInit
 105                     	xref	_TIM1_DeInit
 106                     	xref	_CLK_PeripheralClockConfig
 125                     	end
