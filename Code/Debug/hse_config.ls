   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  53                     ; 6 void HSE_config(void)
  53                     ; 7 {
  55                     .text:	section	.text,new
  56  0000               _HSE_config:
  60                     ; 8   CLK_DeInit();
  62  0000 cd0000        	call	_CLK_DeInit
  64                     ; 10   CLK_HSECmd(ENABLE);
  66  0003 a601          	ld	a,#1
  67  0005 cd0000        	call	_CLK_HSECmd
  69                     ; 11   CLK_LSICmd(DISABLE);
  71  0008 4f            	clr	a
  72  0009 cd0000        	call	_CLK_LSICmd
  74                     ; 12   CLK_HSICmd(DISABLE);
  76  000c 4f            	clr	a
  77  000d cd0000        	call	_CLK_HSICmd
  80  0010               L32:
  81                     ; 13   while(CLK_GetFlagStatus(CLK_FLAG_HSERDY) == FALSE);
  83  0010 ae0202        	ldw	x,#514
  84  0013 cd0000        	call	_CLK_GetFlagStatus
  86  0016 4d            	tnz	a
  87  0017 27f7          	jreq	L32
  88                     ; 15   CLK_ClockSwitchCmd(ENABLE);
  90  0019 a601          	ld	a,#1
  91  001b cd0000        	call	_CLK_ClockSwitchCmd
  93                     ; 16   CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
  95  001e a680          	ld	a,#128
  96  0020 cd0000        	call	_CLK_SYSCLKConfig
  98                     ; 18   CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, 
  98                     ; 19   DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 100  0023 4b01          	push	#1
 101  0025 4b00          	push	#0
 102  0027 ae01b4        	ldw	x,#436
 103  002a cd0000        	call	_CLK_ClockSwitchConfig
 105  002d 85            	popw	x
 106                     ; 21   CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 108  002e 5f            	clrw	x
 109  002f cd0000        	call	_CLK_PeripheralClockConfig
 111                     ; 22   CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 113  0032 ae0100        	ldw	x,#256
 114  0035 cd0000        	call	_CLK_PeripheralClockConfig
 116                     ; 23   CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 118  0038 ae0300        	ldw	x,#768
 119  003b cd0000        	call	_CLK_PeripheralClockConfig
 121                     ; 24   CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 123  003e ae1200        	ldw	x,#4608
 124  0041 cd0000        	call	_CLK_PeripheralClockConfig
 126                     ; 25   CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 128  0044 ae1300        	ldw	x,#4864
 129  0047 cd0000        	call	_CLK_PeripheralClockConfig
 131                     ; 26   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 133  004a ae0700        	ldw	x,#1792
 134  004d cd0000        	call	_CLK_PeripheralClockConfig
 136                     ; 27   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 138  0050 ae0500        	ldw	x,#1280
 139  0053 cd0000        	call	_CLK_PeripheralClockConfig
 141                     ; 28   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 143  0056 ae0400        	ldw	x,#1024
 144  0059 cd0000        	call	_CLK_PeripheralClockConfig
 146                     ; 29 }
 149  005c 81            	ret
 175                     ; 31 void CLOCK_output(void)
 175                     ; 32 {
 176                     .text:	section	.text,new
 177  0000               _CLOCK_output:
 181                     ; 33 	CLK_CCOConfig(CLK_OUTPUT_CPU);
 183  0000 a608          	ld	a,#8
 184  0002 cd0000        	call	_CLK_CCOConfig
 186                     ; 34 	CLK_CCOCmd(ENABLE);
 188  0005 a601          	ld	a,#1
 189  0007 cd0000        	call	_CLK_CCOCmd
 192  000a               L14:
 193                     ; 35 	while(CLK_GetFlagStatus(CLK_FLAG_CCORDY) == FALSE);
 195  000a ae0502        	ldw	x,#1282
 196  000d cd0000        	call	_CLK_GetFlagStatus
 198  0010 4d            	tnz	a
 199  0011 27f7          	jreq	L14
 200                     ; 36 }
 203  0013 81            	ret
 216                     	xdef	_CLOCK_output
 217                     	xdef	_HSE_config
 218                     	xref	_CLK_GetFlagStatus
 219                     	xref	_CLK_SYSCLKConfig
 220                     	xref	_CLK_CCOConfig
 221                     	xref	_CLK_ClockSwitchConfig
 222                     	xref	_CLK_PeripheralClockConfig
 223                     	xref	_CLK_ClockSwitchCmd
 224                     	xref	_CLK_CCOCmd
 225                     	xref	_CLK_LSICmd
 226                     	xref	_CLK_HSICmd
 227                     	xref	_CLK_HSECmd
 228                     	xref	_CLK_DeInit
 247                     	end
