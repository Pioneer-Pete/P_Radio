   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  16                     .const:	section	.text
  17  0000               _APR_Array:
  18  0000 00            	dc.b	0
  19  0001 1e            	dc.b	30
  20  0002 1e            	dc.b	30
  21  0003 1e            	dc.b	30
  22  0004 1e            	dc.b	30
  23  0005 1e            	dc.b	30
  24  0006 1e            	dc.b	30
  25  0007 1e            	dc.b	30
  26  0008 1e            	dc.b	30
  27  0009 1e            	dc.b	30
  28  000a 1e            	dc.b	30
  29  000b 1e            	dc.b	30
  30  000c 1e            	dc.b	30
  31  000d 3d            	dc.b	61
  32  000e 17            	dc.b	23
  33  000f 17            	dc.b	23
  34  0010 3e            	dc.b	62
  35  0011               _TBR_Array:
  36  0011 00            	dc.b	0
  37  0012 01            	dc.b	1
  38  0013 02            	dc.b	2
  39  0014 03            	dc.b	3
  40  0015 04            	dc.b	4
  41  0016 05            	dc.b	5
  42  0017 06            	dc.b	6
  43  0018 07            	dc.b	7
  44  0019 08            	dc.b	8
  45  001a 09            	dc.b	9
  46  001b 0a            	dc.b	10
  47  001c 0b            	dc.b	11
  48  001d 0c            	dc.b	12
  49  001e 0c            	dc.b	12
  50  001f 0e            	dc.b	14
  51  0020 0f            	dc.b	15
  52  0021 0f            	dc.b	15
  81                     ; 73 void AWU_DeInit(void)
  81                     ; 74 {
  83                     .text:	section	.text,new
  84  0000               _AWU_DeInit:
  88                     ; 75   AWU->CSR = AWU_CSR_RESET_VALUE;
  90  0000 725f50f0      	clr	20720
  91                     ; 76   AWU->APR = AWU_APR_RESET_VALUE;
  93  0004 353f50f1      	mov	20721,#63
  94                     ; 77   AWU->TBR = AWU_TBR_RESET_VALUE;
  96  0008 725f50f2      	clr	20722
  97                     ; 78 }
 100  000c 81            	ret
 262                     ; 88 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 262                     ; 89 {
 263                     .text:	section	.text,new
 264  0000               _AWU_Init:
 266  0000 88            	push	a
 267       00000000      OFST:	set	0
 270                     ; 91   assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
 272                     ; 94   AWU->CSR |= AWU_CSR_AWUEN;
 274  0001 721850f0      	bset	20720,#4
 275                     ; 97   AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 277  0005 c650f2        	ld	a,20722
 278  0008 a4f0          	and	a,#240
 279  000a c750f2        	ld	20722,a
 280                     ; 98   AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 282  000d 7b01          	ld	a,(OFST+1,sp)
 283  000f 5f            	clrw	x
 284  0010 97            	ld	xl,a
 285  0011 c650f2        	ld	a,20722
 286  0014 da0011        	or	a,(_TBR_Array,x)
 287  0017 c750f2        	ld	20722,a
 288                     ; 101   AWU->APR &= (uint8_t)(~AWU_APR_APR);
 290  001a c650f1        	ld	a,20721
 291  001d a4c0          	and	a,#192
 292  001f c750f1        	ld	20721,a
 293                     ; 102   AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 295  0022 7b01          	ld	a,(OFST+1,sp)
 296  0024 5f            	clrw	x
 297  0025 97            	ld	xl,a
 298  0026 c650f1        	ld	a,20721
 299  0029 da0000        	or	a,(_APR_Array,x)
 300  002c c750f1        	ld	20721,a
 301                     ; 103 }
 304  002f 84            	pop	a
 305  0030 81            	ret
 360                     ; 112 void AWU_Cmd(FunctionalState NewState)
 360                     ; 113 {
 361                     .text:	section	.text,new
 362  0000               _AWU_Cmd:
 366                     ; 114   if (NewState != DISABLE)
 368  0000 4d            	tnz	a
 369  0001 2706          	jreq	L331
 370                     ; 117     AWU->CSR |= AWU_CSR_AWUEN;
 372  0003 721850f0      	bset	20720,#4
 374  0007 2004          	jra	L531
 375  0009               L331:
 376                     ; 122     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 378  0009 721950f0      	bres	20720,#4
 379  000d               L531:
 380                     ; 124 }
 383  000d 81            	ret
 436                     	switch	.const
 437  0022               L41:
 438  0022 000003e8      	dc.l	1000
 439                     ; 139 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 439                     ; 140 {
 440                     .text:	section	.text,new
 441  0000               _AWU_LSICalibrationConfig:
 443  0000 5206          	subw	sp,#6
 444       00000006      OFST:	set	6
 447                     ; 141   uint16_t lsifreqkhz = 0x0;
 449                     ; 142   uint16_t A = 0x0;
 451                     ; 145   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 453                     ; 147   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 455  0002 96            	ldw	x,sp
 456  0003 1c0009        	addw	x,#OFST+3
 457  0006 cd0000        	call	c_ltor
 459  0009 ae0022        	ldw	x,#L41
 460  000c cd0000        	call	c_ludv
 462  000f be02          	ldw	x,c_lreg+2
 463  0011 1f03          	ldw	(OFST-3,sp),x
 465                     ; 151   A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 467  0013 1e03          	ldw	x,(OFST-3,sp)
 468  0015 54            	srlw	x
 469  0016 54            	srlw	x
 470  0017 1f05          	ldw	(OFST-1,sp),x
 472                     ; 153   if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
 474  0019 1e05          	ldw	x,(OFST-1,sp)
 475  001b 58            	sllw	x
 476  001c 58            	sllw	x
 477  001d 1f01          	ldw	(OFST-5,sp),x
 479  001f 1e03          	ldw	x,(OFST-3,sp)
 480  0021 72f001        	subw	x,(OFST-5,sp)
 481  0024 1605          	ldw	y,(OFST-1,sp)
 482  0026 9058          	sllw	y
 483  0028 905c          	incw	y
 484  002a cd0000        	call	c_imul
 486  002d 1605          	ldw	y,(OFST-1,sp)
 487  002f 9058          	sllw	y
 488  0031 9058          	sllw	y
 489  0033 bf00          	ldw	c_x,x
 490  0035 90b300        	cpw	y,c_x
 491  0038 2509          	jrult	L561
 492                     ; 155     AWU->APR = (uint8_t)(A - 2U);
 494  003a 7b06          	ld	a,(OFST+0,sp)
 495  003c a002          	sub	a,#2
 496  003e c750f1        	ld	20721,a
 498  0041 2006          	jra	L761
 499  0043               L561:
 500                     ; 159     AWU->APR = (uint8_t)(A - 1U);
 502  0043 7b06          	ld	a,(OFST+0,sp)
 503  0045 4a            	dec	a
 504  0046 c750f1        	ld	20721,a
 505  0049               L761:
 506                     ; 161 }
 509  0049 5b06          	addw	sp,#6
 510  004b 81            	ret
 533                     ; 168 void AWU_IdleModeEnable(void)
 533                     ; 169 {
 534                     .text:	section	.text,new
 535  0000               _AWU_IdleModeEnable:
 539                     ; 171   AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 541  0000 721950f0      	bres	20720,#4
 542                     ; 174   AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 544  0004 35f050f2      	mov	20722,#240
 545                     ; 175 }
 548  0008 81            	ret
 592                     ; 183 FlagStatus AWU_GetFlagStatus(void)
 592                     ; 184 {
 593                     .text:	section	.text,new
 594  0000               _AWU_GetFlagStatus:
 598                     ; 185   return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 600  0000 c650f0        	ld	a,20720
 601  0003 a520          	bcp	a,#32
 602  0005 2603          	jrne	L22
 603  0007 4f            	clr	a
 604  0008 2002          	jra	L42
 605  000a               L22:
 606  000a a601          	ld	a,#1
 607  000c               L42:
 610  000c 81            	ret
 645                     	xdef	_TBR_Array
 646                     	xdef	_APR_Array
 647                     	xdef	_AWU_GetFlagStatus
 648                     	xdef	_AWU_IdleModeEnable
 649                     	xdef	_AWU_LSICalibrationConfig
 650                     	xdef	_AWU_Cmd
 651                     	xdef	_AWU_Init
 652                     	xdef	_AWU_DeInit
 653                     	xref.b	c_lreg
 654                     	xref.b	c_x
 673                     	xref	c_imul
 674                     	xref	c_ludv
 675                     	xref	c_ltor
 676                     	end
