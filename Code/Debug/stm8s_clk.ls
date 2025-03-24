   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  16                     .const:	section	.text
  17  0000               _HSIDivFactor:
  18  0000 01            	dc.b	1
  19  0001 02            	dc.b	2
  20  0002 04            	dc.b	4
  21  0003 08            	dc.b	8
  22  0004               _CLKPrescTable:
  23  0004 01            	dc.b	1
  24  0005 02            	dc.b	2
  25  0006 04            	dc.b	4
  26  0007 08            	dc.b	8
  27  0008 0a            	dc.b	10
  28  0009 10            	dc.b	16
  29  000a 14            	dc.b	20
  30  000b 28            	dc.b	40
  59                     ; 72 void CLK_DeInit(void)
  59                     ; 73 {
  61                     .text:	section	.text,new
  62  0000               _CLK_DeInit:
  66                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  68  0000 350150c0      	mov	20672,#1
  69                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  71  0004 725f50c1      	clr	20673
  72                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  74  0008 35e150c4      	mov	20676,#225
  75                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  77  000c 725f50c5      	clr	20677
  78                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  80  0010 351850c6      	mov	20678,#24
  81                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  83  0014 35ff50c7      	mov	20679,#255
  84                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  86  0018 35ff50ca      	mov	20682,#255
  87                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  89  001c 725f50c8      	clr	20680
  90                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  92  0020 725f50c9      	clr	20681
  94  0024               L52:
  95                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  97  0024 c650c9        	ld	a,20681
  98  0027 a501          	bcp	a,#1
  99  0029 26f9          	jrne	L52
 100                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 102  002b 725f50c9      	clr	20681
 103                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 105  002f 725f50cc      	clr	20684
 106                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 108  0033 725f50cd      	clr	20685
 109                     ; 88 }
 112  0037 81            	ret
 168                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 168                     ; 100 {
 169                     .text:	section	.text,new
 170  0000               _CLK_FastHaltWakeUpCmd:
 174                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 176                     ; 104   if (NewState != DISABLE)
 178  0000 4d            	tnz	a
 179  0001 2706          	jreq	L75
 180                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 182  0003 721450c0      	bset	20672,#2
 184  0007 2004          	jra	L16
 185  0009               L75:
 186                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 188  0009 721550c0      	bres	20672,#2
 189  000d               L16:
 190                     ; 114 }
 193  000d 81            	ret
 228                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 228                     ; 122 {
 229                     .text:	section	.text,new
 230  0000               _CLK_HSECmd:
 234                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 236                     ; 126   if (NewState != DISABLE)
 238  0000 4d            	tnz	a
 239  0001 2706          	jreq	L101
 240                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 242  0003 721050c1      	bset	20673,#0
 244  0007 2004          	jra	L301
 245  0009               L101:
 246                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 248  0009 721150c1      	bres	20673,#0
 249  000d               L301:
 250                     ; 136 }
 253  000d 81            	ret
 288                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 288                     ; 144 {
 289                     .text:	section	.text,new
 290  0000               _CLK_HSICmd:
 294                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 296                     ; 148   if (NewState != DISABLE)
 298  0000 4d            	tnz	a
 299  0001 2706          	jreq	L321
 300                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 302  0003 721050c0      	bset	20672,#0
 304  0007 2004          	jra	L521
 305  0009               L321:
 306                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 308  0009 721150c0      	bres	20672,#0
 309  000d               L521:
 310                     ; 158 }
 313  000d 81            	ret
 348                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 348                     ; 167 {
 349                     .text:	section	.text,new
 350  0000               _CLK_LSICmd:
 354                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 356                     ; 171   if (NewState != DISABLE)
 358  0000 4d            	tnz	a
 359  0001 2706          	jreq	L541
 360                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 362  0003 721650c0      	bset	20672,#3
 364  0007 2004          	jra	L741
 365  0009               L541:
 366                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 368  0009 721750c0      	bres	20672,#3
 369  000d               L741:
 370                     ; 181 }
 373  000d 81            	ret
 408                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 408                     ; 190 {
 409                     .text:	section	.text,new
 410  0000               _CLK_CCOCmd:
 414                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 416                     ; 194   if (NewState != DISABLE)
 418  0000 4d            	tnz	a
 419  0001 2706          	jreq	L761
 420                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 422  0003 721050c9      	bset	20681,#0
 424  0007 2004          	jra	L171
 425  0009               L761:
 426                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 428  0009 721150c9      	bres	20681,#0
 429  000d               L171:
 430                     ; 204 }
 433  000d 81            	ret
 468                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 468                     ; 214 {
 469                     .text:	section	.text,new
 470  0000               _CLK_ClockSwitchCmd:
 474                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 476                     ; 218   if (NewState != DISABLE )
 478  0000 4d            	tnz	a
 479  0001 2706          	jreq	L112
 480                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 482  0003 721250c5      	bset	20677,#1
 484  0007 2004          	jra	L312
 485  0009               L112:
 486                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 488  0009 721350c5      	bres	20677,#1
 489  000d               L312:
 490                     ; 228 }
 493  000d 81            	ret
 529                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 529                     ; 239 {
 530                     .text:	section	.text,new
 531  0000               _CLK_SlowActiveHaltWakeUpCmd:
 535                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 537                     ; 243   if (NewState != DISABLE)
 539  0000 4d            	tnz	a
 540  0001 2706          	jreq	L332
 541                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 543  0003 721a50c0      	bset	20672,#5
 545  0007 2004          	jra	L532
 546  0009               L332:
 547                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 549  0009 721b50c0      	bres	20672,#5
 550  000d               L532:
 551                     ; 253 }
 554  000d 81            	ret
 713                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 713                     ; 264 {
 714                     .text:	section	.text,new
 715  0000               _CLK_PeripheralClockConfig:
 717  0000 89            	pushw	x
 718       00000000      OFST:	set	0
 721                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 723                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 725                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 727  0001 9e            	ld	a,xh
 728  0002 a510          	bcp	a,#16
 729  0004 2633          	jrne	L123
 730                     ; 271     if (NewState != DISABLE)
 732  0006 0d02          	tnz	(OFST+2,sp)
 733  0008 2717          	jreq	L323
 734                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 736  000a 7b01          	ld	a,(OFST+1,sp)
 737  000c a40f          	and	a,#15
 738  000e 5f            	clrw	x
 739  000f 97            	ld	xl,a
 740  0010 a601          	ld	a,#1
 741  0012 5d            	tnzw	x
 742  0013 2704          	jreq	L62
 743  0015               L03:
 744  0015 48            	sll	a
 745  0016 5a            	decw	x
 746  0017 26fc          	jrne	L03
 747  0019               L62:
 748  0019 ca50c7        	or	a,20679
 749  001c c750c7        	ld	20679,a
 751  001f 2049          	jra	L723
 752  0021               L323:
 753                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 755  0021 7b01          	ld	a,(OFST+1,sp)
 756  0023 a40f          	and	a,#15
 757  0025 5f            	clrw	x
 758  0026 97            	ld	xl,a
 759  0027 a601          	ld	a,#1
 760  0029 5d            	tnzw	x
 761  002a 2704          	jreq	L23
 762  002c               L43:
 763  002c 48            	sll	a
 764  002d 5a            	decw	x
 765  002e 26fc          	jrne	L43
 766  0030               L23:
 767  0030 43            	cpl	a
 768  0031 c450c7        	and	a,20679
 769  0034 c750c7        	ld	20679,a
 770  0037 2031          	jra	L723
 771  0039               L123:
 772                     ; 284     if (NewState != DISABLE)
 774  0039 0d02          	tnz	(OFST+2,sp)
 775  003b 2717          	jreq	L133
 776                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 778  003d 7b01          	ld	a,(OFST+1,sp)
 779  003f a40f          	and	a,#15
 780  0041 5f            	clrw	x
 781  0042 97            	ld	xl,a
 782  0043 a601          	ld	a,#1
 783  0045 5d            	tnzw	x
 784  0046 2704          	jreq	L63
 785  0048               L04:
 786  0048 48            	sll	a
 787  0049 5a            	decw	x
 788  004a 26fc          	jrne	L04
 789  004c               L63:
 790  004c ca50ca        	or	a,20682
 791  004f c750ca        	ld	20682,a
 793  0052 2016          	jra	L723
 794  0054               L133:
 795                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 797  0054 7b01          	ld	a,(OFST+1,sp)
 798  0056 a40f          	and	a,#15
 799  0058 5f            	clrw	x
 800  0059 97            	ld	xl,a
 801  005a a601          	ld	a,#1
 802  005c 5d            	tnzw	x
 803  005d 2704          	jreq	L24
 804  005f               L44:
 805  005f 48            	sll	a
 806  0060 5a            	decw	x
 807  0061 26fc          	jrne	L44
 808  0063               L24:
 809  0063 43            	cpl	a
 810  0064 c450ca        	and	a,20682
 811  0067 c750ca        	ld	20682,a
 812  006a               L723:
 813                     ; 295 }
 816  006a 85            	popw	x
 817  006b 81            	ret
