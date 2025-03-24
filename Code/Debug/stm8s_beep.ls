   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  44                     ; 54 void BEEP_DeInit(void)
  44                     ; 55 {
  46                     .text:	section	.text,new
  47  0000               _BEEP_DeInit:
  51                     ; 56   BEEP->CSR = BEEP_CSR_RESET_VALUE;
  53  0000 351f50f3      	mov	20723,#31
  54                     ; 57 }
  57  0004 81            	ret
 122                     ; 67 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 122                     ; 68 {
 123                     .text:	section	.text,new
 124  0000               _BEEP_Init:
 126  0000 88            	push	a
 127       00000000      OFST:	set	0
 130                     ; 70   assert_param(IS_BEEP_FREQUENCY_OK(BEEP_Frequency));
 132                     ; 73   if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
 134  0001 c650f3        	ld	a,20723
 135  0004 a41f          	and	a,#31
 136  0006 a11f          	cp	a,#31
 137  0008 2610          	jrne	L15
 138                     ; 75     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 140  000a c650f3        	ld	a,20723
 141  000d a4e0          	and	a,#224
 142  000f c750f3        	ld	20723,a
 143                     ; 76     BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
 145  0012 c650f3        	ld	a,20723
 146  0015 aa0b          	or	a,#11
 147  0017 c750f3        	ld	20723,a
 148  001a               L15:
 149                     ; 80   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
 151  001a c650f3        	ld	a,20723
 152  001d a43f          	and	a,#63
 153  001f c750f3        	ld	20723,a
 154                     ; 81   BEEP->CSR |= (uint8_t)(BEEP_Frequency);
 156  0022 c650f3        	ld	a,20723
 157  0025 1a01          	or	a,(OFST+1,sp)
 158  0027 c750f3        	ld	20723,a
 159                     ; 82 }
 162  002a 84            	pop	a
 163  002b 81            	ret
 218                     ; 91 void BEEP_Cmd(FunctionalState NewState)
 218                     ; 92 {
 219                     .text:	section	.text,new
 220  0000               _BEEP_Cmd:
 224                     ; 93   if (NewState != DISABLE)
 226  0000 4d            	tnz	a
 227  0001 2706          	jreq	L101
 228                     ; 96     BEEP->CSR |= BEEP_CSR_BEEPEN;
 230  0003 721a50f3      	bset	20723,#5
 232  0007 2004          	jra	L301
 233  0009               L101:
 234                     ; 101     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
 236  0009 721b50f3      	bres	20723,#5
 237  000d               L301:
 238                     ; 103 }
 241  000d 81            	ret
 294                     .const:	section	.text
 295  0000               L41:
 296  0000 000003e8      	dc.l	1000
 297                     ; 118 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 297                     ; 119 {
 298                     .text:	section	.text,new
 299  0000               _BEEP_LSICalibrationConfig:
 301  0000 5206          	subw	sp,#6
 302       00000006      OFST:	set	6
 305                     ; 124   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 307                     ; 126   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 309  0002 96            	ldw	x,sp
 310  0003 1c0009        	addw	x,#OFST+3
 311  0006 cd0000        	call	c_ltor
 313  0009 ae0000        	ldw	x,#L41
 314  000c cd0000        	call	c_ludv
 316  000f be02          	ldw	x,c_lreg+2
 317  0011 1f03          	ldw	(OFST-3,sp),x
 319                     ; 130   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 321  0013 c650f3        	ld	a,20723
 322  0016 a4e0          	and	a,#224
 323  0018 c750f3        	ld	20723,a
 324                     ; 132   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 326  001b 1e03          	ldw	x,(OFST-3,sp)
 327  001d 54            	srlw	x
 328  001e 54            	srlw	x
 329  001f 54            	srlw	x
 330  0020 1f05          	ldw	(OFST-1,sp),x
 332                     ; 134   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 334  0022 1e05          	ldw	x,(OFST-1,sp)
 335  0024 58            	sllw	x
 336  0025 58            	sllw	x
 337  0026 58            	sllw	x
 338  0027 1f01          	ldw	(OFST-5,sp),x
 340  0029 1e03          	ldw	x,(OFST-3,sp)
 341  002b 72f001        	subw	x,(OFST-5,sp)
 342  002e 1605          	ldw	y,(OFST-1,sp)
 343  0030 9058          	sllw	y
 344  0032 905c          	incw	y
 345  0034 cd0000        	call	c_imul
 347  0037 1605          	ldw	y,(OFST-1,sp)
 348  0039 9058          	sllw	y
 349  003b 9058          	sllw	y
 350  003d 9058          	sllw	y
 351  003f bf00          	ldw	c_x,x
 352  0041 90b300        	cpw	y,c_x
 353  0044 250c          	jrult	L331
 354                     ; 136     BEEP->CSR |= (uint8_t)(A - 2U);
 356  0046 7b06          	ld	a,(OFST+0,sp)
 357  0048 a002          	sub	a,#2
 358  004a ca50f3        	or	a,20723
 359  004d c750f3        	ld	20723,a
 361  0050 2009          	jra	L531
 362  0052               L331:
 363                     ; 140     BEEP->CSR |= (uint8_t)(A - 1U);
 365  0052 7b06          	ld	a,(OFST+0,sp)
 366  0054 4a            	dec	a
 367  0055 ca50f3        	or	a,20723
 368  0058 c750f3        	ld	20723,a
 369  005b               L531:
 370                     ; 142 }
 373  005b 5b06          	addw	sp,#6
 374  005d 81            	ret
 387                     	xdef	_BEEP_LSICalibrationConfig
 388                     	xdef	_BEEP_Cmd
 389                     	xdef	_BEEP_Init
 390                     	xdef	_BEEP_DeInit
 391                     	xref.b	c_lreg
 392                     	xref.b	c_x
 411                     	xref	c_imul
 412                     	xref	c_ludv
 413                     	xref	c_ltor
 414                     	end
