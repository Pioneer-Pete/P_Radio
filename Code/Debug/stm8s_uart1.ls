   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  44                     ; 53 void UART1_DeInit(void)
  44                     ; 54 {
  46                     .text:	section	.text,new
  47  0000               _UART1_DeInit:
  51                     ; 57   (void)UART1->SR;
  53  0000 c65230        	ld	a,21040
  54                     ; 58   (void)UART1->DR;
  56  0003 c65231        	ld	a,21041
  57                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  59  0006 725f5233      	clr	21043
  60                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  62  000a 725f5232      	clr	21042
  63                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  65  000e 725f5234      	clr	21044
  66                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  68  0012 725f5235      	clr	21045
  69                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  71  0016 725f5236      	clr	21046
  72                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  74  001a 725f5237      	clr	21047
  75                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  77  001e 725f5238      	clr	21048
  78                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
  80  0022 725f5239      	clr	21049
  81                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
  83  0026 725f523a      	clr	21050
  84                     ; 71 }
  87  002a 81            	ret
 390                     .const:	section	.text
 391  0000               L01:
 392  0000 00000064      	dc.l	100
 393                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 393                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 393                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 393                     ; 93 {
 394                     .text:	section	.text,new
 395  0000               _UART1_Init:
 397  0000 520c          	subw	sp,#12
 398       0000000c      OFST:	set	12
 401                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 405                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 407                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 409                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 411                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 413                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 415                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 417                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 419  0002 72195234      	bres	21044,#4
 420                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 422  0006 c65234        	ld	a,21044
 423  0009 1a13          	or	a,(OFST+7,sp)
 424  000b c75234        	ld	21044,a
 425                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 427  000e c65236        	ld	a,21046
 428  0011 a4cf          	and	a,#207
 429  0013 c75236        	ld	21046,a
 430                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 432  0016 c65236        	ld	a,21046
 433  0019 1a14          	or	a,(OFST+8,sp)
 434  001b c75236        	ld	21046,a
 435                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 437  001e c65234        	ld	a,21044
 438  0021 a4f9          	and	a,#249
 439  0023 c75234        	ld	21044,a
 440                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 442  0026 c65234        	ld	a,21044
 443  0029 1a15          	or	a,(OFST+9,sp)
 444  002b c75234        	ld	21044,a
 445                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 447  002e 725f5232      	clr	21042
 448                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 450  0032 c65233        	ld	a,21043
 451  0035 a40f          	and	a,#15
 452  0037 c75233        	ld	21043,a
 453                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 455  003a c65233        	ld	a,21043
 456  003d a4f0          	and	a,#240
 457  003f c75233        	ld	21043,a
 458                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 460  0042 96            	ldw	x,sp
 461  0043 1c000f        	addw	x,#OFST+3
 462  0046 cd0000        	call	c_ltor
 464  0049 a604          	ld	a,#4
 465  004b cd0000        	call	c_llsh
 467  004e 96            	ldw	x,sp
 468  004f 1c0001        	addw	x,#OFST-11
 469  0052 cd0000        	call	c_rtol
 472  0055 cd0000        	call	_CLK_GetClockFreq
 474  0058 96            	ldw	x,sp
 475  0059 1c0001        	addw	x,#OFST-11
 476  005c cd0000        	call	c_ludv
 478  005f 96            	ldw	x,sp
 479  0060 1c0009        	addw	x,#OFST-3
 480  0063 cd0000        	call	c_rtol
 483                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 485  0066 96            	ldw	x,sp
 486  0067 1c000f        	addw	x,#OFST+3
 487  006a cd0000        	call	c_ltor
 489  006d a604          	ld	a,#4
 490  006f cd0000        	call	c_llsh
 492  0072 96            	ldw	x,sp
 493  0073 1c0001        	addw	x,#OFST-11
 494  0076 cd0000        	call	c_rtol
 497  0079 cd0000        	call	_CLK_GetClockFreq
 499  007c a664          	ld	a,#100
 500  007e cd0000        	call	c_smul
 502  0081 96            	ldw	x,sp
 503  0082 1c0001        	addw	x,#OFST-11
 504  0085 cd0000        	call	c_ludv
 506  0088 96            	ldw	x,sp
 507  0089 1c0005        	addw	x,#OFST-7
 508  008c cd0000        	call	c_rtol
 511                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 513  008f 96            	ldw	x,sp
 514  0090 1c0009        	addw	x,#OFST-3
 515  0093 cd0000        	call	c_ltor
 517  0096 a664          	ld	a,#100
 518  0098 cd0000        	call	c_smul
 520  009b 96            	ldw	x,sp
 521  009c 1c0001        	addw	x,#OFST-11
 522  009f cd0000        	call	c_rtol
 525  00a2 96            	ldw	x,sp
 526  00a3 1c0005        	addw	x,#OFST-7
 527  00a6 cd0000        	call	c_ltor
 529  00a9 96            	ldw	x,sp
 530  00aa 1c0001        	addw	x,#OFST-11
 531  00ad cd0000        	call	c_lsub
 533  00b0 a604          	ld	a,#4
 534  00b2 cd0000        	call	c_llsh
 536  00b5 ae0000        	ldw	x,#L01
 537  00b8 cd0000        	call	c_ludv
 539  00bb b603          	ld	a,c_lreg+3
 540  00bd a40f          	and	a,#15
 541  00bf ca5233        	or	a,21043
 542  00c2 c75233        	ld	21043,a
 543                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 545  00c5 1e0b          	ldw	x,(OFST-1,sp)
 546  00c7 54            	srlw	x
 547  00c8 54            	srlw	x
 548  00c9 54            	srlw	x
 549  00ca 54            	srlw	x
 550  00cb 01            	rrwa	x,a
 551  00cc a4f0          	and	a,#240
 552  00ce 5f            	clrw	x
 553  00cf ca5233        	or	a,21043
 554  00d2 c75233        	ld	21043,a
 555                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 557  00d5 c65232        	ld	a,21042
 558  00d8 1a0c          	or	a,(OFST+0,sp)
 559  00da c75232        	ld	21042,a
 560                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 562  00dd c65235        	ld	a,21045
 563  00e0 a4f3          	and	a,#243
 564  00e2 c75235        	ld	21045,a
 565                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 567  00e5 c65236        	ld	a,21046
 568  00e8 a4f8          	and	a,#248
 569  00ea c75236        	ld	21046,a
 570                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 570                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 572  00ed 7b16          	ld	a,(OFST+10,sp)
 573  00ef a407          	and	a,#7
 574  00f1 ca5236        	or	a,21046
 575  00f4 c75236        	ld	21046,a
 576                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 578  00f7 7b17          	ld	a,(OFST+11,sp)
 579  00f9 a504          	bcp	a,#4
 580  00fb 2706          	jreq	L371
 581                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 583  00fd 72165235      	bset	21045,#3
 585  0101 2004          	jra	L571
 586  0103               L371:
 587                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 589  0103 72175235      	bres	21045,#3
 590  0107               L571:
 591                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 593  0107 7b17          	ld	a,(OFST+11,sp)
 594  0109 a508          	bcp	a,#8
 595  010b 2706          	jreq	L771
 596                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 598  010d 72145235      	bset	21045,#2
 600  0111 2004          	jra	L102
 601  0113               L771:
 602                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 604  0113 72155235      	bres	21045,#2
 605  0117               L102:
 606                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 608  0117 7b16          	ld	a,(OFST+10,sp)
 609  0119 a580          	bcp	a,#128
 610  011b 2706          	jreq	L302
 611                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 613  011d 72175236      	bres	21046,#3
 615  0121 200a          	jra	L502
 616  0123               L302:
 617                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 619  0123 7b16          	ld	a,(OFST+10,sp)
 620  0125 a408          	and	a,#8
 621  0127 ca5236        	or	a,21046
 622  012a c75236        	ld	21046,a
 623  012d               L502:
 624                     ; 176 }
 627  012d 5b0c          	addw	sp,#12
 628  012f 81            	ret
 683                     ; 184 void UART1_Cmd(FunctionalState NewState)
 683                     ; 185 {
 684                     .text:	section	.text,new
 685  0000               _UART1_Cmd:
 689                     ; 186   if (NewState != DISABLE)
 691  0000 4d            	tnz	a
 692  0001 2706          	jreq	L532
 693                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 695  0003 721b5234      	bres	21044,#5
 697  0007 2004          	jra	L732
 698  0009               L532:
 699                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 701  0009 721a5234      	bset	21044,#5
 702  000d               L732:
 703                     ; 196 }
 706  000d 81            	ret
 831                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 831                     ; 212 {
 832                     .text:	section	.text,new
 833  0000               _UART1_ITConfig:
 835  0000 89            	pushw	x
 836  0001 89            	pushw	x
 837       00000002      OFST:	set	2
 840                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 844                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 846                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 848                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
 850  0002 9e            	ld	a,xh
 851  0003 6b01          	ld	(OFST-1,sp),a
 853                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
 855  0005 9f            	ld	a,xl
 856  0006 a40f          	and	a,#15
 857  0008 5f            	clrw	x
 858  0009 97            	ld	xl,a
 859  000a a601          	ld	a,#1
 860  000c 5d            	tnzw	x
 861  000d 2704          	jreq	L61
 862  000f               L02:
 863  000f 48            	sll	a
 864  0010 5a            	decw	x
 865  0011 26fc          	jrne	L02
 866  0013               L61:
 867  0013 6b02          	ld	(OFST+0,sp),a
 869                     ; 224   if (NewState != DISABLE)
 871  0015 0d07          	tnz	(OFST+5,sp)
 872  0017 272a          	jreq	L713
 873                     ; 227     if (uartreg == 0x01)
 875  0019 7b01          	ld	a,(OFST-1,sp)
 876  001b a101          	cp	a,#1
 877  001d 260a          	jrne	L123
 878                     ; 229       UART1->CR1 |= itpos;
 880  001f c65234        	ld	a,21044
 881  0022 1a02          	or	a,(OFST+0,sp)
 882  0024 c75234        	ld	21044,a
 884  0027 2045          	jra	L133
 885  0029               L123:
 886                     ; 231     else if (uartreg == 0x02)
 888  0029 7b01          	ld	a,(OFST-1,sp)
 889  002b a102          	cp	a,#2
 890  002d 260a          	jrne	L523
 891                     ; 233       UART1->CR2 |= itpos;
 893  002f c65235        	ld	a,21045
 894  0032 1a02          	or	a,(OFST+0,sp)
 895  0034 c75235        	ld	21045,a
 897  0037 2035          	jra	L133
 898  0039               L523:
 899                     ; 237       UART1->CR4 |= itpos;
 901  0039 c65237        	ld	a,21047
 902  003c 1a02          	or	a,(OFST+0,sp)
 903  003e c75237        	ld	21047,a
 904  0041 202b          	jra	L133
 905  0043               L713:
 906                     ; 243     if (uartreg == 0x01)
 908  0043 7b01          	ld	a,(OFST-1,sp)
 909  0045 a101          	cp	a,#1
 910  0047 260b          	jrne	L333
 911                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
 913  0049 7b02          	ld	a,(OFST+0,sp)
 914  004b 43            	cpl	a
 915  004c c45234        	and	a,21044
 916  004f c75234        	ld	21044,a
 918  0052 201a          	jra	L133
 919  0054               L333:
 920                     ; 247     else if (uartreg == 0x02)
 922  0054 7b01          	ld	a,(OFST-1,sp)
 923  0056 a102          	cp	a,#2
 924  0058 260b          	jrne	L733
 925                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
 927  005a 7b02          	ld	a,(OFST+0,sp)
 928  005c 43            	cpl	a
 929  005d c45235        	and	a,21045
 930  0060 c75235        	ld	21045,a
 932  0063 2009          	jra	L133
 933  0065               L733:
 934                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
 936  0065 7b02          	ld	a,(OFST+0,sp)
 937  0067 43            	cpl	a
 938  0068 c45237        	and	a,21047
 939  006b c75237        	ld	21047,a
 940  006e               L133:
 941                     ; 257 }
 944  006e 5b04          	addw	sp,#4
 945  0070 81            	ret
 981                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
 981                     ; 266 {
 982                     .text:	section	.text,new
 983  0000               _UART1_HalfDuplexCmd:
 987                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 989                     ; 269   if (NewState != DISABLE)
 991  0000 4d            	tnz	a
 992  0001 2706          	jreq	L163
 993                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
 995  0003 72165238      	bset	21048,#3
 997  0007 2004          	jra	L363
 998  0009               L163:
 999                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1001  0009 72175238      	bres	21048,#3
1002  000d               L363:
1003                     ; 277 }
1006  000d 81            	ret
1063                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1063                     ; 286 {
1064                     .text:	section	.text,new
1065  0000               _UART1_IrDAConfig:
1069                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1071                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1073  0000 4d            	tnz	a
1074  0001 2706          	jreq	L314
1075                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1077  0003 72145238      	bset	21048,#2
1079  0007 2004          	jra	L514
1080  0009               L314:
1081                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1083  0009 72155238      	bres	21048,#2
1084  000d               L514:
1085                     ; 297 }
1088  000d 81            	ret
1123                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1123                     ; 306 {
1124                     .text:	section	.text,new
1125  0000               _UART1_IrDACmd:
1129                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1131                     ; 310   if (NewState != DISABLE)
1133  0000 4d            	tnz	a
1134  0001 2706          	jreq	L534
1135                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1137  0003 72125238      	bset	21048,#1
1139  0007 2004          	jra	L734
1140  0009               L534:
1141                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1143  0009 72135238      	bres	21048,#1
1144  000d               L734:
1145                     ; 320 }
1148  000d 81            	ret
1207                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1207                     ; 330 {
1208                     .text:	section	.text,new
1209  0000               _UART1_LINBreakDetectionConfig:
1213                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1215                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1217  0000 4d            	tnz	a
1218  0001 2706          	jreq	L764
1219                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1221  0003 721a5237      	bset	21047,#5
1223  0007 2004          	jra	L174
1224  0009               L764:
1225                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1227  0009 721b5237      	bres	21047,#5
1228  000d               L174:
1229                     ; 341 }
1232  000d 81            	ret
1267                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1267                     ; 350 {
1268                     .text:	section	.text,new
1269  0000               _UART1_LINCmd:
1273                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1275                     ; 353   if (NewState != DISABLE)
1277  0000 4d            	tnz	a
1278  0001 2706          	jreq	L115
1279                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1281  0003 721c5236      	bset	21046,#6
1283  0007 2004          	jra	L315
1284  0009               L115:
1285                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1287  0009 721d5236      	bres	21046,#6
1288  000d               L315:
1289                     ; 363 }
1292  000d 81            	ret
1327                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1327                     ; 372 {
1328                     .text:	section	.text,new
1329  0000               _UART1_SmartCardCmd:
1333                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1335                     ; 375   if (NewState != DISABLE)
1337  0000 4d            	tnz	a
1338  0001 2706          	jreq	L335
1339                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1341  0003 721a5238      	bset	21048,#5
1343  0007 2004          	jra	L535
1344  0009               L335:
1345                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1347  0009 721b5238      	bres	21048,#5
1348  000d               L535:
1349                     ; 385 }
1352  000d 81            	ret
1388                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1388                     ; 395 {
1389                     .text:	section	.text,new
1390  0000               _UART1_SmartCardNACKCmd:
1394                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1396                     ; 398   if (NewState != DISABLE)
1398  0000 4d            	tnz	a
1399  0001 2706          	jreq	L555
1400                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1402  0003 72185238      	bset	21048,#4
1404  0007 2004          	jra	L755
1405  0009               L555:
1406                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1408  0009 72195238      	bres	21048,#4
1409  000d               L755:
1410                     ; 408 }
1413  000d 81            	ret
1470                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1470                     ; 417 {
1471                     .text:	section	.text,new
1472  0000               _UART1_WakeUpConfig:
1476                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1478                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1480  0000 72175234      	bres	21044,#3
1481                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1483  0004 ca5234        	or	a,21044
1484  0007 c75234        	ld	21044,a
1485                     ; 422 }
1488  000a 81            	ret
1524                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1524                     ; 431 {
1525                     .text:	section	.text,new
1526  0000               _UART1_ReceiverWakeUpCmd:
1530                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1532                     ; 434   if (NewState != DISABLE)
1534  0000 4d            	tnz	a
1535  0001 2706          	jreq	L526
1536                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1538  0003 72125235      	bset	21045,#1
1540  0007 2004          	jra	L726
1541  0009               L526:
1542                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1544  0009 72135235      	bres	21045,#1
1545  000d               L726:
1546                     ; 444 }
1549  000d 81            	ret
1572                     ; 451 uint8_t UART1_ReceiveData8(void)
1572                     ; 452 {
1573                     .text:	section	.text,new
1574  0000               _UART1_ReceiveData8:
1578                     ; 453   return ((uint8_t)UART1->DR);
1580  0000 c65231        	ld	a,21041
1583  0003 81            	ret
1617                     ; 461 uint16_t UART1_ReceiveData9(void)
1617                     ; 462 {
1618                     .text:	section	.text,new
1619  0000               _UART1_ReceiveData9:
1621  0000 89            	pushw	x
1622       00000002      OFST:	set	2
1625                     ; 463   uint16_t temp = 0;
1627                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
1629  0001 c65234        	ld	a,21044
1630  0004 5f            	clrw	x
1631  0005 a480          	and	a,#128
1632  0007 5f            	clrw	x
1633  0008 02            	rlwa	x,a
1634  0009 58            	sllw	x
1635  000a 1f01          	ldw	(OFST-1,sp),x
1637                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
1639  000c c65231        	ld	a,21041
1640  000f 5f            	clrw	x
1641  0010 97            	ld	xl,a
1642  0011 01            	rrwa	x,a
1643  0012 1a02          	or	a,(OFST+0,sp)
1644  0014 01            	rrwa	x,a
1645  0015 1a01          	or	a,(OFST-1,sp)
1646  0017 01            	rrwa	x,a
1647  0018 01            	rrwa	x,a
1648  0019 a4ff          	and	a,#255
1649  001b 01            	rrwa	x,a
1650  001c a401          	and	a,#1
1651  001e 01            	rrwa	x,a
1654  001f 5b02          	addw	sp,#2
1655  0021 81            	ret
1689                     ; 474 void UART1_SendData8(uint8_t Data)
1689                     ; 475 {
1690                     .text:	section	.text,new
1691  0000               _UART1_SendData8:
1695                     ; 477   UART1->DR = Data;
1697  0000 c75231        	ld	21041,a
1698                     ; 478 }
1701  0003 81            	ret
1735                     ; 486 void UART1_SendData9(uint16_t Data)
1735                     ; 487 {
1736                     .text:	section	.text,new
1737  0000               _UART1_SendData9:
1739  0000 89            	pushw	x
1740       00000000      OFST:	set	0
1743                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
1745  0001 721d5234      	bres	21044,#6
1746                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
1748  0005 54            	srlw	x
1749  0006 54            	srlw	x
1750  0007 9f            	ld	a,xl
1751  0008 a440          	and	a,#64
1752  000a ca5234        	or	a,21044
1753  000d c75234        	ld	21044,a
1754                     ; 493   UART1->DR   = (uint8_t)(Data);
1756  0010 7b02          	ld	a,(OFST+2,sp)
1757  0012 c75231        	ld	21041,a
1758                     ; 494 }
1761  0015 85            	popw	x
1762  0016 81            	ret
1785                     ; 501 void UART1_SendBreak(void)
1785                     ; 502 {
1786                     .text:	section	.text,new
1787  0000               _UART1_SendBreak:
1791                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
1793  0000 72105235      	bset	21045,#0
1794                     ; 504 }
1797  0004 81            	ret
1831                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
1831                     ; 512 {
1832                     .text:	section	.text,new
1833  0000               _UART1_SetAddress:
1835  0000 88            	push	a
1836       00000000      OFST:	set	0
1839                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
1841                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
1843  0001 c65237        	ld	a,21047
1844  0004 a4f0          	and	a,#240
1845  0006 c75237        	ld	21047,a
1846                     ; 519   UART1->CR4 |= UART1_Address;
1848  0009 c65237        	ld	a,21047
1849  000c 1a01          	or	a,(OFST+1,sp)
1850  000e c75237        	ld	21047,a
1851                     ; 520 }
1854  0011 84            	pop	a
1855  0012 81            	ret
1889                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
1889                     ; 529 {
1890                     .text:	section	.text,new
1891  0000               _UART1_SetGuardTime:
1895                     ; 531   UART1->GTR = UART1_GuardTime;
1897  0000 c75239        	ld	21049,a
1898                     ; 532 }
1901  0003 81            	ret
1935                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
1935                     ; 557 {
1936                     .text:	section	.text,new
1937  0000               _UART1_SetPrescaler:
1941                     ; 559   UART1->PSCR = UART1_Prescaler;
1943  0000 c7523a        	ld	21050,a
1944                     ; 560 }
1947  0003 81            	ret
2090                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2090                     ; 569 {
2091                     .text:	section	.text,new
2092  0000               _UART1_GetFlagStatus:
2094  0000 89            	pushw	x
2095  0001 88            	push	a
2096       00000001      OFST:	set	1
2099                     ; 570   FlagStatus status = RESET;
2101                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2103                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2105  0002 a30210        	cpw	x,#528
2106  0005 2610          	jrne	L7501
2107                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2109  0007 9f            	ld	a,xl
2110  0008 c45237        	and	a,21047
2111  000b 2706          	jreq	L1601
2112                     ; 582       status = SET;
2114  000d a601          	ld	a,#1
2115  000f 6b01          	ld	(OFST+0,sp),a
2118  0011 202b          	jra	L5601
2119  0013               L1601:
2120                     ; 587       status = RESET;
2122  0013 0f01          	clr	(OFST+0,sp)
2124  0015 2027          	jra	L5601
2125  0017               L7501:
2126                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2128  0017 1e02          	ldw	x,(OFST+1,sp)
2129  0019 a30101        	cpw	x,#257
2130  001c 2611          	jrne	L7601
2131                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2133  001e c65235        	ld	a,21045
2134  0021 1503          	bcp	a,(OFST+2,sp)
2135  0023 2706          	jreq	L1701
2136                     ; 595       status = SET;
2138  0025 a601          	ld	a,#1
2139  0027 6b01          	ld	(OFST+0,sp),a
2142  0029 2013          	jra	L5601
2143  002b               L1701:
2144                     ; 600       status = RESET;
2146  002b 0f01          	clr	(OFST+0,sp)
2148  002d 200f          	jra	L5601
2149  002f               L7601:
2150                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2152  002f c65230        	ld	a,21040
2153  0032 1503          	bcp	a,(OFST+2,sp)
2154  0034 2706          	jreq	L7701
2155                     ; 608       status = SET;
2157  0036 a601          	ld	a,#1
2158  0038 6b01          	ld	(OFST+0,sp),a
2161  003a 2002          	jra	L5601
2162  003c               L7701:
2163                     ; 613       status = RESET;
2165  003c 0f01          	clr	(OFST+0,sp)
2167  003e               L5601:
2168                     ; 617   return status;
2170  003e 7b01          	ld	a,(OFST+0,sp)
2173  0040 5b03          	addw	sp,#3
2174  0042 81            	ret
2209                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2209                     ; 647 {
2210                     .text:	section	.text,new
2211  0000               _UART1_ClearFlag:
2215                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2217                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2219  0000 a30020        	cpw	x,#32
2220  0003 2606          	jrne	L1211
2221                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2223  0005 35df5230      	mov	21040,#223
2225  0009 2004          	jra	L3211
2226  000b               L1211:
2227                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2229  000b 72195237      	bres	21047,#4
2230  000f               L3211:
2231                     ; 660 }
2234  000f 81            	ret
2316                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2316                     ; 676 {
2317                     .text:	section	.text,new
2318  0000               _UART1_GetITStatus:
2320  0000 89            	pushw	x
2321  0001 89            	pushw	x
2322       00000002      OFST:	set	2
2325                     ; 677   ITStatus pendingbitstatus = RESET;
2327                     ; 678   uint8_t itpos = 0;
2329                     ; 679   uint8_t itmask1 = 0;
2331                     ; 680   uint8_t itmask2 = 0;
2333                     ; 681   uint8_t enablestatus = 0;
2335                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2337                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2339  0002 9f            	ld	a,xl
2340  0003 a40f          	and	a,#15
2341  0005 5f            	clrw	x
2342  0006 97            	ld	xl,a
2343  0007 a601          	ld	a,#1
2344  0009 5d            	tnzw	x
2345  000a 2704          	jreq	L27
2346  000c               L47:
2347  000c 48            	sll	a
2348  000d 5a            	decw	x
2349  000e 26fc          	jrne	L47
2350  0010               L27:
2351  0010 6b01          	ld	(OFST-1,sp),a
2353                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2355  0012 7b04          	ld	a,(OFST+2,sp)
2356  0014 4e            	swap	a
2357  0015 a40f          	and	a,#15
2358  0017 6b02          	ld	(OFST+0,sp),a
2360                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2362  0019 7b02          	ld	a,(OFST+0,sp)
2363  001b 5f            	clrw	x
2364  001c 97            	ld	xl,a
2365  001d a601          	ld	a,#1
2366  001f 5d            	tnzw	x
2367  0020 2704          	jreq	L67
2368  0022               L001:
2369  0022 48            	sll	a
2370  0023 5a            	decw	x
2371  0024 26fc          	jrne	L001
2372  0026               L67:
2373  0026 6b02          	ld	(OFST+0,sp),a
2375                     ; 695   if (UART1_IT == UART1_IT_PE)
2377  0028 1e03          	ldw	x,(OFST+1,sp)
2378  002a a30100        	cpw	x,#256
2379  002d 261c          	jrne	L7611
2380                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2382  002f c65234        	ld	a,21044
2383  0032 1402          	and	a,(OFST+0,sp)
2384  0034 6b02          	ld	(OFST+0,sp),a
2386                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2388  0036 c65230        	ld	a,21040
2389  0039 1501          	bcp	a,(OFST-1,sp)
2390  003b 270a          	jreq	L1711
2392  003d 0d02          	tnz	(OFST+0,sp)
2393  003f 2706          	jreq	L1711
2394                     ; 704       pendingbitstatus = SET;
2396  0041 a601          	ld	a,#1
2397  0043 6b02          	ld	(OFST+0,sp),a
2400  0045 2041          	jra	L5711
2401  0047               L1711:
2402                     ; 709       pendingbitstatus = RESET;
2404  0047 0f02          	clr	(OFST+0,sp)
2406  0049 203d          	jra	L5711
2407  004b               L7611:
2408                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2410  004b 1e03          	ldw	x,(OFST+1,sp)
2411  004d a30346        	cpw	x,#838
2412  0050 261c          	jrne	L7711
2413                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2415  0052 c65237        	ld	a,21047
2416  0055 1402          	and	a,(OFST+0,sp)
2417  0057 6b02          	ld	(OFST+0,sp),a
2419                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2421  0059 c65237        	ld	a,21047
2422  005c 1501          	bcp	a,(OFST-1,sp)
2423  005e 270a          	jreq	L1021
2425  0060 0d02          	tnz	(OFST+0,sp)
2426  0062 2706          	jreq	L1021
2427                     ; 721       pendingbitstatus = SET;
2429  0064 a601          	ld	a,#1
2430  0066 6b02          	ld	(OFST+0,sp),a
2433  0068 201e          	jra	L5711
2434  006a               L1021:
2435                     ; 726       pendingbitstatus = RESET;
2437  006a 0f02          	clr	(OFST+0,sp)
2439  006c 201a          	jra	L5711
2440  006e               L7711:
2441                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2443  006e c65235        	ld	a,21045
2444  0071 1402          	and	a,(OFST+0,sp)
2445  0073 6b02          	ld	(OFST+0,sp),a
2447                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2449  0075 c65230        	ld	a,21040
2450  0078 1501          	bcp	a,(OFST-1,sp)
2451  007a 270a          	jreq	L7021
2453  007c 0d02          	tnz	(OFST+0,sp)
2454  007e 2706          	jreq	L7021
2455                     ; 737       pendingbitstatus = SET;
2457  0080 a601          	ld	a,#1
2458  0082 6b02          	ld	(OFST+0,sp),a
2461  0084 2002          	jra	L5711
2462  0086               L7021:
2463                     ; 742       pendingbitstatus = RESET;
2465  0086 0f02          	clr	(OFST+0,sp)
2467  0088               L5711:
2468                     ; 747   return  pendingbitstatus;
2470  0088 7b02          	ld	a,(OFST+0,sp)
2473  008a 5b04          	addw	sp,#4
2474  008c 81            	ret
2510                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2510                     ; 776 {
2511                     .text:	section	.text,new
2512  0000               _UART1_ClearITPendingBit:
2516                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2518                     ; 780   if (UART1_IT == UART1_IT_RXNE)
2520  0000 a30255        	cpw	x,#597
2521  0003 2606          	jrne	L1321
2522                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2524  0005 35df5230      	mov	21040,#223
2526  0009 2004          	jra	L3321
2527  000b               L1321:
2528                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2530  000b 72195237      	bres	21047,#4
2531  000f               L3321:
2532                     ; 789 }
2535  000f 81            	ret
2548                     	xdef	_UART1_ClearITPendingBit
2549                     	xdef	_UART1_GetITStatus
2550                     	xdef	_UART1_ClearFlag
2551                     	xdef	_UART1_GetFlagStatus
2552                     	xdef	_UART1_SetPrescaler
2553                     	xdef	_UART1_SetGuardTime
2554                     	xdef	_UART1_SetAddress
2555                     	xdef	_UART1_SendBreak
2556                     	xdef	_UART1_SendData9
2557                     	xdef	_UART1_SendData8
2558                     	xdef	_UART1_ReceiveData9
2559                     	xdef	_UART1_ReceiveData8
2560                     	xdef	_UART1_ReceiverWakeUpCmd
2561                     	xdef	_UART1_WakeUpConfig
2562                     	xdef	_UART1_SmartCardNACKCmd
2563                     	xdef	_UART1_SmartCardCmd
2564                     	xdef	_UART1_LINCmd
2565                     	xdef	_UART1_LINBreakDetectionConfig
2566                     	xdef	_UART1_IrDACmd
2567                     	xdef	_UART1_IrDAConfig
2568                     	xdef	_UART1_HalfDuplexCmd
2569                     	xdef	_UART1_ITConfig
2570                     	xdef	_UART1_Cmd
2571                     	xdef	_UART1_Init
2572                     	xdef	_UART1_DeInit
2573                     	xref	_CLK_GetClockFreq
2574                     	xref.b	c_lreg
2575                     	xref.b	c_x
2594                     	xref	c_lsub
2595                     	xref	c_smul
2596                     	xref	c_ludv
2597                     	xref	c_rtol
2598                     	xref	c_llsh
2599                     	xref	c_ltor
2600                     	end
