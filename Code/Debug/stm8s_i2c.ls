   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  44                     ; 67 void I2C_DeInit(void)
  44                     ; 68 {
  46                     .text:	section	.text,new
  47  0000               _I2C_DeInit:
  51                     ; 69   I2C->CR1 = I2C_CR1_RESET_VALUE;
  53  0000 725f5210      	clr	21008
  54                     ; 70   I2C->CR2 = I2C_CR2_RESET_VALUE;
  56  0004 725f5211      	clr	21009
  57                     ; 71   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  59  0008 725f5212      	clr	21010
  60                     ; 72   I2C->OARL = I2C_OARL_RESET_VALUE;
  62  000c 725f5213      	clr	21011
  63                     ; 73   I2C->OARH = I2C_OARH_RESET_VALUE;
  65  0010 725f5214      	clr	21012
  66                     ; 74   I2C->ITR = I2C_ITR_RESET_VALUE;
  68  0014 725f521a      	clr	21018
  69                     ; 75   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  71  0018 725f521b      	clr	21019
  72                     ; 76   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  74  001c 725f521c      	clr	21020
  75                     ; 77   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  77  0020 3502521d      	mov	21021,#2
  78                     ; 78 }
  81  0024 81            	ret
 260                     .const:	section	.text
 261  0000               L01:
 262  0000 000186a1      	dc.l	100001
 263  0004               L21:
 264  0004 000f4240      	dc.l	1000000
 265                     ; 96 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 265                     ; 97               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 265                     ; 98               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 265                     ; 99 {
 266                     .text:	section	.text,new
 267  0000               _I2C_Init:
 269  0000 5209          	subw	sp,#9
 270       00000009      OFST:	set	9
 273                     ; 100   uint16_t result = 0x0004;
 275                     ; 101   uint16_t tmpval = 0;
 277                     ; 102   uint8_t tmpccrh = 0;
 279  0002 0f07          	clr	(OFST-2,sp)
 281                     ; 105   assert_param(IS_I2C_ACK_OK(Ack));
 283                     ; 106   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 285                     ; 107   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 287                     ; 108   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 289                     ; 109   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 291                     ; 110   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 293                     ; 115   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 295  0004 c65212        	ld	a,21010
 296  0007 a4c0          	and	a,#192
 297  0009 c75212        	ld	21010,a
 298                     ; 117   I2C->FREQR |= InputClockFrequencyMHz;
 300  000c c65212        	ld	a,21010
 301  000f 1a15          	or	a,(OFST+12,sp)
 302  0011 c75212        	ld	21010,a
 303                     ; 121   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 305  0014 72115210      	bres	21008,#0
 306                     ; 124   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 308  0018 c6521c        	ld	a,21020
 309  001b a430          	and	a,#48
 310  001d c7521c        	ld	21020,a
 311                     ; 125   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 313  0020 725f521b      	clr	21019
 314                     ; 128   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 316  0024 96            	ldw	x,sp
 317  0025 1c000c        	addw	x,#OFST+3
 318  0028 cd0000        	call	c_ltor
 320  002b ae0000        	ldw	x,#L01
 321  002e cd0000        	call	c_lcmp
 323  0031 2403          	jruge	L41
 324  0033 cc00c0        	jp	L131
 325  0036               L41:
 326                     ; 131     tmpccrh = I2C_CCRH_FS;
 328  0036 a680          	ld	a,#128
 329  0038 6b07          	ld	(OFST-2,sp),a
 331                     ; 133     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 333  003a 0d12          	tnz	(OFST+9,sp)
 334  003c 2630          	jrne	L331
 335                     ; 136       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 337  003e 96            	ldw	x,sp
 338  003f 1c000c        	addw	x,#OFST+3
 339  0042 cd0000        	call	c_ltor
 341  0045 a603          	ld	a,#3
 342  0047 cd0000        	call	c_smul
 344  004a 96            	ldw	x,sp
 345  004b 1c0001        	addw	x,#OFST-8
 346  004e cd0000        	call	c_rtol
 349  0051 7b15          	ld	a,(OFST+12,sp)
 350  0053 b703          	ld	c_lreg+3,a
 351  0055 3f02          	clr	c_lreg+2
 352  0057 3f01          	clr	c_lreg+1
 353  0059 3f00          	clr	c_lreg
 354  005b ae0004        	ldw	x,#L21
 355  005e cd0000        	call	c_lmul
 357  0061 96            	ldw	x,sp
 358  0062 1c0001        	addw	x,#OFST-8
 359  0065 cd0000        	call	c_ludv
 361  0068 be02          	ldw	x,c_lreg+2
 362  006a 1f08          	ldw	(OFST-1,sp),x
 365  006c 2034          	jra	L531
 366  006e               L331:
 367                     ; 141       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 369  006e 96            	ldw	x,sp
 370  006f 1c000c        	addw	x,#OFST+3
 371  0072 cd0000        	call	c_ltor
 373  0075 a619          	ld	a,#25
 374  0077 cd0000        	call	c_smul
 376  007a 96            	ldw	x,sp
 377  007b 1c0001        	addw	x,#OFST-8
 378  007e cd0000        	call	c_rtol
 381  0081 7b15          	ld	a,(OFST+12,sp)
 382  0083 b703          	ld	c_lreg+3,a
 383  0085 3f02          	clr	c_lreg+2
 384  0087 3f01          	clr	c_lreg+1
 385  0089 3f00          	clr	c_lreg
 386  008b ae0004        	ldw	x,#L21
 387  008e cd0000        	call	c_lmul
 389  0091 96            	ldw	x,sp
 390  0092 1c0001        	addw	x,#OFST-8
 391  0095 cd0000        	call	c_ludv
 393  0098 be02          	ldw	x,c_lreg+2
 394  009a 1f08          	ldw	(OFST-1,sp),x
 396                     ; 143       tmpccrh |= I2C_CCRH_DUTY;
 398  009c 7b07          	ld	a,(OFST-2,sp)
 399  009e aa40          	or	a,#64
 400  00a0 6b07          	ld	(OFST-2,sp),a
 402  00a2               L531:
 403                     ; 147     if (result < (uint16_t)0x01)
 405  00a2 1e08          	ldw	x,(OFST-1,sp)
 406  00a4 2605          	jrne	L731
 407                     ; 150       result = (uint16_t)0x0001;
 409  00a6 ae0001        	ldw	x,#1
 410  00a9 1f08          	ldw	(OFST-1,sp),x
 412  00ab               L731:
 413                     ; 156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 415  00ab 7b15          	ld	a,(OFST+12,sp)
 416  00ad 97            	ld	xl,a
 417  00ae a603          	ld	a,#3
 418  00b0 42            	mul	x,a
 419  00b1 a60a          	ld	a,#10
 420  00b3 cd0000        	call	c_sdivx
 422  00b6 5c            	incw	x
 423  00b7 1f05          	ldw	(OFST-4,sp),x
 425                     ; 157     I2C->TRISER = (uint8_t)tmpval;
 427  00b9 7b06          	ld	a,(OFST-3,sp)
 428  00bb c7521d        	ld	21021,a
 430  00be 2043          	jra	L141
 431  00c0               L131:
 432                     ; 164     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 434  00c0 96            	ldw	x,sp
 435  00c1 1c000c        	addw	x,#OFST+3
 436  00c4 cd0000        	call	c_ltor
 438  00c7 3803          	sll	c_lreg+3
 439  00c9 3902          	rlc	c_lreg+2
 440  00cb 3901          	rlc	c_lreg+1
 441  00cd 3900          	rlc	c_lreg
 442  00cf 96            	ldw	x,sp
 443  00d0 1c0001        	addw	x,#OFST-8
 444  00d3 cd0000        	call	c_rtol
 447  00d6 7b15          	ld	a,(OFST+12,sp)
 448  00d8 b703          	ld	c_lreg+3,a
 449  00da 3f02          	clr	c_lreg+2
 450  00dc 3f01          	clr	c_lreg+1
 451  00de 3f00          	clr	c_lreg
 452  00e0 ae0004        	ldw	x,#L21
 453  00e3 cd0000        	call	c_lmul
 455  00e6 96            	ldw	x,sp
 456  00e7 1c0001        	addw	x,#OFST-8
 457  00ea cd0000        	call	c_ludv
 459  00ed be02          	ldw	x,c_lreg+2
 460  00ef 1f08          	ldw	(OFST-1,sp),x
 462                     ; 167     if (result < (uint16_t)0x0004)
 464  00f1 1e08          	ldw	x,(OFST-1,sp)
 465  00f3 a30004        	cpw	x,#4
 466  00f6 2405          	jruge	L341
 467                     ; 170       result = (uint16_t)0x0004;
 469  00f8 ae0004        	ldw	x,#4
 470  00fb 1f08          	ldw	(OFST-1,sp),x
 472  00fd               L341:
 473                     ; 176     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 475  00fd 7b15          	ld	a,(OFST+12,sp)
 476  00ff 4c            	inc	a
 477  0100 c7521d        	ld	21021,a
 478  0103               L141:
 479                     ; 181   I2C->CCRL = (uint8_t)result;
 481  0103 7b09          	ld	a,(OFST+0,sp)
 482  0105 c7521b        	ld	21019,a
 483                     ; 182   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 485  0108 7b08          	ld	a,(OFST-1,sp)
 486  010a a40f          	and	a,#15
 487  010c 1a07          	or	a,(OFST-2,sp)
 488  010e c7521c        	ld	21020,a
 489                     ; 185   I2C->CR1 |= I2C_CR1_PE;
 491  0111 72105210      	bset	21008,#0
 492                     ; 188   I2C_AcknowledgeConfig(Ack);
 494  0115 7b13          	ld	a,(OFST+10,sp)
 495  0117 cd0000        	call	_I2C_AcknowledgeConfig
 497                     ; 191   I2C->OARL = (uint8_t)(OwnAddress);
 499  011a 7b11          	ld	a,(OFST+8,sp)
 500  011c c75213        	ld	21011,a
 501                     ; 192   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 501                     ; 193                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 503  011f 1e10          	ldw	x,(OFST+7,sp)
 504  0121 4f            	clr	a
 505  0122 01            	rrwa	x,a
 506  0123 48            	sll	a
 507  0124 59            	rlcw	x
 508  0125 01            	rrwa	x,a
 509  0126 a406          	and	a,#6
 510  0128 5f            	clrw	x
 511  0129 6b04          	ld	(OFST-5,sp),a
 513  012b 7b14          	ld	a,(OFST+11,sp)
 514  012d aa40          	or	a,#64
 515  012f 1a04          	or	a,(OFST-5,sp)
 516  0131 c75214        	ld	21012,a
 517                     ; 194 }
 520  0134 5b09          	addw	sp,#9
 521  0136 81            	ret
 576                     ; 202 void I2C_Cmd(FunctionalState NewState)
 576                     ; 203 {
 577                     .text:	section	.text,new
 578  0000               _I2C_Cmd:
 582                     ; 205   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 584                     ; 207   if (NewState != DISABLE)
 586  0000 4d            	tnz	a
 587  0001 2706          	jreq	L371
 588                     ; 210     I2C->CR1 |= I2C_CR1_PE;
 590  0003 72105210      	bset	21008,#0
 592  0007 2004          	jra	L571
 593  0009               L371:
 594                     ; 215     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 596  0009 72115210      	bres	21008,#0
 597  000d               L571:
 598                     ; 217 }
 601  000d 81            	ret
 636                     ; 225 void I2C_GeneralCallCmd(FunctionalState NewState)
 636                     ; 226 {
 637                     .text:	section	.text,new
 638  0000               _I2C_GeneralCallCmd:
 642                     ; 228   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 644                     ; 230   if (NewState != DISABLE)
 646  0000 4d            	tnz	a
 647  0001 2706          	jreq	L512
 648                     ; 233     I2C->CR1 |= I2C_CR1_ENGC;
 650  0003 721c5210      	bset	21008,#6
 652  0007 2004          	jra	L712
 653  0009               L512:
 654                     ; 238     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 656  0009 721d5210      	bres	21008,#6
 657  000d               L712:
 658                     ; 240 }
 661  000d 81            	ret
 696                     ; 250 void I2C_GenerateSTART(FunctionalState NewState)
 696                     ; 251 {
 697                     .text:	section	.text,new
 698  0000               _I2C_GenerateSTART:
 702                     ; 253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 704                     ; 255   if (NewState != DISABLE)
 706  0000 4d            	tnz	a
 707  0001 2706          	jreq	L732
 708                     ; 258     I2C->CR2 |= I2C_CR2_START;
 710  0003 72105211      	bset	21009,#0
 712  0007 2004          	jra	L142
 713  0009               L732:
 714                     ; 263     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 716  0009 72115211      	bres	21009,#0
 717  000d               L142:
 718                     ; 265 }
 721  000d 81            	ret
 756                     ; 273 void I2C_GenerateSTOP(FunctionalState NewState)
 756                     ; 274 {
 757                     .text:	section	.text,new
 758  0000               _I2C_GenerateSTOP:
 762                     ; 276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 764                     ; 278   if (NewState != DISABLE)
 766  0000 4d            	tnz	a
 767  0001 2706          	jreq	L162
 768                     ; 281     I2C->CR2 |= I2C_CR2_STOP;
 770  0003 72125211      	bset	21009,#1
 772  0007 2004          	jra	L362
 773  0009               L162:
 774                     ; 286     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 776  0009 72135211      	bres	21009,#1
 777  000d               L362:
 778                     ; 288 }
 781  000d 81            	ret
 817                     ; 296 void I2C_SoftwareResetCmd(FunctionalState NewState)
 817                     ; 297 {
 818                     .text:	section	.text,new
 819  0000               _I2C_SoftwareResetCmd:
 823                     ; 299   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 825                     ; 301   if (NewState != DISABLE)
 827  0000 4d            	tnz	a
 828  0001 2706          	jreq	L303
 829                     ; 304     I2C->CR2 |= I2C_CR2_SWRST;
 831  0003 721e5211      	bset	21009,#7
 833  0007 2004          	jra	L503
 834  0009               L303:
 835                     ; 309     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 837  0009 721f5211      	bres	21009,#7
 838  000d               L503:
 839                     ; 311 }
 842  000d 81            	ret
 878                     ; 320 void I2C_StretchClockCmd(FunctionalState NewState)
 878                     ; 321 {
 879                     .text:	section	.text,new
 880  0000               _I2C_StretchClockCmd:
 884                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 886                     ; 325   if (NewState != DISABLE)
 888  0000 4d            	tnz	a
 889  0001 2706          	jreq	L523
 890                     ; 328     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 892  0003 721f5210      	bres	21008,#7
 894  0007 2004          	jra	L723
 895  0009               L523:
 896                     ; 334     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 898  0009 721e5210      	bset	21008,#7
 899  000d               L723:
 900                     ; 336 }
 903  000d 81            	ret
 939                     ; 345 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 939                     ; 346 {
 940                     .text:	section	.text,new
 941  0000               _I2C_AcknowledgeConfig:
 943  0000 88            	push	a
 944       00000000      OFST:	set	0
 947                     ; 348   assert_param(IS_I2C_ACK_OK(Ack));
 949                     ; 350   if (Ack == I2C_ACK_NONE)
 951  0001 4d            	tnz	a
 952  0002 2606          	jrne	L743
 953                     ; 353     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 955  0004 72155211      	bres	21009,#2
 957  0008 2014          	jra	L153
 958  000a               L743:
 959                     ; 358     I2C->CR2 |= I2C_CR2_ACK;
 961  000a 72145211      	bset	21009,#2
 962                     ; 360     if (Ack == I2C_ACK_CURR)
 964  000e 7b01          	ld	a,(OFST+1,sp)
 965  0010 a101          	cp	a,#1
 966  0012 2606          	jrne	L353
 967                     ; 363       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
 969  0014 72175211      	bres	21009,#3
 971  0018 2004          	jra	L153
 972  001a               L353:
 973                     ; 368       I2C->CR2 |= I2C_CR2_POS;
 975  001a 72165211      	bset	21009,#3
 976  001e               L153:
 977                     ; 371 }
 980  001e 84            	pop	a
 981  001f 81            	ret
