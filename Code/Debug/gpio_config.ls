   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  46                     ; 5 void GPIO_config(void)
  46                     ; 6 {
  48                     .text:	section	.text,new
  49  0000               _GPIO_config:
  53                     ; 7 	GPIO_DeInit(GPIOA);
  55  0000 ae5000        	ldw	x,#20480
  56  0003 cd0000        	call	_GPIO_DeInit
  58                     ; 8 	GPIO_DeInit(GPIOB);
  60  0006 ae5005        	ldw	x,#20485
  61  0009 cd0000        	call	_GPIO_DeInit
  63                     ; 9 	GPIO_DeInit(GPIOC);
  65  000c ae500a        	ldw	x,#20490
  66  000f cd0000        	call	_GPIO_DeInit
  68                     ; 10 	GPIO_DeInit(GPIOD);
  70  0012 ae500f        	ldw	x,#20495
  71  0015 cd0000        	call	_GPIO_DeInit
  73                     ; 13 	GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_SLOW);		//led
  75  0018 4bc0          	push	#192
  76  001a 4b20          	push	#32
  77  001c ae5005        	ldw	x,#20485
  78  001f cd0000        	call	_GPIO_Init
  80  0022 85            	popw	x
  81                     ; 14 }
  84  0023 81            	ret
  97                     	xdef	_GPIO_config
  98                     	xref	_GPIO_Init
  99                     	xref	_GPIO_DeInit
 118                     	end
