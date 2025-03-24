   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  47                     ; 5 void EXTI_config(void)
  47                     ; 6 {
  49                     .text:	section	.text,new
  50  0000               _EXTI_config:
  54                     ; 7 	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_PU_IT);						//enable exti on PD3
  56  0000 4b60          	push	#96
  57  0002 4b08          	push	#8
  58  0004 ae500f        	ldw	x,#20495
  59  0007 cd0000        	call	_GPIO_Init
  61  000a 85            	popw	x
  62                     ; 9 	EXTI_DeInit();
  64  000b cd0000        	call	_EXTI_DeInit
  66                     ; 10     EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_FALL_ONLY);	//interrupt on falling edge
  68  000e ae0302        	ldw	x,#770
  69  0011 cd0000        	call	_EXTI_SetExtIntSensitivity
  71                     ; 12 }
  74  0014 81            	ret
  87                     	xdef	_EXTI_config
  88                     	xref	_GPIO_Init
  89                     	xref	_EXTI_SetExtIntSensitivity
  90                     	xref	_EXTI_DeInit
 109                     	end
