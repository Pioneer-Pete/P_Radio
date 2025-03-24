   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  52                     ; 5 void TIM2_config(void)
  52                     ; 6 {
  54                     .text:	section	.text,new
  55  0000               _TIM2_config:
  59                     ; 7 	GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);		//CH1
  61  0000 4bf0          	push	#240
  62  0002 4b20          	push	#32
  63  0004 ae500a        	ldw	x,#20490
  64  0007 cd0000        	call	_GPIO_Init
  66  000a 85            	popw	x
  67                     ; 8 	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);		//CH2
  69  000b 4bf0          	push	#240
  70  000d 4b08          	push	#8
  71  000f ae500f        	ldw	x,#20495
  72  0012 cd0000        	call	_GPIO_Init
  74  0015 85            	popw	x
  75                     ; 9 	GPIO_Init(GPIOA, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);		//CH3
  77  0016 4bf0          	push	#240
  78  0018 4b08          	push	#8
  79  001a ae5000        	ldw	x,#20480
  80  001d cd0000        	call	_GPIO_Init
  82  0020 85            	popw	x
  83                     ; 12 	TIM2_DeInit(); 
  85  0021 cd0000        	call	_TIM2_DeInit
  87                     ; 14 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);	//16 MHz
  89  0024 ae0501        	ldw	x,#1281
  90  0027 cd0000        	call	_CLK_PeripheralClockConfig
  92                     ; 16 	TIM2_TimeBaseInit(TIM2_PRESCALER_1, 0xFFFF);					//16 MHz / 65536 = 244 Hz
  94  002a aeffff        	ldw	x,#65535
  95  002d 89            	pushw	x
  96  002e 4f            	clr	a
  97  002f cd0000        	call	_TIM2_TimeBaseInit
  99  0032 85            	popw	x
 100                     ; 18 	TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 1, TIM2_OCPOLARITY_HIGH);
 102  0033 4b00          	push	#0
 103  0035 ae0001        	ldw	x,#1
 104  0038 89            	pushw	x
 105  0039 ae6011        	ldw	x,#24593
 106  003c cd0000        	call	_TIM2_OC1Init
 108  003f 5b03          	addw	sp,#3
 109                     ; 19 	TIM2_OC2Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 1, TIM2_OCPOLARITY_HIGH);
 111  0041 4b00          	push	#0
 112  0043 ae0001        	ldw	x,#1
 113  0046 89            	pushw	x
 114  0047 ae6011        	ldw	x,#24593
 115  004a cd0000        	call	_TIM2_OC2Init
 117  004d 5b03          	addw	sp,#3
 118                     ; 20 	TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 1, TIM2_OCPOLARITY_HIGH);
 120  004f 4b00          	push	#0
 121  0051 ae0001        	ldw	x,#1
 122  0054 89            	pushw	x
 123  0055 ae6011        	ldw	x,#24593
 124  0058 cd0000        	call	_TIM2_OC3Init
 126  005b 5b03          	addw	sp,#3
 127                     ; 21 	TIM2_Cmd(ENABLE);
 129  005d a601          	ld	a,#1
 130  005f cd0000        	call	_TIM2_Cmd
 132                     ; 22 }
 135  0062 81            	ret
 148                     	xdef	_TIM2_config
 149                     	xref	_TIM2_Cmd
 150                     	xref	_TIM2_OC3Init
 151                     	xref	_TIM2_OC2Init
 152                     	xref	_TIM2_OC1Init
 153                     	xref	_TIM2_TimeBaseInit
 154                     	xref	_TIM2_DeInit
 155                     	xref	_GPIO_Init
 156                     	xref	_CLK_PeripheralClockConfig
 175                     	end