1053                     ; 381 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1053                     ; 382 {
1054                     .text:	section	.text,new
1055  0000               _I2C_ITConfig:
1057  0000 89            	pushw	x
1058       00000000      OFST:	set	0
1061                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1063                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1065                     ; 387   if (NewState != DISABLE)
1067  0001 9f            	ld	a,xl
1068  0002 4d            	tnz	a
1069  0003 2709          	jreq	L314
1070                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1072  0005 9e            	ld	a,xh
1073  0006 ca521a        	or	a,21018
1074  0009 c7521a        	ld	21018,a
1076  000c 2009          	jra	L514
1077  000e               L314:
1078                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1080  000e 7b01          	ld	a,(OFST+1,sp)
1081  0010 43            	cpl	a
1082  0011 c4521a        	and	a,21018
1083  0014 c7521a        	ld	21018,a
1084  0017               L514:
1085                     ; 397 }
1088  0017 85            	popw	x
1089  0018 81            	ret
1125                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1125                     ; 406 {
1126                     .text:	section	.text,new
1127  0000               _I2C_FastModeDutyCycleConfig:
1131                     ; 408   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1133                     ; 410   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1135  0000 a140          	cp	a,#64
1136  0002 2606          	jrne	L534
1137                     ; 413     I2C->CCRH |= I2C_CCRH_DUTY;
1139  0004 721c521c      	bset	21020,#6
1141  0008 2004          	jra	L734
1142  000a               L534:
1143                     ; 418     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1145  000a 721d521c      	bres	21020,#6
1146  000e               L734:
1147                     ; 420 }
1150  000e 81            	ret
1173                     ; 427 uint8_t I2C_ReceiveData(void)
1173                     ; 428 {
1174                     .text:	section	.text,new
1175  0000               _I2C_ReceiveData:
1179                     ; 430   return ((uint8_t)I2C->DR);
1181  0000 c65216        	ld	a,21014
1184  0003 81            	ret
1249                     ; 440 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1249                     ; 441 {
1250                     .text:	section	.text,new
1251  0000               _I2C_Send7bitAddress:
1253  0000 89            	pushw	x
1254       00000000      OFST:	set	0
1257                     ; 443   assert_param(IS_I2C_ADDRESS_OK(Address));
1259                     ; 444   assert_param(IS_I2C_DIRECTION_OK(Direction));
1261                     ; 447   Address &= (uint8_t)0xFE;
1263  0001 7b01          	ld	a,(OFST+1,sp)
1264  0003 a4fe          	and	a,#254
1265  0005 6b01          	ld	(OFST+1,sp),a
1266                     ; 450   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1268  0007 7b01          	ld	a,(OFST+1,sp)
1269  0009 1a02          	or	a,(OFST+2,sp)
1270  000b c75216        	ld	21014,a
1271                     ; 451 }
1274  000e 85            	popw	x
1275  000f 81            	ret
1309                     ; 458 void I2C_SendData(uint8_t Data)
1309                     ; 459 {
1310                     .text:	section	.text,new
1311  0000               _I2C_SendData:
1315                     ; 461   I2C->DR = Data;
1317  0000 c75216        	ld	21014,a
1318                     ; 462 }
1321  0003 81            	ret
1545                     ; 578 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1545                     ; 579 {
1546                     .text:	section	.text,new
1547  0000               _I2C_CheckEvent:
1549  0000 89            	pushw	x
1550  0001 5206          	subw	sp,#6
1551       00000006      OFST:	set	6
1554                     ; 580   __IO uint16_t lastevent = 0x00;
1556  0003 5f            	clrw	x
1557  0004 1f04          	ldw	(OFST-2,sp),x
1559                     ; 581   uint8_t flag1 = 0x00 ;
1561                     ; 582   uint8_t flag2 = 0x00;
1563                     ; 583   ErrorStatus status = ERROR;
1565                     ; 586   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1567                     ; 588   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1569  0006 1e07          	ldw	x,(OFST+1,sp)
1570  0008 a30004        	cpw	x,#4
1571  000b 260b          	jrne	L136
1572                     ; 590     lastevent = I2C->SR2 & I2C_SR2_AF;
1574  000d c65218        	ld	a,21016
1575  0010 a404          	and	a,#4
1576  0012 5f            	clrw	x
1577  0013 97            	ld	xl,a
1578  0014 1f04          	ldw	(OFST-2,sp),x
1581  0016 201f          	jra	L336
1582  0018               L136:
1583                     ; 594     flag1 = I2C->SR1;
1585  0018 c65217        	ld	a,21015
1586  001b 6b03          	ld	(OFST-3,sp),a
1588                     ; 595     flag2 = I2C->SR3;
1590  001d c65219        	ld	a,21017
1591  0020 6b06          	ld	(OFST+0,sp),a
1593                     ; 596     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1595  0022 7b03          	ld	a,(OFST-3,sp)
1596  0024 5f            	clrw	x
1597  0025 97            	ld	xl,a
1598  0026 1f01          	ldw	(OFST-5,sp),x
1600  0028 7b06          	ld	a,(OFST+0,sp)
1601  002a 5f            	clrw	x
1602  002b 97            	ld	xl,a
1603  002c 4f            	clr	a
1604  002d 02            	rlwa	x,a
1605  002e 01            	rrwa	x,a
1606  002f 1a02          	or	a,(OFST-4,sp)
1607  0031 01            	rrwa	x,a
1608  0032 1a01          	or	a,(OFST-5,sp)
1609  0034 01            	rrwa	x,a
1610  0035 1f04          	ldw	(OFST-2,sp),x
1612  0037               L336:
1613                     ; 599   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1615  0037 1e04          	ldw	x,(OFST-2,sp)
1616  0039 01            	rrwa	x,a
1617  003a 1408          	and	a,(OFST+2,sp)
1618  003c 01            	rrwa	x,a
1619  003d 1407          	and	a,(OFST+1,sp)
1620  003f 01            	rrwa	x,a
1621  0040 1307          	cpw	x,(OFST+1,sp)
1622  0042 2606          	jrne	L536
1623                     ; 602     status = SUCCESS;
1625  0044 a601          	ld	a,#1
1626  0046 6b06          	ld	(OFST+0,sp),a
1629  0048 2002          	jra	L736
1630  004a               L536:
1631                     ; 607     status = ERROR;
1633  004a 0f06          	clr	(OFST+0,sp)
1635  004c               L736:
1636                     ; 611   return status;
1638  004c 7b06          	ld	a,(OFST+0,sp)
1641  004e 5b08          	addw	sp,#8
1642  0050 81            	ret
1695                     ; 628 I2C_Event_TypeDef I2C_GetLastEvent(void)
1695                     ; 629 {
1696                     .text:	section	.text,new
1697  0000               _I2C_GetLastEvent:
1699  0000 5206          	subw	sp,#6
1700       00000006      OFST:	set	6
1703                     ; 630   __IO uint16_t lastevent = 0;
1705  0002 5f            	clrw	x
1706  0003 1f05          	ldw	(OFST-1,sp),x
1708                     ; 631   uint16_t flag1 = 0;
1710                     ; 632   uint16_t flag2 = 0;
1712                     ; 634   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1714  0005 c65218        	ld	a,21016
1715  0008 a504          	bcp	a,#4
1716  000a 2707          	jreq	L766
1717                     ; 636     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1719  000c ae0004        	ldw	x,#4
1720  000f 1f05          	ldw	(OFST-1,sp),x
1723  0011 201b          	jra	L176
1724  0013               L766:
1725                     ; 641     flag1 = I2C->SR1;
1727  0013 c65217        	ld	a,21015
1728  0016 5f            	clrw	x
1729  0017 97            	ld	xl,a
1730  0018 1f01          	ldw	(OFST-5,sp),x
1732                     ; 642     flag2 = I2C->SR3;
1734  001a c65219        	ld	a,21017
1735  001d 5f            	clrw	x
1736  001e 97            	ld	xl,a
1737  001f 1f03          	ldw	(OFST-3,sp),x
1739                     ; 645     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1741  0021 1e03          	ldw	x,(OFST-3,sp)
1742  0023 4f            	clr	a
1743  0024 02            	rlwa	x,a
1744  0025 01            	rrwa	x,a
1745  0026 1a02          	or	a,(OFST-4,sp)
1746  0028 01            	rrwa	x,a
1747  0029 1a01          	or	a,(OFST-5,sp)
1748  002b 01            	rrwa	x,a
1749  002c 1f05          	ldw	(OFST-1,sp),x
1751  002e               L176:
1752                     ; 648   return (I2C_Event_TypeDef)lastevent;
1754  002e 1e05          	ldw	x,(OFST-1,sp)
1757  0030 5b06          	addw	sp,#6
1758  0032 81            	ret
1973                     ; 679 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
1973                     ; 680 {
1974                     .text:	section	.text,new
1975  0000               _I2C_GetFlagStatus:
1977  0000 89            	pushw	x
1978  0001 89            	pushw	x
1979       00000002      OFST:	set	2
1982                     ; 681   uint8_t tempreg = 0;
1984  0002 0f02          	clr	(OFST+0,sp)
1986                     ; 682   uint8_t regindex = 0;
1988                     ; 683   FlagStatus bitstatus = RESET;
1990                     ; 686   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
1992                     ; 689   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
1994  0004 9e            	ld	a,xh
1995  0005 6b01          	ld	(OFST-1,sp),a
1997                     ; 691   switch (regindex)
1999  0007 7b01          	ld	a,(OFST-1,sp)
2001                     ; 708     default:
2001                     ; 709       break;
2002  0009 4a            	dec	a
2003  000a 2708          	jreq	L376
2004  000c 4a            	dec	a
2005  000d 270c          	jreq	L576
2006  000f 4a            	dec	a
2007  0010 2710          	jreq	L776
2008  0012 2013          	jra	L3101
2009  0014               L376:
2010                     ; 694     case 0x01:
2010                     ; 695       tempreg = (uint8_t)I2C->SR1;
2012  0014 c65217        	ld	a,21015
2013  0017 6b02          	ld	(OFST+0,sp),a
2015                     ; 696       break;
2017  0019 200c          	jra	L3101
2018  001b               L576:
2019                     ; 699     case 0x02:
2019                     ; 700       tempreg = (uint8_t)I2C->SR2;
2021  001b c65218        	ld	a,21016
2022  001e 6b02          	ld	(OFST+0,sp),a
2024                     ; 701       break;
2026  0020 2005          	jra	L3101
2027  0022               L776:
2028                     ; 704     case 0x03:
2028                     ; 705       tempreg = (uint8_t)I2C->SR3;
2030  0022 c65219        	ld	a,21017
2031  0025 6b02          	ld	(OFST+0,sp),a
2033                     ; 706       break;
2035  0027               L107:
2036                     ; 708     default:
2036                     ; 709       break;
2038  0027               L3101:
2039                     ; 713   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2041  0027 7b04          	ld	a,(OFST+2,sp)
2042  0029 1502          	bcp	a,(OFST+0,sp)
2043  002b 2706          	jreq	L5101
2044                     ; 716     bitstatus = SET;
2046  002d a601          	ld	a,#1
2047  002f 6b02          	ld	(OFST+0,sp),a
2050  0031 2002          	jra	L7101
2051  0033               L5101:
2052                     ; 721     bitstatus = RESET;
2054  0033 0f02          	clr	(OFST+0,sp)
2056  0035               L7101:
2057                     ; 724   return bitstatus;
2059  0035 7b02          	ld	a,(OFST+0,sp)
2062  0037 5b04          	addw	sp,#4
2063  0039 81            	ret
2107                     ; 759 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2107                     ; 760 {
2108                     .text:	section	.text,new
2109  0000               _I2C_ClearFlag:
2111  0000 89            	pushw	x
2112       00000002      OFST:	set	2
2115                     ; 761   uint16_t flagpos = 0;
2117                     ; 763   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2119                     ; 766   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2121  0001 01            	rrwa	x,a
2122  0002 a4ff          	and	a,#255
2123  0004 5f            	clrw	x
2124  0005 02            	rlwa	x,a
2125  0006 1f01          	ldw	(OFST-1,sp),x
2126  0008 01            	rrwa	x,a
2128                     ; 768   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2130  0009 7b02          	ld	a,(OFST+0,sp)
2131  000b 43            	cpl	a
2132  000c c75218        	ld	21016,a
2133                     ; 769 }
2136  000f 85            	popw	x
2137  0010 81            	ret
2303                     ; 791 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2303                     ; 792 {
2304                     .text:	section	.text,new
2305  0000               _I2C_GetITStatus:
2307  0000 89            	pushw	x
2308  0001 5204          	subw	sp,#4
2309       00000004      OFST:	set	4
2312                     ; 793   ITStatus bitstatus = RESET;
2314                     ; 794   __IO uint8_t enablestatus = 0;
2316  0003 0f03          	clr	(OFST-1,sp)
2318                     ; 795   uint16_t tempregister = 0;
2320                     ; 798     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2322                     ; 800   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2324  0005 9e            	ld	a,xh
2325  0006 a407          	and	a,#7
2326  0008 5f            	clrw	x
2327  0009 97            	ld	xl,a
2328  000a 1f01          	ldw	(OFST-3,sp),x
2330                     ; 803   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2332  000c c6521a        	ld	a,21018
2333  000f 1402          	and	a,(OFST-2,sp)
2334  0011 6b03          	ld	(OFST-1,sp),a
2336                     ; 805   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2338  0013 7b05          	ld	a,(OFST+1,sp)
2339  0015 97            	ld	xl,a
2340  0016 7b06          	ld	a,(OFST+2,sp)
2341  0018 9f            	ld	a,xl
2342  0019 a430          	and	a,#48
2343  001b 97            	ld	xl,a
2344  001c 4f            	clr	a
2345  001d 02            	rlwa	x,a
2346  001e a30100        	cpw	x,#256
2347  0021 2615          	jrne	L1311
2348                     ; 808     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2350  0023 c65217        	ld	a,21015
2351  0026 1506          	bcp	a,(OFST+2,sp)
2352  0028 270a          	jreq	L3311
2354  002a 0d03          	tnz	(OFST-1,sp)
2355  002c 2706          	jreq	L3311
2356                     ; 811       bitstatus = SET;
2358  002e a601          	ld	a,#1
2359  0030 6b04          	ld	(OFST+0,sp),a
2362  0032 2017          	jra	L7311
2363  0034               L3311:
2364                     ; 816       bitstatus = RESET;
2366  0034 0f04          	clr	(OFST+0,sp)
2368  0036 2013          	jra	L7311
2369  0038               L1311:
2370                     ; 822     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2372  0038 c65218        	ld	a,21016
2373  003b 1506          	bcp	a,(OFST+2,sp)
2374  003d 270a          	jreq	L1411
2376  003f 0d03          	tnz	(OFST-1,sp)
2377  0041 2706          	jreq	L1411
2378                     ; 825       bitstatus = SET;
2380  0043 a601          	ld	a,#1
2381  0045 6b04          	ld	(OFST+0,sp),a
2384  0047 2002          	jra	L7311
2385  0049               L1411:
2386                     ; 830       bitstatus = RESET;
2388  0049 0f04          	clr	(OFST+0,sp)
2390  004b               L7311:
2391                     ; 834   return  bitstatus;
2393  004b 7b04          	ld	a,(OFST+0,sp)
2396  004d 5b06          	addw	sp,#6
2397  004f 81            	ret
2442                     ; 871 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2442                     ; 872 {
2443                     .text:	section	.text,new
2444  0000               _I2C_ClearITPendingBit:
2446  0000 89            	pushw	x
2447       00000002      OFST:	set	2
2450                     ; 873   uint16_t flagpos = 0;
2452                     ; 876   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2454                     ; 879   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2456  0001 01            	rrwa	x,a
2457  0002 a4ff          	and	a,#255
2458  0004 5f            	clrw	x
2459  0005 02            	rlwa	x,a
2460  0006 1f01          	ldw	(OFST-1,sp),x
2461  0008 01            	rrwa	x,a
2463                     ; 882   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2465  0009 7b02          	ld	a,(OFST+0,sp)
2466  000b 43            	cpl	a
2467  000c c75218        	ld	21016,a
2468                     ; 883 }
2471  000f 85            	popw	x
2472  0010 81            	ret
2485                     	xdef	_I2C_ClearITPendingBit
2486                     	xdef	_I2C_GetITStatus
2487                     	xdef	_I2C_ClearFlag
2488                     	xdef	_I2C_GetFlagStatus
2489                     	xdef	_I2C_GetLastEvent
2490                     	xdef	_I2C_CheckEvent
2491                     	xdef	_I2C_SendData
2492                     	xdef	_I2C_Send7bitAddress
2493                     	xdef	_I2C_ReceiveData
2494                     	xdef	_I2C_ITConfig
2495                     	xdef	_I2C_FastModeDutyCycleConfig
2496                     	xdef	_I2C_AcknowledgeConfig
2497                     	xdef	_I2C_StretchClockCmd
2498                     	xdef	_I2C_SoftwareResetCmd
2499                     	xdef	_I2C_GenerateSTOP
2500                     	xdef	_I2C_GenerateSTART
2501                     	xdef	_I2C_GeneralCallCmd
2502                     	xdef	_I2C_Cmd
2503                     	xdef	_I2C_Init
2504                     	xdef	_I2C_DeInit
2505                     	xref.b	c_lreg
2506                     	xref.b	c_x
2525                     	xref	c_sdivx
2526                     	xref	c_ludv
2527                     	xref	c_rtol
2528                     	xref	c_smul
2529                     	xref	c_lmul
2530                     	xref	c_lcmp
2531                     	xref	c_ltor
2532                     	end
