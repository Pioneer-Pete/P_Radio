   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  55                     ; 4 uint8_t BCD2DEC(uint8_t bcd)
  55                     ; 5 {
  57                     .text:	section	.text,new
  58  0000               _BCD2DEC:
  60  0000 88            	push	a
  61  0001 88            	push	a
  62       00000001      OFST:	set	1
  65                     ; 6 	return (uint8_t) ((uint8_t) (bcd & 0xF) + ((uint8_t) (bcd >> 4) * 10));
  67  0002 4e            	swap	a
  68  0003 a40f          	and	a,#15
  69  0005 97            	ld	xl,a
  70  0006 a60a          	ld	a,#10
  71  0008 42            	mul	x,a
  72  0009 9f            	ld	a,xl
  73  000a 6b01          	ld	(OFST+0,sp),a
  75  000c 7b02          	ld	a,(OFST+1,sp)
  76  000e a40f          	and	a,#15
  77  0010 1b01          	add	a,(OFST+0,sp)
  80  0012 85            	popw	x
  81  0013 81            	ret
 115                     ; 9 uint8_t DEC2BCD(uint8_t dec) 
 115                     ; 10 {
 116                     .text:	section	.text,new
 117  0000               _DEC2BCD:
 119  0000 88            	push	a
 120  0001 88            	push	a
 121       00000001      OFST:	set	1
 124                     ; 11 	return (uint8_t) ((uint8_t) (dec % 10) | ((uint8_t) (dec / 10) << 4));
 126  0002 5f            	clrw	x
 127  0003 97            	ld	xl,a
 128  0004 a60a          	ld	a,#10
 129  0006 62            	div	x,a
 130  0007 9f            	ld	a,xl
 131  0008 97            	ld	xl,a
 132  0009 a610          	ld	a,#16
 133  000b 42            	mul	x,a
 134  000c 9f            	ld	a,xl
 135  000d 6b01          	ld	(OFST+0,sp),a
 137  000f 7b02          	ld	a,(OFST+1,sp)
 138  0011 5f            	clrw	x
 139  0012 97            	ld	xl,a
 140  0013 a60a          	ld	a,#10
 141  0015 62            	div	x,a
 142  0016 5f            	clrw	x
 143  0017 97            	ld	xl,a
 144  0018 9f            	ld	a,xl
 145  0019 1a01          	or	a,(OFST+0,sp)
 148  001b 85            	popw	x
 149  001c 81            	ret
 162                     	xdef	_DEC2BCD
 163                     	xdef	_BCD2DEC
 182                     	end
