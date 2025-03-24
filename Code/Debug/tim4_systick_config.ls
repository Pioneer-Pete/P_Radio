   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  51                     ; 10 void TIM4_SYSTICK_config(void)
  51                     ; 11 {
  53                     .text:	section	.text,new
  54  0000               _TIM4_SYSTICK_config:
  58                     ; 12 	TIM4_DeInit(); 
  60  0000 cd0000        	call	_TIM4_DeInit
  62                     ; 13 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
  64  0003 ae0401        	ldw	x,#1025
  65  0006 cd0000        	call	_CLK_PeripheralClockConfig
  67                     ; 14 	TIM4_TimeBaseInit(TIM2_PRESCALER_128, 124);		//16 MHz / 128 / 125 = 1000 Hz
  69  0009 ae077c        	ldw	x,#1916
  70  000c cd0000        	call	_TIM4_TimeBaseInit
  72                     ; 15 	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);			//interrupt on overflow
  74  000f ae0101        	ldw	x,#257
  75  0012 cd0000        	call	_TIM4_ITConfig
  77                     ; 16 	TIM4_Cmd(ENABLE);
  79  0015 a601          	ld	a,#1
  80  0017 cd0000        	call	_TIM4_Cmd
  82                     ; 17 }
  85  001a 81            	ret
 120                     ; 19 void DELAY_ms(uint32_t delay_ms)					//function that waits for "delay_ms" milliseconds
 120                     ; 20 {
 121                     .text:	section	.text,new
 122  0000               _DELAY_ms:
 124       00000000      OFST:	set	0
 127  0000 200f          	jra	L14
 128  0002               L73:
 129                     ; 23 		if (countflag)								//countflag is set every ms
 131  0002 3d04          	tnz	_countflag
 132  0004 270b          	jreq	L14
 133                     ; 25 			countflag = 0;
 135  0006 3f04          	clr	_countflag
 136                     ; 26 			delay_ms--;
 138  0008 96            	ldw	x,sp
 139  0009 1c0003        	addw	x,#OFST+3
 140  000c a601          	ld	a,#1
 141  000e cd0000        	call	c_lgsbc
 143  0011               L14:
 144                     ; 21 	while (delay_ms)
 146  0011 96            	ldw	x,sp
 147  0012 1c0003        	addw	x,#OFST+3
 148  0015 cd0000        	call	c_lzmp
 150  0018 26e8          	jrne	L73
 151                     ; 29 }
 154  001a 81            	ret
 197                     ; 31 void DELAY_us(uint32_t delay_us)					//function that waits for approx "delay_us" microseconds
 197                     ; 32 {
 198                     .text:	section	.text,new
 199  0000               _DELAY_us:
 201  0000 5204          	subw	sp,#4
 202       00000004      OFST:	set	4
 205                     ; 34 	microseconds = delay_us / USFACTOR;
 207  0002 96            	ldw	x,sp
 208  0003 1c0007        	addw	x,#OFST+3
 209  0006 cd0000        	call	c_ltor
 211  0009 a602          	ld	a,#2
 212  000b cd0000        	call	c_lursh
 214  000e 96            	ldw	x,sp
 215  000f 1c0001        	addw	x,#OFST-3
 216  0012 cd0000        	call	c_rtol
 220  0015               L57:
 221                     ; 35 	while (microseconds-- > 0);
 223  0015 96            	ldw	x,sp
 224  0016 1c0001        	addw	x,#OFST-3
 225  0019 cd0000        	call	c_ltor
 227  001c 96            	ldw	x,sp
 228  001d 1c0001        	addw	x,#OFST-3
 229  0020 a601          	ld	a,#1
 230  0022 cd0000        	call	c_lgsbc
 233  0025 cd0000        	call	c_lrzmp
 235  0028 26eb          	jrne	L57
 236                     ; 36 }
 239  002a 5b04          	addw	sp,#4
 240  002c 81            	ret
 273                     	xdef	_DELAY_us
 274                     	xdef	_DELAY_ms
 275                     	xdef	_TIM4_SYSTICK_config
 276                     	switch	.ubsct
 277  0000               _millis:
 278  0000 00000000      	ds.b	4
 279                     	xdef	_millis
 280  0004               _countflag:
 281  0004 00            	ds.b	1
 282                     	xdef	_countflag
 283                     	xref	_TIM4_ITConfig
 284                     	xref	_TIM4_Cmd
 285                     	xref	_TIM4_TimeBaseInit
 286                     	xref	_TIM4_DeInit
 287                     	xref	_CLK_PeripheralClockConfig
 307                     	xref	c_lrzmp
 308                     	xref	c_rtol
 309                     	xref	c_lursh
 310                     	xref	c_ltor
 311                     	xref	c_lzmp
 312                     	xref	c_lgsbc
 313                     	end
