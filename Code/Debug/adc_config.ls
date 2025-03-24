   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  50                     ; 5 void ADC_config(void)
  50                     ; 6 {
  52                     .text:	section	.text,new
  53  0000               _ADC_config:
  57                     ; 7 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
  59  0000 ae1301        	ldw	x,#4865
  60  0003 cd0000        	call	_CLK_PeripheralClockConfig
  62                     ; 10 	GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT);
  64  0006 4b00          	push	#0
  65  0008 4b04          	push	#4
  66  000a ae500f        	ldw	x,#20495
  67  000d cd0000        	call	_GPIO_Init
  69  0010 85            	popw	x
  70                     ; 12 	ADC1_DeInit(); 
  72  0011 cd0000        	call	_ADC1_DeInit
  74                     ; 18 	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D18, 
  74                     ; 19 		ADC1_EXTTRIG_TIM, ENABLE, 
  74                     ; 20 		ADC1_ALIGN_RIGHT, 
  74                     ; 21 		ADC1_SCHMITTTRIG_CHANNEL3, DISABLE);
  76  0014 4b00          	push	#0
  77  0016 4b03          	push	#3
  78  0018 4b08          	push	#8
  79  001a 4b01          	push	#1
  80  001c 4b00          	push	#0
  81  001e 4b70          	push	#112
  82  0020 ae0003        	ldw	x,#3
  83  0023 cd0000        	call	_ADC1_Init
  85  0026 5b06          	addw	sp,#6
  86                     ; 24 	ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
  88  0028 4b01          	push	#1
  89  002a ae0020        	ldw	x,#32
  90  002d cd0000        	call	_ADC1_ITConfig
  92  0030 84            	pop	a
  93                     ; 26 	ADC1_Cmd(ENABLE);
  95  0031 a601          	ld	a,#1
  96  0033 cd0000        	call	_ADC1_Cmd
  98                     ; 27 }
 101  0036 81            	ret
 114                     	xdef	_ADC_config
 115                     	xref	_GPIO_Init
 116                     	xref	_CLK_PeripheralClockConfig
 117                     	xref	_ADC1_ITConfig
 118                     	xref	_ADC1_Cmd
 119                     	xref	_ADC1_Init
 120                     	xref	_ADC1_DeInit
 139                     	end
