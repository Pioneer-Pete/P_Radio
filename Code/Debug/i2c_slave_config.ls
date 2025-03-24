   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  48                     ; 3 void I2C_slave_config(void)
  48                     ; 4 {
  50                     .text:	section	.text,new
  51  0000               _I2C_slave_config:
  55                     ; 5 	disableInterrupts();
  58  0000 9b            sim
  60                     ; 7 	CLK->PCKENR1 |= CLK_PCKENR1_I2C;									//enable I2C Clock
  63  0001 721050c7      	bset	20679,#0
  64                     ; 9 	I2C_Init(I2C_MAX_STANDARD_FREQ, SLAVE_ADDRESS, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, 16);
  66  0005 4b10          	push	#16
  67  0007 4b00          	push	#0
  68  0009 4b01          	push	#1
  69  000b 4b00          	push	#0
  70  000d ae0060        	ldw	x,#96
  71  0010 89            	pushw	x
  72  0011 ae86a0        	ldw	x,#34464
  73  0014 89            	pushw	x
  74  0015 ae0001        	ldw	x,#1
  75  0018 89            	pushw	x
  76  0019 cd0000        	call	_I2C_Init
  78  001c 5b0a          	addw	sp,#10
  79                     ; 10 	I2C_ITConfig((I2C_IT_TypeDef)(I2C_IT_ERR | I2C_IT_EVT | I2C_IT_BUF), ENABLE);
  81  001e ae0701        	ldw	x,#1793
  82  0021 cd0000        	call	_I2C_ITConfig
  84                     ; 13 	enableInterrupts();
  87  0024 9a            rim
  89                     ; 14 }
  93  0025 81            	ret
 106                     	xdef	_I2C_slave_config
 107                     	xref	_I2C_ITConfig
 108                     	xref	_I2C_Init
 127                     	end
