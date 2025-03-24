   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  45                     ; 5 void DS1337_config(void)
  45                     ; 6 {
  47                     .text:	section	.text,new
  48  0000               _DS1337_config:
  52                     ; 7 	I2C_sendbyte_reg8(DS1337_ADDRESS, DS1337_CONTROL, 0x00);
  54  0000 4b00          	push	#0
  55  0002 aed00e        	ldw	x,#53262
  56  0005 cd0000        	call	_I2C_sendbyte_reg8
  58  0008 84            	pop	a
  59                     ; 8 }
  62  0009 81            	ret
 168                     ; 11 void DS1337_read_data_time(date_time_t *ds1337)
 168                     ; 12 {
 169                     .text:	section	.text,new
 170  0000               _DS1337_read_data_time:
 172  0000 89            	pushw	x
 173  0001 5208          	subw	sp,#8
 174       00000008      OFST:	set	8
 177                     ; 15 	I2C_readarray_reg8(DS1337_ADDRESS, DS1337_SECONDS, i2c_buff, 7);
 179  0003 4b07          	push	#7
 180  0005 96            	ldw	x,sp
 181  0006 1c0002        	addw	x,#OFST-6
 182  0009 89            	pushw	x
 183  000a 5f            	clrw	x
 184  000b 89            	pushw	x
 185  000c a6d0          	ld	a,#208
 186  000e cd0000        	call	_I2C_readarray_reg8
 188  0011 5b05          	addw	sp,#5
 189                     ; 17 	ds1337->second = BCD2DEC((uint8_t) (i2c_buff[0] & 0x7F));
 191  0013 7b01          	ld	a,(OFST-7,sp)
 192  0015 a47f          	and	a,#127
 193  0017 cd0000        	call	_BCD2DEC
 195  001a 1e09          	ldw	x,(OFST+1,sp)
 196  001c f7            	ld	(x),a
 197                     ; 18 	ds1337->minute = BCD2DEC((uint8_t) (i2c_buff[1] & 0x7F));
 199  001d 7b02          	ld	a,(OFST-6,sp)
 200  001f a47f          	and	a,#127
 201  0021 cd0000        	call	_BCD2DEC
 203  0024 1e09          	ldw	x,(OFST+1,sp)
 204  0026 e701          	ld	(1,x),a
 205                     ; 19 	ds1337->hour 	= BCD2DEC((uint8_t) (i2c_buff[2] & 0x3F));
 207  0028 7b03          	ld	a,(OFST-5,sp)
 208  002a a43f          	and	a,#63
 209  002c cd0000        	call	_BCD2DEC
 211  002f 1e09          	ldw	x,(OFST+1,sp)
 212  0031 e702          	ld	(2,x),a
 213                     ; 20 	ds1337->weekday = BCD2DEC((uint8_t) (i2c_buff[3] & 0x07));
 215  0033 7b04          	ld	a,(OFST-4,sp)
 216  0035 a407          	and	a,#7
 217  0037 cd0000        	call	_BCD2DEC
 219  003a 1e09          	ldw	x,(OFST+1,sp)
 220  003c e703          	ld	(3,x),a
 221                     ; 21 	ds1337->date    = BCD2DEC((uint8_t) (i2c_buff[4] & 0x3F));
 223  003e 7b05          	ld	a,(OFST-3,sp)
 224  0040 a43f          	and	a,#63
 225  0042 cd0000        	call	_BCD2DEC
 227  0045 1e09          	ldw	x,(OFST+1,sp)
 228  0047 e704          	ld	(4,x),a
 229                     ; 22 	ds1337->month   = BCD2DEC((uint8_t) (i2c_buff[5] & 0x1F));
 231  0049 7b06          	ld	a,(OFST-2,sp)
 232  004b a41f          	and	a,#31
 233  004d cd0000        	call	_BCD2DEC
 235  0050 1e09          	ldw	x,(OFST+1,sp)
 236  0052 e705          	ld	(5,x),a
 237                     ; 23 	ds1337->year    = BCD2DEC((uint8_t) (i2c_buff[6] & 0xFF));
 239  0054 7b07          	ld	a,(OFST-1,sp)
 240  0056 cd0000        	call	_BCD2DEC
 242  0059 1e09          	ldw	x,(OFST+1,sp)
 243  005b e706          	ld	(6,x),a
 244                     ; 24 }
 247  005d 5b0a          	addw	sp,#10
 248  005f 81            	ret
 298                     ; 26 void DS1337_write_data_time(date_time_t *ds1337)
 298                     ; 27 {
 299                     .text:	section	.text,new
 300  0000               _DS1337_write_data_time:
 302  0000 89            	pushw	x
 303  0001 5208          	subw	sp,#8
 304       00000008      OFST:	set	8
 307                     ; 30 	i2c_buff[0] = DEC2BCD(ds1337->second);
 309  0003 f6            	ld	a,(x)
 310  0004 cd0000        	call	_DEC2BCD
 312  0007 6b01          	ld	(OFST-7,sp),a
 314                     ; 31 	i2c_buff[1] = DEC2BCD(ds1337->minute);
 316  0009 1e09          	ldw	x,(OFST+1,sp)
 317  000b e601          	ld	a,(1,x)
 318  000d cd0000        	call	_DEC2BCD
 320  0010 6b02          	ld	(OFST-6,sp),a
 322                     ; 32 	i2c_buff[2] = DEC2BCD(ds1337->hour);
 324  0012 1e09          	ldw	x,(OFST+1,sp)
 325  0014 e602          	ld	a,(2,x)
 326  0016 cd0000        	call	_DEC2BCD
 328  0019 6b03          	ld	(OFST-5,sp),a
 330                     ; 33 	i2c_buff[3] = DEC2BCD(ds1337->weekday);
 332  001b 1e09          	ldw	x,(OFST+1,sp)
 333  001d e603          	ld	a,(3,x)
 334  001f cd0000        	call	_DEC2BCD
 336  0022 6b04          	ld	(OFST-4,sp),a
 338                     ; 34 	i2c_buff[4] = DEC2BCD(ds1337->date);
 340  0024 1e09          	ldw	x,(OFST+1,sp)
 341  0026 e604          	ld	a,(4,x)
 342  0028 cd0000        	call	_DEC2BCD
 344  002b 6b05          	ld	(OFST-3,sp),a
 346                     ; 35 	i2c_buff[5] = DEC2BCD(ds1337->month);
 348  002d 1e09          	ldw	x,(OFST+1,sp)
 349  002f e605          	ld	a,(5,x)
 350  0031 cd0000        	call	_DEC2BCD
 352  0034 6b06          	ld	(OFST-2,sp),a
 354                     ; 36 	i2c_buff[6] = DEC2BCD(ds1337->year);
 356  0036 1e09          	ldw	x,(OFST+1,sp)
 357  0038 e606          	ld	a,(6,x)
 358  003a cd0000        	call	_DEC2BCD
 360  003d 6b07          	ld	(OFST-1,sp),a
 362                     ; 38 	I2C_sendarray_reg8(DS1337_ADDRESS, DS1337_SECONDS, i2c_buff, 7);
 364  003f 4b07          	push	#7
 365  0041 96            	ldw	x,sp
 366  0042 1c0002        	addw	x,#OFST-6
 367  0045 89            	pushw	x
 368  0046 aed000        	ldw	x,#53248
 369  0049 cd0000        	call	_I2C_sendarray_reg8
 371  004c 5b03          	addw	sp,#3
 372                     ; 39 }
 375  004e 5b0a          	addw	sp,#10
 376  0050 81            	ret
 389                     	xref	_DEC2BCD
 390                     	xref	_BCD2DEC
 391                     	xref	_I2C_readarray_reg8
 392                     	xref	_I2C_sendarray_reg8
 393                     	xref	_I2C_sendbyte_reg8
 394                     	xdef	_DS1337_write_data_time
 395                     	xdef	_DS1337_read_data_time
 396                     	xdef	_DS1337_config
 415                     	end
