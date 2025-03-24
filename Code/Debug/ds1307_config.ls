   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  57                     ; 7 void DS1307_config(void)
  57                     ; 8 {
  59                     .text:	section	.text,new
  60  0000               _DS1307_config:
  62  0000 88            	push	a
  63       00000001      OFST:	set	1
  66                     ; 11 	oscillator = I2C_readbyte_reg8(DS1307_ADDRESS, DS1307_SECONDS);	//read oscillator status
  68  0001 aed000        	ldw	x,#53248
  69  0004 cd0000        	call	_I2C_readbyte_reg8
  71  0007 6b01          	ld	(OFST+0,sp),a
  73                     ; 12 	if (oscillator & 0x80) 											//if NOT running
  75  0009 7b01          	ld	a,(OFST+0,sp)
  76  000b a580          	bcp	a,#128
  77  000d 2709          	jreq	L72
  78                     ; 14 		I2C_sendbyte_reg8(DS1307_ADDRESS, DS1307_SECONDS, 0x00);	//send startbit
  80  000f 4b00          	push	#0
  81  0011 aed000        	ldw	x,#53248
  82  0014 cd0000        	call	_I2C_sendbyte_reg8
  84  0017 84            	pop	a
  85  0018               L72:
  86                     ; 17 	I2C_sendbyte_reg8(DS1307_ADDRESS, DS1307_CONTROL, 0x10);
  88  0018 4b10          	push	#16
  89  001a aed007        	ldw	x,#53255
  90  001d cd0000        	call	_I2C_sendbyte_reg8
  92  0020 84            	pop	a
  93                     ; 18 }
  96  0021 84            	pop	a
  97  0022 81            	ret
 203                     ; 21 void DS1307_read_data_time(date_time_t *ds1307)
 203                     ; 22 {
 204                     .text:	section	.text,new
 205  0000               _DS1307_read_data_time:
 207  0000 89            	pushw	x
 208  0001 5208          	subw	sp,#8
 209       00000008      OFST:	set	8
 212                     ; 25 	I2C_readarray_reg8(DS1307_ADDRESS, DS1307_SECONDS, i2c_buff, 7);
 214  0003 4b07          	push	#7
 215  0005 96            	ldw	x,sp
 216  0006 1c0002        	addw	x,#OFST-6
 217  0009 89            	pushw	x
 218  000a 5f            	clrw	x
 219  000b 89            	pushw	x
 220  000c a6d0          	ld	a,#208
 221  000e cd0000        	call	_I2C_readarray_reg8
 223  0011 5b05          	addw	sp,#5
 224                     ; 27 	ds1307->second = BCD2DEC((uint8_t) (i2c_buff[0] & 0x7F));
 226  0013 7b01          	ld	a,(OFST-7,sp)
 227  0015 a47f          	and	a,#127
 228  0017 cd0000        	call	_BCD2DEC
 230  001a 1e09          	ldw	x,(OFST+1,sp)
 231  001c f7            	ld	(x),a
 232                     ; 28 	ds1307->minute = BCD2DEC((uint8_t) (i2c_buff[1] & 0x7F));
 234  001d 7b02          	ld	a,(OFST-6,sp)
 235  001f a47f          	and	a,#127
 236  0021 cd0000        	call	_BCD2DEC
 238  0024 1e09          	ldw	x,(OFST+1,sp)
 239  0026 e701          	ld	(1,x),a
 240                     ; 29 	ds1307->hour 	= BCD2DEC((uint8_t) (i2c_buff[2] & 0x3F));
 242  0028 7b03          	ld	a,(OFST-5,sp)
 243  002a a43f          	and	a,#63
 244  002c cd0000        	call	_BCD2DEC
 246  002f 1e09          	ldw	x,(OFST+1,sp)
 247  0031 e702          	ld	(2,x),a
 248                     ; 30 	ds1307->weekday = BCD2DEC((uint8_t) (i2c_buff[3] & 0x07));
 250  0033 7b04          	ld	a,(OFST-4,sp)
 251  0035 a407          	and	a,#7
 252  0037 cd0000        	call	_BCD2DEC
 254  003a 1e09          	ldw	x,(OFST+1,sp)
 255  003c e703          	ld	(3,x),a
 256                     ; 31 	ds1307->date    = BCD2DEC((uint8_t) (i2c_buff[4] & 0x3F));
 258  003e 7b05          	ld	a,(OFST-3,sp)
 259  0040 a43f          	and	a,#63
 260  0042 cd0000        	call	_BCD2DEC
 262  0045 1e09          	ldw	x,(OFST+1,sp)
 263  0047 e704          	ld	(4,x),a
 264                     ; 32 	ds1307->month   = BCD2DEC((uint8_t) (i2c_buff[5] & 0x1F));
 266  0049 7b06          	ld	a,(OFST-2,sp)
 267  004b a41f          	and	a,#31
 268  004d cd0000        	call	_BCD2DEC
 270  0050 1e09          	ldw	x,(OFST+1,sp)
 271  0052 e705          	ld	(5,x),a
 272                     ; 33 	ds1307->year    = BCD2DEC((uint8_t) (i2c_buff[6] & 0xFF));
 274  0054 7b07          	ld	a,(OFST-1,sp)
 275  0056 cd0000        	call	_BCD2DEC
 277  0059 1e09          	ldw	x,(OFST+1,sp)
 278  005b e706          	ld	(6,x),a
 279                     ; 34 }
 282  005d 5b0a          	addw	sp,#10
 283  005f 81            	ret
 333                     ; 36 void DS1307_write_data_time(date_time_t *ds1307)
 333                     ; 37 {
 334                     .text:	section	.text,new
 335  0000               _DS1307_write_data_time:
 337  0000 89            	pushw	x
 338  0001 5208          	subw	sp,#8
 339       00000008      OFST:	set	8
 342                     ; 40 	i2c_buff[0] = DEC2BCD(ds1307->second);
 344  0003 f6            	ld	a,(x)
 345  0004 cd0000        	call	_DEC2BCD
 347  0007 6b01          	ld	(OFST-7,sp),a
 349                     ; 41 	i2c_buff[1] = DEC2BCD(ds1307->minute);
 351  0009 1e09          	ldw	x,(OFST+1,sp)
 352  000b e601          	ld	a,(1,x)
 353  000d cd0000        	call	_DEC2BCD
 355  0010 6b02          	ld	(OFST-6,sp),a
 357                     ; 42 	i2c_buff[2] = DEC2BCD(ds1307->hour);
 359  0012 1e09          	ldw	x,(OFST+1,sp)
 360  0014 e602          	ld	a,(2,x)
 361  0016 cd0000        	call	_DEC2BCD
 363  0019 6b03          	ld	(OFST-5,sp),a
 365                     ; 43 	i2c_buff[3] = DEC2BCD(ds1307->weekday);
 367  001b 1e09          	ldw	x,(OFST+1,sp)
 368  001d e603          	ld	a,(3,x)
 369  001f cd0000        	call	_DEC2BCD
 371  0022 6b04          	ld	(OFST-4,sp),a
 373                     ; 44 	i2c_buff[4] = DEC2BCD(ds1307->date);
 375  0024 1e09          	ldw	x,(OFST+1,sp)
 376  0026 e604          	ld	a,(4,x)
 377  0028 cd0000        	call	_DEC2BCD
 379  002b 6b05          	ld	(OFST-3,sp),a
 381                     ; 45 	i2c_buff[5] = DEC2BCD(ds1307->month);
 383  002d 1e09          	ldw	x,(OFST+1,sp)
 384  002f e605          	ld	a,(5,x)
 385  0031 cd0000        	call	_DEC2BCD
 387  0034 6b06          	ld	(OFST-2,sp),a
 389                     ; 46 	i2c_buff[6] = DEC2BCD(ds1307->year);
 391  0036 1e09          	ldw	x,(OFST+1,sp)
 392  0038 e606          	ld	a,(6,x)
 393  003a cd0000        	call	_DEC2BCD
 395  003d 6b07          	ld	(OFST-1,sp),a
 397                     ; 49 	I2C_sendarray_reg8(DS1307_ADDRESS, DS1307_SECONDS, i2c_buff, 7);
 399  003f 4b07          	push	#7
 400  0041 96            	ldw	x,sp
 401  0042 1c0002        	addw	x,#OFST-6
 402  0045 89            	pushw	x
 403  0046 aed000        	ldw	x,#53248
 404  0049 cd0000        	call	_I2C_sendarray_reg8
 406  004c 5b03          	addw	sp,#3
 407                     ; 50 }
 410  004e 5b0a          	addw	sp,#10
 411  0050 81            	ret
 424                     	xref	_DEC2BCD
 425                     	xref	_BCD2DEC
 426                     	xref	_I2C_readarray_reg8
 427                     	xref	_I2C_sendarray_reg8
 428                     	xref	_I2C_readbyte_reg8
 429                     	xref	_I2C_sendbyte_reg8
 430                     	xdef	_DS1307_write_data_time
 431                     	xdef	_DS1307_read_data_time
 432                     	xdef	_DS1307_config
 451                     	end