1005                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1005                     ; 310 {
1006                     .text:	section	.text,new
1007  0000               _CLK_ClockSwitchConfig:
1009  0000 89            	pushw	x
1010  0001 5204          	subw	sp,#4
1011       00000004      OFST:	set	4
1014                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1016  0003 aeffff        	ldw	x,#65535
1017  0006 1f03          	ldw	(OFST-1,sp),x
1019                     ; 313   ErrorStatus Swif = ERROR;
1021                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1023                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1025                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1027                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1029                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1031  0008 c650c3        	ld	a,20675
1032  000b 6b01          	ld	(OFST-3,sp),a
1034                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1036  000d 7b05          	ld	a,(OFST+1,sp)
1037  000f a101          	cp	a,#1
1038  0011 264b          	jrne	L544
1039                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1041  0013 721250c5      	bset	20677,#1
1042                     ; 331     if (ITState != DISABLE)
1044  0017 0d09          	tnz	(OFST+5,sp)
1045  0019 2706          	jreq	L744
1046                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1048  001b 721450c5      	bset	20677,#2
1050  001f 2004          	jra	L154
1051  0021               L744:
1052                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1054  0021 721550c5      	bres	20677,#2
1055  0025               L154:
1056                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1058  0025 7b06          	ld	a,(OFST+2,sp)
1059  0027 c750c4        	ld	20676,a
1061  002a 2007          	jra	L754
1062  002c               L354:
1063                     ; 346       DownCounter--;
1065  002c 1e03          	ldw	x,(OFST-1,sp)
1066  002e 1d0001        	subw	x,#1
1067  0031 1f03          	ldw	(OFST-1,sp),x
1069  0033               L754:
1070                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1072  0033 c650c5        	ld	a,20677
1073  0036 a501          	bcp	a,#1
1074  0038 2704          	jreq	L364
1076  003a 1e03          	ldw	x,(OFST-1,sp)
1077  003c 26ee          	jrne	L354
1078  003e               L364:
1079                     ; 349     if(DownCounter != 0)
1081  003e 1e03          	ldw	x,(OFST-1,sp)
1082  0040 2706          	jreq	L564
1083                     ; 351       Swif = SUCCESS;
1085  0042 a601          	ld	a,#1
1086  0044 6b02          	ld	(OFST-2,sp),a
1089  0046 2002          	jra	L174
1090  0048               L564:
1091                     ; 355       Swif = ERROR;
1093  0048 0f02          	clr	(OFST-2,sp)
1095  004a               L174:
1096                     ; 390   if(Swif != ERROR)
1098  004a 0d02          	tnz	(OFST-2,sp)
1099  004c 2767          	jreq	L515
1100                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1102  004e 0d0a          	tnz	(OFST+6,sp)
1103  0050 2645          	jrne	L715
1105  0052 7b01          	ld	a,(OFST-3,sp)
1106  0054 a1e1          	cp	a,#225
1107  0056 263f          	jrne	L715
1108                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1110  0058 721150c0      	bres	20672,#0
1112  005c 2057          	jra	L515
1113  005e               L544:
1114                     ; 361     if (ITState != DISABLE)
1116  005e 0d09          	tnz	(OFST+5,sp)
1117  0060 2706          	jreq	L374
1118                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1120  0062 721450c5      	bset	20677,#2
1122  0066 2004          	jra	L574
1123  0068               L374:
1124                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1126  0068 721550c5      	bres	20677,#2
1127  006c               L574:
1128                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1130  006c 7b06          	ld	a,(OFST+2,sp)
1131  006e c750c4        	ld	20676,a
1133  0071 2007          	jra	L305
1134  0073               L774:
1135                     ; 376       DownCounter--;
1137  0073 1e03          	ldw	x,(OFST-1,sp)
1138  0075 1d0001        	subw	x,#1
1139  0078 1f03          	ldw	(OFST-1,sp),x
1141  007a               L305:
1142                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1144  007a c650c5        	ld	a,20677
1145  007d a508          	bcp	a,#8
1146  007f 2704          	jreq	L705
1148  0081 1e03          	ldw	x,(OFST-1,sp)
1149  0083 26ee          	jrne	L774
1150  0085               L705:
1151                     ; 379     if(DownCounter != 0)
1153  0085 1e03          	ldw	x,(OFST-1,sp)
1154  0087 270a          	jreq	L115
1155                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1157  0089 721250c5      	bset	20677,#1
1158                     ; 383       Swif = SUCCESS;
1160  008d a601          	ld	a,#1
1161  008f 6b02          	ld	(OFST-2,sp),a
1164  0091 20b7          	jra	L174
1165  0093               L115:
1166                     ; 387       Swif = ERROR;
1168  0093 0f02          	clr	(OFST-2,sp)
1170  0095 20b3          	jra	L174
1171  0097               L715:
1172                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1174  0097 0d0a          	tnz	(OFST+6,sp)
1175  0099 260c          	jrne	L325
1177  009b 7b01          	ld	a,(OFST-3,sp)
1178  009d a1d2          	cp	a,#210
1179  009f 2606          	jrne	L325
1180                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1182  00a1 721750c0      	bres	20672,#3
1184  00a5 200e          	jra	L515
1185  00a7               L325:
1186                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1188  00a7 0d0a          	tnz	(OFST+6,sp)
1189  00a9 260a          	jrne	L515
1191  00ab 7b01          	ld	a,(OFST-3,sp)
1192  00ad a1b4          	cp	a,#180
1193  00af 2604          	jrne	L515
1194                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1196  00b1 721150c1      	bres	20673,#0
1197  00b5               L515:
1198                     ; 406   return(Swif);
1200  00b5 7b02          	ld	a,(OFST-2,sp)
1203  00b7 5b06          	addw	sp,#6
1204  00b9 81            	ret
1342                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1342                     ; 416 {
1343                     .text:	section	.text,new
1344  0000               _CLK_HSIPrescalerConfig:
1346  0000 88            	push	a
1347       00000000      OFST:	set	0
1350                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1352                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1354  0001 c650c6        	ld	a,20678
1355  0004 a4e7          	and	a,#231
1356  0006 c750c6        	ld	20678,a
1357                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1359  0009 c650c6        	ld	a,20678
1360  000c 1a01          	or	a,(OFST+1,sp)
1361  000e c750c6        	ld	20678,a
1362                     ; 425 }
1365  0011 84            	pop	a
1366  0012 81            	ret
1501                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1501                     ; 437 {
1502                     .text:	section	.text,new
1503  0000               _CLK_CCOConfig:
1505  0000 88            	push	a
1506       00000000      OFST:	set	0
1509                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1511                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1513  0001 c650c9        	ld	a,20681
1514  0004 a4e1          	and	a,#225
1515  0006 c750c9        	ld	20681,a
1516                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1518  0009 c650c9        	ld	a,20681
1519  000c 1a01          	or	a,(OFST+1,sp)
1520  000e c750c9        	ld	20681,a
1521                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1523  0011 721050c9      	bset	20681,#0
1524                     ; 449 }
1527  0015 84            	pop	a
1528  0016 81            	ret
1593                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1593                     ; 460 {
1594                     .text:	section	.text,new
1595  0000               _CLK_ITConfig:
1597  0000 89            	pushw	x
1598       00000000      OFST:	set	0
1601                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1603                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1605                     ; 465   if (NewState != DISABLE)
1607  0001 9f            	ld	a,xl
1608  0002 4d            	tnz	a
1609  0003 2719          	jreq	L527
1610                     ; 467     switch (CLK_IT)
1612  0005 9e            	ld	a,xh
1614                     ; 475     default:
1614                     ; 476       break;
1615  0006 a00c          	sub	a,#12
1616  0008 270a          	jreq	L166
1617  000a a010          	sub	a,#16
1618  000c 2624          	jrne	L337
1619                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1619                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1621  000e 721450c5      	bset	20677,#2
1622                     ; 471       break;
1624  0012 201e          	jra	L337
1625  0014               L166:
1626                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1626                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1628  0014 721450c8      	bset	20680,#2
1629                     ; 474       break;
1631  0018 2018          	jra	L337
1632  001a               L366:
1633                     ; 475     default:
1633                     ; 476       break;
1635  001a 2016          	jra	L337
1636  001c               L137:
1638  001c 2014          	jra	L337
1639  001e               L527:
1640                     ; 481     switch (CLK_IT)
1642  001e 7b01          	ld	a,(OFST+1,sp)
1644                     ; 489     default:
1644                     ; 490       break;
1645  0020 a00c          	sub	a,#12
1646  0022 270a          	jreq	L766
1647  0024 a010          	sub	a,#16
1648  0026 260a          	jrne	L337
1649                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1649                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1651  0028 721550c5      	bres	20677,#2
1652                     ; 485       break;
1654  002c 2004          	jra	L337
1655  002e               L766:
1656                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1656                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1658  002e 721550c8      	bres	20680,#2
1659                     ; 488       break;
1660  0032               L337:
1661                     ; 493 }
1664  0032 85            	popw	x
1665  0033 81            	ret
1666  0034               L176:
1667                     ; 489     default:
1667                     ; 490       break;
1669  0034 20fc          	jra	L337
1670  0036               L737:
1671  0036 20fa          	jra	L337
1706                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1706                     ; 501 {
1707                     .text:	section	.text,new
1708  0000               _CLK_SYSCLKConfig:
1710  0000 88            	push	a
1711       00000000      OFST:	set	0
1714                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1716                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1718  0001 a580          	bcp	a,#128
1719  0003 2614          	jrne	L757
1720                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1722  0005 c650c6        	ld	a,20678
1723  0008 a4e7          	and	a,#231
1724  000a c750c6        	ld	20678,a
1725                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1727  000d 7b01          	ld	a,(OFST+1,sp)
1728  000f a418          	and	a,#24
1729  0011 ca50c6        	or	a,20678
1730  0014 c750c6        	ld	20678,a
1732  0017 2012          	jra	L167
1733  0019               L757:
1734                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1736  0019 c650c6        	ld	a,20678
1737  001c a4f8          	and	a,#248
1738  001e c750c6        	ld	20678,a
1739                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1741  0021 7b01          	ld	a,(OFST+1,sp)
1742  0023 a407          	and	a,#7
1743  0025 ca50c6        	or	a,20678
1744  0028 c750c6        	ld	20678,a
1745  002b               L167:
1746                     ; 515 }
1749  002b 84            	pop	a
1750  002c 81            	ret
1806                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1806                     ; 524 {
1807                     .text:	section	.text,new
1808  0000               _CLK_SWIMConfig:
1812                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1814                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1816  0000 4d            	tnz	a
1817  0001 2706          	jreq	L1101
1818                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1820  0003 721050cd      	bset	20685,#0
1822  0007 2004          	jra	L3101
1823  0009               L1101:
1824                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1826  0009 721150cd      	bres	20685,#0
1827  000d               L3101:
1828                     ; 538 }
1831  000d 81            	ret
1855                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1855                     ; 548 {
1856                     .text:	section	.text,new
1857  0000               _CLK_ClockSecuritySystemEnable:
1861                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1863  0000 721050c8      	bset	20680,#0
1864                     ; 551 }
1867  0004 81            	ret
1892                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1892                     ; 560 {
1893                     .text:	section	.text,new
1894  0000               _CLK_GetSYSCLKSource:
1898                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1900  0000 c650c3        	ld	a,20675
1903  0003 81            	ret
1966                     ; 569 uint32_t CLK_GetClockFreq(void)
1966                     ; 570 {
1967                     .text:	section	.text,new
1968  0000               _CLK_GetClockFreq:
1970  0000 5209          	subw	sp,#9
1971       00000009      OFST:	set	9
1974                     ; 571   uint32_t clockfrequency = 0;
1976                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1978                     ; 573   uint8_t tmp = 0, presc = 0;
1982                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1984  0002 c650c3        	ld	a,20675
1985  0005 6b09          	ld	(OFST+0,sp),a
1987                     ; 578   if (clocksource == CLK_SOURCE_HSI)
1989  0007 7b09          	ld	a,(OFST+0,sp)
1990  0009 a1e1          	cp	a,#225
1991  000b 2641          	jrne	L7601
1992                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1994  000d c650c6        	ld	a,20678
1995  0010 a418          	and	a,#24
1996  0012 6b09          	ld	(OFST+0,sp),a
1998                     ; 581     tmp = (uint8_t)(tmp >> 3);
2000  0014 0409          	srl	(OFST+0,sp)
2001  0016 0409          	srl	(OFST+0,sp)
2002  0018 0409          	srl	(OFST+0,sp)
2004                     ; 582     presc = HSIDivFactor[tmp];
2006  001a 7b09          	ld	a,(OFST+0,sp)
2007  001c 5f            	clrw	x
2008  001d 97            	ld	xl,a
2009  001e d60000        	ld	a,(_HSIDivFactor,x)
2010  0021 6b09          	ld	(OFST+0,sp),a
2012                     ; 583     clockfrequency = HSI_VALUE / presc;
2014  0023 7b09          	ld	a,(OFST+0,sp)
2015  0025 b703          	ld	c_lreg+3,a
2016  0027 3f02          	clr	c_lreg+2
2017  0029 3f01          	clr	c_lreg+1
2018  002b 3f00          	clr	c_lreg
2019  002d 96            	ldw	x,sp
2020  002e 1c0001        	addw	x,#OFST-8
2021  0031 cd0000        	call	c_rtol
2024  0034 ae2400        	ldw	x,#9216
2025  0037 bf02          	ldw	c_lreg+2,x
2026  0039 ae00f4        	ldw	x,#244
2027  003c bf00          	ldw	c_lreg,x
2028  003e 96            	ldw	x,sp
2029  003f 1c0001        	addw	x,#OFST-8
2030  0042 cd0000        	call	c_ludv
2032  0045 96            	ldw	x,sp
2033  0046 1c0005        	addw	x,#OFST-4
2034  0049 cd0000        	call	c_rtol
2038  004c 201c          	jra	L1701
2039  004e               L7601:
2040                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2042  004e 7b09          	ld	a,(OFST+0,sp)
2043  0050 a1d2          	cp	a,#210
2044  0052 260c          	jrne	L3701
2045                     ; 587     clockfrequency = LSI_VALUE;
2047  0054 aef400        	ldw	x,#62464
2048  0057 1f07          	ldw	(OFST-2,sp),x
2049  0059 ae0001        	ldw	x,#1
2050  005c 1f05          	ldw	(OFST-4,sp),x
2053  005e 200a          	jra	L1701
2054  0060               L3701:
2055                     ; 591     clockfrequency = HSE_VALUE;
2057  0060 ae2400        	ldw	x,#9216
2058  0063 1f07          	ldw	(OFST-2,sp),x
2059  0065 ae00f4        	ldw	x,#244
2060  0068 1f05          	ldw	(OFST-4,sp),x
2062  006a               L1701:
2063                     ; 594   return((uint32_t)clockfrequency);
2065  006a 96            	ldw	x,sp
2066  006b 1c0005        	addw	x,#OFST-4
2067  006e cd0000        	call	c_ltor
2071  0071 5b09          	addw	sp,#9
2072  0073 81            	ret
2171                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2171                     ; 605 {
2172                     .text:	section	.text,new
2173  0000               _CLK_AdjustHSICalibrationValue:
2175  0000 88            	push	a
2176       00000000      OFST:	set	0
2179                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2181                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2183  0001 c650cc        	ld	a,20684
2184  0004 a4f8          	and	a,#248
2185  0006 1a01          	or	a,(OFST+1,sp)
2186  0008 c750cc        	ld	20684,a
2187                     ; 611 }
2190  000b 84            	pop	a
2191  000c 81            	ret
2215                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2215                     ; 623 {
2216                     .text:	section	.text,new
2217  0000               _CLK_SYSCLKEmergencyClear:
2221                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2223  0000 721150c5      	bres	20677,#0
2224                     ; 625 }
2227  0004 81            	ret
2380                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2380                     ; 635 {
2381                     .text:	section	.text,new
2382  0000               _CLK_GetFlagStatus:
2384  0000 89            	pushw	x
2385  0001 5203          	subw	sp,#3
2386       00000003      OFST:	set	3
2389                     ; 636   uint16_t statusreg = 0;
2391                     ; 637   uint8_t tmpreg = 0;
2393                     ; 638   FlagStatus bitstatus = RESET;
2395                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2397                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2399  0003 01            	rrwa	x,a
2400  0004 9f            	ld	a,xl
2401  0005 a4ff          	and	a,#255
2402  0007 97            	ld	xl,a
2403  0008 4f            	clr	a
2404  0009 02            	rlwa	x,a
2405  000a 1f01          	ldw	(OFST-2,sp),x
2406  000c 01            	rrwa	x,a
2408                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2410  000d 1e01          	ldw	x,(OFST-2,sp)
2411  000f a30100        	cpw	x,#256
2412  0012 2607          	jrne	L1421
2413                     ; 649     tmpreg = CLK->ICKR;
2415  0014 c650c0        	ld	a,20672
2416  0017 6b03          	ld	(OFST+0,sp),a
2419  0019 202f          	jra	L3421
2420  001b               L1421:
2421                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2423  001b 1e01          	ldw	x,(OFST-2,sp)
2424  001d a30200        	cpw	x,#512
2425  0020 2607          	jrne	L5421
2426                     ; 653     tmpreg = CLK->ECKR;
2428  0022 c650c1        	ld	a,20673
2429  0025 6b03          	ld	(OFST+0,sp),a
2432  0027 2021          	jra	L3421
2433  0029               L5421:
2434                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2436  0029 1e01          	ldw	x,(OFST-2,sp)
2437  002b a30300        	cpw	x,#768
2438  002e 2607          	jrne	L1521
2439                     ; 657     tmpreg = CLK->SWCR;
2441  0030 c650c5        	ld	a,20677
2442  0033 6b03          	ld	(OFST+0,sp),a
2445  0035 2013          	jra	L3421
2446  0037               L1521:
2447                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2449  0037 1e01          	ldw	x,(OFST-2,sp)
2450  0039 a30400        	cpw	x,#1024
2451  003c 2607          	jrne	L5521
2452                     ; 661     tmpreg = CLK->CSSR;
2454  003e c650c8        	ld	a,20680
2455  0041 6b03          	ld	(OFST+0,sp),a
2458  0043 2005          	jra	L3421
2459  0045               L5521:
2460                     ; 665     tmpreg = CLK->CCOR;
2462  0045 c650c9        	ld	a,20681
2463  0048 6b03          	ld	(OFST+0,sp),a
2465  004a               L3421:
2466                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2468  004a 7b05          	ld	a,(OFST+2,sp)
2469  004c 1503          	bcp	a,(OFST+0,sp)
2470  004e 2706          	jreq	L1621
2471                     ; 670     bitstatus = SET;
2473  0050 a601          	ld	a,#1
2474  0052 6b03          	ld	(OFST+0,sp),a
2477  0054 2002          	jra	L3621
2478  0056               L1621:
2479                     ; 674     bitstatus = RESET;
2481  0056 0f03          	clr	(OFST+0,sp)
2483  0058               L3621:
2484                     ; 678   return((FlagStatus)bitstatus);
2486  0058 7b03          	ld	a,(OFST+0,sp)
2489  005a 5b05          	addw	sp,#5
2490  005c 81            	ret
2536                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2536                     ; 688 {
2537                     .text:	section	.text,new
2538  0000               _CLK_GetITStatus:
2540  0000 88            	push	a
2541  0001 88            	push	a
2542       00000001      OFST:	set	1
2545                     ; 689   ITStatus bitstatus = RESET;
2547                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2549                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2551  0002 a11c          	cp	a,#28
2552  0004 2611          	jrne	L7031
2553                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2555  0006 c450c5        	and	a,20677
2556  0009 a10c          	cp	a,#12
2557  000b 2606          	jrne	L1131
2558                     ; 699       bitstatus = SET;
2560  000d a601          	ld	a,#1
2561  000f 6b01          	ld	(OFST+0,sp),a
2564  0011 2015          	jra	L5131
2565  0013               L1131:
2566                     ; 703       bitstatus = RESET;
2568  0013 0f01          	clr	(OFST+0,sp)
2570  0015 2011          	jra	L5131
2571  0017               L7031:
2572                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2574  0017 c650c8        	ld	a,20680
2575  001a 1402          	and	a,(OFST+1,sp)
2576  001c a10c          	cp	a,#12
2577  001e 2606          	jrne	L7131
2578                     ; 711       bitstatus = SET;
2580  0020 a601          	ld	a,#1
2581  0022 6b01          	ld	(OFST+0,sp),a
2584  0024 2002          	jra	L5131
2585  0026               L7131:
2586                     ; 715       bitstatus = RESET;
2588  0026 0f01          	clr	(OFST+0,sp)
2590  0028               L5131:
2591                     ; 720   return bitstatus;
2593  0028 7b01          	ld	a,(OFST+0,sp)
2596  002a 85            	popw	x
2597  002b 81            	ret
2633                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2633                     ; 730 {
2634                     .text:	section	.text,new
2635  0000               _CLK_ClearITPendingBit:
2639                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2641                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2643  0000 a10c          	cp	a,#12
2644  0002 2606          	jrne	L1431
2645                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2647  0004 721750c8      	bres	20680,#3
2649  0008 2004          	jra	L3431
2650  000a               L1431:
2651                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2653  000a 721750c5      	bres	20677,#3
2654  000e               L3431:
2655                     ; 745 }
2658  000e 81            	ret
2693                     	xdef	_CLKPrescTable
2694                     	xdef	_HSIDivFactor
2695                     	xdef	_CLK_ClearITPendingBit
2696                     	xdef	_CLK_GetITStatus
2697                     	xdef	_CLK_GetFlagStatus
2698                     	xdef	_CLK_GetSYSCLKSource
2699                     	xdef	_CLK_GetClockFreq
2700                     	xdef	_CLK_AdjustHSICalibrationValue
2701                     	xdef	_CLK_SYSCLKEmergencyClear
2702                     	xdef	_CLK_ClockSecuritySystemEnable
2703                     	xdef	_CLK_SWIMConfig
2704                     	xdef	_CLK_SYSCLKConfig
2705                     	xdef	_CLK_ITConfig
2706                     	xdef	_CLK_CCOConfig
2707                     	xdef	_CLK_HSIPrescalerConfig
2708                     	xdef	_CLK_ClockSwitchConfig
2709                     	xdef	_CLK_PeripheralClockConfig
2710                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2711                     	xdef	_CLK_FastHaltWakeUpCmd
2712                     	xdef	_CLK_ClockSwitchCmd
2713                     	xdef	_CLK_CCOCmd
2714                     	xdef	_CLK_LSICmd
2715                     	xdef	_CLK_HSICmd
2716                     	xdef	_CLK_HSECmd
2717                     	xdef	_CLK_DeInit
2718                     	xref.b	c_lreg
2719                     	xref.b	c_x
2738                     	xref	c_ltor
2739                     	xref	c_ludv
2740                     	xref	c_rtol
2741                     	end
