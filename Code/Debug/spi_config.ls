   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  50                     ; 4 void SPI_config(void)
  50                     ; 5 {
  52                     .text:	section	.text,new
  53  0000               _SPI_config:
  57                     ; 6 	GPIO_Init(SPI_CE_PORT, SPI_CE_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);	//spi_nss (ce)
  59  0000 4bf0          	push	#240
  60  0002 4b08          	push	#8
  61  0004 ae5000        	ldw	x,#20480
  62  0007 cd0000        	call	_GPIO_Init
  64  000a 85            	popw	x
  65                     ; 8 	GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);		//spi_sck
  67  000b 4bf0          	push	#240
  68  000d 4b20          	push	#32
  69  000f ae500a        	ldw	x,#20490
  70  0012 cd0000        	call	_GPIO_Init
  72  0015 85            	popw	x
  73                     ; 9 	GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_HIGH_FAST);		//spi_mosi
  75  0016 4bf0          	push	#240
  76  0018 4b40          	push	#64
  77  001a ae500a        	ldw	x,#20490
  78  001d cd0000        	call	_GPIO_Init
  80  0020 85            	popw	x
  81                     ; 10 	GPIO_Init(GPIOC, GPIO_PIN_7, GPIO_MODE_IN_PU_NO_IT);			//spi_miso
  83  0021 4b40          	push	#64
  84  0023 4b80          	push	#128
  85  0025 ae500a        	ldw	x,#20490
  86  0028 cd0000        	call	_GPIO_Init
  88  002b 85            	popw	x
  89                     ; 14 	SPI_DeInit(); 
  91  002c cd0000        	call	_SPI_DeInit
  93                     ; 15 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
  95  002f ae0101        	ldw	x,#257
  96  0032 cd0000        	call	_CLK_PeripheralClockConfig
  98                     ; 16 	SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_2, SPI_MODE_MASTER, 
  98                     ; 17 		SPI_CLOCKPOLARITY_HIGH, SPI_CLOCKPHASE_1EDGE, SPI_DATADIRECTION_1LINE_TX, 
  98                     ; 18 		SPI_NSS_SOFT, 0x00);
 100  0035 4b00          	push	#0
 101  0037 4b02          	push	#2
 102  0039 4bc0          	push	#192
 103  003b 4b00          	push	#0
 104  003d 4b02          	push	#2
 105  003f 4b04          	push	#4
 106  0041 5f            	clrw	x
 107  0042 cd0000        	call	_SPI_Init
 109  0045 5b06          	addw	sp,#6
 110                     ; 20 	SPI_Cmd(ENABLE);
 112  0047 a601          	ld	a,#1
 113  0049 cd0000        	call	_SPI_Cmd
 115                     ; 22 	GPIO_WriteHigh(SPI_CE_PORT, SPI_CE_PIN);			//PA3 used for NSS (CE)
 117  004c 4b08          	push	#8
 118  004e ae5000        	ldw	x,#20480
 119  0051 cd0000        	call	_GPIO_WriteHigh
 121  0054 84            	pop	a
 122                     ; 23 }
 125  0055 81            	ret
 163                     ; 26 void SPI_send_byte(uint8_t data)
 163                     ; 27 {
 164                     .text:	section	.text,new
 165  0000               _SPI_send_byte:
 167  0000 88            	push	a
 168       00000000      OFST:	set	0
 171                     ; 28 	GPIO_WriteLow(SPI_CE_PORT, SPI_CE_PIN);
 173  0001 4b08          	push	#8
 174  0003 ae5000        	ldw	x,#20480
 175  0006 cd0000        	call	_GPIO_WriteLow
 177  0009 84            	pop	a
 179  000a               L14:
 180                     ; 30 	while(!SPI_GetFlagStatus(SPI_FLAG_TXE));
 182  000a a602          	ld	a,#2
 183  000c cd0000        	call	_SPI_GetFlagStatus
 185  000f 4d            	tnz	a
 186  0010 27f8          	jreq	L14
 187                     ; 31 	SPI_SendData(data);
 189  0012 7b01          	ld	a,(OFST+1,sp)
 190  0014 cd0000        	call	_SPI_SendData
 193  0017               L74:
 194                     ; 32 	while(SPI_GetFlagStatus(SPI_FLAG_BSY));
 196  0017 a680          	ld	a,#128
 197  0019 cd0000        	call	_SPI_GetFlagStatus
 199  001c 4d            	tnz	a
 200  001d 26f8          	jrne	L74
 201                     ; 34 	GPIO_WriteHigh(SPI_CE_PORT, SPI_CE_PIN);
 203  001f 4b08          	push	#8
 204  0021 ae5000        	ldw	x,#20480
 205  0024 cd0000        	call	_GPIO_WriteHigh
 207  0027 84            	pop	a
 208                     ; 35 }
 211  0028 84            	pop	a
 212  0029 81            	ret
 250                     ; 38 void SPI_sendword(uint16_t data)
 250                     ; 39 {
 251                     .text:	section	.text,new
 252  0000               _SPI_sendword:
 254  0000 89            	pushw	x
 255       00000000      OFST:	set	0
 258                     ; 40 	GPIO_WriteLow(SPI_CE_PORT, SPI_CE_PIN);
 260  0001 4b08          	push	#8
 261  0003 ae5000        	ldw	x,#20480
 262  0006 cd0000        	call	_GPIO_WriteLow
 264  0009 84            	pop	a
 266  000a               L37:
 267                     ; 42 	while(!SPI_GetFlagStatus(SPI_FLAG_TXE));
 269  000a a602          	ld	a,#2
 270  000c cd0000        	call	_SPI_GetFlagStatus
 272  000f 4d            	tnz	a
 273  0010 27f8          	jreq	L37
 274                     ; 43 	SPI_SendData((uint8_t) (data >> 8));
 276  0012 7b01          	ld	a,(OFST+1,sp)
 277  0014 cd0000        	call	_SPI_SendData
 280  0017               L101:
 281                     ; 44 	while(!SPI_GetFlagStatus(SPI_FLAG_TXE));
 283  0017 a602          	ld	a,#2
 284  0019 cd0000        	call	_SPI_GetFlagStatus
 286  001c 4d            	tnz	a
 287  001d 27f8          	jreq	L101
 288                     ; 45 	SPI_SendData((uint8_t) (data & 0x00FF));
 290  001f 7b02          	ld	a,(OFST+2,sp)
 291  0021 a4ff          	and	a,#255
 292  0023 cd0000        	call	_SPI_SendData
 295  0026               L701:
 296                     ; 46 	while(SPI_GetFlagStatus(SPI_FLAG_BSY));
 298  0026 a680          	ld	a,#128
 299  0028 cd0000        	call	_SPI_GetFlagStatus
 301  002b 4d            	tnz	a
 302  002c 26f8          	jrne	L701
 303                     ; 48 	GPIO_WriteHigh(SPI_CE_PORT, SPI_CE_PIN);
 305  002e 4b08          	push	#8
 306  0030 ae5000        	ldw	x,#20480
 307  0033 cd0000        	call	_GPIO_WriteHigh
 309  0036 84            	pop	a
 310                     ; 49 }
 313  0037 85            	popw	x
 314  0038 81            	ret
 352                     ; 51 uint16_t SPI_read_byte(void)
 352                     ; 52 {
 353                     .text:	section	.text,new
 354  0000               _SPI_read_byte:
 356  0000 89            	pushw	x
 357       00000002      OFST:	set	2
 360                     ; 53 	uint16_t data = 0xFF00;						//FF00 --> no data
 362  0001 aeff00        	ldw	x,#65280
 363  0004 1f01          	ldw	(OFST-1,sp),x
 365                     ; 55 	if (SPI_GetFlagStatus(SPI_FLAG_RXNE))
 367  0006 a601          	ld	a,#1
 368  0008 cd0000        	call	_SPI_GetFlagStatus
 370  000b 4d            	tnz	a
 371  000c 2719          	jreq	L131
 372                     ; 57 		GPIO_WriteLow(SPI_CE_PORT, SPI_CE_PIN);
 374  000e 4b08          	push	#8
 375  0010 ae5000        	ldw	x,#20480
 376  0013 cd0000        	call	_GPIO_WriteLow
 378  0016 84            	pop	a
 379                     ; 58 		data = 0x0000 | SPI_ReceiveData();
 381  0017 cd0000        	call	_SPI_ReceiveData
 383  001a 5f            	clrw	x
 384  001b 97            	ld	xl,a
 385  001c 1f01          	ldw	(OFST-1,sp),x
 387                     ; 59 		GPIO_WriteHigh(SPI_CE_PORT, SPI_CE_PIN);
 389  001e 4b08          	push	#8
 390  0020 ae5000        	ldw	x,#20480
 391  0023 cd0000        	call	_GPIO_WriteHigh
 393  0026 84            	pop	a
 394  0027               L131:
 395                     ; 61 	return data;								//00xx --> xx = received data
 397  0027 1e01          	ldw	x,(OFST-1,sp)
 400  0029 5b02          	addw	sp,#2
 401  002b 81            	ret
 414                     	xdef	_SPI_read_byte
 415                     	xdef	_SPI_sendword
 416                     	xdef	_SPI_send_byte
 417                     	xdef	_SPI_config
 418                     	xref	_SPI_GetFlagStatus
 419                     	xref	_SPI_ReceiveData
 420                     	xref	_SPI_SendData
 421                     	xref	_SPI_Cmd
 422                     	xref	_SPI_Init
 423                     	xref	_SPI_DeInit
 424                     	xref	_GPIO_WriteLow
 425                     	xref	_GPIO_WriteHigh
 426                     	xref	_GPIO_Init
 427                     	xref	_CLK_PeripheralClockConfig
 446                     	end
