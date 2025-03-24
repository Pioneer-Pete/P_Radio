   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  54                     ; 5 void HSI16_config(void)
  54                     ; 6 {
  56                     .text:	section	.text,new
  57  0000               _HSI16_config:
  61                     ; 7   CLK_DeInit();
  63  0000 cd0000        	call	_CLK_DeInit
  65                     ; 9   CLK_HSECmd(DISABLE);
  67  0003 4f            	clr	a
  68  0004 cd0000        	call	_CLK_HSECmd
  70                     ; 10   CLK_LSICmd(DISABLE);
  72  0007 4f            	clr	a
  73  0008 cd0000        	call	_CLK_LSICmd
  75                     ; 11   CLK_HSICmd(ENABLE);
  77  000b a601          	ld	a,#1
  78  000d cd0000        	call	_CLK_HSICmd
  81  0010               L32:
  82                     ; 12   while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
  84  0010 ae0102        	ldw	x,#258
  85  0013 cd0000        	call	_CLK_GetFlagStatus
  87  0016 4d            	tnz	a
  88  0017 27f7          	jreq	L32
  89                     ; 14   CLK_ClockSwitchCmd(ENABLE);
  91  0019 a601          	ld	a,#1
  92  001b cd0000        	call	_CLK_ClockSwitchCmd
  94                     ; 15   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
  96  001e 4f            	clr	a
  97  001f cd0000        	call	_CLK_HSIPrescalerConfig
  99                     ; 16   CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 101  0022 a680          	ld	a,#128
 102  0024 cd0000        	call	_CLK_SYSCLKConfig
 104                     ; 18   CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 104                     ; 19   DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 106  0027 4b01          	push	#1
 107  0029 4b00          	push	#0
 108  002b ae01e1        	ldw	x,#481
 109  002e cd0000        	call	_CLK_ClockSwitchConfig
 111  0031 85            	popw	x
 112                     ; 21   CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 114  0032 5f            	clrw	x
 115  0033 cd0000        	call	_CLK_PeripheralClockConfig
 117                     ; 22   CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 119  0036 ae0100        	ldw	x,#256
 120  0039 cd0000        	call	_CLK_PeripheralClockConfig
 122                     ; 23   CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 124  003c ae0300        	ldw	x,#768
 125  003f cd0000        	call	_CLK_PeripheralClockConfig
 127                     ; 24   CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 129  0042 ae1200        	ldw	x,#4608
 130  0045 cd0000        	call	_CLK_PeripheralClockConfig
 132                     ; 25   CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 134  0048 ae1300        	ldw	x,#4864
 135  004b cd0000        	call	_CLK_PeripheralClockConfig
 137                     ; 26   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 139  004e ae0700        	ldw	x,#1792
 140  0051 cd0000        	call	_CLK_PeripheralClockConfig
 142                     ; 27   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 144  0054 ae0500        	ldw	x,#1280
 145  0057 cd0000        	call	_CLK_PeripheralClockConfig
 147                     ; 28   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 149  005a ae0400        	ldw	x,#1024
 150  005d cd0000        	call	_CLK_PeripheralClockConfig
 152                     ; 29 }
 155  0060 81            	ret
 181                     ; 31 void HSI16_CLOCK_output(void)
 181                     ; 32 {
 182                     .text:	section	.text,new
 183  0000               _HSI16_CLOCK_output:
 187                     ; 33 	CLK_CCOConfig(CLK_OUTPUT_CPU);
 189  0000 a608          	ld	a,#8
 190  0002 cd0000        	call	_CLK_CCOConfig
 192                     ; 34 	CLK_CCOCmd(ENABLE);
 194  0005 a601          	ld	a,#1
 195  0007 cd0000        	call	_CLK_CCOCmd
 198  000a               L14:
 199                     ; 35 	while(CLK_GetFlagStatus(CLK_FLAG_CCORDY) == FALSE);
 201  000a ae0502        	ldw	x,#1282
 202  000d cd0000        	call	_CLK_GetFlagStatus
 204  0010 4d            	tnz	a
 205  0011 27f7          	jreq	L14
 206                     ; 36 }
 209  0013 81            	ret
 222                     	xdef	_HSI16_CLOCK_output
 223                     	xdef	_HSI16_config
 224                     	xref	_CLK_GetFlagStatus
 225                     	xref	_CLK_SYSCLKConfig
 226                     	xref	_CLK_CCOConfig
 227                     	xref	_CLK_HSIPrescalerConfig
 228                     	xref	_CLK_ClockSwitchConfig
 229                     	xref	_CLK_PeripheralClockConfig
 230                     	xref	_CLK_ClockSwitchCmd
 231                     	xref	_CLK_CCOCmd
 232                     	xref	_CLK_LSICmd
 233                     	xref	_CLK_HSICmd
 234                     	xref	_CLK_HSECmd
 235                     	xref	_CLK_DeInit
 254                     	end
