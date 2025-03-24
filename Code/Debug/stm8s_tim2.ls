   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  44                     ; 52 void TIM2_DeInit(void)
  44                     ; 53 {
  46                     .text:	section	.text,new
  47  0000               _TIM2_DeInit:
  51                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  53  0000 725f5300      	clr	21248
  54                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  56  0004 725f5303      	clr	21251
  57                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  59  0008 725f5305      	clr	21253
  60                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  62  000c 725f530a      	clr	21258
  63                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  65  0010 725f530b      	clr	21259
  66                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  68  0014 725f530a      	clr	21258
  69                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  71  0018 725f530b      	clr	21259
  72                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  74  001c 725f5307      	clr	21255
  75                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  77  0020 725f5308      	clr	21256
  78                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  80  0024 725f5309      	clr	21257
  81                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  83  0028 725f530c      	clr	21260
  84                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  86  002c 725f530d      	clr	21261
  87                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  89  0030 725f530e      	clr	21262
  90                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  92  0034 35ff530f      	mov	21263,#255
  93                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  95  0038 35ff5310      	mov	21264,#255
  96                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
  98  003c 725f5311      	clr	21265
  99                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 101  0040 725f5312      	clr	21266
 102                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 104  0044 725f5313      	clr	21267
 105                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 107  0048 725f5314      	clr	21268
 108                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 110  004c 725f5315      	clr	21269
 111                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 113  0050 725f5316      	clr	21270
 114                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 116  0054 725f5304      	clr	21252
 117                     ; 81 }
 120  0058 81            	ret
 288                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 288                     ; 90                         uint16_t TIM2_Period)
 288                     ; 91 {
 289                     .text:	section	.text,new
 290  0000               _TIM2_TimeBaseInit:
 292  0000 88            	push	a
 293       00000000      OFST:	set	0
 296                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 298  0001 c7530e        	ld	21262,a
 299                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 301  0004 7b04          	ld	a,(OFST+4,sp)
 302  0006 c7530f        	ld	21263,a
 303                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 305  0009 7b05          	ld	a,(OFST+5,sp)
 306  000b c75310        	ld	21264,a
 307                     ; 97 }
 310  000e 84            	pop	a
 311  000f 81            	ret
 468                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 468                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 468                     ; 110                   uint16_t TIM2_Pulse,
 468                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 468                     ; 112 {
 469                     .text:	section	.text,new
 470  0000               _TIM2_OC1Init:
 472  0000 89            	pushw	x
 473  0001 88            	push	a
 474       00000001      OFST:	set	1
 477                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 479                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 481                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 483                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 485  0002 c6530a        	ld	a,21258
 486  0005 a4fc          	and	a,#252
 487  0007 c7530a        	ld	21258,a
 488                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 488                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 490  000a 7b08          	ld	a,(OFST+7,sp)
 491  000c a402          	and	a,#2
 492  000e 6b01          	ld	(OFST+0,sp),a
 494  0010 9f            	ld	a,xl
 495  0011 a401          	and	a,#1
 496  0013 1a01          	or	a,(OFST+0,sp)
 497  0015 ca530a        	or	a,21258
 498  0018 c7530a        	ld	21258,a
 499                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 499                     ; 126                           (uint8_t)TIM2_OCMode);
 501  001b c65307        	ld	a,21255
 502  001e a48f          	and	a,#143
 503  0020 1a02          	or	a,(OFST+1,sp)
 504  0022 c75307        	ld	21255,a
 505                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 507  0025 7b06          	ld	a,(OFST+5,sp)
 508  0027 c75311        	ld	21265,a
 509                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 511  002a 7b07          	ld	a,(OFST+6,sp)
 512  002c c75312        	ld	21266,a
 513                     ; 131 }
 516  002f 5b03          	addw	sp,#3
 517  0031 81            	ret
 581                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 581                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 581                     ; 144                   uint16_t TIM2_Pulse,
 581                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 581                     ; 146 {
 582                     .text:	section	.text,new
 583  0000               _TIM2_OC2Init:
 585  0000 89            	pushw	x
 586  0001 88            	push	a
 587       00000001      OFST:	set	1
 590                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 592                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 594                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 596                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 598  0002 c6530a        	ld	a,21258
 599  0005 a4cf          	and	a,#207
 600  0007 c7530a        	ld	21258,a
 601                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 601                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 603  000a 7b08          	ld	a,(OFST+7,sp)
 604  000c a420          	and	a,#32
 605  000e 6b01          	ld	(OFST+0,sp),a
 607  0010 9f            	ld	a,xl
 608  0011 a410          	and	a,#16
 609  0013 1a01          	or	a,(OFST+0,sp)
 610  0015 ca530a        	or	a,21258
 611  0018 c7530a        	ld	21258,a
 612                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 612                     ; 162                           (uint8_t)TIM2_OCMode);
 614  001b c65308        	ld	a,21256
 615  001e a48f          	and	a,#143
 616  0020 1a02          	or	a,(OFST+1,sp)
 617  0022 c75308        	ld	21256,a
 618                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 620  0025 7b06          	ld	a,(OFST+5,sp)
 621  0027 c75313        	ld	21267,a
 622                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 624  002a 7b07          	ld	a,(OFST+6,sp)
 625  002c c75314        	ld	21268,a
 626                     ; 168 }
 629  002f 5b03          	addw	sp,#3
 630  0031 81            	ret
 694                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 694                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 694                     ; 181                   uint16_t TIM2_Pulse,
 694                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 694                     ; 183 {
 695                     .text:	section	.text,new
 696  0000               _TIM2_OC3Init:
 698  0000 89            	pushw	x
 699  0001 88            	push	a
 700       00000001      OFST:	set	1
 703                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 705                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 707                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 709                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 711  0002 c6530b        	ld	a,21259
 712  0005 a4fc          	and	a,#252
 713  0007 c7530b        	ld	21259,a
 714                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 714                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 716  000a 7b08          	ld	a,(OFST+7,sp)
 717  000c a402          	and	a,#2
 718  000e 6b01          	ld	(OFST+0,sp),a
 720  0010 9f            	ld	a,xl
 721  0011 a401          	and	a,#1
 722  0013 1a01          	or	a,(OFST+0,sp)
 723  0015 ca530b        	or	a,21259
 724  0018 c7530b        	ld	21259,a
 725                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 725                     ; 196                           (uint8_t)TIM2_OCMode);
 727  001b c65309        	ld	a,21257
 728  001e a48f          	and	a,#143
 729  0020 1a02          	or	a,(OFST+1,sp)
 730  0022 c75309        	ld	21257,a
 731                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 733  0025 7b06          	ld	a,(OFST+5,sp)
 734  0027 c75315        	ld	21269,a
 735                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 737  002a 7b07          	ld	a,(OFST+6,sp)
 738  002c c75316        	ld	21270,a
 739                     ; 201 }
 742  002f 5b03          	addw	sp,#3
 743  0031 81            	ret
 936                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 936                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 936                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 936                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 936                     ; 216                  uint8_t TIM2_ICFilter)
 936                     ; 217 {
 937                     .text:	section	.text,new
 938  0000               _TIM2_ICInit:
 940  0000 89            	pushw	x
 941       00000000      OFST:	set	0
 944                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 946                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 948                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 950                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 952                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 954                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
 956  0001 9e            	ld	a,xh
 957  0002 4d            	tnz	a
 958  0003 2614          	jrne	L104
 959                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
 959                     ; 229                (uint8_t)TIM2_ICSelection,
 959                     ; 230                (uint8_t)TIM2_ICFilter);
 961  0005 7b07          	ld	a,(OFST+7,sp)
 962  0007 88            	push	a
 963  0008 7b06          	ld	a,(OFST+6,sp)
 964  000a 97            	ld	xl,a
 965  000b 7b03          	ld	a,(OFST+3,sp)
 966  000d 95            	ld	xh,a
 967  000e cd0000        	call	L3_TI1_Config
 969  0011 84            	pop	a
 970                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 972  0012 7b06          	ld	a,(OFST+6,sp)
 973  0014 cd0000        	call	_TIM2_SetIC1Prescaler
 976  0017 202c          	jra	L304
 977  0019               L104:
 978                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
 980  0019 7b01          	ld	a,(OFST+1,sp)
 981  001b a101          	cp	a,#1
 982  001d 2614          	jrne	L504
 983                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
 983                     ; 239                (uint8_t)TIM2_ICSelection,
 983                     ; 240                (uint8_t)TIM2_ICFilter);
 985  001f 7b07          	ld	a,(OFST+7,sp)
 986  0021 88            	push	a
 987  0022 7b06          	ld	a,(OFST+6,sp)
 988  0024 97            	ld	xl,a
 989  0025 7b03          	ld	a,(OFST+3,sp)
 990  0027 95            	ld	xh,a
 991  0028 cd0000        	call	L5_TI2_Config
 993  002b 84            	pop	a
 994                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 996  002c 7b06          	ld	a,(OFST+6,sp)
 997  002e cd0000        	call	_TIM2_SetIC2Prescaler
