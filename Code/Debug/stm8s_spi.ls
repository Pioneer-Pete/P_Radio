   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  44                     ; 50 void SPI_DeInit(void)
  44                     ; 51 {
  46                     .text:	section	.text,new
  47  0000               _SPI_DeInit:
  51                     ; 52   SPI->CR1    = SPI_CR1_RESET_VALUE;
  53  0000 725f5200      	clr	20992
  54                     ; 53   SPI->CR2    = SPI_CR2_RESET_VALUE;
  56  0004 725f5201      	clr	20993
  57                     ; 54   SPI->ICR    = SPI_ICR_RESET_VALUE;
  59  0008 725f5202      	clr	20994
  60                     ; 55   SPI->SR     = SPI_SR_RESET_VALUE;
  62  000c 35025203      	mov	20995,#2
  63                     ; 56   SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  65  0010 35075205      	mov	20997,#7
  66                     ; 57 }
  69  0014 81            	ret
 385                     ; 78 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 385                     ; 79 {
 386                     .text:	section	.text,new
 387  0000               _SPI_Init:
 389  0000 89            	pushw	x
 390  0001 88            	push	a
 391       00000001      OFST:	set	1
 394                     ; 81   assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 396                     ; 82   assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 398                     ; 83   assert_param(IS_SPI_MODE_OK(Mode));
 400                     ; 84   assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 402                     ; 85   assert_param(IS_SPI_PHASE_OK(ClockPhase));
 404                     ; 86   assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 406                     ; 87   assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 408                     ; 88   assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 410                     ; 91   SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 410                     ; 92                        (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 412  0002 7b07          	ld	a,(OFST+6,sp)
 413  0004 1a08          	or	a,(OFST+7,sp)
 414  0006 6b01          	ld	(OFST+0,sp),a
 416  0008 9f            	ld	a,xl
 417  0009 1a02          	or	a,(OFST+1,sp)
 418  000b 1a01          	or	a,(OFST+0,sp)
 419  000d c75200        	ld	20992,a
 420                     ; 95   SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 422  0010 7b09          	ld	a,(OFST+8,sp)
 423  0012 1a0a          	or	a,(OFST+9,sp)
 424  0014 c75201        	ld	20993,a
 425                     ; 97   if (Mode == SPI_MODE_MASTER)
 427  0017 7b06          	ld	a,(OFST+5,sp)
 428  0019 a104          	cp	a,#4
 429  001b 2606          	jrne	L302
 430                     ; 99     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 432  001d 72105201      	bset	20993,#0
 434  0021 2004          	jra	L502
 435  0023               L302:
 436                     ; 103     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 438  0023 72115201      	bres	20993,#0
 439  0027               L502:
 440                     ; 107   SPI->CR1 |= (uint8_t)(Mode);
 442  0027 c65200        	ld	a,20992
 443  002a 1a06          	or	a,(OFST+5,sp)
 444  002c c75200        	ld	20992,a
 445                     ; 110   SPI->CRCPR = (uint8_t)CRCPolynomial;
 447  002f 7b0b          	ld	a,(OFST+10,sp)
 448  0031 c75205        	ld	20997,a
 449                     ; 111 }
 452  0034 5b03          	addw	sp,#3
 453  0036 81            	ret
 508                     ; 119 void SPI_Cmd(FunctionalState NewState)
 508                     ; 120 {
 509                     .text:	section	.text,new
 510  0000               _SPI_Cmd:
 514                     ; 122   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 516                     ; 124   if (NewState != DISABLE)
 518  0000 4d            	tnz	a
 519  0001 2706          	jreq	L532
 520                     ; 126     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 522  0003 721c5200      	bset	20992,#6
 524  0007 2004          	jra	L732
 525  0009               L532:
 526                     ; 130     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 528  0009 721d5200      	bres	20992,#6
 529  000d               L732:
 530                     ; 132 }
 533  000d 81            	ret
 642                     ; 141 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 642                     ; 142 {
 643                     .text:	section	.text,new
 644  0000               _SPI_ITConfig:
 646  0000 89            	pushw	x
 647  0001 88            	push	a
 648       00000001      OFST:	set	1
 651                     ; 143   uint8_t itpos = 0;
 653                     ; 145   assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 655                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 657                     ; 149   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 659  0002 9e            	ld	a,xh
 660  0003 a40f          	and	a,#15
 661  0005 5f            	clrw	x
 662  0006 97            	ld	xl,a
 663  0007 a601          	ld	a,#1
 664  0009 5d            	tnzw	x
 665  000a 2704          	jreq	L41
 666  000c               L61:
 667  000c 48            	sll	a
 668  000d 5a            	decw	x
 669  000e 26fc          	jrne	L61
 670  0010               L41:
 671  0010 6b01          	ld	(OFST+0,sp),a
 673                     ; 151   if (NewState != DISABLE)
 675  0012 0d03          	tnz	(OFST+2,sp)
 676  0014 270a          	jreq	L113
 677                     ; 153     SPI->ICR |= itpos; /* Enable interrupt*/
 679  0016 c65202        	ld	a,20994
 680  0019 1a01          	or	a,(OFST+0,sp)
 681  001b c75202        	ld	20994,a
 683  001e 2009          	jra	L313
 684  0020               L113:
 685                     ; 157     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 687  0020 7b01          	ld	a,(OFST+0,sp)
 688  0022 43            	cpl	a
 689  0023 c45202        	and	a,20994
 690  0026 c75202        	ld	20994,a
 691  0029               L313:
 692                     ; 159 }
 695  0029 5b03          	addw	sp,#3
 696  002b 81            	ret
 730                     ; 166 void SPI_SendData(uint8_t Data)
 730                     ; 167 {
 731                     .text:	section	.text,new
 732  0000               _SPI_SendData:
 736                     ; 168   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 738  0000 c75204        	ld	20996,a
 739                     ; 169 }
 742  0003 81            	ret
 765                     ; 176 uint8_t SPI_ReceiveData(void)
 765                     ; 177 {
 766                     .text:	section	.text,new
 767  0000               _SPI_ReceiveData:
 771                     ; 178   return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 773  0000 c65204        	ld	a,20996
 776  0003 81            	ret
 812                     ; 187 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 812                     ; 188 {
 813                     .text:	section	.text,new
 814  0000               _SPI_NSSInternalSoftwareCmd:
 818                     ; 190   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 820                     ; 192   if (NewState != DISABLE)
 822  0000 4d            	tnz	a
 823  0001 2706          	jreq	L163
 824                     ; 194     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 826  0003 72105201      	bset	20993,#0
 828  0007 2004          	jra	L363
 829  0009               L163:
 830                     ; 198     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 832  0009 72115201      	bres	20993,#0
 833  000d               L363:
 834                     ; 200 }
 837  000d 81            	ret
 860                     ; 207 void SPI_TransmitCRC(void)
 860                     ; 208 {
 861                     .text:	section	.text,new
 862  0000               _SPI_TransmitCRC:
 866                     ; 209   SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 868  0000 72185201      	bset	20993,#4
 869                     ; 210 }
 872  0004 81            	ret
 908                     ; 218 void SPI_CalculateCRCCmd(FunctionalState NewState)
 908                     ; 219 {
 909                     .text:	section	.text,new
 910  0000               _SPI_CalculateCRCCmd:
 914                     ; 221   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 916                     ; 223   if (NewState != DISABLE)
 918  0000 4d            	tnz	a
 919  0001 2706          	jreq	L314
 920                     ; 225     SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
 922  0003 721a5201      	bset	20993,#5
 924  0007 2004          	jra	L514
 925  0009               L314:
 926                     ; 229     SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
 928  0009 721b5201      	bres	20993,#5
 929  000d               L514:
 930                     ; 231 }
 933  000d 81            	ret
 997                     ; 238 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
 997                     ; 239 {
 998                     .text:	section	.text,new
 999  0000               _SPI_GetCRC:
1001  0000 88            	push	a
1002       00000001      OFST:	set	1
1005                     ; 240   uint8_t crcreg = 0;
1007                     ; 243   assert_param(IS_SPI_CRC_OK(SPI_CRC));
1009                     ; 245   if (SPI_CRC != SPI_CRC_RX)
1011  0001 4d            	tnz	a
1012  0002 2707          	jreq	L154
1013                     ; 247     crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1015  0004 c65207        	ld	a,20999
1016  0007 6b01          	ld	(OFST+0,sp),a
1019  0009 2005          	jra	L354
1020  000b               L154:
1021                     ; 251     crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1023  000b c65206        	ld	a,20998
1024  000e 6b01          	ld	(OFST+0,sp),a
1026  0010               L354:
1027                     ; 255   return crcreg;
1029  0010 7b01          	ld	a,(OFST+0,sp)
1032  0012 5b01          	addw	sp,#1
1033  0014 81            	ret
1058                     ; 263 void SPI_ResetCRC(void)
1058                     ; 264 {
1059                     .text:	section	.text,new
1060  0000               _SPI_ResetCRC:
1064                     ; 267   SPI_CalculateCRCCmd(ENABLE);
1066  0000 a601          	ld	a,#1
1067  0002 cd0000        	call	_SPI_CalculateCRCCmd
1069                     ; 270   SPI_Cmd(ENABLE);
1071  0005 a601          	ld	a,#1
1072  0007 cd0000        	call	_SPI_Cmd
1074                     ; 271 }
1077  000a 81            	ret
1101                     ; 278 uint8_t SPI_GetCRCPolynomial(void)
1101                     ; 279 {
1102                     .text:	section	.text,new
1103  0000               _SPI_GetCRCPolynomial:
1107                     ; 280   return SPI->CRCPR; /* Return the CRC polynomial register */
1109  0000 c65205        	ld	a,20997
1112  0003 81            	ret
1168                     ; 288 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1168                     ; 289 {
1169                     .text:	section	.text,new
1170  0000               _SPI_BiDirectionalLineConfig:
1174                     ; 291   assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1176                     ; 293   if (SPI_Direction != SPI_DIRECTION_RX)
1178  0000 4d            	tnz	a
1179  0001 2706          	jreq	L325
1180                     ; 295     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1182  0003 721c5201      	bset	20993,#6
1184  0007 2004          	jra	L525
1185  0009               L325:
1186                     ; 299     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1188  0009 721d5201      	bres	20993,#6
1189  000d               L525:
1190                     ; 301 }
1193  000d 81            	ret
1314                     ; 311 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1314                     ; 312 {
1315                     .text:	section	.text,new
1316  0000               _SPI_GetFlagStatus:
1318  0000 88            	push	a
1319       00000001      OFST:	set	1
1322                     ; 313   FlagStatus status = RESET;
1324                     ; 315   assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1326                     ; 318   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1328  0001 c45203        	and	a,20995
1329  0004 2706          	jreq	L306
1330                     ; 320     status = SET; /* SPI_FLAG is set */
1332  0006 a601          	ld	a,#1
1333  0008 6b01          	ld	(OFST+0,sp),a
1336  000a 2002          	jra	L506
1337  000c               L306:
1338                     ; 324     status = RESET; /* SPI_FLAG is reset*/
1340  000c 0f01          	clr	(OFST+0,sp)
1342  000e               L506:
1343                     ; 328   return status;
1345  000e 7b01          	ld	a,(OFST+0,sp)
1348  0010 5b01          	addw	sp,#1
1349  0012 81            	ret
1384                     ; 346 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1384                     ; 347 {
1385                     .text:	section	.text,new
1386  0000               _SPI_ClearFlag:
1390                     ; 348   assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1392                     ; 350   SPI->SR = (uint8_t)(~SPI_FLAG);
1394  0000 43            	cpl	a
1395  0001 c75203        	ld	20995,a
1396                     ; 351 }
1399  0004 81            	ret
1481                     ; 366 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1481                     ; 367 {
1482                     .text:	section	.text,new
1483  0000               _SPI_GetITStatus:
1485  0000 88            	push	a
1486  0001 89            	pushw	x
1487       00000002      OFST:	set	2
1490                     ; 368   ITStatus pendingbitstatus = RESET;
1492                     ; 369   uint8_t itpos = 0;
1494                     ; 370   uint8_t itmask1 = 0;
1496                     ; 371   uint8_t itmask2 = 0;
1498                     ; 372   uint8_t enablestatus = 0;
1500                     ; 373   assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1502                     ; 375   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1504  0002 a40f          	and	a,#15
1505  0004 5f            	clrw	x
1506  0005 97            	ld	xl,a
1507  0006 a601          	ld	a,#1
1508  0008 5d            	tnzw	x
1509  0009 2704          	jreq	L05
1510  000b               L25:
1511  000b 48            	sll	a
1512  000c 5a            	decw	x
1513  000d 26fc          	jrne	L25
1514  000f               L05:
1515  000f 6b01          	ld	(OFST-1,sp),a
1517                     ; 378   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1519  0011 7b03          	ld	a,(OFST+1,sp)
1520  0013 4e            	swap	a
1521  0014 a40f          	and	a,#15
1522  0016 6b02          	ld	(OFST+0,sp),a
1524                     ; 380   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1526  0018 7b02          	ld	a,(OFST+0,sp)
1527  001a 5f            	clrw	x
1528  001b 97            	ld	xl,a
1529  001c a601          	ld	a,#1
1530  001e 5d            	tnzw	x
1531  001f 2704          	jreq	L45
1532  0021               L65:
1533  0021 48            	sll	a
1534  0022 5a            	decw	x
1535  0023 26fc          	jrne	L65
1536  0025               L45:
1537  0025 6b02          	ld	(OFST+0,sp),a
1539                     ; 382   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1541  0027 c65203        	ld	a,20995
1542  002a 1402          	and	a,(OFST+0,sp)
1543  002c 6b02          	ld	(OFST+0,sp),a
1545                     ; 384   if (((SPI->ICR & itpos) != RESET) && enablestatus)
1547  002e c65202        	ld	a,20994
1548  0031 1501          	bcp	a,(OFST-1,sp)
1549  0033 270a          	jreq	L766
1551  0035 0d02          	tnz	(OFST+0,sp)
1552  0037 2706          	jreq	L766
1553                     ; 387     pendingbitstatus = SET;
1555  0039 a601          	ld	a,#1
1556  003b 6b02          	ld	(OFST+0,sp),a
1559  003d 2002          	jra	L176
1560  003f               L766:
1561                     ; 392     pendingbitstatus = RESET;
1563  003f 0f02          	clr	(OFST+0,sp)
1565  0041               L176:
1566                     ; 395   return  pendingbitstatus;
1568  0041 7b02          	ld	a,(OFST+0,sp)
1571  0043 5b03          	addw	sp,#3
1572  0045 81            	ret
1617                     ; 412 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1617                     ; 413 {
1618                     .text:	section	.text,new
1619  0000               _SPI_ClearITPendingBit:
1621  0000 88            	push	a
1622       00000001      OFST:	set	1
1625                     ; 414   uint8_t itpos = 0;
1627                     ; 415   assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
1629                     ; 420   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
1631  0001 a4f0          	and	a,#240
1632  0003 4e            	swap	a
1633  0004 a40f          	and	a,#15
1634  0006 5f            	clrw	x
1635  0007 97            	ld	xl,a
1636  0008 a601          	ld	a,#1
1637  000a 5d            	tnzw	x
1638  000b 2704          	jreq	L26
1639  000d               L46:
1640  000d 48            	sll	a
1641  000e 5a            	decw	x
1642  000f 26fc          	jrne	L46
1643  0011               L26:
1644  0011 6b01          	ld	(OFST+0,sp),a
1646                     ; 422   SPI->SR = (uint8_t)(~itpos);
1648  0013 7b01          	ld	a,(OFST+0,sp)
1649  0015 43            	cpl	a
1650  0016 c75203        	ld	20995,a
1651                     ; 424 }
1654  0019 84            	pop	a
1655  001a 81            	ret
1668                     	xdef	_SPI_ClearITPendingBit
1669                     	xdef	_SPI_GetITStatus
1670                     	xdef	_SPI_ClearFlag
1671                     	xdef	_SPI_GetFlagStatus
1672                     	xdef	_SPI_BiDirectionalLineConfig
1673                     	xdef	_SPI_GetCRCPolynomial
1674                     	xdef	_SPI_ResetCRC
1675                     	xdef	_SPI_GetCRC
1676                     	xdef	_SPI_CalculateCRCCmd
1677                     	xdef	_SPI_TransmitCRC
1678                     	xdef	_SPI_NSSInternalSoftwareCmd
1679                     	xdef	_SPI_ReceiveData
1680                     	xdef	_SPI_SendData
1681                     	xdef	_SPI_ITConfig
1682                     	xdef	_SPI_Cmd
1683                     	xdef	_SPI_Init
1684                     	xdef	_SPI_DeInit
1703                     	end
