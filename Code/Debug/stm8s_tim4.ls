   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  44                     ; 49 void TIM4_DeInit(void)
  44                     ; 50 {
  46                     .text:	section	.text,new
  47  0000               _TIM4_DeInit:
  51                     ; 51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  53  0000 725f5340      	clr	21312
  54                     ; 52   TIM4->IER = TIM4_IER_RESET_VALUE;
  56  0004 725f5343      	clr	21315
  57                     ; 53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  59  0008 725f5346      	clr	21318
  60                     ; 54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  62  000c 725f5347      	clr	21319
  63                     ; 55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  65  0010 35ff5348      	mov	21320,#255
  66                     ; 56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  68  0014 725f5344      	clr	21316
  69                     ; 57 }
  72  0018 81            	ret
 178                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 178                     ; 66 {
 179                     .text:	section	.text,new
 180  0000               _TIM4_TimeBaseInit:
 184                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 186                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 188  0000 9e            	ld	a,xh
 189  0001 c75347        	ld	21319,a
 190                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
 192  0004 9f            	ld	a,xl
 193  0005 c75348        	ld	21320,a
 194                     ; 73 }
 197  0008 81            	ret
 252                     ; 81 void TIM4_Cmd(FunctionalState NewState)
 252                     ; 82 {
 253                     .text:	section	.text,new
 254  0000               _TIM4_Cmd:
 258                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 260                     ; 87   if (NewState != DISABLE)
 262  0000 4d            	tnz	a
 263  0001 2706          	jreq	L511
 264                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 266  0003 72105340      	bset	21312,#0
 268  0007 2004          	jra	L711
 269  0009               L511:
 270                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 272  0009 72115340      	bres	21312,#0
 273  000d               L711:
 274                     ; 95 }
 277  000d 81            	ret
 335                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 335                     ; 108 {
 336                     .text:	section	.text,new
 337  0000               _TIM4_ITConfig:
 339  0000 89            	pushw	x
 340       00000000      OFST:	set	0
 343                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 345                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 347                     ; 113   if (NewState != DISABLE)
 349  0001 9f            	ld	a,xl
 350  0002 4d            	tnz	a
 351  0003 2709          	jreq	L151
 352                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 354  0005 9e            	ld	a,xh
 355  0006 ca5343        	or	a,21315
 356  0009 c75343        	ld	21315,a
 358  000c 2009          	jra	L351
 359  000e               L151:
 360                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 362  000e 7b01          	ld	a,(OFST+1,sp)
 363  0010 43            	cpl	a
 364  0011 c45343        	and	a,21315
 365  0014 c75343        	ld	21315,a
 366  0017               L351:
 367                     ; 123 }
 370  0017 85            	popw	x
 371  0018 81            	ret
 407                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 407                     ; 132 {
 408                     .text:	section	.text,new
 409  0000               _TIM4_UpdateDisableConfig:
 413                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 415                     ; 137   if (NewState != DISABLE)
 417  0000 4d            	tnz	a
 418  0001 2706          	jreq	L371
 419                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 421  0003 72125340      	bset	21312,#1
 423  0007 2004          	jra	L571
 424  0009               L371:
 425                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 427  0009 72135340      	bres	21312,#1
 428  000d               L571:
 429                     ; 145 }
 432  000d 81            	ret
 490                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 490                     ; 156 {
 491                     .text:	section	.text,new
 492  0000               _TIM4_UpdateRequestConfig:
 496                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 498                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 500  0000 4d            	tnz	a
 501  0001 2706          	jreq	L522
 502                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 504  0003 72145340      	bset	21312,#2
 506  0007 2004          	jra	L722
 507  0009               L522:
 508                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 510  0009 72155340      	bres	21312,#2
 511  000d               L722:
 512                     ; 169 }
 515  000d 81            	ret
 572                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 572                     ; 180 {
 573                     .text:	section	.text,new
 574  0000               _TIM4_SelectOnePulseMode:
 578                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 580                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 582  0000 4d            	tnz	a
 583  0001 2706          	jreq	L752
 584                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 586  0003 72165340      	bset	21312,#3
 588  0007 2004          	jra	L162
 589  0009               L752:
 590                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 592  0009 72175340      	bres	21312,#3
 593  000d               L162:
 594                     ; 193 }
 597  000d 81            	ret
 665                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 665                     ; 216 {
 666                     .text:	section	.text,new
 667  0000               _TIM4_PrescalerConfig:
 671                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 673                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 675                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 677  0000 9e            	ld	a,xh
 678  0001 c75347        	ld	21319,a
 679                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 681  0004 9f            	ld	a,xl
 682  0005 c75345        	ld	21317,a
 683                     ; 226 }
 686  0008 81            	ret
 722                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 722                     ; 235 {
 723                     .text:	section	.text,new
 724  0000               _TIM4_ARRPreloadConfig:
 728                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 730                     ; 240   if (NewState != DISABLE)
 732  0000 4d            	tnz	a
 733  0001 2706          	jreq	L333
 734                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 736  0003 721e5340      	bset	21312,#7
 738  0007 2004          	jra	L533
 739  0009               L333:
 740                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 742  0009 721f5340      	bres	21312,#7
 743  000d               L533:
 744                     ; 248 }
 747  000d 81            	ret
 796                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 796                     ; 258 {
 797                     .text:	section	.text,new
 798  0000               _TIM4_GenerateEvent:
 802                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 804                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
 806  0000 c75345        	ld	21317,a
 807                     ; 264 }
 810  0003 81            	ret
 844                     ; 272 void TIM4_SetCounter(uint8_t Counter)
 844                     ; 273 {
 845                     .text:	section	.text,new
 846  0000               _TIM4_SetCounter:
 850                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
 852  0000 c75346        	ld	21318,a
 853                     ; 276 }
 856  0003 81            	ret
 890                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
 890                     ; 285 {
 891                     .text:	section	.text,new
 892  0000               _TIM4_SetAutoreload:
 896                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
 898  0000 c75348        	ld	21320,a
 899                     ; 288 }
 902  0003 81            	ret
 925                     ; 295 uint8_t TIM4_GetCounter(void)
 925                     ; 296 {
 926                     .text:	section	.text,new
 927  0000               _TIM4_GetCounter:
 931                     ; 298   return (uint8_t)(TIM4->CNTR);
 933  0000 c65346        	ld	a,21318
 936  0003 81            	ret
 960                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 960                     ; 307 {
 961                     .text:	section	.text,new
 962  0000               _TIM4_GetPrescaler:
 966                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 968  0000 c65347        	ld	a,21319
 971  0003 81            	ret
1050                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1050                     ; 320 {
1051                     .text:	section	.text,new
1052  0000               _TIM4_GetFlagStatus:
1054  0000 88            	push	a
1055       00000001      OFST:	set	1
1058                     ; 321   FlagStatus bitstatus = RESET;
1060                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1062                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1064  0001 c45344        	and	a,21316
1065  0004 2706          	jreq	L774
1066                     ; 328     bitstatus = SET;
1068  0006 a601          	ld	a,#1
1069  0008 6b01          	ld	(OFST+0,sp),a
1072  000a 2002          	jra	L105
1073  000c               L774:
1074                     ; 332     bitstatus = RESET;
1076  000c 0f01          	clr	(OFST+0,sp)
1078  000e               L105:
1079                     ; 334   return ((FlagStatus)bitstatus);
1081  000e 7b01          	ld	a,(OFST+0,sp)
1084  0010 5b01          	addw	sp,#1
1085  0012 81            	ret
1120                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1120                     ; 345 {
1121                     .text:	section	.text,new
1122  0000               _TIM4_ClearFlag:
1126                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1128                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1130  0000 43            	cpl	a
1131  0001 c75344        	ld	21316,a
1132                     ; 351 }
1135  0004 81            	ret
1199                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1199                     ; 361 {
1200                     .text:	section	.text,new
1201  0000               _TIM4_GetITStatus:
1203  0000 88            	push	a
1204  0001 89            	pushw	x
1205       00000002      OFST:	set	2
1208                     ; 362   ITStatus bitstatus = RESET;
1210                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1214                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1216                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1218  0002 c45344        	and	a,21316
1219  0005 6b01          	ld	(OFST-1,sp),a
1221                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1223  0007 c65343        	ld	a,21315
1224  000a 1403          	and	a,(OFST+1,sp)
1225  000c 6b02          	ld	(OFST+0,sp),a
1227                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1229  000e 0d01          	tnz	(OFST-1,sp)
1230  0010 270a          	jreq	L355
1232  0012 0d02          	tnz	(OFST+0,sp)
1233  0014 2706          	jreq	L355
1234                     ; 375     bitstatus = (ITStatus)SET;
1236  0016 a601          	ld	a,#1
1237  0018 6b02          	ld	(OFST+0,sp),a
1240  001a 2002          	jra	L555
1241  001c               L355:
1242                     ; 379     bitstatus = (ITStatus)RESET;
1244  001c 0f02          	clr	(OFST+0,sp)
1246  001e               L555:
1247                     ; 381   return ((ITStatus)bitstatus);
1249  001e 7b02          	ld	a,(OFST+0,sp)
1252  0020 5b03          	addw	sp,#3
1253  0022 81            	ret
1289                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1289                     ; 392 {
1290                     .text:	section	.text,new
1291  0000               _TIM4_ClearITPendingBit:
1295                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1297                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
1299  0000 43            	cpl	a
1300  0001 c75344        	ld	21316,a
1301                     ; 398 }
1304  0004 81            	ret
1317                     	xdef	_TIM4_ClearITPendingBit
1318                     	xdef	_TIM4_GetITStatus
1319                     	xdef	_TIM4_ClearFlag
1320                     	xdef	_TIM4_GetFlagStatus
1321                     	xdef	_TIM4_GetPrescaler
1322                     	xdef	_TIM4_GetCounter
1323                     	xdef	_TIM4_SetAutoreload
1324                     	xdef	_TIM4_SetCounter
1325                     	xdef	_TIM4_GenerateEvent
1326                     	xdef	_TIM4_ARRPreloadConfig
1327                     	xdef	_TIM4_PrescalerConfig
1328                     	xdef	_TIM4_SelectOnePulseMode
1329                     	xdef	_TIM4_UpdateRequestConfig
1330                     	xdef	_TIM4_UpdateDisableConfig
1331                     	xdef	_TIM4_ITConfig
1332                     	xdef	_TIM4_Cmd
1333                     	xdef	_TIM4_TimeBaseInit
1334                     	xdef	_TIM4_DeInit
1353                     	end
