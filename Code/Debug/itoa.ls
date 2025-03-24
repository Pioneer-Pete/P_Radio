   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  75                     ; 8 void swap(char *x, char *y) 
  75                     ; 9 {
  77                     .text:	section	.text,new
  78  0000               _swap:
  80  0000 89            	pushw	x
  81  0001 88            	push	a
  82       00000001      OFST:	set	1
  85                     ; 10 	char t = *x; *x = *y; *y = t;
  87  0002 f6            	ld	a,(x)
  88  0003 6b01          	ld	(OFST+0,sp),a
  92  0005 1e06          	ldw	x,(OFST+5,sp)
  93  0007 f6            	ld	a,(x)
  94  0008 1e02          	ldw	x,(OFST+1,sp)
  95  000a f7            	ld	(x),a
  98  000b 7b01          	ld	a,(OFST+0,sp)
  99  000d 1e06          	ldw	x,(OFST+5,sp)
 100  000f f7            	ld	(x),a
 101                     ; 11 }
 104  0010 5b03          	addw	sp,#3
 105  0012 81            	ret
 160                     ; 14 char* reverse(char *buffer, int16_t i, int16_t j)
 160                     ; 15 {
 161                     .text:	section	.text,new
 162  0000               _reverse:
 164  0000 89            	pushw	x
 165       00000000      OFST:	set	0
 168  0001 201f          	jra	L76
 169  0003               L56:
 170                     ; 17 		swap(&buffer[i++], &buffer[j--]);
 172  0003 1e07          	ldw	x,(OFST+7,sp)
 173  0005 1d0001        	subw	x,#1
 174  0008 1f07          	ldw	(OFST+7,sp),x
 175  000a 1c0001        	addw	x,#1
 176  000d 72fb01        	addw	x,(OFST+1,sp)
 177  0010 89            	pushw	x
 178  0011 1e07          	ldw	x,(OFST+7,sp)
 179  0013 1c0001        	addw	x,#1
 180  0016 1f07          	ldw	(OFST+7,sp),x
 181  0018 1d0001        	subw	x,#1
 182  001b 72fb03        	addw	x,(OFST+3,sp)
 183  001e cd0000        	call	_swap
 185  0021 85            	popw	x
 186  0022               L76:
 187                     ; 16 	while (i < j)
 189  0022 9c            	rvf
 190  0023 1e05          	ldw	x,(OFST+5,sp)
 191  0025 1307          	cpw	x,(OFST+7,sp)
 192  0027 2fda          	jrslt	L56
 193                     ; 19 	return buffer;
 195  0029 1e01          	ldw	x,(OFST+1,sp)
 198  002b 5b02          	addw	sp,#2
 199  002d 81            	ret
 282                     ; 23 char* itoa(int16_t value, char* buffer, int16_t base)	//Iterative function to implement itoa() function in C
 282                     ; 24 {
 283                     .text:	section	.text,new
 284  0000               _itoa:
 286  0000 89            	pushw	x
 287  0001 5206          	subw	sp,#6
 288       00000006      OFST:	set	6
 291                     ; 27 	if (base < 2 || base > 32)	return buffer;			// invalid input
 293  0003 9c            	rvf
 294  0004 1e0d          	ldw	x,(OFST+7,sp)
 295  0006 a30002        	cpw	x,#2
 296  0009 2f08          	jrslt	L731
 298  000b 9c            	rvf
 299  000c 1e0d          	ldw	x,(OFST+7,sp)
 300  000e a30021        	cpw	x,#33
 301  0011 2f06          	jrslt	L531
 302  0013               L731:
 305  0013 1e0b          	ldw	x,(OFST+5,sp)
 307  0015 acad00ad      	jpf	L21
 308  0019               L531:
 309                     ; 28 	n = abs(value);										// consider absolute value of number
 311  0019 1e07          	ldw	x,(OFST+1,sp)
 312  001b cd0000        	call	_abs
 314  001e 1f05          	ldw	(OFST-1,sp),x
 316                     ; 30 	i = 0;
 318  0020 5f            	clrw	x
 319  0021 1f01          	ldw	(OFST-5,sp),x
 322  0023 2041          	jra	L541
 323  0025               L141:
 324                     ; 33 		r = n % base;
 326  0025 1e05          	ldw	x,(OFST-1,sp)
 327  0027 160d          	ldw	y,(OFST+7,sp)
 328  0029 cd0000        	call	c_idiv
 330  002c 51            	exgw	x,y
 331  002d 1f03          	ldw	(OFST-3,sp),x
 333                     ; 34 		if (r >= 10) buffer[i++] = (char) (65 + (r - 10));
 335  002f 9c            	rvf
 336  0030 1e03          	ldw	x,(OFST-3,sp)
 337  0032 a3000a        	cpw	x,#10
 338  0035 2f14          	jrslt	L151
 341  0037 7b04          	ld	a,(OFST-2,sp)
 342  0039 ab37          	add	a,#55
 343  003b 1e01          	ldw	x,(OFST-5,sp)
 344  003d 1c0001        	addw	x,#1
 345  0040 1f01          	ldw	(OFST-5,sp),x
 346  0042 1d0001        	subw	x,#1
 348  0045 72fb0b        	addw	x,(OFST+5,sp)
 349  0048 f7            	ld	(x),a
 351  0049 2012          	jra	L351
 352  004b               L151:
 353                     ; 35 		else buffer[i++] = (char) (48 + r);
 355  004b 7b04          	ld	a,(OFST-2,sp)
 356  004d ab30          	add	a,#48
 357  004f 1e01          	ldw	x,(OFST-5,sp)
 358  0051 1c0001        	addw	x,#1
 359  0054 1f01          	ldw	(OFST-5,sp),x
 360  0056 1d0001        	subw	x,#1
 362  0059 72fb0b        	addw	x,(OFST+5,sp)
 363  005c f7            	ld	(x),a
 364  005d               L351:
 365                     ; 36 		n = n / base;
 367  005d 1e05          	ldw	x,(OFST-1,sp)
 368  005f 160d          	ldw	y,(OFST+7,sp)
 369  0061 cd0000        	call	c_idiv
 371  0064 1f05          	ldw	(OFST-1,sp),x
 373  0066               L541:
 374                     ; 31 	while (n)
 376  0066 1e05          	ldw	x,(OFST-1,sp)
 377  0068 26bb          	jrne	L141
 378                     ; 38 	if (i == 0) buffer[i++] = '0';
 380  006a 1e01          	ldw	x,(OFST-5,sp)
 381  006c 2610          	jrne	L551
 384  006e 1e01          	ldw	x,(OFST-5,sp)
 385  0070 1c0001        	addw	x,#1
 386  0073 1f01          	ldw	(OFST-5,sp),x
 387  0075 1d0001        	subw	x,#1
 389  0078 72fb0b        	addw	x,(OFST+5,sp)
 390  007b a630          	ld	a,#48
 391  007d f7            	ld	(x),a
 392  007e               L551:
 393                     ; 43 	if (value < 0 && base == 10) buffer[i++] = '-';
 395  007e 9c            	rvf
 396  007f 1e07          	ldw	x,(OFST+1,sp)
 397  0081 2e17          	jrsge	L751
 399  0083 1e0d          	ldw	x,(OFST+7,sp)
 400  0085 a3000a        	cpw	x,#10
 401  0088 2610          	jrne	L751
 404  008a 1e01          	ldw	x,(OFST-5,sp)
 405  008c 1c0001        	addw	x,#1
 406  008f 1f01          	ldw	(OFST-5,sp),x
 407  0091 1d0001        	subw	x,#1
 409  0094 72fb0b        	addw	x,(OFST+5,sp)
 410  0097 a62d          	ld	a,#45
 411  0099 f7            	ld	(x),a
 412  009a               L751:
 413                     ; 44 	buffer[i] = '\0'; 									// null terminate string
 415  009a 1e01          	ldw	x,(OFST-5,sp)
 416  009c 72fb0b        	addw	x,(OFST+5,sp)
 417  009f 7f            	clr	(x)
 418                     ; 46 	return reverse(buffer, 0, i - 1);					// reverse the string and return it
 420  00a0 1e01          	ldw	x,(OFST-5,sp)
 421  00a2 5a            	decw	x
 422  00a3 89            	pushw	x
 423  00a4 5f            	clrw	x
 424  00a5 89            	pushw	x
 425  00a6 1e0f          	ldw	x,(OFST+9,sp)
 426  00a8 cd0000        	call	_reverse
 428  00ab 5b04          	addw	sp,#4
 430  00ad               L21:
 432  00ad 5b08          	addw	sp,#8
 433  00af 81            	ret
 446                     	xdef	_reverse
 447                     	xdef	_swap
 448                     	xdef	_itoa
 449                     	xref	_abs
 468                     	xref	c_idiv
 469                     	end
