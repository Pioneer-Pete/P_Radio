   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  45                     ; 7 void PCF8563_config(void)
  45                     ; 8 {
  47                     .text:	section	.text,new
  48  0000               _PCF8563_config:
  52                     ; 9 	I2C_sendbyte_reg8(PCF8563_ADDRESS, PCF8563_CONTROL1, 0x00);
  54  0000 4b00          	push	#0
  55  0002 aea200        	ldw	x,#41472
  56  0005 cd0000        	call	_I2C_sendbyte_reg8
  58  0008 84            	pop	a
  59                     ; 10 	I2C_sendbyte_reg8(PCF8563_ADDRESS, PCF8563_CONTROL2, 0x00);
  61  0009 4b00          	push	#0
  62  000b aea201        	ldw	x,#41473
  63  000e cd0000        	call	_I2C_sendbyte_reg8
  65  0011 84            	pop	a
  66                     ; 11 }
  69  0012 81            	ret
 175                     ; 14 void PCF8563_read_data_time(date_time_t *pcf8563_ptr)
 175                     ; 15 {
 176                     .text:	section	.text,new
 177  0000               _PCF8563_read_data_time:
 179  0000 89            	pushw	x
 180  0001 5208          	subw	sp,#8
 181       00000008      OFST:	set	8
 184                     ; 18 	I2C_readarray_reg8(PCF8563_ADDRESS, PCF8563_SECONDS, i2c_buff, 7);
 186  0003 4b07          	push	#7
 187  0005 96            	ldw	x,sp
 188  0006 1c0002        	addw	x,#OFST-6
 189  0009 89            	pushw	x
 190  000a ae0002        	ldw	x,#2
 191  000d 89            	pushw	x
 192  000e a6a2          	ld	a,#162
 193  0010 cd0000        	call	_I2C_readarray_reg8
 195  0013 5b05          	addw	sp,#5
 196                     ; 20 	pcf8563_ptr->second  = BCD2DEC((uint8_t) (i2c_buff[0] & 0x7F));
 198  0015 7b01          	ld	a,(OFST-7,sp)
 199  0017 a47f          	and	a,#127
 200  0019 cd0000        	call	_BCD2DEC
 202  001c 1e09          	ldw	x,(OFST+1,sp)
 203  001e f7            	ld	(x),a
 204                     ; 21 	pcf8563_ptr->minute  = BCD2DEC((uint8_t) (i2c_buff[1] & 0x7F));
 206  001f 7b02          	ld	a,(OFST-6,sp)
 207  0021 a47f          	and	a,#127
 208  0023 cd0000        	call	_BCD2DEC
 210  0026 1e09          	ldw	x,(OFST+1,sp)
 211  0028 e701          	ld	(1,x),a
 212                     ; 22 	pcf8563_ptr->hour    = BCD2DEC((uint8_t) (i2c_buff[2] & 0x3F));
 214  002a 7b03          	ld	a,(OFST-5,sp)
 215  002c a43f          	and	a,#63
 216  002e cd0000        	call	_BCD2DEC
 218  0031 1e09          	ldw	x,(OFST+1,sp)
 219  0033 e702          	ld	(2,x),a
 220                     ; 23 	pcf8563_ptr->date    = BCD2DEC((uint8_t) (i2c_buff[3] & 0x3F));
 222  0035 7b04          	ld	a,(OFST-4,sp)
 223  0037 a43f          	and	a,#63
 224  0039 cd0000        	call	_BCD2DEC
 226  003c 1e09          	ldw	x,(OFST+1,sp)
 227  003e e703          	ld	(3,x),a
 228                     ; 24 	pcf8563_ptr->weekday =         (uint8_t) (i2c_buff[4] & 0x03);
 230  0040 7b05          	ld	a,(OFST-3,sp)
 231  0042 a403          	and	a,#3
 232  0044 1e09          	ldw	x,(OFST+1,sp)
 233  0046 e704          	ld	(4,x),a
 234                     ; 25 	pcf8563_ptr->month   = BCD2DEC((uint8_t) (i2c_buff[5] & 0x1F));
 236  0048 7b06          	ld	a,(OFST-2,sp)
 237  004a a41f          	and	a,#31
 238  004c cd0000        	call	_BCD2DEC
 240  004f 1e09          	ldw	x,(OFST+1,sp)
 241  0051 e705          	ld	(5,x),a
 242                     ; 26 	pcf8563_ptr->year    = BCD2DEC((uint8_t) (i2c_buff[6] & 0xFF));
 244  0053 7b07          	ld	a,(OFST-1,sp)
 245  0055 cd0000        	call	_BCD2DEC
 247  0058 1e09          	ldw	x,(OFST+1,sp)
 248  005a e706          	ld	(6,x),a
 249                     ; 27 }
 252  005c 5b0a          	addw	sp,#10
 253  005e 81            	ret
 303                     ; 29 void PCF8563_write_data_time(date_time_t *pcf8563_ptr)
 303                     ; 30 {
 304                     .text:	section	.text,new
 305  0000               _PCF8563_write_data_time:
 307  0000 89            	pushw	x
 308  0001 5208          	subw	sp,#8
 309       00000008      OFST:	set	8
 312                     ; 33 	i2c_buff[0] = DEC2BCD(pcf8563_ptr->second);
 314  0003 f6            	ld	a,(x)
 315  0004 cd0000        	call	_DEC2BCD
 317  0007 6b01          	ld	(OFST-7,sp),a
 319                     ; 34 	i2c_buff[1] = DEC2BCD(pcf8563_ptr->minute);
 321  0009 1e09          	ldw	x,(OFST+1,sp)
 322  000b e601          	ld	a,(1,x)
 323  000d cd0000        	call	_DEC2BCD
 325  0010 6b02          	ld	(OFST-6,sp),a
 327                     ; 35 	i2c_buff[2] = DEC2BCD(pcf8563_ptr->hour);
 329  0012 1e09          	ldw	x,(OFST+1,sp)
 330  0014 e602          	ld	a,(2,x)
 331  0016 cd0000        	call	_DEC2BCD
 333  0019 6b03          	ld	(OFST-5,sp),a
 335                     ; 36 	i2c_buff[3] = pcf8563_ptr->date;
 337  001b 1e09          	ldw	x,(OFST+1,sp)
 338  001d e603          	ld	a,(3,x)
 339  001f 6b04          	ld	(OFST-4,sp),a
 341                     ; 37 	i2c_buff[4] = DEC2BCD(pcf8563_ptr->weekday);
 343  0021 1e09          	ldw	x,(OFST+1,sp)
 344  0023 e604          	ld	a,(4,x)
 345  0025 cd0000        	call	_DEC2BCD
 347  0028 6b05          	ld	(OFST-3,sp),a
 349                     ; 38 	i2c_buff[5] = DEC2BCD(pcf8563_ptr->month);
 351  002a 1e09          	ldw	x,(OFST+1,sp)
 352  002c e605          	ld	a,(5,x)
 353  002e cd0000        	call	_DEC2BCD
 355  0031 6b06          	ld	(OFST-2,sp),a
 357                     ; 39 	i2c_buff[6] = DEC2BCD(pcf8563_ptr->year);
 359  0033 1e09          	ldw	x,(OFST+1,sp)
 360  0035 e606          	ld	a,(6,x)
 361  0037 cd0000        	call	_DEC2BCD
 363  003a 6b07          	ld	(OFST-1,sp),a
 365                     ; 42 	I2C_sendarray_reg8(PCF8563_ADDRESS, PCF8563_SECONDS, i2c_buff, 7);
 367  003c 4b07          	push	#7
 368  003e 96            	ldw	x,sp
 369  003f 1c0002        	addw	x,#OFST-6
 370  0042 89            	pushw	x
 371  0043 aea202        	ldw	x,#41474
 372  0046 cd0000        	call	_I2C_sendarray_reg8
 374  0049 5b03          	addw	sp,#3
 375                     ; 43 }
 378  004b 5b0a          	addw	sp,#10
 379  004d 81            	ret
 392                     	xref	_DEC2BCD
 393                     	xref	_BCD2DEC
 394                     	xref	_I2C_readarray_reg8
 395                     	xref	_I2C_sendarray_reg8
 396                     	xref	_I2C_sendbyte_reg8
 397                     	xdef	_PCF8563_write_data_time
 398                     	xdef	_PCF8563_read_data_time
 399                     	xdef	_PCF8563_config
 418                     	end