1000  0031 2012          	jra	L304
1001  0033               L504:
1002                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
1002                     ; 249                (uint8_t)TIM2_ICSelection,
1002                     ; 250                (uint8_t)TIM2_ICFilter);
1004  0033 7b07          	ld	a,(OFST+7,sp)
1005  0035 88            	push	a
1006  0036 7b06          	ld	a,(OFST+6,sp)
1007  0038 97            	ld	xl,a
1008  0039 7b03          	ld	a,(OFST+3,sp)
1009  003b 95            	ld	xh,a
1010  003c cd0000        	call	L7_TI3_Config
1012  003f 84            	pop	a
1013                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1015  0040 7b06          	ld	a,(OFST+6,sp)
1016  0042 cd0000        	call	_TIM2_SetIC3Prescaler
1018  0045               L304:
1019                     ; 255 }
1022  0045 85            	popw	x
1023  0046 81            	ret
1119                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1119                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1119                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1119                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1119                     ; 270                      uint8_t TIM2_ICFilter)
1119                     ; 271 {
1120                     .text:	section	.text,new
1121  0000               _TIM2_PWMIConfig:
1123  0000 89            	pushw	x
1124  0001 89            	pushw	x
1125       00000002      OFST:	set	2
1128                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1130                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1132                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1134                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1136                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1138                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1140                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1142  0002 9f            	ld	a,xl
1143  0003 a144          	cp	a,#68
1144  0005 2706          	jreq	L754
1145                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1147  0007 a644          	ld	a,#68
1148  0009 6b01          	ld	(OFST-1,sp),a
1151  000b 2002          	jra	L164
1152  000d               L754:
1153                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1155  000d 0f01          	clr	(OFST-1,sp)
1157  000f               L164:
1158                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1160  000f 7b07          	ld	a,(OFST+5,sp)
1161  0011 a101          	cp	a,#1
1162  0013 2606          	jrne	L364
1163                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1165  0015 a602          	ld	a,#2
1166  0017 6b02          	ld	(OFST+0,sp),a
1169  0019 2004          	jra	L564
1170  001b               L364:
1171                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1173  001b a601          	ld	a,#1
1174  001d 6b02          	ld	(OFST+0,sp),a
1176  001f               L564:
1177                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1179  001f 0d03          	tnz	(OFST+1,sp)
1180  0021 2626          	jrne	L764
1181                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1181                     ; 305                (uint8_t)TIM2_ICFilter);
1183  0023 7b09          	ld	a,(OFST+7,sp)
1184  0025 88            	push	a
1185  0026 7b08          	ld	a,(OFST+6,sp)
1186  0028 97            	ld	xl,a
1187  0029 7b05          	ld	a,(OFST+3,sp)
1188  002b 95            	ld	xh,a
1189  002c cd0000        	call	L3_TI1_Config
1191  002f 84            	pop	a
1192                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1194  0030 7b08          	ld	a,(OFST+6,sp)
1195  0032 cd0000        	call	_TIM2_SetIC1Prescaler
1197                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1199  0035 7b09          	ld	a,(OFST+7,sp)
1200  0037 88            	push	a
1201  0038 7b03          	ld	a,(OFST+1,sp)
1202  003a 97            	ld	xl,a
1203  003b 7b02          	ld	a,(OFST+0,sp)
1204  003d 95            	ld	xh,a
1205  003e cd0000        	call	L5_TI2_Config
1207  0041 84            	pop	a
1208                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1210  0042 7b08          	ld	a,(OFST+6,sp)
1211  0044 cd0000        	call	_TIM2_SetIC2Prescaler
1214  0047 2024          	jra	L174
1215  0049               L764:
1216                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1216                     ; 320                (uint8_t)TIM2_ICFilter);
1218  0049 7b09          	ld	a,(OFST+7,sp)
1219  004b 88            	push	a
1220  004c 7b08          	ld	a,(OFST+6,sp)
1221  004e 97            	ld	xl,a
1222  004f 7b05          	ld	a,(OFST+3,sp)
1223  0051 95            	ld	xh,a
1224  0052 cd0000        	call	L5_TI2_Config
1226  0055 84            	pop	a
1227                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1229  0056 7b08          	ld	a,(OFST+6,sp)
1230  0058 cd0000        	call	_TIM2_SetIC2Prescaler
1232                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1234  005b 7b09          	ld	a,(OFST+7,sp)
1235  005d 88            	push	a
1236  005e 7b03          	ld	a,(OFST+1,sp)
1237  0060 97            	ld	xl,a
1238  0061 7b02          	ld	a,(OFST+0,sp)
1239  0063 95            	ld	xh,a
1240  0064 cd0000        	call	L3_TI1_Config
1242  0067 84            	pop	a
1243                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1245  0068 7b08          	ld	a,(OFST+6,sp)
1246  006a cd0000        	call	_TIM2_SetIC1Prescaler
1248  006d               L174:
1249                     ; 331 }
1252  006d 5b04          	addw	sp,#4
1253  006f 81            	ret
1308                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1308                     ; 340 {
1309                     .text:	section	.text,new
1310  0000               _TIM2_Cmd:
1314                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1316                     ; 345   if (NewState != DISABLE)
1318  0000 4d            	tnz	a
1319  0001 2706          	jreq	L125
1320                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1322  0003 72105300      	bset	21248,#0
1324  0007 2004          	jra	L325
1325  0009               L125:
1326                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1328  0009 72115300      	bres	21248,#0
1329  000d               L325:
1330                     ; 353 }
1333  000d 81            	ret
1412                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1412                     ; 369 {
1413                     .text:	section	.text,new
1414  0000               _TIM2_ITConfig:
1416  0000 89            	pushw	x
1417       00000000      OFST:	set	0
1420                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1422                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1424                     ; 374   if (NewState != DISABLE)
1426  0001 9f            	ld	a,xl
1427  0002 4d            	tnz	a
1428  0003 2709          	jreq	L365
1429                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1431  0005 9e            	ld	a,xh
1432  0006 ca5303        	or	a,21251
1433  0009 c75303        	ld	21251,a
1435  000c 2009          	jra	L565
1436  000e               L365:
1437                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1439  000e 7b01          	ld	a,(OFST+1,sp)
1440  0010 43            	cpl	a
1441  0011 c45303        	and	a,21251
1442  0014 c75303        	ld	21251,a
1443  0017               L565:
1444                     ; 384 }
1447  0017 85            	popw	x
1448  0018 81            	ret
1484                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1484                     ; 393 {
1485                     .text:	section	.text,new
1486  0000               _TIM2_UpdateDisableConfig:
1490                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1492                     ; 398   if (NewState != DISABLE)
1494  0000 4d            	tnz	a
1495  0001 2706          	jreq	L506
1496                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1498  0003 72125300      	bset	21248,#1
1500  0007 2004          	jra	L706
1501  0009               L506:
1502                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1504  0009 72135300      	bres	21248,#1
1505  000d               L706:
1506                     ; 406 }
1509  000d 81            	ret
1567                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1567                     ; 417 {
1568                     .text:	section	.text,new
1569  0000               _TIM2_UpdateRequestConfig:
1573                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1575                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1577  0000 4d            	tnz	a
1578  0001 2706          	jreq	L736
1579                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1581  0003 72145300      	bset	21248,#2
1583  0007 2004          	jra	L146
1584  0009               L736:
1585                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1587  0009 72155300      	bres	21248,#2
1588  000d               L146:
1589                     ; 430 }
1592  000d 81            	ret
1649                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1649                     ; 441 {
1650                     .text:	section	.text,new
1651  0000               _TIM2_SelectOnePulseMode:
1655                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1657                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1659  0000 4d            	tnz	a
1660  0001 2706          	jreq	L176
1661                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1663  0003 72165300      	bset	21248,#3
1665  0007 2004          	jra	L376
1666  0009               L176:
1667                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1669  0009 72175300      	bres	21248,#3
1670  000d               L376:
1671                     ; 454 }
1674  000d 81            	ret
1742                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1742                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1742                     ; 486 {
1743                     .text:	section	.text,new
1744  0000               _TIM2_PrescalerConfig:
1748                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
1750                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
1752                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
1754  0000 9e            	ld	a,xh
1755  0001 c7530e        	ld	21262,a
1756                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
1758  0004 9f            	ld	a,xl
1759  0005 c75306        	ld	21254,a
1760                     ; 496 }
1763  0008 81            	ret
1821                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1821                     ; 508 {
1822                     .text:	section	.text,new
1823  0000               _TIM2_ForcedOC1Config:
1825  0000 88            	push	a
1826       00000000      OFST:	set	0
1829                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1831                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
1831                     ; 514                             | (uint8_t)TIM2_ForcedAction);
1833  0001 c65307        	ld	a,21255
1834  0004 a48f          	and	a,#143
1835  0006 1a01          	or	a,(OFST+1,sp)
1836  0008 c75307        	ld	21255,a
1837                     ; 515 }
1840  000b 84            	pop	a
1841  000c 81            	ret
1877                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1877                     ; 527 {
1878                     .text:	section	.text,new
1879  0000               _TIM2_ForcedOC2Config:
1881  0000 88            	push	a
1882       00000000      OFST:	set	0
1885                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1887                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
1887                     ; 533                           | (uint8_t)TIM2_ForcedAction);
1889  0001 c65308        	ld	a,21256
1890  0004 a48f          	and	a,#143
1891  0006 1a01          	or	a,(OFST+1,sp)
1892  0008 c75308        	ld	21256,a
1893                     ; 534 }
1896  000b 84            	pop	a
1897  000c 81            	ret
1933                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1933                     ; 546 {
1934                     .text:	section	.text,new
1935  0000               _TIM2_ForcedOC3Config:
1937  0000 88            	push	a
1938       00000000      OFST:	set	0
1941                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1943                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
1943                     ; 552                             | (uint8_t)TIM2_ForcedAction);
1945  0001 c65309        	ld	a,21257
1946  0004 a48f          	and	a,#143
1947  0006 1a01          	or	a,(OFST+1,sp)
1948  0008 c75309        	ld	21257,a
1949                     ; 553 }
1952  000b 84            	pop	a
1953  000c 81            	ret
1989                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1989                     ; 562 {
1990                     .text:	section	.text,new
1991  0000               _TIM2_ARRPreloadConfig:
1995                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1997                     ; 567   if (NewState != DISABLE)
1999  0000 4d            	tnz	a
2000  0001 2706          	jreq	L7201
2001                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
2003  0003 721e5300      	bset	21248,#7
2005  0007 2004          	jra	L1301
2006  0009               L7201:
2007                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2009  0009 721f5300      	bres	21248,#7
2010  000d               L1301:
2011                     ; 575 }
2014  000d 81            	ret
2050                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2050                     ; 584 {
2051                     .text:	section	.text,new
2052  0000               _TIM2_OC1PreloadConfig:
2056                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2058                     ; 589   if (NewState != DISABLE)
2060  0000 4d            	tnz	a
2061  0001 2706          	jreq	L1501
2062                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2064  0003 72165307      	bset	21255,#3
2066  0007 2004          	jra	L3501
2067  0009               L1501:
2068                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2070  0009 72175307      	bres	21255,#3
2071  000d               L3501:
2072                     ; 597 }
2075  000d 81            	ret
2111                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2111                     ; 606 {
2112                     .text:	section	.text,new
2113  0000               _TIM2_OC2PreloadConfig:
2117                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2119                     ; 611   if (NewState != DISABLE)
2121  0000 4d            	tnz	a
2122  0001 2706          	jreq	L3701
2123                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2125  0003 72165308      	bset	21256,#3
2127  0007 2004          	jra	L5701
2128  0009               L3701:
2129                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2131  0009 72175308      	bres	21256,#3
2132  000d               L5701:
2133                     ; 619 }
2136  000d 81            	ret
2172                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2172                     ; 628 {
2173                     .text:	section	.text,new
2174  0000               _TIM2_OC3PreloadConfig:
2178                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2180                     ; 633   if (NewState != DISABLE)
2182  0000 4d            	tnz	a
2183  0001 2706          	jreq	L5111
2184                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2186  0003 72165309      	bset	21257,#3
2188  0007 2004          	jra	L7111
2189  0009               L5111:
2190                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2192  0009 72175309      	bres	21257,#3
2193  000d               L7111:
2194                     ; 641 }
2197  000d 81            	ret
2270                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2270                     ; 654 {
2271                     .text:	section	.text,new
2272  0000               _TIM2_GenerateEvent:
2276                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2278                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
2280  0000 c75306        	ld	21254,a
2281                     ; 660 }
2284  0003 81            	ret
2320                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2320                     ; 671 {
2321                     .text:	section	.text,new
2322  0000               _TIM2_OC1PolarityConfig:
2326                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2328                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2330  0000 4d            	tnz	a
2331  0001 2706          	jreq	L1711
2332                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2334  0003 7212530a      	bset	21258,#1
2336  0007 2004          	jra	L3711
2337  0009               L1711:
2338                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2340  0009 7213530a      	bres	21258,#1
2341  000d               L3711:
2342                     ; 684 }
2345  000d 81            	ret
2381                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2381                     ; 695 {
2382                     .text:	section	.text,new
2383  0000               _TIM2_OC2PolarityConfig:
2387                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2389                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2391  0000 4d            	tnz	a
2392  0001 2706          	jreq	L3121
2393                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
2395  0003 721a530a      	bset	21258,#5
2397  0007 2004          	jra	L5121
2398  0009               L3121:
2399                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2401  0009 721b530a      	bres	21258,#5
2402  000d               L5121:
2403                     ; 708 }
2406  000d 81            	ret
2442                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2442                     ; 719 {
2443                     .text:	section	.text,new
2444  0000               _TIM2_OC3PolarityConfig:
2448                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2450                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2452  0000 4d            	tnz	a
2453  0001 2706          	jreq	L5321
2454                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2456  0003 7212530b      	bset	21259,#1
2458  0007 2004          	jra	L7321
2459  0009               L5321:
2460                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2462  0009 7213530b      	bres	21259,#1
2463  000d               L7321:
2464                     ; 732 }
2467  000d 81            	ret
2512                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2512                     ; 746 {
2513                     .text:	section	.text,new
2514  0000               _TIM2_CCxCmd:
2516  0000 89            	pushw	x
2517       00000000      OFST:	set	0
2520                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2522                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2524                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
2526  0001 9e            	ld	a,xh
2527  0002 4d            	tnz	a
2528  0003 2610          	jrne	L3621
2529                     ; 754     if (NewState != DISABLE)
2531  0005 9f            	ld	a,xl
2532  0006 4d            	tnz	a
2533  0007 2706          	jreq	L5621
2534                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2536  0009 7210530a      	bset	21258,#0
2538  000d 202a          	jra	L1721
2539  000f               L5621:
2540                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2542  000f 7211530a      	bres	21258,#0
2543  0013 2024          	jra	L1721
2544  0015               L3621:
2545                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
2547  0015 7b01          	ld	a,(OFST+1,sp)
2548  0017 a101          	cp	a,#1
2549  0019 2610          	jrne	L3721
2550                     ; 767     if (NewState != DISABLE)
2552  001b 0d02          	tnz	(OFST+2,sp)
2553  001d 2706          	jreq	L5721
2554                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2556  001f 7218530a      	bset	21258,#4
2558  0023 2014          	jra	L1721
2559  0025               L5721:
2560                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2562  0025 7219530a      	bres	21258,#4
2563  0029 200e          	jra	L1721
2564  002b               L3721:
2565                     ; 779     if (NewState != DISABLE)
2567  002b 0d02          	tnz	(OFST+2,sp)
2568  002d 2706          	jreq	L3031
2569                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2571  002f 7210530b      	bset	21259,#0
2573  0033 2004          	jra	L1721
2574  0035               L3031:
2575                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2577  0035 7211530b      	bres	21259,#0
2578  0039               L1721:
2579                     ; 788 }
2582  0039 85            	popw	x
2583  003a 81            	ret
2628                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2628                     ; 811 {
2629                     .text:	section	.text,new
2630  0000               _TIM2_SelectOCxM:
2632  0000 89            	pushw	x
2633       00000000      OFST:	set	0
2636                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2638                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2640                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
2642  0001 9e            	ld	a,xh
2643  0002 4d            	tnz	a
2644  0003 2610          	jrne	L1331
2645                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2647  0005 7211530a      	bres	21258,#0
2648                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2648                     ; 823                             | (uint8_t)TIM2_OCMode);
2650  0009 c65307        	ld	a,21255
2651  000c a48f          	and	a,#143
2652  000e 1a02          	or	a,(OFST+2,sp)
2653  0010 c75307        	ld	21255,a
2655  0013 2024          	jra	L3331
2656  0015               L1331:
2657                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
2659  0015 7b01          	ld	a,(OFST+1,sp)
2660  0017 a101          	cp	a,#1
2661  0019 2610          	jrne	L5331
2662                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2664  001b 7219530a      	bres	21258,#4
2665                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2665                     ; 832                             | (uint8_t)TIM2_OCMode);
2667  001f c65308        	ld	a,21256
2668  0022 a48f          	and	a,#143
2669  0024 1a02          	or	a,(OFST+2,sp)
2670  0026 c75308        	ld	21256,a
2672  0029 200e          	jra	L3331
2673  002b               L5331:
2674                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2676  002b 7211530b      	bres	21259,#0
2677                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2677                     ; 841                             | (uint8_t)TIM2_OCMode);
2679  002f c65309        	ld	a,21257
2680  0032 a48f          	and	a,#143
2681  0034 1a02          	or	a,(OFST+2,sp)
2682  0036 c75309        	ld	21257,a
2683  0039               L3331:
2684                     ; 843 }
2687  0039 85            	popw	x
2688  003a 81            	ret
2722                     ; 851 void TIM2_SetCounter(uint16_t Counter)
2722                     ; 852 {
2723                     .text:	section	.text,new
2724  0000               _TIM2_SetCounter:
2728                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
2730  0000 9e            	ld	a,xh
2731  0001 c7530c        	ld	21260,a
2732                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
2734  0004 9f            	ld	a,xl
2735  0005 c7530d        	ld	21261,a
2736                     ; 856 }
2739  0008 81            	ret
2773                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
2773                     ; 865 {
2774                     .text:	section	.text,new
2775  0000               _TIM2_SetAutoreload:
2779                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2781  0000 9e            	ld	a,xh
2782  0001 c7530f        	ld	21263,a
2783                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
2785  0004 9f            	ld	a,xl
2786  0005 c75310        	ld	21264,a
2787                     ; 869 }
2790  0008 81            	ret
2824                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
2824                     ; 878 {
2825                     .text:	section	.text,new
2826  0000               _TIM2_SetCompare1:
2830                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
2832  0000 9e            	ld	a,xh
2833  0001 c75311        	ld	21265,a
2834                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
2836  0004 9f            	ld	a,xl
2837  0005 c75312        	ld	21266,a
2838                     ; 882 }
2841  0008 81            	ret
2875                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
2875                     ; 891 {
2876                     .text:	section	.text,new
2877  0000               _TIM2_SetCompare2:
2881                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
2883  0000 9e            	ld	a,xh
2884  0001 c75313        	ld	21267,a
2885                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
2887  0004 9f            	ld	a,xl
2888  0005 c75314        	ld	21268,a
2889                     ; 895 }
2892  0008 81            	ret
2926                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
2926                     ; 904 {
2927                     .text:	section	.text,new
2928  0000               _TIM2_SetCompare3:
2932                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
2934  0000 9e            	ld	a,xh
2935  0001 c75315        	ld	21269,a
2936                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
2938  0004 9f            	ld	a,xl
2939  0005 c75316        	ld	21270,a
2940                     ; 908 }
2943  0008 81            	ret
2979                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2979                     ; 921 {
2980                     .text:	section	.text,new
2981  0000               _TIM2_SetIC1Prescaler:
2983  0000 88            	push	a
2984       00000000      OFST:	set	0
2987                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2989                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2989                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
2991  0001 c65307        	ld	a,21255
2992  0004 a4f3          	and	a,#243
2993  0006 1a01          	or	a,(OFST+1,sp)
2994  0008 c75307        	ld	21255,a
2995                     ; 928 }
2998  000b 84            	pop	a
2999  000c 81            	ret
3035                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3035                     ; 941 {
3036                     .text:	section	.text,new
3037  0000               _TIM2_SetIC2Prescaler:
3039  0000 88            	push	a
3040       00000000      OFST:	set	0
3043                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3045                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3045                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
3047  0001 c65308        	ld	a,21256
3048  0004 a4f3          	and	a,#243
3049  0006 1a01          	or	a,(OFST+1,sp)
3050  0008 c75308        	ld	21256,a
3051                     ; 948 }
3054  000b 84            	pop	a
3055  000c 81            	ret
3091                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3091                     ; 961 {
3092                     .text:	section	.text,new
3093  0000               _TIM2_SetIC3Prescaler:
3095  0000 88            	push	a
3096       00000000      OFST:	set	0
3099                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3101                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3101                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
3103  0001 c65309        	ld	a,21257
3104  0004 a4f3          	and	a,#243
3105  0006 1a01          	or	a,(OFST+1,sp)
3106  0008 c75309        	ld	21257,a
3107                     ; 968 }
3110  000b 84            	pop	a
3111  000c 81            	ret
3163                     ; 975 uint16_t TIM2_GetCapture1(void)
3163                     ; 976 {
3164                     .text:	section	.text,new
3165  0000               _TIM2_GetCapture1:
3167  0000 5204          	subw	sp,#4
3168       00000004      OFST:	set	4
3171                     ; 978   uint16_t tmpccr1 = 0;
3173                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
3177                     ; 981   tmpccr1h = TIM2->CCR1H;
3179  0002 c65311        	ld	a,21265
3180  0005 6b02          	ld	(OFST-2,sp),a
3182                     ; 982   tmpccr1l = TIM2->CCR1L;
3184  0007 c65312        	ld	a,21266
3185  000a 6b01          	ld	(OFST-3,sp),a
3187                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
3189  000c 7b01          	ld	a,(OFST-3,sp)
3190  000e 5f            	clrw	x
3191  000f 97            	ld	xl,a
3192  0010 1f03          	ldw	(OFST-1,sp),x
3194                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3196  0012 7b02          	ld	a,(OFST-2,sp)
3197  0014 5f            	clrw	x
3198  0015 97            	ld	xl,a
3199  0016 4f            	clr	a
3200  0017 02            	rlwa	x,a
3201  0018 01            	rrwa	x,a
3202  0019 1a04          	or	a,(OFST+0,sp)
3203  001b 01            	rrwa	x,a
3204  001c 1a03          	or	a,(OFST-1,sp)
3205  001e 01            	rrwa	x,a
3206  001f 1f03          	ldw	(OFST-1,sp),x
3208                     ; 987   return (uint16_t)tmpccr1;
3210  0021 1e03          	ldw	x,(OFST-1,sp)
3213  0023 5b04          	addw	sp,#4
3214  0025 81            	ret
3266                     ; 995 uint16_t TIM2_GetCapture2(void)
3266                     ; 996 {
3267                     .text:	section	.text,new
3268  0000               _TIM2_GetCapture2:
3270  0000 5204          	subw	sp,#4
3271       00000004      OFST:	set	4
3274                     ; 998   uint16_t tmpccr2 = 0;
3276                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
3280                     ; 1001   tmpccr2h = TIM2->CCR2H;
3282  0002 c65313        	ld	a,21267
3283  0005 6b02          	ld	(OFST-2,sp),a
3285                     ; 1002   tmpccr2l = TIM2->CCR2L;
3287  0007 c65314        	ld	a,21268
3288  000a 6b01          	ld	(OFST-3,sp),a
3290                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
3292  000c 7b01          	ld	a,(OFST-3,sp)
3293  000e 5f            	clrw	x
3294  000f 97            	ld	xl,a
3295  0010 1f03          	ldw	(OFST-1,sp),x
3297                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3299  0012 7b02          	ld	a,(OFST-2,sp)
3300  0014 5f            	clrw	x
3301  0015 97            	ld	xl,a
3302  0016 4f            	clr	a
3303  0017 02            	rlwa	x,a
3304  0018 01            	rrwa	x,a
3305  0019 1a04          	or	a,(OFST+0,sp)
3306  001b 01            	rrwa	x,a
3307  001c 1a03          	or	a,(OFST-1,sp)
3308  001e 01            	rrwa	x,a
3309  001f 1f03          	ldw	(OFST-1,sp),x
3311                     ; 1007   return (uint16_t)tmpccr2;
3313  0021 1e03          	ldw	x,(OFST-1,sp)
3316  0023 5b04          	addw	sp,#4
3317  0025 81            	ret
3369                     ; 1015 uint16_t TIM2_GetCapture3(void)
3369                     ; 1016 {
3370                     .text:	section	.text,new
3371  0000               _TIM2_GetCapture3:
3373  0000 5204          	subw	sp,#4
3374       00000004      OFST:	set	4
3377                     ; 1018   uint16_t tmpccr3 = 0;
3379                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
3383                     ; 1021   tmpccr3h = TIM2->CCR3H;
3385  0002 c65315        	ld	a,21269
3386  0005 6b02          	ld	(OFST-2,sp),a
3388                     ; 1022   tmpccr3l = TIM2->CCR3L;
3390  0007 c65316        	ld	a,21270
3391  000a 6b01          	ld	(OFST-3,sp),a
3393                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
3395  000c 7b01          	ld	a,(OFST-3,sp)
3396  000e 5f            	clrw	x
3397  000f 97            	ld	xl,a
3398  0010 1f03          	ldw	(OFST-1,sp),x
3400                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
3402  0012 7b02          	ld	a,(OFST-2,sp)
3403  0014 5f            	clrw	x
3404  0015 97            	ld	xl,a
3405  0016 4f            	clr	a
3406  0017 02            	rlwa	x,a
3407  0018 01            	rrwa	x,a
3408  0019 1a04          	or	a,(OFST+0,sp)
3409  001b 01            	rrwa	x,a
3410  001c 1a03          	or	a,(OFST-1,sp)
3411  001e 01            	rrwa	x,a
3412  001f 1f03          	ldw	(OFST-1,sp),x
3414                     ; 1027   return (uint16_t)tmpccr3;
3416  0021 1e03          	ldw	x,(OFST-1,sp)
3419  0023 5b04          	addw	sp,#4
3420  0025 81            	ret
3454                     ; 1035 uint16_t TIM2_GetCounter(void)
3454                     ; 1036 {
3455                     .text:	section	.text,new
3456  0000               _TIM2_GetCounter:
3458  0000 89            	pushw	x
3459       00000002      OFST:	set	2
3462                     ; 1037   uint16_t tmpcntr = 0;
3464                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3466  0001 c6530c        	ld	a,21260
3467  0004 5f            	clrw	x
3468  0005 97            	ld	xl,a
3469  0006 4f            	clr	a
3470  0007 02            	rlwa	x,a
3471  0008 1f01          	ldw	(OFST-1,sp),x
3473                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3475  000a c6530d        	ld	a,21261
3476  000d 5f            	clrw	x
3477  000e 97            	ld	xl,a
3478  000f 01            	rrwa	x,a
3479  0010 1a02          	or	a,(OFST+0,sp)
3480  0012 01            	rrwa	x,a
3481  0013 1a01          	or	a,(OFST-1,sp)
3482  0015 01            	rrwa	x,a
3485  0016 5b02          	addw	sp,#2
3486  0018 81            	ret
3510                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3510                     ; 1050 {
3511                     .text:	section	.text,new
3512  0000               _TIM2_GetPrescaler:
3516                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3518  0000 c6530e        	ld	a,21262
3521  0003 81            	ret
3660                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3660                     ; 1069 {
3661                     .text:	section	.text,new
3662  0000               _TIM2_GetFlagStatus:
3664  0000 89            	pushw	x
3665  0001 89            	pushw	x
3666       00000002      OFST:	set	2
3669                     ; 1070   FlagStatus bitstatus = RESET;
3671                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3675                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3677                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3679  0002 9f            	ld	a,xl
3680  0003 c45304        	and	a,21252
3681  0006 6b01          	ld	(OFST-1,sp),a
3683                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3685  0008 7b03          	ld	a,(OFST+1,sp)
3686  000a 6b02          	ld	(OFST+0,sp),a
3688                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3690  000c c65305        	ld	a,21253
3691  000f 1402          	and	a,(OFST+0,sp)
3692  0011 1a01          	or	a,(OFST-1,sp)
3693  0013 2706          	jreq	L5371
3694                     ; 1081     bitstatus = SET;
3696  0015 a601          	ld	a,#1
3697  0017 6b02          	ld	(OFST+0,sp),a
3700  0019 2002          	jra	L7371
3701  001b               L5371:
3702                     ; 1085     bitstatus = RESET;
3704  001b 0f02          	clr	(OFST+0,sp)
3706  001d               L7371:
3707                     ; 1087   return (FlagStatus)bitstatus;
3709  001d 7b02          	ld	a,(OFST+0,sp)
3712  001f 5b04          	addw	sp,#4
3713  0021 81            	ret
3748                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3748                     ; 1104 {
3749                     .text:	section	.text,new
3750  0000               _TIM2_ClearFlag:
3754                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3756                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3758  0000 9f            	ld	a,xl
3759  0001 43            	cpl	a
3760  0002 c75304        	ld	21252,a
3761                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3763  0005 35ff5305      	mov	21253,#255
3764                     ; 1111 }
3767  0009 81            	ret
3831                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3831                     ; 1124 {
3832                     .text:	section	.text,new
3833  0000               _TIM2_GetITStatus:
3835  0000 88            	push	a
3836  0001 89            	pushw	x
3837       00000002      OFST:	set	2
3840                     ; 1125   ITStatus bitstatus = RESET;
3842                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3846                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3848                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3850  0002 c45304        	and	a,21252
3851  0005 6b01          	ld	(OFST-1,sp),a
3853                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3855  0007 c65303        	ld	a,21251
3856  000a 1403          	and	a,(OFST+1,sp)
3857  000c 6b02          	ld	(OFST+0,sp),a
3859                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3861  000e 0d01          	tnz	(OFST-1,sp)
3862  0010 270a          	jreq	L1102
3864  0012 0d02          	tnz	(OFST+0,sp)
3865  0014 2706          	jreq	L1102
3866                     ; 1137     bitstatus = SET;
3868  0016 a601          	ld	a,#1
3869  0018 6b02          	ld	(OFST+0,sp),a
3872  001a 2002          	jra	L3102
3873  001c               L1102:
3874                     ; 1141     bitstatus = RESET;
3876  001c 0f02          	clr	(OFST+0,sp)
3878  001e               L3102:
3879                     ; 1143   return (ITStatus)(bitstatus);
3881  001e 7b02          	ld	a,(OFST+0,sp)
3884  0020 5b03          	addw	sp,#3
3885  0022 81            	ret
3921                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3921                     ; 1157 {
3922                     .text:	section	.text,new
3923  0000               _TIM2_ClearITPendingBit:
3927                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
3929                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
3931  0000 43            	cpl	a
3932  0001 c75304        	ld	21252,a
3933                     ; 1163 }
3936  0004 81            	ret
3988                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
3988                     ; 1182                        uint8_t TIM2_ICSelection,
3988                     ; 1183                        uint8_t TIM2_ICFilter)
3988                     ; 1184 {
3989                     .text:	section	.text,new
3990  0000               L3_TI1_Config:
3992  0000 89            	pushw	x
3993  0001 88            	push	a
3994       00000001      OFST:	set	1
3997                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3999  0002 7211530a      	bres	21258,#0
4000                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
4000                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4002  0006 7b06          	ld	a,(OFST+5,sp)
4003  0008 97            	ld	xl,a
4004  0009 a610          	ld	a,#16
4005  000b 42            	mul	x,a
4006  000c 9f            	ld	a,xl
4007  000d 1a03          	or	a,(OFST+2,sp)
4008  000f 6b01          	ld	(OFST+0,sp),a
4010  0011 c65307        	ld	a,21255
4011  0014 a40c          	and	a,#12
4012  0016 1a01          	or	a,(OFST+0,sp)
4013  0018 c75307        	ld	21255,a
4014                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4016  001b 0d02          	tnz	(OFST+1,sp)
4017  001d 2706          	jreq	L1602
4018                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
4020  001f 7212530a      	bset	21258,#1
4022  0023 2004          	jra	L3602
4023  0025               L1602:
4024                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
4026  0025 7213530a      	bres	21258,#1
4027  0029               L3602:
4028                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
4030  0029 7210530a      	bset	21258,#0
4031                     ; 1203 }
4034  002d 5b03          	addw	sp,#3
4035  002f 81            	ret
4087                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
4087                     ; 1222                        uint8_t TIM2_ICSelection,
4087                     ; 1223                        uint8_t TIM2_ICFilter)
4087                     ; 1224 {
4088                     .text:	section	.text,new
4089  0000               L5_TI2_Config:
4091  0000 89            	pushw	x
4092  0001 88            	push	a
4093       00000001      OFST:	set	1
4096                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4098  0002 7219530a      	bres	21258,#4
4099                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4099                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4101  0006 7b06          	ld	a,(OFST+5,sp)
4102  0008 97            	ld	xl,a
4103  0009 a610          	ld	a,#16
4104  000b 42            	mul	x,a
4105  000c 9f            	ld	a,xl
4106  000d 1a03          	or	a,(OFST+2,sp)
4107  000f 6b01          	ld	(OFST+0,sp),a
4109  0011 c65308        	ld	a,21256
4110  0014 a40c          	and	a,#12
4111  0016 1a01          	or	a,(OFST+0,sp)
4112  0018 c75308        	ld	21256,a
4113                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4115  001b 0d02          	tnz	(OFST+1,sp)
4116  001d 2706          	jreq	L3112
4117                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
4119  001f 721a530a      	bset	21258,#5
4121  0023 2004          	jra	L5112
4122  0025               L3112:
4123                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4125  0025 721b530a      	bres	21258,#5
4126  0029               L5112:
4127                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
4129  0029 7218530a      	bset	21258,#4
4130                     ; 1245 }
4133  002d 5b03          	addw	sp,#3
4134  002f 81            	ret
4186                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4186                     ; 1262                        uint8_t TIM2_ICFilter)
4186                     ; 1263 {
4187                     .text:	section	.text,new
4188  0000               L7_TI3_Config:
4190  0000 89            	pushw	x
4191  0001 88            	push	a
4192       00000001      OFST:	set	1
4195                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4197  0002 7211530b      	bres	21259,#0
4198                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4198                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4200  0006 7b06          	ld	a,(OFST+5,sp)
4201  0008 97            	ld	xl,a
4202  0009 a610          	ld	a,#16
4203  000b 42            	mul	x,a
4204  000c 9f            	ld	a,xl
4205  000d 1a03          	or	a,(OFST+2,sp)
4206  000f 6b01          	ld	(OFST+0,sp),a
4208  0011 c65309        	ld	a,21257
4209  0014 a40c          	and	a,#12
4210  0016 1a01          	or	a,(OFST+0,sp)
4211  0018 c75309        	ld	21257,a
4212                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4214  001b 0d02          	tnz	(OFST+1,sp)
4215  001d 2706          	jreq	L5412
4216                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
4218  001f 7212530b      	bset	21259,#1
4220  0023 2004          	jra	L7412
4221  0025               L5412:
4222                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4224  0025 7213530b      	bres	21259,#1
4225  0029               L7412:
4226                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
4228  0029 7210530b      	bset	21259,#0
4229                     ; 1283 }
4232  002d 5b03          	addw	sp,#3
4233  002f 81            	ret
4246                     	xdef	_TIM2_ClearITPendingBit
4247                     	xdef	_TIM2_GetITStatus
4248                     	xdef	_TIM2_ClearFlag
4249                     	xdef	_TIM2_GetFlagStatus
4250                     	xdef	_TIM2_GetPrescaler
4251                     	xdef	_TIM2_GetCounter
4252                     	xdef	_TIM2_GetCapture3
4253                     	xdef	_TIM2_GetCapture2
4254                     	xdef	_TIM2_GetCapture1
4255                     	xdef	_TIM2_SetIC3Prescaler
4256                     	xdef	_TIM2_SetIC2Prescaler
4257                     	xdef	_TIM2_SetIC1Prescaler
4258                     	xdef	_TIM2_SetCompare3
4259                     	xdef	_TIM2_SetCompare2
4260                     	xdef	_TIM2_SetCompare1
4261                     	xdef	_TIM2_SetAutoreload
4262                     	xdef	_TIM2_SetCounter
4263                     	xdef	_TIM2_SelectOCxM
4264                     	xdef	_TIM2_CCxCmd
4265                     	xdef	_TIM2_OC3PolarityConfig
4266                     	xdef	_TIM2_OC2PolarityConfig
4267                     	xdef	_TIM2_OC1PolarityConfig
4268                     	xdef	_TIM2_GenerateEvent
4269                     	xdef	_TIM2_OC3PreloadConfig
4270                     	xdef	_TIM2_OC2PreloadConfig
4271                     	xdef	_TIM2_OC1PreloadConfig
4272                     	xdef	_TIM2_ARRPreloadConfig
4273                     	xdef	_TIM2_ForcedOC3Config
4274                     	xdef	_TIM2_ForcedOC2Config
4275                     	xdef	_TIM2_ForcedOC1Config
4276                     	xdef	_TIM2_PrescalerConfig
4277                     	xdef	_TIM2_SelectOnePulseMode
4278                     	xdef	_TIM2_UpdateRequestConfig
4279                     	xdef	_TIM2_UpdateDisableConfig
4280                     	xdef	_TIM2_ITConfig
4281                     	xdef	_TIM2_Cmd
4282                     	xdef	_TIM2_PWMIConfig
4283                     	xdef	_TIM2_ICInit
4284                     	xdef	_TIM2_OC3Init
4285                     	xdef	_TIM2_OC2Init
4286                     	xdef	_TIM2_OC1Init
4287                     	xdef	_TIM2_TimeBaseInit
4288                     	xdef	_TIM2_DeInit
4307                     	end
