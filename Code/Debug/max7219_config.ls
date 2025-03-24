   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  46                     ; 4 void MAX7219_config(void)
  46                     ; 5 {
  48                     .text:	section	.text,new
  49  0000               _MAX7219_config:
  53                     ; 6 	DELAY_ms(100);			//MAX7219 needs some time after power on
  55  0000 ae0064        	ldw	x,#100
  56  0003 89            	pushw	x
  57  0004 ae0000        	ldw	x,#0
  58  0007 89            	pushw	x
  59  0008 cd0000        	call	_DELAY_ms
  61  000b 5b04          	addw	sp,#4
  62                     ; 8 	SPI_sendword(0x0000);	//nop
  64  000d 5f            	clrw	x
  65  000e cd0000        	call	_SPI_sendword
  67                     ; 9 	SPI_sendword(0x0C00);	//shutdown
  69  0011 ae0c00        	ldw	x,#3072
  70  0014 cd0000        	call	_SPI_sendword
  72                     ; 10 	SPI_sendword(0x0000);	//nop
  74  0017 5f            	clrw	x
  75  0018 cd0000        	call	_SPI_sendword
  77                     ; 12 	SPI_sendword(0x0F00);	//testmode off
  79  001b ae0f00        	ldw	x,#3840
  80  001e cd0000        	call	_SPI_sendword
  82                     ; 13 	SPI_sendword(0x0C01);	//normal operation
  84  0021 ae0c01        	ldw	x,#3073
  85  0024 cd0000        	call	_SPI_sendword
  87                     ; 14 	SPI_sendword(0x09FF);	//bcd code B, all digits
  89  0027 ae09ff        	ldw	x,#2559
  90  002a cd0000        	call	_SPI_sendword
  92                     ; 15 	SPI_sendword(0x0A02);	//brightness
  94  002d ae0a02        	ldw	x,#2562
  95  0030 cd0000        	call	_SPI_sendword
  97                     ; 16 	SPI_sendword(0x0B07);	//all digits
  99  0033 ae0b07        	ldw	x,#2823
 100  0036 cd0000        	call	_SPI_sendword
 102                     ; 18 	SPI_sendword(0x0100);	//digit1 = 0
 104  0039 ae0100        	ldw	x,#256
 105  003c cd0000        	call	_SPI_sendword
 107                     ; 19 	SPI_sendword(0x0200);	//digit2 = 0
 109  003f ae0200        	ldw	x,#512
 110  0042 cd0000        	call	_SPI_sendword
 112                     ; 20 	SPI_sendword(0x0300);	//digit3 = 0
 114  0045 ae0300        	ldw	x,#768
 115  0048 cd0000        	call	_SPI_sendword
 117                     ; 21 	SPI_sendword(0x0400);	//digit4 = 0
 119  004b ae0400        	ldw	x,#1024
 120  004e cd0000        	call	_SPI_sendword
 122                     ; 22 	SPI_sendword(0x0500);	//digit5 = 0
 124  0051 ae0500        	ldw	x,#1280
 125  0054 cd0000        	call	_SPI_sendword
 127                     ; 23 	SPI_sendword(0x0600);	//digit6 = 0
 129  0057 ae0600        	ldw	x,#1536
 130  005a cd0000        	call	_SPI_sendword
 132                     ; 24 	SPI_sendword(0x0700);	//digit7 = 0
 134  005d ae0700        	ldw	x,#1792
 135  0060 cd0000        	call	_SPI_sendword
 137                     ; 25 	SPI_sendword(0x0800);	//digit8 = 0
 139  0063 ae0800        	ldw	x,#2048
 140  0066 cd0000        	call	_SPI_sendword
 142                     ; 27 }
 145  0069 81            	ret
 207                     .const:	section	.text
 208  0000               L01:
 209  0000 0000000a      	dc.l	10
 210                     ; 29 void MAX7219_shownumber(uint32_t number, uint8_t decimal_point)
 210                     ; 30 {
 211                     .text:	section	.text,new
 212  0000               _MAX7219_shownumber:
 214  0000 5209          	subw	sp,#9
 215       00000009      OFST:	set	9
 218                     ; 34 	tmp = number;
 220  0002 1e0e          	ldw	x,(OFST+5,sp)
 221  0004 1f07          	ldw	(OFST-2,sp),x
 222  0006 1e0c          	ldw	x,(OFST+3,sp)
 223  0008 1f05          	ldw	(OFST-4,sp),x
 225                     ; 35 	for (i=1; i<9; i++)
 227  000a a601          	ld	a,#1
 228  000c 6b09          	ld	(OFST+0,sp),a
 230  000e               L35:
 231                     ; 37 		if (i == decimal_point) SPI_sendword((uint16_t) ((i << 8) | ((tmp % 10) | 0x80)));
 233  000e 7b09          	ld	a,(OFST+0,sp)
 234  0010 1110          	cp	a,(OFST+7,sp)
 235  0012 262f          	jrne	L16
 238  0014 96            	ldw	x,sp
 239  0015 1c0005        	addw	x,#OFST-4
 240  0018 cd0000        	call	c_ltor
 242  001b ae0000        	ldw	x,#L01
 243  001e cd0000        	call	c_lumd
 245  0021 721e0003      	bset	c_lreg+3,#7
 246  0025 96            	ldw	x,sp
 247  0026 1c0001        	addw	x,#OFST-8
 248  0029 cd0000        	call	c_rtol
 251  002c 7b09          	ld	a,(OFST+0,sp)
 252  002e 5f            	clrw	x
 253  002f 97            	ld	xl,a
 254  0030 4f            	clr	a
 255  0031 02            	rlwa	x,a
 256  0032 cd0000        	call	c_itolx
 258  0035 96            	ldw	x,sp
 259  0036 1c0001        	addw	x,#OFST-8
 260  0039 cd0000        	call	c_lor
 262  003c be02          	ldw	x,c_lreg+2
 263  003e cd0000        	call	_SPI_sendword
 266  0041 2029          	jra	L36
 267  0043               L16:
 268                     ; 38 		else SPI_sendword((uint16_t) ((i << 8) | (tmp % 10)));
 270  0043 96            	ldw	x,sp
 271  0044 1c0005        	addw	x,#OFST-4
 272  0047 cd0000        	call	c_ltor
 274  004a ae0000        	ldw	x,#L01
 275  004d cd0000        	call	c_lumd
 277  0050 96            	ldw	x,sp
 278  0051 1c0001        	addw	x,#OFST-8
 279  0054 cd0000        	call	c_rtol
 282  0057 7b09          	ld	a,(OFST+0,sp)
 283  0059 5f            	clrw	x
 284  005a 97            	ld	xl,a
 285  005b 4f            	clr	a
 286  005c 02            	rlwa	x,a
 287  005d cd0000        	call	c_itolx
 289  0060 96            	ldw	x,sp
 290  0061 1c0001        	addw	x,#OFST-8
 291  0064 cd0000        	call	c_lor
 293  0067 be02          	ldw	x,c_lreg+2
 294  0069 cd0000        	call	_SPI_sendword
 296  006c               L36:
 297                     ; 40 		tmp /= 10;
 299  006c 96            	ldw	x,sp
 300  006d 1c0005        	addw	x,#OFST-4
 301  0070 cd0000        	call	c_ltor
 303  0073 ae0000        	ldw	x,#L01
 304  0076 cd0000        	call	c_ludv
 306  0079 96            	ldw	x,sp
 307  007a 1c0005        	addw	x,#OFST-4
 308  007d cd0000        	call	c_rtol
 311                     ; 35 	for (i=1; i<9; i++)
 313  0080 0c09          	inc	(OFST+0,sp)
 317  0082 7b09          	ld	a,(OFST+0,sp)
 318  0084 a109          	cp	a,#9
 319  0086 2402          	jruge	L21
 320  0088 2084          	jp	L35
 321  008a               L21:
 322                     ; 42 }
 325  008a 5b09          	addw	sp,#9
 326  008c 81            	ret
 361                     ; 44 void MAX7219_brightness(uint8_t brightness)
 361                     ; 45 {
 362                     .text:	section	.text,new
 363  0000               _MAX7219_brightness:
 365  0000 88            	push	a
 366       00000000      OFST:	set	0
 369                     ; 46 	if ((brightness < 1) || (brightness > 15)) brightness = 2;
 371  0001 4d            	tnz	a
 372  0002 2704          	jreq	L501
 374  0004 a110          	cp	a,#16
 375  0006 2504          	jrult	L301
 376  0008               L501:
 379  0008 a602          	ld	a,#2
 380  000a 6b01          	ld	(OFST+1,sp),a
 381  000c               L301:
 382                     ; 47 	SPI_sendword(0x0A00 | brightness);
 384  000c 7b01          	ld	a,(OFST+1,sp)
 385  000e 5f            	clrw	x
 386  000f 97            	ld	xl,a
 387  0010 01            	rrwa	x,a
 388  0011 aa00          	or	a,#0
 389  0013 01            	rrwa	x,a
 390  0014 aa0a          	or	a,#10
 391  0016 01            	rrwa	x,a
 392  0017 cd0000        	call	_SPI_sendword
 394                     ; 48 }
 397  001a 84            	pop	a
 398  001b 81            	ret
 411                     	xdef	_MAX7219_brightness
 412                     	xdef	_MAX7219_shownumber
 413                     	xdef	_MAX7219_config
 414                     	xref	_DELAY_ms
 415                     	xref	_SPI_sendword
 416                     	xref.b	c_lreg
 417                     	xref.b	c_x
 436                     	xref	c_ludv
 437                     	xref	c_lor
 438                     	xref	c_rtol
 439                     	xref	c_lumd
 440                     	xref	c_ltor
 441                     	xref	c_itolx
 442                     	end
