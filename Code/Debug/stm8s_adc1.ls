   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  44                     ; 52 void ADC1_DeInit(void)
  44                     ; 53 {
  46                     .text:	section	.text,new
  47  0000               _ADC1_DeInit:
  51                     ; 54   ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  53  0000 725f5400      	clr	21504
  54                     ; 55   ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  56  0004 725f5401      	clr	21505
  57                     ; 56   ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  59  0008 725f5402      	clr	21506
  60                     ; 57   ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  62  000c 725f5403      	clr	21507
  63                     ; 58   ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  65  0010 725f5406      	clr	21510
  66                     ; 59   ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  68  0014 725f5407      	clr	21511
  69                     ; 60   ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  71  0018 35ff5408      	mov	21512,#255
  72                     ; 61   ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  74  001c 35035409      	mov	21513,#3
  75                     ; 62   ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  77  0020 725f540a      	clr	21514
  78                     ; 63   ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  80  0024 725f540b      	clr	21515
  81                     ; 64   ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  83  0028 725f540e      	clr	21518
  84                     ; 65   ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  86  002c 725f540f      	clr	21519
  87                     ; 66 }
  90  0030 81            	ret
 541                     ; 88 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 541                     ; 89 {
 542                     .text:	section	.text,new
 543  0000               _ADC1_Init:
 545  0000 89            	pushw	x
 546       00000000      OFST:	set	0
 549                     ; 91   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 551                     ; 92   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 553                     ; 93   assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 555                     ; 94   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 557                     ; 95   assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 559                     ; 96   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 561                     ; 97   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 563                     ; 98   assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 565                     ; 103   ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 567  0001 7b08          	ld	a,(OFST+8,sp)
 568  0003 88            	push	a
 569  0004 9f            	ld	a,xl
 570  0005 97            	ld	xl,a
 571  0006 7b02          	ld	a,(OFST+2,sp)
 572  0008 95            	ld	xh,a
 573  0009 cd0000        	call	_ADC1_ConversionConfig
 575  000c 84            	pop	a
 576                     ; 105   ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 578  000d 7b05          	ld	a,(OFST+5,sp)
 579  000f cd0000        	call	_ADC1_PrescalerConfig
 581                     ; 110   ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 583  0012 7b07          	ld	a,(OFST+7,sp)
 584  0014 97            	ld	xl,a
 585  0015 7b06          	ld	a,(OFST+6,sp)
 586  0017 95            	ld	xh,a
 587  0018 cd0000        	call	_ADC1_ExternalTriggerConfig
 589                     ; 115   ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 591  001b 7b0a          	ld	a,(OFST+10,sp)
 592  001d 97            	ld	xl,a
 593  001e 7b09          	ld	a,(OFST+9,sp)
 594  0020 95            	ld	xh,a
 595  0021 cd0000        	call	_ADC1_SchmittTriggerConfig
 597                     ; 118   ADC1->CR1 |= ADC1_CR1_ADON;
 599  0024 72105401      	bset	21505,#0
 600                     ; 119 }
 603  0028 85            	popw	x
 604  0029 81            	ret
 639                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 639                     ; 127 {
 640                     .text:	section	.text,new
 641  0000               _ADC1_Cmd:
 645                     ; 129   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 647                     ; 131   if (NewState != DISABLE)
 649  0000 4d            	tnz	a
 650  0001 2706          	jreq	L362
 651                     ; 133     ADC1->CR1 |= ADC1_CR1_ADON;
 653  0003 72105401      	bset	21505,#0
 655  0007 2004          	jra	L562
 656  0009               L362:
 657                     ; 137     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 659  0009 72115401      	bres	21505,#0
 660  000d               L562:
 661                     ; 139 }
 664  000d 81            	ret
 699                     ; 146 void ADC1_ScanModeCmd(FunctionalState NewState)
 699                     ; 147 {
 700                     .text:	section	.text,new
 701  0000               _ADC1_ScanModeCmd:
 705                     ; 149   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 707                     ; 151   if (NewState != DISABLE)
 709  0000 4d            	tnz	a
 710  0001 2706          	jreq	L503
 711                     ; 153     ADC1->CR2 |= ADC1_CR2_SCAN;
 713  0003 72125402      	bset	21506,#1
 715  0007 2004          	jra	L703
 716  0009               L503:
 717                     ; 157     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 719  0009 72135402      	bres	21506,#1
 720  000d               L703:
 721                     ; 159 }
 724  000d 81            	ret
 759                     ; 166 void ADC1_DataBufferCmd(FunctionalState NewState)
 759                     ; 167 {
 760                     .text:	section	.text,new
 761  0000               _ADC1_DataBufferCmd:
 765                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 767                     ; 171   if (NewState != DISABLE)
 769  0000 4d            	tnz	a
 770  0001 2706          	jreq	L723
 771                     ; 173     ADC1->CR3 |= ADC1_CR3_DBUF;
 773  0003 721e5403      	bset	21507,#7
 775  0007 2004          	jra	L133
 776  0009               L723:
 777                     ; 177     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 779  0009 721f5403      	bres	21507,#7
 780  000d               L133:
 781                     ; 179 }
 784  000d 81            	ret
 940                     ; 190 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 940                     ; 191 {
 941                     .text:	section	.text,new
 942  0000               _ADC1_ITConfig:
 944  0000 89            	pushw	x
 945       00000000      OFST:	set	0
 948                     ; 193   assert_param(IS_ADC1_IT_OK(ADC1_IT));
 950                     ; 194   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 952                     ; 196   if (NewState != DISABLE)
 954  0001 0d05          	tnz	(OFST+5,sp)
 955  0003 2709          	jreq	L714
 956                     ; 199     ADC1->CSR |= (uint8_t)ADC1_IT;
 958  0005 9f            	ld	a,xl
 959  0006 ca5400        	or	a,21504
 960  0009 c75400        	ld	21504,a
 962  000c 2009          	jra	L124
 963  000e               L714:
 964                     ; 204     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
 966  000e 7b02          	ld	a,(OFST+2,sp)
 967  0010 43            	cpl	a
 968  0011 c45400        	and	a,21504
 969  0014 c75400        	ld	21504,a
 970  0017               L124:
 971                     ; 206 }
 974  0017 85            	popw	x
 975  0018 81            	ret
