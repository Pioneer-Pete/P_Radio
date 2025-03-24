   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  16                     	bsct
  17  0000               _UART1_rxhead:
  18  0000 00            	dc.b	0
  19  0001               _UART1_rxtail:
  20  0001 00            	dc.b	0
  21  0002               _UART1_txhead:
  22  0002 00            	dc.b	0
  23  0003               _UART1_txtail:
  24  0003 00            	dc.b	0
  25  0004               _UART1_rxerror:
  26  0004 0000          	dc.w	0
  27                     .const:	section	.text
  28  0000               _UART1_rxbuff_size:
  29  0000 40            	dc.b	64
  30  0001               _UART1_txbuff_size:
  31  0001 40            	dc.b	64
  32  0002               _UART1_rxbuff_mask:
  33  0002 3f            	dc.b	63
  34  0003               _UART1_txbuff_mask:
  35  0003 3f            	dc.b	63
  80                     ; 35 void UART1_config(uint32_t baudrate)
  80                     ; 36 {
  82                     .text:	section	.text,new
  83  0000               _UART1_config:
  85       00000000      OFST:	set	0
  88                     ; 37 	GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);		//uart1_tx
  90  0000 4bf0          	push	#240
  91  0002 4b20          	push	#32
  92  0004 ae500f        	ldw	x,#20495
  93  0007 cd0000        	call	_GPIO_Init
  95  000a 85            	popw	x
  96                     ; 38 	GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);			//uart1_rx
  98  000b 4b40          	push	#64
  99  000d 4b40          	push	#64
 100  000f ae500f        	ldw	x,#20495
 101  0012 cd0000        	call	_GPIO_Init
 103  0015 85            	popw	x
 104                     ; 41 	UART1_DeInit(); 
 106  0016 cd0000        	call	_UART1_DeInit
 108                     ; 42 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
 110  0019 ae0301        	ldw	x,#769
 111  001c cd0000        	call	_CLK_PeripheralClockConfig
 113                     ; 43 	UART1_Init(baudrate, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO, 
 113                     ; 44 		UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
 115  001f 4b0c          	push	#12
 116  0021 4b80          	push	#128
 117  0023 4b00          	push	#0
 118  0025 4b00          	push	#0
 119  0027 4b00          	push	#0
 120  0029 1e0a          	ldw	x,(OFST+10,sp)
 121  002b 89            	pushw	x
 122  002c 1e0a          	ldw	x,(OFST+10,sp)
 123  002e 89            	pushw	x
 124  002f cd0000        	call	_UART1_Init
 126  0032 5b09          	addw	sp,#9
 127                     ; 45 	UART1_Cmd(ENABLE);
 129  0034 a601          	ld	a,#1
 130  0036 cd0000        	call	_UART1_Cmd
 132                     ; 46 }
 135  0039 81            	ret
 183                     ; 49 uint16_t UART1_getc(void)
 183                     ; 50 {
 184                     .text:	section	.text,new
 185  0000               _UART1_getc:
 187  0000 5203          	subw	sp,#3
 188       00000003      OFST:	set	3
 191                     ; 54 	if (UART1_rxhead == UART1_rxtail) return(0); //no data available
 193  0002 b600          	ld	a,_UART1_rxhead
 194  0004 b101          	cp	a,_UART1_rxtail
 195  0006 2603          	jrne	L15
 198  0008 5f            	clrw	x
 200  0009 201b          	jra	L01
 201  000b               L15:
 202                     ; 56 	tmp = (uint8_t) ((UART1_rxtail + 1) & UART1_rxbuff_mask);
 204  000b b601          	ld	a,_UART1_rxtail
 205  000d 4c            	inc	a
 206  000e a43f          	and	a,#63
 207  0010 6b03          	ld	(OFST+0,sp),a
 209                     ; 57 	UART1_rxtail = tmp;
 211  0012 7b03          	ld	a,(OFST+0,sp)
 212  0014 b701          	ld	_UART1_rxtail,a
 213                     ; 59 	data = (uint16_t) ((UART1_rxerror << 8) | UART1_rxbuff[tmp]);
 215  0016 be04          	ldw	x,_UART1_rxerror
 216  0018 7b03          	ld	a,(OFST+0,sp)
 217  001a 905f          	clrw	y
 218  001c 9097          	ld	yl,a
 219  001e 90e640        	ld	a,(_UART1_rxbuff,y)
 220  0021 02            	rlwa	x,a
 221  0022 1f01          	ldw	(OFST-2,sp),x
 223                     ; 60 	return(data);
 225  0024 1e01          	ldw	x,(OFST-2,sp)
 227  0026               L01:
 229  0026 5b03          	addw	sp,#3
 230  0028 81            	ret
 277                     ; 64 void UART1_putc(uint8_t data)
 277                     ; 65 {
 278                     .text:	section	.text,new
 279  0000               _UART1_putc:
 281  0000 88            	push	a
 282  0001 88            	push	a
 283       00000001      OFST:	set	1
 286                     ; 68 	tmp = (uint8_t) ((UART1_txhead + 1) & UART1_txbuff_mask);
 288  0002 b602          	ld	a,_UART1_txhead
 289  0004 4c            	inc	a
 290  0005 a43f          	and	a,#63
 291  0007 6b01          	ld	(OFST+0,sp),a
 294  0009               L101:
 295                     ; 69 	while (tmp == UART1_txtail) {}                  //wait for free space in tx buffer
 297  0009 7b01          	ld	a,(OFST+0,sp)
 298  000b b103          	cp	a,_UART1_txtail
 299  000d 27fa          	jreq	L101
 300                     ; 70 	UART1_txbuff[tmp] = data;
 302  000f 7b01          	ld	a,(OFST+0,sp)
 303  0011 5f            	clrw	x
 304  0012 97            	ld	xl,a
 305  0013 7b02          	ld	a,(OFST+1,sp)
 306  0015 e700          	ld	(_UART1_txbuff,x),a
 307                     ; 71 	UART1_txhead = tmp;
 309  0017 7b01          	ld	a,(OFST+0,sp)
 310  0019 b702          	ld	_UART1_txhead,a
 311                     ; 72 	UART1->CR2 |= (uint8_t) UART1_CR2_TIEN;			//enable TXE-irq
 313  001b 721e5235      	bset	21045,#7
 314                     ; 73 }
 317  001f 85            	popw	x
 318  0020 81            	ret
 354                     ; 76 void UART1_puts(char *s)
 354                     ; 77 {
 355                     .text:	section	.text,new
 356  0000               _UART1_puts:
 358  0000 89            	pushw	x
 359       00000000      OFST:	set	0
 362  0001 200e          	jra	L521
 363  0003               L321:
 364                     ; 78 	while (*s) UART1_putc(*s++);
 366  0003 1e01          	ldw	x,(OFST+1,sp)
 367  0005 1c0001        	addw	x,#1
 368  0008 1f01          	ldw	(OFST+1,sp),x
 369  000a 1d0001        	subw	x,#1
 370  000d f6            	ld	a,(x)
 371  000e cd0000        	call	_UART1_putc
 373  0011               L521:
 376  0011 1e01          	ldw	x,(OFST+1,sp)
 377  0013 7d            	tnz	(x)
 378  0014 26ed          	jrne	L321
 379                     ; 79 }
 382  0016 85            	popw	x
 383  0017 81            	ret
 410                     ; 82 uint16_t UART1_available(void)
 410                     ; 83 {
 411                     .text:	section	.text,new
 412  0000               _UART1_available:
 414  0000 89            	pushw	x
 415       00000002      OFST:	set	2
 418                     ; 84 	return (uint16_t) ((UART1_rxerror << 8) | ((UART1_rxbuff_mask + UART1_rxhead - UART1_rxtail)
 418                     ; 85 		% UART1_rxbuff_mask));
 420  0001 b600          	ld	a,_UART1_rxhead
 421  0003 5f            	clrw	x
 422  0004 97            	ld	xl,a
 423  0005 1c003f        	addw	x,#63
 424  0008 01            	rrwa	x,a
 425  0009 b001          	sub	a,_UART1_rxtail
 426  000b 2401          	jrnc	L02
 427  000d 5a            	decw	x
 428  000e               L02:
 429  000e 02            	rlwa	x,a
 430  000f a63f          	ld	a,#63
 431  0011 cd0000        	call	c_smodx
 433  0014 1f01          	ldw	(OFST-1,sp),x
 435  0016 be04          	ldw	x,_UART1_rxerror
 436  0018 4f            	clr	a
 437  0019 02            	rlwa	x,a
 438  001a 01            	rrwa	x,a
 439  001b 1a02          	or	a,(OFST+0,sp)
 440  001d 01            	rrwa	x,a
 441  001e 1a01          	or	a,(OFST-1,sp)
 442  0020 01            	rrwa	x,a
 445  0021 5b02          	addw	sp,#2
 446  0023 81            	ret
 471                     ; 89 void UART1_flush(void)
 471                     ; 90 {
 472                     .text:	section	.text,new
 473  0000               _UART1_flush:
 477                     ; 91 	UART1_rxhead = UART1_rxtail;
 479  0000 450100        	mov	_UART1_rxhead,_UART1_rxtail
 480                     ; 92 }
 483  0003 81            	ret
 599                     	xdef	_UART1_flush
 600                     	xdef	_UART1_available
 601                     	xdef	_UART1_puts
 602                     	xdef	_UART1_putc
 603                     	xdef	_UART1_getc
 604                     	xdef	_UART1_config
 605                     	xdef	_UART1_txbuff_mask
 606                     	xdef	_UART1_rxbuff_mask
 607                     	xdef	_UART1_txbuff_size
 608                     	xdef	_UART1_rxbuff_size
 609                     	xdef	_UART1_rxerror
 610                     	xdef	_UART1_txtail
 611                     	xdef	_UART1_txhead
 612                     	xdef	_UART1_rxtail
 613                     	xdef	_UART1_rxhead
 614                     	switch	.ubsct
 615  0000               _UART1_txbuff:
 616  0000 000000000000  	ds.b	64
 617                     	xdef	_UART1_txbuff
 618  0040               _UART1_rxbuff:
 619  0040 000000000000  	ds.b	64
 620                     	xdef	_UART1_rxbuff
 621                     	xref	_UART1_Cmd
 622                     	xref	_UART1_Init
 623                     	xref	_UART1_DeInit
 624                     	xref	_GPIO_Init
 625                     	xref	_CLK_PeripheralClockConfig
 626                     	xref.b	c_x
 646                     	xref	c_smodx
 647                     	end
