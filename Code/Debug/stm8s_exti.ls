   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  44                     ; 53 void EXTI_DeInit(void)
  44                     ; 54 {
  46                     .text:	section	.text,new
  47  0000               _EXTI_DeInit:
  51                     ; 55   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  53  0000 725f50a0      	clr	20640
  54                     ; 56   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  56  0004 725f50a1      	clr	20641
  57                     ; 57 }
  60  0008 81            	ret
 185                     ; 70 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 185                     ; 71 {
 186                     .text:	section	.text,new
 187  0000               _EXTI_SetExtIntSensitivity:
 189  0000 89            	pushw	x
 190       00000000      OFST:	set	0
 193                     ; 73   assert_param(IS_EXTI_PORT_OK(Port));
 195                     ; 74   assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 197                     ; 77   switch (Port)
 199  0001 9e            	ld	a,xh
 201                     ; 99   default:
 201                     ; 100     break;
 202  0002 4d            	tnz	a
 203  0003 270e          	jreq	L12
 204  0005 4a            	dec	a
 205  0006 271d          	jreq	L32
 206  0008 4a            	dec	a
 207  0009 272e          	jreq	L52
 208  000b 4a            	dec	a
 209  000c 2742          	jreq	L72
 210  000e 4a            	dec	a
 211  000f 2756          	jreq	L13
 212  0011 2064          	jra	L311
 213  0013               L12:
 214                     ; 79   case EXTI_PORT_GPIOA:
 214                     ; 80     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 216  0013 c650a0        	ld	a,20640
 217  0016 a4fc          	and	a,#252
 218  0018 c750a0        	ld	20640,a
 219                     ; 81     EXTI->CR1 |= (uint8_t)(SensitivityValue);
 221  001b c650a0        	ld	a,20640
 222  001e 1a02          	or	a,(OFST+2,sp)
 223  0020 c750a0        	ld	20640,a
 224                     ; 82     break;
 226  0023 2052          	jra	L311
 227  0025               L32:
 228                     ; 83   case EXTI_PORT_GPIOB:
 228                     ; 84     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 230  0025 c650a0        	ld	a,20640
 231  0028 a4f3          	and	a,#243
 232  002a c750a0        	ld	20640,a
 233                     ; 85     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 235  002d 7b02          	ld	a,(OFST+2,sp)
 236  002f 48            	sll	a
 237  0030 48            	sll	a
 238  0031 ca50a0        	or	a,20640
 239  0034 c750a0        	ld	20640,a
 240                     ; 86     break;
 242  0037 203e          	jra	L311
 243  0039               L52:
 244                     ; 87   case EXTI_PORT_GPIOC:
 244                     ; 88     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 246  0039 c650a0        	ld	a,20640
 247  003c a4cf          	and	a,#207
 248  003e c750a0        	ld	20640,a
 249                     ; 89     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 251  0041 7b02          	ld	a,(OFST+2,sp)
 252  0043 97            	ld	xl,a
 253  0044 a610          	ld	a,#16
 254  0046 42            	mul	x,a
 255  0047 9f            	ld	a,xl
 256  0048 ca50a0        	or	a,20640
 257  004b c750a0        	ld	20640,a
 258                     ; 90     break;
 260  004e 2027          	jra	L311
 261  0050               L72:
 262                     ; 91   case EXTI_PORT_GPIOD:
 262                     ; 92     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 264  0050 c650a0        	ld	a,20640
 265  0053 a43f          	and	a,#63
 266  0055 c750a0        	ld	20640,a
 267                     ; 93     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 269  0058 7b02          	ld	a,(OFST+2,sp)
 270  005a 97            	ld	xl,a
 271  005b a640          	ld	a,#64
 272  005d 42            	mul	x,a
 273  005e 9f            	ld	a,xl
 274  005f ca50a0        	or	a,20640
 275  0062 c750a0        	ld	20640,a
 276                     ; 94     break;
 278  0065 2010          	jra	L311
 279  0067               L13:
 280                     ; 95   case EXTI_PORT_GPIOE:
 280                     ; 96     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 282  0067 c650a1        	ld	a,20641
 283  006a a4fc          	and	a,#252
 284  006c c750a1        	ld	20641,a
 285                     ; 97     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 287  006f c650a1        	ld	a,20641
 288  0072 1a02          	or	a,(OFST+2,sp)
 289  0074 c750a1        	ld	20641,a
 290                     ; 98     break;
 292  0077               L33:
 293                     ; 99   default:
 293                     ; 100     break;
 295  0077               L311:
 296                     ; 102 }
 299  0077 85            	popw	x
 300  0078 81            	ret
 358                     ; 111 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 358                     ; 112 {
 359                     .text:	section	.text,new
 360  0000               _EXTI_SetTLISensitivity:
 364                     ; 114   assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 366                     ; 117   EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 368  0000 721550a1      	bres	20641,#2
 369                     ; 118   EXTI->CR2 |= (uint8_t)(SensitivityValue);
 371  0004 ca50a1        	or	a,20641
 372  0007 c750a1        	ld	20641,a
 373                     ; 119 }
 376  000a 81            	ret
 422                     ; 126 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 422                     ; 127 {
 423                     .text:	section	.text,new
 424  0000               _EXTI_GetExtIntSensitivity:
 426  0000 88            	push	a
 427       00000001      OFST:	set	1
 430                     ; 128   uint8_t value = 0;
 432  0001 0f01          	clr	(OFST+0,sp)
 434                     ; 131   assert_param(IS_EXTI_PORT_OK(Port));
 436                     ; 133   switch (Port)
 439                     ; 150   default:
 439                     ; 151     break;
 440  0003 4d            	tnz	a
 441  0004 270e          	jreq	L341
 442  0006 4a            	dec	a
 443  0007 2714          	jreq	L541
 444  0009 4a            	dec	a
 445  000a 271c          	jreq	L741
 446  000c 4a            	dec	a
 447  000d 2725          	jreq	L151
 448  000f 4a            	dec	a
 449  0010 2730          	jreq	L351
 450  0012 2035          	jra	L302
 451  0014               L341:
 452                     ; 135   case EXTI_PORT_GPIOA:
 452                     ; 136     value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 454  0014 c650a0        	ld	a,20640
 455  0017 a403          	and	a,#3
 456  0019 6b01          	ld	(OFST+0,sp),a
 458                     ; 137     break;
 460  001b 202c          	jra	L302
 461  001d               L541:
 462                     ; 138   case EXTI_PORT_GPIOB:
 462                     ; 139     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 464  001d c650a0        	ld	a,20640
 465  0020 a40c          	and	a,#12
 466  0022 44            	srl	a
 467  0023 44            	srl	a
 468  0024 6b01          	ld	(OFST+0,sp),a
 470                     ; 140     break;
 472  0026 2021          	jra	L302
 473  0028               L741:
 474                     ; 141   case EXTI_PORT_GPIOC:
 474                     ; 142     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 476  0028 c650a0        	ld	a,20640
 477  002b a430          	and	a,#48
 478  002d 4e            	swap	a
 479  002e a40f          	and	a,#15
 480  0030 6b01          	ld	(OFST+0,sp),a
 482                     ; 143     break;
 484  0032 2015          	jra	L302
 485  0034               L151:
 486                     ; 144   case EXTI_PORT_GPIOD:
 486                     ; 145     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 488  0034 c650a0        	ld	a,20640
 489  0037 a4c0          	and	a,#192
 490  0039 4e            	swap	a
 491  003a 44            	srl	a
 492  003b 44            	srl	a
 493  003c a403          	and	a,#3
 494  003e 6b01          	ld	(OFST+0,sp),a
 496                     ; 146     break;
 498  0040 2007          	jra	L302
 499  0042               L351:
 500                     ; 147   case EXTI_PORT_GPIOE:
 500                     ; 148     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 502  0042 c650a1        	ld	a,20641
 503  0045 a403          	and	a,#3
 504  0047 6b01          	ld	(OFST+0,sp),a
 506                     ; 149     break;
 508  0049               L551:
 509                     ; 150   default:
 509                     ; 151     break;
 511  0049               L302:
 512                     ; 154   return((EXTI_Sensitivity_TypeDef)value);
 514  0049 7b01          	ld	a,(OFST+0,sp)
 517  004b 5b01          	addw	sp,#1
 518  004d 81            	ret
 554                     ; 162 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 554                     ; 163 {
 555                     .text:	section	.text,new
 556  0000               _EXTI_GetTLISensitivity:
 558  0000 88            	push	a
 559       00000001      OFST:	set	1
 562                     ; 164   uint8_t value = 0;
 564                     ; 167   value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 566  0001 c650a1        	ld	a,20641
 567  0004 a404          	and	a,#4
 568  0006 6b01          	ld	(OFST+0,sp),a
 570                     ; 169   return((EXTI_TLISensitivity_TypeDef)value);
 572  0008 7b01          	ld	a,(OFST+0,sp)
 575  000a 5b01          	addw	sp,#1
 576  000c 81            	ret
 589                     	xdef	_EXTI_GetTLISensitivity
 590                     	xdef	_EXTI_GetExtIntSensitivity
 591                     	xdef	_EXTI_SetTLISensitivity
 592                     	xdef	_EXTI_SetExtIntSensitivity
 593                     	xdef	_EXTI_DeInit
 612                     	end