1011                     ; 214 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1011                     ; 215 {
1012                     .text:	section	.text,new
1013  0000               _ADC1_PrescalerConfig:
1015  0000 88            	push	a
1016       00000000      OFST:	set	0
1019                     ; 217   assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1021                     ; 220   ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1023  0001 c65401        	ld	a,21505
1024  0004 a48f          	and	a,#143
1025  0006 c75401        	ld	21505,a
1026                     ; 222   ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1028  0009 c65401        	ld	a,21505
1029  000c 1a01          	or	a,(OFST+1,sp)
1030  000e c75401        	ld	21505,a
1031                     ; 223 }
1034  0011 84            	pop	a
1035  0012 81            	ret
1082                     ; 233 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1082                     ; 234 {
1083                     .text:	section	.text,new
1084  0000               _ADC1_SchmittTriggerConfig:
1086  0000 89            	pushw	x
1087       00000000      OFST:	set	0
1090                     ; 236   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1092                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1094                     ; 239   if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1096  0001 9e            	ld	a,xh
1097  0002 a1ff          	cp	a,#255
1098  0004 2620          	jrne	L364
1099                     ; 241     if (NewState != DISABLE)
1101  0006 9f            	ld	a,xl
1102  0007 4d            	tnz	a
1103  0008 270a          	jreq	L564
1104                     ; 243       ADC1->TDRL &= (uint8_t)0x0;
1106  000a 725f5407      	clr	21511
1107                     ; 244       ADC1->TDRH &= (uint8_t)0x0;
1109  000e 725f5406      	clr	21510
1111  0012 2078          	jra	L174
1112  0014               L564:
1113                     ; 248       ADC1->TDRL |= (uint8_t)0xFF;
1115  0014 c65407        	ld	a,21511
1116  0017 aaff          	or	a,#255
1117  0019 c75407        	ld	21511,a
1118                     ; 249       ADC1->TDRH |= (uint8_t)0xFF;
1120  001c c65406        	ld	a,21510
1121  001f aaff          	or	a,#255
1122  0021 c75406        	ld	21510,a
1123  0024 2066          	jra	L174
1124  0026               L364:
1125                     ; 252   else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1127  0026 7b01          	ld	a,(OFST+1,sp)
1128  0028 a108          	cp	a,#8
1129  002a 242f          	jruge	L374
1130                     ; 254     if (NewState != DISABLE)
1132  002c 0d02          	tnz	(OFST+2,sp)
1133  002e 2716          	jreq	L574
1134                     ; 256       ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1136  0030 7b01          	ld	a,(OFST+1,sp)
1137  0032 5f            	clrw	x
1138  0033 97            	ld	xl,a
1139  0034 a601          	ld	a,#1
1140  0036 5d            	tnzw	x
1141  0037 2704          	jreq	L42
1142  0039               L62:
1143  0039 48            	sll	a
1144  003a 5a            	decw	x
1145  003b 26fc          	jrne	L62
1146  003d               L42:
1147  003d 43            	cpl	a
1148  003e c45407        	and	a,21511
1149  0041 c75407        	ld	21511,a
1151  0044 2046          	jra	L174
1152  0046               L574:
1153                     ; 260       ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1155  0046 7b01          	ld	a,(OFST+1,sp)
1156  0048 5f            	clrw	x
1157  0049 97            	ld	xl,a
1158  004a a601          	ld	a,#1
1159  004c 5d            	tnzw	x
1160  004d 2704          	jreq	L03
1161  004f               L23:
1162  004f 48            	sll	a
1163  0050 5a            	decw	x
1164  0051 26fc          	jrne	L23
1165  0053               L03:
1166  0053 ca5407        	or	a,21511
1167  0056 c75407        	ld	21511,a
1168  0059 2031          	jra	L174
1169  005b               L374:
1170                     ; 265     if (NewState != DISABLE)
1172  005b 0d02          	tnz	(OFST+2,sp)
1173  005d 2718          	jreq	L305
1174                     ; 267       ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1176  005f 7b01          	ld	a,(OFST+1,sp)
1177  0061 a008          	sub	a,#8
1178  0063 5f            	clrw	x
1179  0064 97            	ld	xl,a
1180  0065 a601          	ld	a,#1
1181  0067 5d            	tnzw	x
1182  0068 2704          	jreq	L43
1183  006a               L63:
1184  006a 48            	sll	a
1185  006b 5a            	decw	x
1186  006c 26fc          	jrne	L63
1187  006e               L43:
1188  006e 43            	cpl	a
1189  006f c45406        	and	a,21510
1190  0072 c75406        	ld	21510,a
1192  0075 2015          	jra	L174
1193  0077               L305:
1194                     ; 271       ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1196  0077 7b01          	ld	a,(OFST+1,sp)
1197  0079 a008          	sub	a,#8
1198  007b 5f            	clrw	x
1199  007c 97            	ld	xl,a
1200  007d a601          	ld	a,#1
1201  007f 5d            	tnzw	x
1202  0080 2704          	jreq	L04
1203  0082               L24:
1204  0082 48            	sll	a
1205  0083 5a            	decw	x
1206  0084 26fc          	jrne	L24
1207  0086               L04:
1208  0086 ca5406        	or	a,21510
1209  0089 c75406        	ld	21510,a
1210  008c               L174:
1211                     ; 274 }
1214  008c 85            	popw	x
1215  008d 81            	ret
1272                     ; 286 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1272                     ; 287 {
1273                     .text:	section	.text,new
1274  0000               _ADC1_ConversionConfig:
1276  0000 89            	pushw	x
1277       00000000      OFST:	set	0
1280                     ; 289   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1282                     ; 290   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1284                     ; 291   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1286                     ; 294   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1288  0001 72175402      	bres	21506,#3
1289                     ; 296   ADC1->CR2 |= (uint8_t)(ADC1_Align);
1291  0005 c65402        	ld	a,21506
1292  0008 1a05          	or	a,(OFST+5,sp)
1293  000a c75402        	ld	21506,a
1294                     ; 298   if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1296  000d 9e            	ld	a,xh
1297  000e a101          	cp	a,#1
1298  0010 2606          	jrne	L535
1299                     ; 301     ADC1->CR1 |= ADC1_CR1_CONT;
1301  0012 72125401      	bset	21505,#1
1303  0016 2004          	jra	L735
1304  0018               L535:
1305                     ; 306     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1307  0018 72135401      	bres	21505,#1
1308  001c               L735:
1309                     ; 310   ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1311  001c c65400        	ld	a,21504
1312  001f a4f0          	and	a,#240
1313  0021 c75400        	ld	21504,a
1314                     ; 312   ADC1->CSR |= (uint8_t)(ADC1_Channel);
1316  0024 c65400        	ld	a,21504
1317  0027 1a02          	or	a,(OFST+2,sp)
1318  0029 c75400        	ld	21504,a
1319                     ; 313 }
1322  002c 85            	popw	x
1323  002d 81            	ret
1369                     ; 325 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1369                     ; 326 {
1370                     .text:	section	.text,new
1371  0000               _ADC1_ExternalTriggerConfig:
1373  0000 89            	pushw	x
1374       00000000      OFST:	set	0
1377                     ; 328   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1379                     ; 329   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1381                     ; 332   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1383  0001 c65402        	ld	a,21506
1384  0004 a4cf          	and	a,#207
1385  0006 c75402        	ld	21506,a
1386                     ; 334   if (NewState != DISABLE)
1388  0009 9f            	ld	a,xl
1389  000a 4d            	tnz	a
1390  000b 2706          	jreq	L365
1391                     ; 337     ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1393  000d 721c5402      	bset	21506,#6
1395  0011 2004          	jra	L565
1396  0013               L365:
1397                     ; 342     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1399  0013 721d5402      	bres	21506,#6
1400  0017               L565:
1401                     ; 346   ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1403  0017 c65402        	ld	a,21506
1404  001a 1a01          	or	a,(OFST+1,sp)
1405  001c c75402        	ld	21506,a
1406                     ; 347 }
1409  001f 85            	popw	x
1410  0020 81            	ret
1434                     ; 358 void ADC1_StartConversion(void)
1434                     ; 359 {
1435                     .text:	section	.text,new
1436  0000               _ADC1_StartConversion:
1440                     ; 360   ADC1->CR1 |= ADC1_CR1_ADON;
1442  0000 72105401      	bset	21505,#0
1443                     ; 361 }
1446  0004 81            	ret
1490                     ; 370 uint16_t ADC1_GetConversionValue(void)
1490                     ; 371 {
1491                     .text:	section	.text,new
1492  0000               _ADC1_GetConversionValue:
1494  0000 5205          	subw	sp,#5
1495       00000005      OFST:	set	5
1498                     ; 372   uint16_t temph = 0;
1500                     ; 373   uint8_t templ = 0;
1502                     ; 375   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1504  0002 c65402        	ld	a,21506
1505  0005 a508          	bcp	a,#8
1506  0007 2715          	jreq	L126
1507                     ; 378     templ = ADC1->DRL;
1509  0009 c65405        	ld	a,21509
1510  000c 6b03          	ld	(OFST-2,sp),a
1512                     ; 380     temph = ADC1->DRH;
1514  000e c65404        	ld	a,21508
1515  0011 5f            	clrw	x
1516  0012 97            	ld	xl,a
1517  0013 1f04          	ldw	(OFST-1,sp),x
1519                     ; 382     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1521  0015 1e04          	ldw	x,(OFST-1,sp)
1522  0017 7b03          	ld	a,(OFST-2,sp)
1523  0019 02            	rlwa	x,a
1524  001a 1f04          	ldw	(OFST-1,sp),x
1527  001c 2021          	jra	L326
1528  001e               L126:
1529                     ; 387     temph = ADC1->DRH;
1531  001e c65404        	ld	a,21508
1532  0021 5f            	clrw	x
1533  0022 97            	ld	xl,a
1534  0023 1f04          	ldw	(OFST-1,sp),x
1536                     ; 389     templ = ADC1->DRL;
1538  0025 c65405        	ld	a,21509
1539  0028 6b03          	ld	(OFST-2,sp),a
1541                     ; 391     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1543  002a 1e04          	ldw	x,(OFST-1,sp)
1544  002c 4f            	clr	a
1545  002d 02            	rlwa	x,a
1546  002e 1f01          	ldw	(OFST-4,sp),x
1548  0030 7b03          	ld	a,(OFST-2,sp)
1549  0032 97            	ld	xl,a
1550  0033 a640          	ld	a,#64
1551  0035 42            	mul	x,a
1552  0036 01            	rrwa	x,a
1553  0037 1a02          	or	a,(OFST-3,sp)
1554  0039 01            	rrwa	x,a
1555  003a 1a01          	or	a,(OFST-4,sp)
1556  003c 01            	rrwa	x,a
1557  003d 1f04          	ldw	(OFST-1,sp),x
1559  003f               L326:
1560                     ; 394   return ((uint16_t)temph);
1562  003f 1e04          	ldw	x,(OFST-1,sp)
1565  0041 5b05          	addw	sp,#5
1566  0043 81            	ret
1612                     ; 405 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1612                     ; 406 {
1613                     .text:	section	.text,new
1614  0000               _ADC1_AWDChannelConfig:
1616  0000 89            	pushw	x
1617       00000000      OFST:	set	0
1620                     ; 408   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1622                     ; 409   assert_param(IS_ADC1_CHANNEL_OK(Channel));
1624                     ; 411   if (Channel < (uint8_t)8)
1626  0001 9e            	ld	a,xh
1627  0002 a108          	cp	a,#8
1628  0004 242e          	jruge	L746
1629                     ; 413     if (NewState != DISABLE)
1631  0006 9f            	ld	a,xl
1632  0007 4d            	tnz	a
1633  0008 2714          	jreq	L156
1634                     ; 415       ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1636  000a 9e            	ld	a,xh
1637  000b 5f            	clrw	x
1638  000c 97            	ld	xl,a
1639  000d a601          	ld	a,#1
1640  000f 5d            	tnzw	x
1641  0010 2704          	jreq	L65
1642  0012               L06:
1643  0012 48            	sll	a
1644  0013 5a            	decw	x
1645  0014 26fc          	jrne	L06
1646  0016               L65:
1647  0016 ca540f        	or	a,21519
1648  0019 c7540f        	ld	21519,a
1650  001c 2047          	jra	L556
1651  001e               L156:
1652                     ; 419       ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1654  001e 7b01          	ld	a,(OFST+1,sp)
1655  0020 5f            	clrw	x
1656  0021 97            	ld	xl,a
1657  0022 a601          	ld	a,#1
1658  0024 5d            	tnzw	x
1659  0025 2704          	jreq	L26
1660  0027               L46:
1661  0027 48            	sll	a
1662  0028 5a            	decw	x
1663  0029 26fc          	jrne	L46
1664  002b               L26:
1665  002b 43            	cpl	a
1666  002c c4540f        	and	a,21519
1667  002f c7540f        	ld	21519,a
1668  0032 2031          	jra	L556
1669  0034               L746:
1670                     ; 424     if (NewState != DISABLE)
1672  0034 0d02          	tnz	(OFST+2,sp)
1673  0036 2717          	jreq	L756
1674                     ; 426       ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1676  0038 7b01          	ld	a,(OFST+1,sp)
1677  003a a008          	sub	a,#8
1678  003c 5f            	clrw	x
1679  003d 97            	ld	xl,a
1680  003e a601          	ld	a,#1
1681  0040 5d            	tnzw	x
1682  0041 2704          	jreq	L66
1683  0043               L07:
1684  0043 48            	sll	a
1685  0044 5a            	decw	x
1686  0045 26fc          	jrne	L07
1687  0047               L66:
1688  0047 ca540e        	or	a,21518
1689  004a c7540e        	ld	21518,a
1691  004d 2016          	jra	L556
1692  004f               L756:
1693                     ; 430       ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1695  004f 7b01          	ld	a,(OFST+1,sp)
1696  0051 a008          	sub	a,#8
1697  0053 5f            	clrw	x
1698  0054 97            	ld	xl,a
1699  0055 a601          	ld	a,#1
1700  0057 5d            	tnzw	x
1701  0058 2704          	jreq	L27
1702  005a               L47:
1703  005a 48            	sll	a
1704  005b 5a            	decw	x
1705  005c 26fc          	jrne	L47
1706  005e               L27:
1707  005e 43            	cpl	a
1708  005f c4540e        	and	a,21518
1709  0062 c7540e        	ld	21518,a
1710  0065               L556:
1711                     ; 433 }
1714  0065 85            	popw	x
1715  0066 81            	ret
1750                     ; 441 void ADC1_SetHighThreshold(uint16_t Threshold)
1750                     ; 442 {
1751                     .text:	section	.text,new
1752  0000               _ADC1_SetHighThreshold:
1754  0000 89            	pushw	x
1755       00000000      OFST:	set	0
1758                     ; 443   ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
1760  0001 54            	srlw	x
1761  0002 54            	srlw	x
1762  0003 9f            	ld	a,xl
1763  0004 c75408        	ld	21512,a
1764                     ; 444   ADC1->HTRL = (uint8_t)Threshold;
1766  0007 7b02          	ld	a,(OFST+2,sp)
1767  0009 c75409        	ld	21513,a
1768                     ; 445 }
1771  000c 85            	popw	x
1772  000d 81            	ret
1807                     ; 453 void ADC1_SetLowThreshold(uint16_t Threshold)
1807                     ; 454 {
1808                     .text:	section	.text,new
1809  0000               _ADC1_SetLowThreshold:
1813                     ; 455   ADC1->LTRL = (uint8_t)Threshold;
1815  0000 9f            	ld	a,xl
1816  0001 c7540b        	ld	21515,a
1817                     ; 456   ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
1819  0004 54            	srlw	x
1820  0005 54            	srlw	x
1821  0006 9f            	ld	a,xl
1822  0007 c7540a        	ld	21514,a
1823                     ; 457 }
1826  000a 81            	ret
1879                     ; 466 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
1879                     ; 467 {
1880                     .text:	section	.text,new
1881  0000               _ADC1_GetBufferValue:
1883  0000 88            	push	a
1884  0001 5205          	subw	sp,#5
1885       00000005      OFST:	set	5
1888                     ; 468   uint16_t temph = 0;
1890                     ; 469   uint8_t templ = 0;
1892                     ; 472   assert_param(IS_ADC1_BUFFER_OK(Buffer));
1894                     ; 474   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1896  0003 c65402        	ld	a,21506
1897  0006 a508          	bcp	a,#8
1898  0008 271f          	jreq	L547
1899                     ; 477     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1901  000a 7b06          	ld	a,(OFST+1,sp)
1902  000c 48            	sll	a
1903  000d 5f            	clrw	x
1904  000e 97            	ld	xl,a
1905  000f d653e1        	ld	a,(21473,x)
1906  0012 6b03          	ld	(OFST-2,sp),a
1908                     ; 479     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1910  0014 7b06          	ld	a,(OFST+1,sp)
1911  0016 48            	sll	a
1912  0017 5f            	clrw	x
1913  0018 97            	ld	xl,a
1914  0019 d653e0        	ld	a,(21472,x)
1915  001c 5f            	clrw	x
1916  001d 97            	ld	xl,a
1917  001e 1f04          	ldw	(OFST-1,sp),x
1919                     ; 481     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1921  0020 1e04          	ldw	x,(OFST-1,sp)
1922  0022 7b03          	ld	a,(OFST-2,sp)
1923  0024 02            	rlwa	x,a
1924  0025 1f04          	ldw	(OFST-1,sp),x
1927  0027 202b          	jra	L747
1928  0029               L547:
1929                     ; 486     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1931  0029 7b06          	ld	a,(OFST+1,sp)
1932  002b 48            	sll	a
1933  002c 5f            	clrw	x
1934  002d 97            	ld	xl,a
1935  002e d653e0        	ld	a,(21472,x)
1936  0031 5f            	clrw	x
1937  0032 97            	ld	xl,a
1938  0033 1f04          	ldw	(OFST-1,sp),x
1940                     ; 488     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1942  0035 7b06          	ld	a,(OFST+1,sp)
1943  0037 48            	sll	a
1944  0038 5f            	clrw	x
1945  0039 97            	ld	xl,a
1946  003a d653e1        	ld	a,(21473,x)
1947  003d 6b03          	ld	(OFST-2,sp),a
1949                     ; 490     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
1951  003f 1e04          	ldw	x,(OFST-1,sp)
1952  0041 4f            	clr	a
1953  0042 02            	rlwa	x,a
1954  0043 1f01          	ldw	(OFST-4,sp),x
1956  0045 7b03          	ld	a,(OFST-2,sp)
1957  0047 97            	ld	xl,a
1958  0048 a640          	ld	a,#64
1959  004a 42            	mul	x,a
1960  004b 01            	rrwa	x,a
1961  004c 1a02          	or	a,(OFST-3,sp)
1962  004e 01            	rrwa	x,a
1963  004f 1a01          	or	a,(OFST-4,sp)
1964  0051 01            	rrwa	x,a
1965  0052 1f04          	ldw	(OFST-1,sp),x
1967  0054               L747:
1968                     ; 493   return ((uint16_t)temph);
1970  0054 1e04          	ldw	x,(OFST-1,sp)
1973  0056 5b06          	addw	sp,#6
1974  0058 81            	ret
2040                     ; 502 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
2040                     ; 503 {
2041                     .text:	section	.text,new
2042  0000               _ADC1_GetAWDChannelStatus:
2044  0000 88            	push	a
2045  0001 88            	push	a
2046       00000001      OFST:	set	1
2049                     ; 504   uint8_t status = 0;
2051                     ; 507   assert_param(IS_ADC1_CHANNEL_OK(Channel));
2053                     ; 509   if (Channel < (uint8_t)8)
2055  0002 a108          	cp	a,#8
2056  0004 2412          	jruge	L3001
2057                     ; 511     status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2059  0006 5f            	clrw	x
2060  0007 97            	ld	xl,a
2061  0008 a601          	ld	a,#1
2062  000a 5d            	tnzw	x
2063  000b 2704          	jreq	L601
2064  000d               L011:
2065  000d 48            	sll	a
2066  000e 5a            	decw	x
2067  000f 26fc          	jrne	L011
2068  0011               L601:
2069  0011 c4540d        	and	a,21517
2070  0014 6b01          	ld	(OFST+0,sp),a
2073  0016 2014          	jra	L5001
2074  0018               L3001:
2075                     ; 515     status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2077  0018 7b02          	ld	a,(OFST+1,sp)
2078  001a a008          	sub	a,#8
2079  001c 5f            	clrw	x
2080  001d 97            	ld	xl,a
2081  001e a601          	ld	a,#1
2082  0020 5d            	tnzw	x
2083  0021 2704          	jreq	L211
2084  0023               L411:
2085  0023 48            	sll	a
2086  0024 5a            	decw	x
2087  0025 26fc          	jrne	L411
2088  0027               L211:
2089  0027 c4540c        	and	a,21516
2090  002a 6b01          	ld	(OFST+0,sp),a
2092  002c               L5001:
2093                     ; 518   return ((FlagStatus)status);
2095  002c 7b01          	ld	a,(OFST+0,sp)
2098  002e 85            	popw	x
2099  002f 81            	ret
2257                     ; 527 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2257                     ; 528 {
2258                     .text:	section	.text,new
2259  0000               _ADC1_GetFlagStatus:
2261  0000 88            	push	a
2262  0001 88            	push	a
2263       00000001      OFST:	set	1
2266                     ; 529   uint8_t flagstatus = 0;
2268                     ; 530   uint8_t temp = 0;
2270                     ; 533   assert_param(IS_ADC1_FLAG_OK(Flag));
2272                     ; 535   if ((Flag & 0x0F) == 0x01)
2274  0002 a40f          	and	a,#15
2275  0004 a101          	cp	a,#1
2276  0006 2609          	jrne	L5701
2277                     ; 538     flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2279  0008 c65403        	ld	a,21507
2280  000b a440          	and	a,#64
2281  000d 6b01          	ld	(OFST+0,sp),a
2284  000f 2045          	jra	L7701
2285  0011               L5701:
2286                     ; 540   else if ((Flag & 0xF0) == 0x10)
2288  0011 7b02          	ld	a,(OFST+1,sp)
2289  0013 a4f0          	and	a,#240
2290  0015 a110          	cp	a,#16
2291  0017 2636          	jrne	L1011
2292                     ; 543     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2294  0019 7b02          	ld	a,(OFST+1,sp)
2295  001b a40f          	and	a,#15
2296  001d 6b01          	ld	(OFST+0,sp),a
2298                     ; 544     if (temp < 8)
2300  001f 7b01          	ld	a,(OFST+0,sp)
2301  0021 a108          	cp	a,#8
2302  0023 2414          	jruge	L3011
2303                     ; 546       flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2305  0025 7b01          	ld	a,(OFST+0,sp)
2306  0027 5f            	clrw	x
2307  0028 97            	ld	xl,a
2308  0029 a601          	ld	a,#1
2309  002b 5d            	tnzw	x
2310  002c 2704          	jreq	L021
2311  002e               L221:
2312  002e 48            	sll	a
2313  002f 5a            	decw	x
2314  0030 26fc          	jrne	L221
2315  0032               L021:
2316  0032 c4540d        	and	a,21517
2317  0035 6b01          	ld	(OFST+0,sp),a
2320  0037 201d          	jra	L7701
2321  0039               L3011:
2322                     ; 550       flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2324  0039 7b01          	ld	a,(OFST+0,sp)
2325  003b a008          	sub	a,#8
2326  003d 5f            	clrw	x
2327  003e 97            	ld	xl,a
2328  003f a601          	ld	a,#1
2329  0041 5d            	tnzw	x
2330  0042 2704          	jreq	L421
2331  0044               L621:
2332  0044 48            	sll	a
2333  0045 5a            	decw	x
2334  0046 26fc          	jrne	L621
2335  0048               L421:
2336  0048 c4540c        	and	a,21516
2337  004b 6b01          	ld	(OFST+0,sp),a
2339  004d 2007          	jra	L7701
2340  004f               L1011:
2341                     ; 555     flagstatus = (uint8_t)(ADC1->CSR & Flag);
2343  004f c65400        	ld	a,21504
2344  0052 1402          	and	a,(OFST+1,sp)
2345  0054 6b01          	ld	(OFST+0,sp),a
2347  0056               L7701:
2348                     ; 557   return ((FlagStatus)flagstatus);
2350  0056 7b01          	ld	a,(OFST+0,sp)
2353  0058 85            	popw	x
2354  0059 81            	ret
2398                     ; 567 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2398                     ; 568 {
2399                     .text:	section	.text,new
2400  0000               _ADC1_ClearFlag:
2402  0000 88            	push	a
2403  0001 88            	push	a
2404       00000001      OFST:	set	1
2407                     ; 569   uint8_t temp = 0;
2409                     ; 572   assert_param(IS_ADC1_FLAG_OK(Flag));
2411                     ; 574   if ((Flag & 0x0F) == 0x01)
2413  0002 a40f          	and	a,#15
2414  0004 a101          	cp	a,#1
2415  0006 2606          	jrne	L3311
2416                     ; 577     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2418  0008 721d5403      	bres	21507,#6
2420  000c 204b          	jra	L5311
2421  000e               L3311:
2422                     ; 579   else if ((Flag & 0xF0) == 0x10)
2424  000e 7b02          	ld	a,(OFST+1,sp)
2425  0010 a4f0          	and	a,#240
2426  0012 a110          	cp	a,#16
2427  0014 263a          	jrne	L7311
2428                     ; 582     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2430  0016 7b02          	ld	a,(OFST+1,sp)
2431  0018 a40f          	and	a,#15
2432  001a 6b01          	ld	(OFST+0,sp),a
2434                     ; 583     if (temp < 8)
2436  001c 7b01          	ld	a,(OFST+0,sp)
2437  001e a108          	cp	a,#8
2438  0020 2416          	jruge	L1411
2439                     ; 585       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2441  0022 7b01          	ld	a,(OFST+0,sp)
2442  0024 5f            	clrw	x
2443  0025 97            	ld	xl,a
2444  0026 a601          	ld	a,#1
2445  0028 5d            	tnzw	x
2446  0029 2704          	jreq	L231
2447  002b               L431:
2448  002b 48            	sll	a
2449  002c 5a            	decw	x
2450  002d 26fc          	jrne	L431
2451  002f               L231:
2452  002f 43            	cpl	a
2453  0030 c4540d        	and	a,21517
2454  0033 c7540d        	ld	21517,a
2456  0036 2021          	jra	L5311
2457  0038               L1411:
2458                     ; 589       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2460  0038 7b01          	ld	a,(OFST+0,sp)
2461  003a a008          	sub	a,#8
2462  003c 5f            	clrw	x
2463  003d 97            	ld	xl,a
2464  003e a601          	ld	a,#1
2465  0040 5d            	tnzw	x
2466  0041 2704          	jreq	L631
2467  0043               L041:
2468  0043 48            	sll	a
2469  0044 5a            	decw	x
2470  0045 26fc          	jrne	L041
2471  0047               L631:
2472  0047 43            	cpl	a
2473  0048 c4540c        	and	a,21516
2474  004b c7540c        	ld	21516,a
2475  004e 2009          	jra	L5311
2476  0050               L7311:
2477                     ; 594     ADC1->CSR &= (uint8_t) (~Flag);
2479  0050 7b02          	ld	a,(OFST+1,sp)
2480  0052 43            	cpl	a
2481  0053 c45400        	and	a,21504
2482  0056 c75400        	ld	21504,a
2483  0059               L5311:
2484                     ; 596 }
2487  0059 85            	popw	x
2488  005a 81            	ret
2543                     ; 616 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2543                     ; 617 {
2544                     .text:	section	.text,new
2545  0000               _ADC1_GetITStatus:
2547  0000 89            	pushw	x
2548  0001 88            	push	a
2549       00000001      OFST:	set	1
2552                     ; 618   ITStatus itstatus = RESET;
2554                     ; 619   uint8_t temp = 0;
2556                     ; 622   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2558                     ; 624   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2560  0002 01            	rrwa	x,a
2561  0003 a4f0          	and	a,#240
2562  0005 5f            	clrw	x
2563  0006 02            	rlwa	x,a
2564  0007 a30010        	cpw	x,#16
2565  000a 2636          	jrne	L5711
2566                     ; 627     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2568  000c 7b03          	ld	a,(OFST+2,sp)
2569  000e a40f          	and	a,#15
2570  0010 6b01          	ld	(OFST+0,sp),a
2572                     ; 628     if (temp < 8)
2574  0012 7b01          	ld	a,(OFST+0,sp)
2575  0014 a108          	cp	a,#8
2576  0016 2414          	jruge	L7711
2577                     ; 630       itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2579  0018 7b01          	ld	a,(OFST+0,sp)
2580  001a 5f            	clrw	x
2581  001b 97            	ld	xl,a
2582  001c a601          	ld	a,#1
2583  001e 5d            	tnzw	x
2584  001f 2704          	jreq	L441
2585  0021               L641:
2586  0021 48            	sll	a
2587  0022 5a            	decw	x
2588  0023 26fc          	jrne	L641
2589  0025               L441:
2590  0025 c4540d        	and	a,21517
2591  0028 6b01          	ld	(OFST+0,sp),a
2594  002a 201d          	jra	L3021
2595  002c               L7711:
2596                     ; 634       itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2598  002c 7b01          	ld	a,(OFST+0,sp)
2599  002e a008          	sub	a,#8
2600  0030 5f            	clrw	x
2601  0031 97            	ld	xl,a
2602  0032 a601          	ld	a,#1
2603  0034 5d            	tnzw	x
2604  0035 2704          	jreq	L051
2605  0037               L251:
2606  0037 48            	sll	a
2607  0038 5a            	decw	x
2608  0039 26fc          	jrne	L251
2609  003b               L051:
2610  003b c4540c        	and	a,21516
2611  003e 6b01          	ld	(OFST+0,sp),a
2613  0040 2007          	jra	L3021
2614  0042               L5711:
2615                     ; 639     itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
2617  0042 c65400        	ld	a,21504
2618  0045 1403          	and	a,(OFST+2,sp)
2619  0047 6b01          	ld	(OFST+0,sp),a
2621  0049               L3021:
2622                     ; 641   return ((ITStatus)itstatus);
2624  0049 7b01          	ld	a,(OFST+0,sp)
2627  004b 5b03          	addw	sp,#3
2628  004d 81            	ret
2673                     ; 662 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2673                     ; 663 {
2674                     .text:	section	.text,new
2675  0000               _ADC1_ClearITPendingBit:
2677  0000 89            	pushw	x
2678  0001 88            	push	a
2679       00000001      OFST:	set	1
2682                     ; 664   uint8_t temp = 0;
2684                     ; 667   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2686                     ; 669   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2688  0002 01            	rrwa	x,a
2689  0003 a4f0          	and	a,#240
2690  0005 5f            	clrw	x
2691  0006 02            	rlwa	x,a
2692  0007 a30010        	cpw	x,#16
2693  000a 263a          	jrne	L7221
2694                     ; 672     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2696  000c 7b03          	ld	a,(OFST+2,sp)
2697  000e a40f          	and	a,#15
2698  0010 6b01          	ld	(OFST+0,sp),a
2700                     ; 673     if (temp < 8)
2702  0012 7b01          	ld	a,(OFST+0,sp)
2703  0014 a108          	cp	a,#8
2704  0016 2416          	jruge	L1321
2705                     ; 675       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2707  0018 7b01          	ld	a,(OFST+0,sp)
2708  001a 5f            	clrw	x
2709  001b 97            	ld	xl,a
2710  001c a601          	ld	a,#1
2711  001e 5d            	tnzw	x
2712  001f 2704          	jreq	L651
2713  0021               L061:
2714  0021 48            	sll	a
2715  0022 5a            	decw	x
2716  0023 26fc          	jrne	L061
2717  0025               L651:
2718  0025 43            	cpl	a
2719  0026 c4540d        	and	a,21517
2720  0029 c7540d        	ld	21517,a
2722  002c 2021          	jra	L5321
2723  002e               L1321:
2724                     ; 679       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2726  002e 7b01          	ld	a,(OFST+0,sp)
2727  0030 a008          	sub	a,#8
2728  0032 5f            	clrw	x
2729  0033 97            	ld	xl,a
2730  0034 a601          	ld	a,#1
2731  0036 5d            	tnzw	x
2732  0037 2704          	jreq	L261
2733  0039               L461:
2734  0039 48            	sll	a
2735  003a 5a            	decw	x
2736  003b 26fc          	jrne	L461
2737  003d               L261:
2738  003d 43            	cpl	a
2739  003e c4540c        	and	a,21516
2740  0041 c7540c        	ld	21516,a
2741  0044 2009          	jra	L5321
2742  0046               L7221:
2743                     ; 684     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
2745  0046 7b03          	ld	a,(OFST+2,sp)
2746  0048 43            	cpl	a
2747  0049 c45400        	and	a,21504
2748  004c c75400        	ld	21504,a
2749  004f               L5321:
2750                     ; 686 }
2753  004f 5b03          	addw	sp,#3
2754  0051 81            	ret
2767                     	xdef	_ADC1_ClearITPendingBit
2768                     	xdef	_ADC1_GetITStatus
2769                     	xdef	_ADC1_ClearFlag
2770                     	xdef	_ADC1_GetFlagStatus
2771                     	xdef	_ADC1_GetAWDChannelStatus
2772                     	xdef	_ADC1_GetBufferValue
2773                     	xdef	_ADC1_SetLowThreshold
2774                     	xdef	_ADC1_SetHighThreshold
2775                     	xdef	_ADC1_GetConversionValue
2776                     	xdef	_ADC1_StartConversion
2777                     	xdef	_ADC1_AWDChannelConfig
2778                     	xdef	_ADC1_ExternalTriggerConfig
2779                     	xdef	_ADC1_ConversionConfig
2780                     	xdef	_ADC1_SchmittTriggerConfig
2781                     	xdef	_ADC1_PrescalerConfig
2782                     	xdef	_ADC1_ITConfig
2783                     	xdef	_ADC1_DataBufferCmd
2784                     	xdef	_ADC1_ScanModeCmd
2785                     	xdef	_ADC1_Cmd
2786                     	xdef	_ADC1_Init
2787                     	xdef	_ADC1_DeInit
2806                     	end
