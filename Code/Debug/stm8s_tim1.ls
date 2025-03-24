   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  44                     ; 58 void TIM1_DeInit(void)
  44                     ; 59 {
  46                     .text:	section	.text,new
  47  0000               _TIM1_DeInit:
  51                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  53  0000 725f5250      	clr	21072
  54                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  56  0004 725f5251      	clr	21073
  57                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  59  0008 725f5252      	clr	21074
  60                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  62  000c 725f5253      	clr	21075
  63                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
  65  0010 725f5254      	clr	21076
  66                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  68  0014 725f5256      	clr	21078
  69                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  71  0018 725f525c      	clr	21084
  72                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  74  001c 725f525d      	clr	21085
  75                     ; 70   TIM1->CCMR1 = 0x01;
  77  0020 35015258      	mov	21080,#1
  78                     ; 71   TIM1->CCMR2 = 0x01;
  80  0024 35015259      	mov	21081,#1
  81                     ; 72   TIM1->CCMR3 = 0x01;
  83  0028 3501525a      	mov	21082,#1
  84                     ; 73   TIM1->CCMR4 = 0x01;
  86  002c 3501525b      	mov	21083,#1
  87                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  89  0030 725f525c      	clr	21084
  90                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  92  0034 725f525d      	clr	21085
  93                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  95  0038 725f5258      	clr	21080
  96                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  98  003c 725f5259      	clr	21081
  99                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 101  0040 725f525a      	clr	21082
 102                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 104  0044 725f525b      	clr	21083
 105                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 107  0048 725f525e      	clr	21086
 108                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 110  004c 725f525f      	clr	21087
 111                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 113  0050 725f5260      	clr	21088
 114                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 116  0054 725f5261      	clr	21089
 117                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 119  0058 35ff5262      	mov	21090,#255
 120                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 122  005c 35ff5263      	mov	21091,#255
 123                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 125  0060 725f5265      	clr	21093
 126                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 128  0064 725f5266      	clr	21094
 129                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 131  0068 725f5267      	clr	21095
 132                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 134  006c 725f5268      	clr	21096
 135                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 137  0070 725f5269      	clr	21097
 138                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 140  0074 725f526a      	clr	21098
 141                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 143  0078 725f526b      	clr	21099
 144                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 146  007c 725f526c      	clr	21100
 147                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 149  0080 725f526f      	clr	21103
 150                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 152  0084 35015257      	mov	21079,#1
 153                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 155  0088 725f526e      	clr	21102
 156                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 158  008c 725f526d      	clr	21101
 159                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 161  0090 725f5264      	clr	21092
 162                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 164  0094 725f5255      	clr	21077
 165                     ; 101 }
 168  0098 81            	ret
 277                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 277                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 277                     ; 113                        uint16_t TIM1_Period,
 277                     ; 114                        uint8_t TIM1_RepetitionCounter)
 277                     ; 115 {
 278                     .text:	section	.text,new
 279  0000               _TIM1_TimeBaseInit:
 281  0000 89            	pushw	x
 282       00000000      OFST:	set	0
 285                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 287                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 289  0001 7b06          	ld	a,(OFST+6,sp)
 290  0003 c75262        	ld	21090,a
 291                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 293  0006 7b07          	ld	a,(OFST+7,sp)
 294  0008 c75263        	ld	21091,a
 295                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 297  000b 9e            	ld	a,xh
 298  000c c75260        	ld	21088,a
 299                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 301  000f 9f            	ld	a,xl
 302  0010 c75261        	ld	21089,a
 303                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 303                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 305  0013 c65250        	ld	a,21072
 306  0016 a48f          	and	a,#143
 307  0018 1a05          	or	a,(OFST+5,sp)
 308  001a c75250        	ld	21072,a
 309                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 311  001d 7b08          	ld	a,(OFST+8,sp)
 312  001f c75264        	ld	21092,a
 313                     ; 133 }
 316  0022 85            	popw	x
 317  0023 81            	ret
 602                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 602                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 602                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 602                     ; 157                   uint16_t TIM1_Pulse,
 602                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 602                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 602                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 602                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 602                     ; 162 {
 603                     .text:	section	.text,new
 604  0000               _TIM1_OC1Init:
 606  0000 89            	pushw	x
 607  0001 5203          	subw	sp,#3
 608       00000003      OFST:	set	3
 611                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 613                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 615                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 617                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 619                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 621                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 623                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 625                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 625                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 627  0003 c6525c        	ld	a,21084
 628  0006 a4f0          	and	a,#240
 629  0008 c7525c        	ld	21084,a
 630                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 630                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 630                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 630                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 632  000b 7b0c          	ld	a,(OFST+9,sp)
 633  000d a408          	and	a,#8
 634  000f 6b03          	ld	(OFST+0,sp),a
 636  0011 7b0b          	ld	a,(OFST+8,sp)
 637  0013 a402          	and	a,#2
 638  0015 1a03          	or	a,(OFST+0,sp)
 639  0017 6b02          	ld	(OFST-1,sp),a
 641  0019 7b08          	ld	a,(OFST+5,sp)
 642  001b a404          	and	a,#4
 643  001d 6b01          	ld	(OFST-2,sp),a
 645  001f 9f            	ld	a,xl
 646  0020 a401          	and	a,#1
 647  0022 1a01          	or	a,(OFST-2,sp)
 648  0024 1a02          	or	a,(OFST-1,sp)
 649  0026 ca525c        	or	a,21084
 650  0029 c7525c        	ld	21084,a
 651                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 651                     ; 185                           (uint8_t)TIM1_OCMode);
 653  002c c65258        	ld	a,21080
 654  002f a48f          	and	a,#143
 655  0031 1a04          	or	a,(OFST+1,sp)
 656  0033 c75258        	ld	21080,a
 657                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 659  0036 c6526f        	ld	a,21103
 660  0039 a4fc          	and	a,#252
 661  003b c7526f        	ld	21103,a
 662                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 662                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 664  003e 7b0e          	ld	a,(OFST+11,sp)
 665  0040 a402          	and	a,#2
 666  0042 6b03          	ld	(OFST+0,sp),a
 668  0044 7b0d          	ld	a,(OFST+10,sp)
 669  0046 a401          	and	a,#1
 670  0048 1a03          	or	a,(OFST+0,sp)
 671  004a ca526f        	or	a,21103
 672  004d c7526f        	ld	21103,a
 673                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 675  0050 7b09          	ld	a,(OFST+6,sp)
 676  0052 c75265        	ld	21093,a
 677                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 679  0055 7b0a          	ld	a,(OFST+7,sp)
 680  0057 c75266        	ld	21094,a
 681                     ; 196 }
 684  005a 5b05          	addw	sp,#5
 685  005c 81            	ret
 789                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 789                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 789                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 789                     ; 220                   uint16_t TIM1_Pulse,
 789                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 789                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 789                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 789                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 789                     ; 225 {
 790                     .text:	section	.text,new
 791  0000               _TIM1_OC2Init:
 793  0000 89            	pushw	x
 794  0001 5203          	subw	sp,#3
 795       00000003      OFST:	set	3
 798                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 800                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 802                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 804                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 806                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 808                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 810                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 812                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 812                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 814  0003 c6525c        	ld	a,21084
 815  0006 a40f          	and	a,#15
 816  0008 c7525c        	ld	21084,a
 817                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 817                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 817                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 817                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 819  000b 7b0c          	ld	a,(OFST+9,sp)
 820  000d a480          	and	a,#128
 821  000f 6b03          	ld	(OFST+0,sp),a
 823  0011 7b0b          	ld	a,(OFST+8,sp)
 824  0013 a420          	and	a,#32
 825  0015 1a03          	or	a,(OFST+0,sp)
 826  0017 6b02          	ld	(OFST-1,sp),a
 828  0019 7b08          	ld	a,(OFST+5,sp)
 829  001b a440          	and	a,#64
 830  001d 6b01          	ld	(OFST-2,sp),a
 832  001f 9f            	ld	a,xl
 833  0020 a410          	and	a,#16
 834  0022 1a01          	or	a,(OFST-2,sp)
 835  0024 1a02          	or	a,(OFST-1,sp)
 836  0026 ca525c        	or	a,21084
 837  0029 c7525c        	ld	21084,a
 838                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 838                     ; 249                           (uint8_t)TIM1_OCMode);
 840  002c c65259        	ld	a,21081
 841  002f a48f          	and	a,#143
 842  0031 1a04          	or	a,(OFST+1,sp)
 843  0033 c75259        	ld	21081,a
 844                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 846  0036 c6526f        	ld	a,21103
 847  0039 a4f3          	and	a,#243
 848  003b c7526f        	ld	21103,a
 849                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 849                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 851  003e 7b0e          	ld	a,(OFST+11,sp)
 852  0040 a408          	and	a,#8
 853  0042 6b03          	ld	(OFST+0,sp),a
 855  0044 7b0d          	ld	a,(OFST+10,sp)
 856  0046 a404          	and	a,#4
 857  0048 1a03          	or	a,(OFST+0,sp)
 858  004a ca526f        	or	a,21103
 859  004d c7526f        	ld	21103,a
 860                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 862  0050 7b09          	ld	a,(OFST+6,sp)
 863  0052 c75267        	ld	21095,a
 864                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 866  0055 7b0a          	ld	a,(OFST+7,sp)
 867  0057 c75268        	ld	21096,a
 868                     ; 260 }
 871  005a 5b05          	addw	sp,#5
 872  005c 81            	ret
 976                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 976                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
 976                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 976                     ; 284                   uint16_t TIM1_Pulse,
 976                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 976                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 976                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 976                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 976                     ; 289 {
 977                     .text:	section	.text,new
 978  0000               _TIM1_OC3Init:
 980  0000 89            	pushw	x
 981  0001 5203          	subw	sp,#3
 982       00000003      OFST:	set	3
 985                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 987                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 989                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 991                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 993                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 995                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 997                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 999                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
 999                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1001  0003 c6525d        	ld	a,21085
1002  0006 a4f0          	and	a,#240
1003  0008 c7525d        	ld	21085,a
1004                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
1004                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
1004                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
1004                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1006  000b 7b0c          	ld	a,(OFST+9,sp)
1007  000d a408          	and	a,#8
1008  000f 6b03          	ld	(OFST+0,sp),a
1010  0011 7b0b          	ld	a,(OFST+8,sp)
1011  0013 a402          	and	a,#2
1012  0015 1a03          	or	a,(OFST+0,sp)
1013  0017 6b02          	ld	(OFST-1,sp),a
1015  0019 7b08          	ld	a,(OFST+5,sp)
1016  001b a404          	and	a,#4
1017  001d 6b01          	ld	(OFST-2,sp),a
1019  001f 9f            	ld	a,xl
1020  0020 a401          	and	a,#1
1021  0022 1a01          	or	a,(OFST-2,sp)
1022  0024 1a02          	or	a,(OFST-1,sp)
1023  0026 ca525d        	or	a,21085
1024  0029 c7525d        	ld	21085,a
1025                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1025                     ; 312                           (uint8_t)TIM1_OCMode);
1027  002c c6525a        	ld	a,21082
1028  002f a48f          	and	a,#143
1029  0031 1a04          	or	a,(OFST+1,sp)
1030  0033 c7525a        	ld	21082,a
1031                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1033  0036 c6526f        	ld	a,21103
1034  0039 a4cf          	and	a,#207
1035  003b c7526f        	ld	21103,a
1036                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1036                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1038  003e 7b0e          	ld	a,(OFST+11,sp)
1039  0040 a420          	and	a,#32
1040  0042 6b03          	ld	(OFST+0,sp),a
1042  0044 7b0d          	ld	a,(OFST+10,sp)
1043  0046 a410          	and	a,#16
1044  0048 1a03          	or	a,(OFST+0,sp)
1045  004a ca526f        	or	a,21103
1046  004d c7526f        	ld	21103,a
1047                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1049  0050 7b09          	ld	a,(OFST+6,sp)
1050  0052 c75269        	ld	21097,a
1051                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1053  0055 7b0a          	ld	a,(OFST+7,sp)
1054  0057 c7526a        	ld	21098,a
1055                     ; 323 }
1058  005a 5b05          	addw	sp,#5
1059  005c 81            	ret
1133                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1133                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1133                     ; 340                   uint16_t TIM1_Pulse,
1133                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1133                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1133                     ; 343 {
1134                     .text:	section	.text,new
1135  0000               _TIM1_OC4Init:
1137  0000 89            	pushw	x
1138  0001 88            	push	a
1139       00000001      OFST:	set	1
1142                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1144                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1146                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1148                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1150                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1152  0002 c6525d        	ld	a,21085
1153  0005 a4cf          	and	a,#207
1154  0007 c7525d        	ld	21085,a
1155                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1155                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1157  000a 7b08          	ld	a,(OFST+7,sp)
1158  000c a420          	and	a,#32
1159  000e 6b01          	ld	(OFST+0,sp),a
1161  0010 9f            	ld	a,xl
1162  0011 a410          	and	a,#16
1163  0013 1a01          	or	a,(OFST+0,sp)
1164  0015 ca525d        	or	a,21085
1165  0018 c7525d        	ld	21085,a
1166                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1166                     ; 358                           TIM1_OCMode);
1168  001b c6525b        	ld	a,21083
1169  001e a48f          	and	a,#143
1170  0020 1a02          	or	a,(OFST+1,sp)
1171  0022 c7525b        	ld	21083,a
1172                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1174  0025 0d09          	tnz	(OFST+8,sp)
1175  0027 270a          	jreq	L534
1176                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1178  0029 c6526f        	ld	a,21103
1179  002c aadf          	or	a,#223
1180  002e c7526f        	ld	21103,a
1182  0031 2004          	jra	L734
1183  0033               L534:
1184                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1186  0033 721d526f      	bres	21103,#6
1187  0037               L734:
1188                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1190  0037 7b06          	ld	a,(OFST+5,sp)
1191  0039 c7526b        	ld	21099,a
1192                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1194  003c 7b07          	ld	a,(OFST+6,sp)
1195  003e c7526c        	ld	21100,a
1196                     ; 373 }
1199  0041 5b03          	addw	sp,#3
1200  0043 81            	ret
1405                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1405                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1405                     ; 390                      uint8_t TIM1_DeadTime,
1405                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1405                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1405                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1405                     ; 394 {
1406                     .text:	section	.text,new
1407  0000               _TIM1_BDTRConfig:
1409  0000 89            	pushw	x
1410  0001 88            	push	a
1411       00000001      OFST:	set	1
1414                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1416                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1418                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1420                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1422                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1424                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1426  0002 7b06          	ld	a,(OFST+5,sp)
1427  0004 c7526e        	ld	21102,a
1428                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1428                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1428                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
1430  0007 7b07          	ld	a,(OFST+6,sp)
1431  0009 1a08          	or	a,(OFST+7,sp)
1432  000b 1a09          	or	a,(OFST+8,sp)
1433  000d 6b01          	ld	(OFST+0,sp),a
1435  000f 9f            	ld	a,xl
1436  0010 1a02          	or	a,(OFST+1,sp)
1437  0012 1a01          	or	a,(OFST+0,sp)
1438  0014 c7526d        	ld	21101,a
1439                     ; 409 }
1442  0017 5b03          	addw	sp,#3
1443  0019 81            	ret
1645                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1645                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1645                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1645                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1645                     ; 427                  uint8_t TIM1_ICFilter)
1645                     ; 428 {
1646                     .text:	section	.text,new
1647  0000               _TIM1_ICInit:
1649  0000 89            	pushw	x
1650       00000000      OFST:	set	0
1653                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1655                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1657                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1659                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1661                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1663                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
1665  0001 9e            	ld	a,xh
1666  0002 4d            	tnz	a
1667  0003 2614          	jrne	L766
1668                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
1668                     ; 440                (uint8_t)TIM1_ICSelection,
1668                     ; 441                (uint8_t)TIM1_ICFilter);
1670  0005 7b07          	ld	a,(OFST+7,sp)
1671  0007 88            	push	a
1672  0008 7b06          	ld	a,(OFST+6,sp)
1673  000a 97            	ld	xl,a
1674  000b 7b03          	ld	a,(OFST+3,sp)
1675  000d 95            	ld	xh,a
1676  000e cd0000        	call	L3_TI1_Config
1678  0011 84            	pop	a
1679                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1681  0012 7b06          	ld	a,(OFST+6,sp)
1682  0014 cd0000        	call	_TIM1_SetIC1Prescaler
1685  0017 2046          	jra	L176
1686  0019               L766:
1687                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
1689  0019 7b01          	ld	a,(OFST+1,sp)
1690  001b a101          	cp	a,#1
1691  001d 2614          	jrne	L376
1692                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
1692                     ; 449                (uint8_t)TIM1_ICSelection,
1692                     ; 450                (uint8_t)TIM1_ICFilter);
1694  001f 7b07          	ld	a,(OFST+7,sp)
1695  0021 88            	push	a
1696  0022 7b06          	ld	a,(OFST+6,sp)
1697  0024 97            	ld	xl,a
1698  0025 7b03          	ld	a,(OFST+3,sp)
1699  0027 95            	ld	xh,a
1700  0028 cd0000        	call	L5_TI2_Config
1702  002b 84            	pop	a
1703                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1705  002c 7b06          	ld	a,(OFST+6,sp)
1706  002e cd0000        	call	_TIM1_SetIC2Prescaler
1709  0031 202c          	jra	L176
1710  0033               L376:
1711                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
1713  0033 7b01          	ld	a,(OFST+1,sp)
1714  0035 a102          	cp	a,#2
1715  0037 2614          	jrne	L776
1716                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
1716                     ; 458                (uint8_t)TIM1_ICSelection,
1716                     ; 459                (uint8_t)TIM1_ICFilter);
1718  0039 7b07          	ld	a,(OFST+7,sp)
1719  003b 88            	push	a
1720  003c 7b06          	ld	a,(OFST+6,sp)
1721  003e 97            	ld	xl,a
1722  003f 7b03          	ld	a,(OFST+3,sp)
1723  0041 95            	ld	xh,a
1724  0042 cd0000        	call	L7_TI3_Config
1726  0045 84            	pop	a
1727                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1729  0046 7b06          	ld	a,(OFST+6,sp)
1730  0048 cd0000        	call	_TIM1_SetIC3Prescaler
1733  004b 2012          	jra	L176
1734  004d               L776:
1735                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
1735                     ; 467                (uint8_t)TIM1_ICSelection,
1735                     ; 468                (uint8_t)TIM1_ICFilter);
1737  004d 7b07          	ld	a,(OFST+7,sp)
1738  004f 88            	push	a
1739  0050 7b06          	ld	a,(OFST+6,sp)
1740  0052 97            	ld	xl,a
1741  0053 7b03          	ld	a,(OFST+3,sp)
1742  0055 95            	ld	xh,a
1743  0056 cd0000        	call	L11_TI4_Config
1745  0059 84            	pop	a
1746                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1748  005a 7b06          	ld	a,(OFST+6,sp)
1749  005c cd0000        	call	_TIM1_SetIC4Prescaler
1751  005f               L176:
1752                     ; 472 }
1755  005f 85            	popw	x
1756  0060 81            	ret
1852                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1852                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1852                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1852                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1852                     ; 492                      uint8_t TIM1_ICFilter)
1852                     ; 493 {
1853                     .text:	section	.text,new
1854  0000               _TIM1_PWMIConfig:
1856  0000 89            	pushw	x
1857  0001 89            	pushw	x
1858       00000002      OFST:	set	2
1861                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1863                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1865                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1867                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1869                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1871                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1873                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1875  0002 9f            	ld	a,xl
1876  0003 a101          	cp	a,#1
1877  0005 2706          	jreq	L157
1878                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
1880  0007 a601          	ld	a,#1
1881  0009 6b01          	ld	(OFST-1,sp),a
1884  000b 2002          	jra	L357
1885  000d               L157:
1886                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
1888  000d 0f01          	clr	(OFST-1,sp)
1890  000f               L357:
1891                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1893  000f 7b07          	ld	a,(OFST+5,sp)
1894  0011 a101          	cp	a,#1
1895  0013 2606          	jrne	L557
1896                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
1898  0015 a602          	ld	a,#2
1899  0017 6b02          	ld	(OFST+0,sp),a
1902  0019 2004          	jra	L757
1903  001b               L557:
1904                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
1906  001b a601          	ld	a,#1
1907  001d 6b02          	ld	(OFST+0,sp),a
1909  001f               L757:
1910                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
1912  001f 0d03          	tnz	(OFST+1,sp)
1913  0021 2626          	jrne	L167
1914                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1914                     ; 527                (uint8_t)TIM1_ICFilter);
1916  0023 7b09          	ld	a,(OFST+7,sp)
1917  0025 88            	push	a
1918  0026 7b08          	ld	a,(OFST+6,sp)
1919  0028 97            	ld	xl,a
1920  0029 7b05          	ld	a,(OFST+3,sp)
1921  002b 95            	ld	xh,a
1922  002c cd0000        	call	L3_TI1_Config
1924  002f 84            	pop	a
1925                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1927  0030 7b08          	ld	a,(OFST+6,sp)
1928  0032 cd0000        	call	_TIM1_SetIC1Prescaler
1930                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1932  0035 7b09          	ld	a,(OFST+7,sp)
1933  0037 88            	push	a
1934  0038 7b03          	ld	a,(OFST+1,sp)
1935  003a 97            	ld	xl,a
1936  003b 7b02          	ld	a,(OFST+0,sp)
1937  003d 95            	ld	xh,a
1938  003e cd0000        	call	L5_TI2_Config
1940  0041 84            	pop	a
1941                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1943  0042 7b08          	ld	a,(OFST+6,sp)
1944  0044 cd0000        	call	_TIM1_SetIC2Prescaler
1947  0047 2024          	jra	L367
1948  0049               L167:
1949                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1949                     ; 542                (uint8_t)TIM1_ICFilter);
1951  0049 7b09          	ld	a,(OFST+7,sp)
1952  004b 88            	push	a
1953  004c 7b08          	ld	a,(OFST+6,sp)
1954  004e 97            	ld	xl,a
1955  004f 7b05          	ld	a,(OFST+3,sp)
1956  0051 95            	ld	xh,a
1957  0052 cd0000        	call	L5_TI2_Config
1959  0055 84            	pop	a
1960                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1962  0056 7b08          	ld	a,(OFST+6,sp)
1963  0058 cd0000        	call	_TIM1_SetIC2Prescaler
1965                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1967  005b 7b09          	ld	a,(OFST+7,sp)
1968  005d 88            	push	a
1969  005e 7b03          	ld	a,(OFST+1,sp)
1970  0060 97            	ld	xl,a
1971  0061 7b02          	ld	a,(OFST+0,sp)
1972  0063 95            	ld	xh,a
1973  0064 cd0000        	call	L3_TI1_Config
1975  0067 84            	pop	a
1976                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1978  0068 7b08          	ld	a,(OFST+6,sp)
1979  006a cd0000        	call	_TIM1_SetIC1Prescaler
1981  006d               L367:
1982                     ; 553 }
1985  006d 5b04          	addw	sp,#4
1986  006f 81            	ret
2041                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2041                     ; 562 {
2042                     .text:	section	.text,new
2043  0000               _TIM1_Cmd:
2047                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2049                     ; 567   if (NewState != DISABLE)
2051  0000 4d            	tnz	a
2052  0001 2706          	jreq	L3101
2053                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2055  0003 72105250      	bset	21072,#0
2057  0007 2004          	jra	L5101
2058  0009               L3101:
2059                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2061  0009 72115250      	bres	21072,#0
2062  000d               L5101:
2063                     ; 575 }
2066  000d 81            	ret
2102                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2102                     ; 584 {
2103                     .text:	section	.text,new
2104  0000               _TIM1_CtrlPWMOutputs:
2108                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2110                     ; 590   if (NewState != DISABLE)
2112  0000 4d            	tnz	a
2113  0001 2706          	jreq	L5301
2114                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2116  0003 721e526d      	bset	21101,#7
2118  0007 2004          	jra	L7301
2119  0009               L5301:
2120                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2122  0009 721f526d      	bres	21101,#7
2123  000d               L7301:
2124                     ; 598 }
2127  000d 81            	ret
2234                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2234                     ; 618 {
2235                     .text:	section	.text,new
2236  0000               _TIM1_ITConfig:
2238  0000 89            	pushw	x
2239       00000000      OFST:	set	0
2242                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
2244                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2246                     ; 623   if (NewState != DISABLE)
2248  0001 9f            	ld	a,xl
2249  0002 4d            	tnz	a
2250  0003 2709          	jreq	L7011
2251                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
2253  0005 9e            	ld	a,xh
2254  0006 ca5254        	or	a,21076
2255  0009 c75254        	ld	21076,a
2257  000c 2009          	jra	L1111
2258  000e               L7011:
2259                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2261  000e 7b01          	ld	a,(OFST+1,sp)
2262  0010 43            	cpl	a
2263  0011 c45254        	and	a,21076
2264  0014 c75254        	ld	21076,a
2265  0017               L1111:
2266                     ; 633 }
2269  0017 85            	popw	x
2270  0018 81            	ret
2294                     ; 640 void TIM1_InternalClockConfig(void)
2294                     ; 641 {
2295                     .text:	section	.text,new
2296  0000               _TIM1_InternalClockConfig:
2300                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2302  0000 c65252        	ld	a,21074
2303  0003 a4f8          	and	a,#248
2304  0005 c75252        	ld	21074,a
2305                     ; 644 }
2308  0008 81            	ret
2425                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2425                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2425                     ; 664                               uint8_t ExtTRGFilter)
2425                     ; 665 {
2426                     .text:	section	.text,new
2427  0000               _TIM1_ETRClockMode1Config:
2429  0000 89            	pushw	x
2430       00000000      OFST:	set	0
2433                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2435                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2437                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2439  0001 7b05          	ld	a,(OFST+5,sp)
2440  0003 88            	push	a
2441  0004 9f            	ld	a,xl
2442  0005 97            	ld	xl,a
2443  0006 7b02          	ld	a,(OFST+2,sp)
2444  0008 95            	ld	xh,a
2445  0009 cd0000        	call	_TIM1_ETRConfig
2447  000c 84            	pop	a
2448                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2448                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2450  000d c65252        	ld	a,21074
2451  0010 a488          	and	a,#136
2452  0012 aa77          	or	a,#119
2453  0014 c75252        	ld	21074,a
2454                     ; 676 }
2457  0017 85            	popw	x
2458  0018 81            	ret
2516                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2516                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2516                     ; 696                               uint8_t ExtTRGFilter)
2516                     ; 697 {
2517                     .text:	section	.text,new
2518  0000               _TIM1_ETRClockMode2Config:
2520  0000 89            	pushw	x
2521       00000000      OFST:	set	0
2524                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2526                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2528                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2530  0001 7b05          	ld	a,(OFST+5,sp)
2531  0003 88            	push	a
2532  0004 9f            	ld	a,xl
2533  0005 97            	ld	xl,a
2534  0006 7b02          	ld	a,(OFST+2,sp)
2535  0008 95            	ld	xh,a
2536  0009 cd0000        	call	_TIM1_ETRConfig
2538  000c 84            	pop	a
2539                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
2541  000d 721c5253      	bset	21075,#6
2542                     ; 707 }
2545  0011 85            	popw	x
2546  0012 81            	ret
2602                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2602                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2602                     ; 727                     uint8_t ExtTRGFilter)
2602                     ; 728 {
2603                     .text:	section	.text,new
2604  0000               _TIM1_ETRConfig:
2606  0000 89            	pushw	x
2607       00000000      OFST:	set	0
2610                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2612                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2612                     ; 733                          (uint8_t)ExtTRGFilter );
2614  0001 9f            	ld	a,xl
2615  0002 1a01          	or	a,(OFST+1,sp)
2616  0004 1a05          	or	a,(OFST+5,sp)
2617  0006 ca5253        	or	a,21075
2618  0009 c75253        	ld	21075,a
2619                     ; 734 }
2622  000c 85            	popw	x
2623  000d 81            	ret
2712                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2712                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2712                     ; 753                                  uint8_t ICFilter)
2712                     ; 754 {
2713                     .text:	section	.text,new
2714  0000               _TIM1_TIxExternalClockConfig:
2716  0000 89            	pushw	x
2717       00000000      OFST:	set	0
2720                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2722                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2724                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2726                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2728  0001 9e            	ld	a,xh
2729  0002 a160          	cp	a,#96
2730  0004 260e          	jrne	L1131
2731                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2733  0006 7b05          	ld	a,(OFST+5,sp)
2734  0008 88            	push	a
2735  0009 9f            	ld	a,xl
2736  000a ae0001        	ldw	x,#1
2737  000d 95            	ld	xh,a
2738  000e cd0000        	call	L5_TI2_Config
2740  0011 84            	pop	a
2742  0012 200d          	jra	L3131
2743  0014               L1131:
2744                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2746  0014 7b05          	ld	a,(OFST+5,sp)
2747  0016 88            	push	a
2748  0017 7b03          	ld	a,(OFST+3,sp)
2749  0019 ae0001        	ldw	x,#1
2750  001c 95            	ld	xh,a
2751  001d cd0000        	call	L3_TI1_Config
2753  0020 84            	pop	a
2754  0021               L3131:
2755                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2757  0021 7b01          	ld	a,(OFST+1,sp)
2758  0023 cd0000        	call	_TIM1_SelectInputTrigger
2760                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2762  0026 c65252        	ld	a,21074
2763  0029 aa07          	or	a,#7
2764  002b c75252        	ld	21074,a
2765                     ; 775 }
2768  002e 85            	popw	x
2769  002f 81            	ret
2854                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2854                     ; 788 {
2855                     .text:	section	.text,new
2856  0000               _TIM1_SelectInputTrigger:
2858  0000 88            	push	a
2859       00000000      OFST:	set	0
2862                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2864                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2866  0001 c65252        	ld	a,21074
2867  0004 a48f          	and	a,#143
2868  0006 1a01          	or	a,(OFST+1,sp)
2869  0008 c75252        	ld	21074,a
2870                     ; 794 }
2873  000b 84            	pop	a
2874  000c 81            	ret
2910                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2910                     ; 804 {
2911                     .text:	section	.text,new
2912  0000               _TIM1_UpdateDisableConfig:
2916                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2918                     ; 809   if (NewState != DISABLE)
2920  0000 4d            	tnz	a
2921  0001 2706          	jreq	L1731
2922                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
2924  0003 72125250      	bset	21072,#1
2926  0007 2004          	jra	L3731
2927  0009               L1731:
2928                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2930  0009 72135250      	bres	21072,#1
2931  000d               L3731:
2932                     ; 817 }
2935  000d 81            	ret
2993                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
2993                     ; 828 {
2994                     .text:	section	.text,new
2995  0000               _TIM1_UpdateRequestConfig:
2999                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
3001                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
3003  0000 4d            	tnz	a
3004  0001 2706          	jreq	L3241
3005                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
3007  0003 72145250      	bset	21072,#2
3009  0007 2004          	jra	L5241
3010  0009               L3241:
3011                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
3013  0009 72155250      	bres	21072,#2
3014  000d               L5241:
3015                     ; 841 }
3018  000d 81            	ret
3054                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
3054                     ; 850 {
3055                     .text:	section	.text,new
3056  0000               _TIM1_SelectHallSensor:
3060                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3062                     ; 855   if (NewState != DISABLE)
3064  0000 4d            	tnz	a
3065  0001 2706          	jreq	L5441
3066                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
3068  0003 721e5251      	bset	21073,#7
3070  0007 2004          	jra	L7441
3071  0009               L5441:
3072                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3074  0009 721f5251      	bres	21073,#7
3075  000d               L7441:
3076                     ; 863 }
3079  000d 81            	ret
3136                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3136                     ; 874 {
3137                     .text:	section	.text,new
3138  0000               _TIM1_SelectOnePulseMode:
3142                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3144                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3146  0000 4d            	tnz	a
3147  0001 2706          	jreq	L7741
3148                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
3150  0003 72165250      	bset	21072,#3
3152  0007 2004          	jra	L1051
3153  0009               L7741:
3154                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3156  0009 72175250      	bres	21072,#3
3157  000d               L1051:
3158                     ; 888 }
3161  000d 81            	ret
3259                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3259                     ; 904 {
3260                     .text:	section	.text,new
3261  0000               _TIM1_SelectOutputTrigger:
3263  0000 88            	push	a
3264       00000000      OFST:	set	0
3267                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3269                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3269                     ; 910                         (uint8_t) TIM1_TRGOSource);
3271  0001 c65251        	ld	a,21073
3272  0004 a48f          	and	a,#143
3273  0006 1a01          	or	a,(OFST+1,sp)
3274  0008 c75251        	ld	21073,a
3275                     ; 911 }
3278  000b 84            	pop	a
3279  000c 81            	ret
3353                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3353                     ; 924 {
3354                     .text:	section	.text,new
3355  0000               _TIM1_SelectSlaveMode:
3357  0000 88            	push	a
3358       00000000      OFST:	set	0
3361                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3363                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3363                     ; 930                          (uint8_t)TIM1_SlaveMode);
3365  0001 c65252        	ld	a,21074
3366  0004 a4f8          	and	a,#248
3367  0006 1a01          	or	a,(OFST+1,sp)
3368  0008 c75252        	ld	21074,a
3369                     ; 931 }
3372  000b 84            	pop	a
3373  000c 81            	ret
3409                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3409                     ; 940 {
3410                     .text:	section	.text,new
3411  0000               _TIM1_SelectMasterSlaveMode:
3415                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3417                     ; 945   if (NewState != DISABLE)
3419  0000 4d            	tnz	a
3420  0001 2706          	jreq	L3161
3421                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
3423  0003 721e5252      	bset	21074,#7
3425  0007 2004          	jra	L5161
3426  0009               L3161:
3427                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3429  0009 721f5252      	bres	21074,#7
3430  000d               L5161:
3431                     ; 953 }
3434  000d 81            	ret
3520                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3520                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3520                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3520                     ; 978 {
3521                     .text:	section	.text,new
3522  0000               _TIM1_EncoderInterfaceConfig:
3524  0000 89            	pushw	x
3525       00000000      OFST:	set	0
3528                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3530                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3532                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3534                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3536  0001 9f            	ld	a,xl
3537  0002 4d            	tnz	a
3538  0003 2706          	jreq	L7561
3539                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3541  0005 7212525c      	bset	21084,#1
3543  0009 2004          	jra	L1661
3544  000b               L7561:
3545                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3547  000b 7213525c      	bres	21084,#1
3548  000f               L1661:
3549                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3551  000f 0d05          	tnz	(OFST+5,sp)
3552  0011 2706          	jreq	L3661
3553                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3555  0013 721a525c      	bset	21084,#5
3557  0017 2004          	jra	L5661
3558  0019               L3661:
3559                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3561  0019 721b525c      	bres	21084,#5
3562  001d               L5661:
3563                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3563                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
3565  001d c65252        	ld	a,21074
3566  0020 a4f0          	and	a,#240
3567  0022 1a01          	or	a,(OFST+1,sp)
3568  0024 c75252        	ld	21074,a
3569                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3569                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
3571  0027 c65258        	ld	a,21080
3572  002a a4fc          	and	a,#252
3573  002c aa01          	or	a,#1
3574  002e c75258        	ld	21080,a
3575                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3575                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
3577  0031 c65259        	ld	a,21081
3578  0034 a4fc          	and	a,#252
3579  0036 aa01          	or	a,#1
3580  0038 c75259        	ld	21081,a
3581                     ; 1011 }
3584  003b 85            	popw	x
3585  003c 81            	ret
3652                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
3652                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3652                     ; 1025 {
3653                     .text:	section	.text,new
3654  0000               _TIM1_PrescalerConfig:
3656  0000 89            	pushw	x
3657       00000000      OFST:	set	0
3660                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3662                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3664  0001 9e            	ld	a,xh
3665  0002 c75260        	ld	21088,a
3666                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
3668  0005 9f            	ld	a,xl
3669  0006 c75261        	ld	21089,a
3670                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3672  0009 7b05          	ld	a,(OFST+5,sp)
3673  000b c75257        	ld	21079,a
3674                     ; 1035 }
3677  000e 85            	popw	x
3678  000f 81            	ret
3714                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3714                     ; 1049 {
3715                     .text:	section	.text,new
3716  0000               _TIM1_CounterModeConfig:
3718  0000 88            	push	a
3719       00000000      OFST:	set	0
3722                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3724                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3724                     ; 1056                         | (uint8_t)TIM1_CounterMode);
3726  0001 c65250        	ld	a,21072
3727  0004 a48f          	and	a,#143
3728  0006 1a01          	or	a,(OFST+1,sp)
3729  0008 c75250        	ld	21072,a
3730                     ; 1057 }
3733  000b 84            	pop	a
3734  000c 81            	ret
3792                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3792                     ; 1068 {
3793                     .text:	section	.text,new
3794  0000               _TIM1_ForcedOC1Config:
3796  0000 88            	push	a
3797       00000000      OFST:	set	0
3800                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3802                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3802                     ; 1074                            (uint8_t)TIM1_ForcedAction);
3804  0001 c65258        	ld	a,21080
3805  0004 a48f          	and	a,#143
3806  0006 1a01          	or	a,(OFST+1,sp)
3807  0008 c75258        	ld	21080,a
3808                     ; 1075 }
3811  000b 84            	pop	a
3812  000c 81            	ret
3848                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3848                     ; 1086 {
3849                     .text:	section	.text,new
3850  0000               _TIM1_ForcedOC2Config:
3852  0000 88            	push	a
3853       00000000      OFST:	set	0
3856                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3858                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3858                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
3860  0001 c65259        	ld	a,21081
3861  0004 a48f          	and	a,#143
3862  0006 1a01          	or	a,(OFST+1,sp)
3863  0008 c75259        	ld	21081,a
3864                     ; 1093 }
3867  000b 84            	pop	a
3868  000c 81            	ret
3904                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3904                     ; 1105 {
3905                     .text:	section	.text,new
3906  0000               _TIM1_ForcedOC3Config:
3908  0000 88            	push	a
3909       00000000      OFST:	set	0
3912                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3914                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3914                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
3916  0001 c6525a        	ld	a,21082
3917  0004 a48f          	and	a,#143
3918  0006 1a01          	or	a,(OFST+1,sp)
3919  0008 c7525a        	ld	21082,a
3920                     ; 1112 }
3923  000b 84            	pop	a
3924  000c 81            	ret
3960                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3960                     ; 1124 {
3961                     .text:	section	.text,new
3962  0000               _TIM1_ForcedOC4Config:
3964  0000 88            	push	a
3965       00000000      OFST:	set	0
3968                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3970                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
3970                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
3972  0001 c6525b        	ld	a,21083
3973  0004 a48f          	and	a,#143
3974  0006 1a01          	or	a,(OFST+1,sp)
3975  0008 c7525b        	ld	21083,a
3976                     ; 1131 }
3979  000b 84            	pop	a
3980  000c 81            	ret
4016                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
4016                     ; 1140 {
4017                     .text:	section	.text,new
4018  0000               _TIM1_ARRPreloadConfig:
4022                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4024                     ; 1145   if (NewState != DISABLE)
4026  0000 4d            	tnz	a
4027  0001 2706          	jreq	L5502
4028                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
4030  0003 721e5250      	bset	21072,#7
4032  0007 2004          	jra	L7502
4033  0009               L5502:
4034                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
4036  0009 721f5250      	bres	21072,#7
4037  000d               L7502:
4038                     ; 1153 }
4041  000d 81            	ret
4076                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
4076                     ; 1162 {
4077                     .text:	section	.text,new
4078  0000               _TIM1_SelectCOM:
4082                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4084                     ; 1167   if (NewState != DISABLE)
4086  0000 4d            	tnz	a
4087  0001 2706          	jreq	L7702
4088                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
4090  0003 72145251      	bset	21073,#2
4092  0007 2004          	jra	L1012
4093  0009               L7702:
4094                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4096  0009 72155251      	bres	21073,#2
4097  000d               L1012:
4098                     ; 1175 }
4101  000d 81            	ret
4137                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
4137                     ; 1184 {
4138                     .text:	section	.text,new
4139  0000               _TIM1_CCPreloadControl:
4143                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4145                     ; 1189   if (NewState != DISABLE)
4147  0000 4d            	tnz	a
4148  0001 2706          	jreq	L1212
4149                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
4151  0003 72105251      	bset	21073,#0
4153  0007 2004          	jra	L3212
4154  0009               L1212:
4155                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4157  0009 72115251      	bres	21073,#0
4158  000d               L3212:
4159                     ; 1197 }
4162  000d 81            	ret
4198                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4198                     ; 1206 {
4199                     .text:	section	.text,new
4200  0000               _TIM1_OC1PreloadConfig:
4204                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4206                     ; 1211   if (NewState != DISABLE)
4208  0000 4d            	tnz	a
4209  0001 2706          	jreq	L3412
4210                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4212  0003 72165258      	bset	21080,#3
4214  0007 2004          	jra	L5412
4215  0009               L3412:
4216                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4218  0009 72175258      	bres	21080,#3
4219  000d               L5412:
4220                     ; 1219 }
4223  000d 81            	ret
4259                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4259                     ; 1228 {
4260                     .text:	section	.text,new
4261  0000               _TIM1_OC2PreloadConfig:
4265                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4267                     ; 1233   if (NewState != DISABLE)
4269  0000 4d            	tnz	a
4270  0001 2706          	jreq	L5612
4271                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4273  0003 72165259      	bset	21081,#3
4275  0007 2004          	jra	L7612
4276  0009               L5612:
4277                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4279  0009 72175259      	bres	21081,#3
4280  000d               L7612:
4281                     ; 1241 }
4284  000d 81            	ret
4320                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4320                     ; 1250 {
4321                     .text:	section	.text,new
4322  0000               _TIM1_OC3PreloadConfig:
4326                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4328                     ; 1255   if (NewState != DISABLE)
4330  0000 4d            	tnz	a
4331  0001 2706          	jreq	L7022
4332                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4334  0003 7216525a      	bset	21082,#3
4336  0007 2004          	jra	L1122
4337  0009               L7022:
4338                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4340  0009 7217525a      	bres	21082,#3
4341  000d               L1122:
4342                     ; 1263 }
4345  000d 81            	ret
4381                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4381                     ; 1272 {
4382                     .text:	section	.text,new
4383  0000               _TIM1_OC4PreloadConfig:
4387                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4389                     ; 1277   if (NewState != DISABLE)
4391  0000 4d            	tnz	a
4392  0001 2706          	jreq	L1322
4393                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4395  0003 7216525b      	bset	21083,#3
4397  0007 2004          	jra	L3322
4398  0009               L1322:
4399                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4401  0009 7217525b      	bres	21083,#3
4402  000d               L3322:
4403                     ; 1285 }
4406  000d 81            	ret
4441                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
4441                     ; 1294 {
4442                     .text:	section	.text,new
4443  0000               _TIM1_OC1FastConfig:
4447                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4449                     ; 1299   if (NewState != DISABLE)
4451  0000 4d            	tnz	a
4452  0001 2706          	jreq	L3522
4453                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4455  0003 72145258      	bset	21080,#2
4457  0007 2004          	jra	L5522
4458  0009               L3522:
4459                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4461  0009 72155258      	bres	21080,#2
4462  000d               L5522:
4463                     ; 1307 }
4466  000d 81            	ret
4501                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
4501                     ; 1316 {
4502                     .text:	section	.text,new
4503  0000               _TIM1_OC2FastConfig:
4507                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4509                     ; 1321   if (NewState != DISABLE)
4511  0000 4d            	tnz	a
4512  0001 2706          	jreq	L5722
4513                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4515  0003 72145259      	bset	21081,#2
4517  0007 2004          	jra	L7722
4518  0009               L5722:
4519                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4521  0009 72155259      	bres	21081,#2
4522  000d               L7722:
4523                     ; 1329 }
4526  000d 81            	ret
4561                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
4561                     ; 1338 {
4562                     .text:	section	.text,new
4563  0000               _TIM1_OC3FastConfig:
4567                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4569                     ; 1343   if (NewState != DISABLE)
4571  0000 4d            	tnz	a
4572  0001 2706          	jreq	L7132
4573                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4575  0003 7214525a      	bset	21082,#2
4577  0007 2004          	jra	L1232
4578  0009               L7132:
4579                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4581  0009 7215525a      	bres	21082,#2
4582  000d               L1232:
4583                     ; 1351 }
4586  000d 81            	ret
4621                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
4621                     ; 1360 {
4622                     .text:	section	.text,new
4623  0000               _TIM1_OC4FastConfig:
4627                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4629                     ; 1365   if (NewState != DISABLE)
4631  0000 4d            	tnz	a
4632  0001 2706          	jreq	L1432
4633                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4635  0003 7214525b      	bset	21083,#2
4637  0007 2004          	jra	L3432
4638  0009               L1432:
4639                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4641  0009 7215525b      	bres	21083,#2
4642  000d               L3432:
4643                     ; 1373 }
4646  000d 81            	ret
4751                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4751                     ; 1390 {
4752                     .text:	section	.text,new
4753  0000               _TIM1_GenerateEvent:
4757                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4759                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
4761  0000 c75257        	ld	21079,a
4762                     ; 1396 }
4765  0003 81            	ret
4801                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4801                     ; 1407 {
4802                     .text:	section	.text,new
4803  0000               _TIM1_OC1PolarityConfig:
4807                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4809                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4811  0000 4d            	tnz	a
4812  0001 2706          	jreq	L5242
4813                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4815  0003 7212525c      	bset	21084,#1
4817  0007 2004          	jra	L7242
4818  0009               L5242:
4819                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4821  0009 7213525c      	bres	21084,#1
4822  000d               L7242:
4823                     ; 1420 }
4826  000d 81            	ret
4862                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4862                     ; 1431 {
4863                     .text:	section	.text,new
4864  0000               _TIM1_OC1NPolarityConfig:
4868                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4870                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4872  0000 4d            	tnz	a
4873  0001 2706          	jreq	L7442
4874                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4876  0003 7216525c      	bset	21084,#3
4878  0007 2004          	jra	L1542
4879  0009               L7442:
4880                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4882  0009 7217525c      	bres	21084,#3
4883  000d               L1542:
4884                     ; 1444 }
4887  000d 81            	ret
4923                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4923                     ; 1455 {
4924                     .text:	section	.text,new
4925  0000               _TIM1_OC2PolarityConfig:
4929                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4931                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4933  0000 4d            	tnz	a
4934  0001 2706          	jreq	L1742
4935                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4937  0003 721a525c      	bset	21084,#5
4939  0007 2004          	jra	L3742
4940  0009               L1742:
4941                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4943  0009 721b525c      	bres	21084,#5
4944  000d               L3742:
4945                     ; 1468 }
4948  000d 81            	ret
4984                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4984                     ; 1479 {
4985                     .text:	section	.text,new
4986  0000               _TIM1_OC2NPolarityConfig:
4990                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4992                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4994  0000 4d            	tnz	a
4995  0001 2706          	jreq	L3152
4996                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
4998  0003 721e525c      	bset	21084,#7
5000  0007 2004          	jra	L5152
5001  0009               L3152:
5002                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
5004  0009 721f525c      	bres	21084,#7
5005  000d               L5152:
5006                     ; 1492 }
5009  000d 81            	ret
5045                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5045                     ; 1503 {
5046                     .text:	section	.text,new
5047  0000               _TIM1_OC3PolarityConfig:
5051                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5053                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5055  0000 4d            	tnz	a
5056  0001 2706          	jreq	L5352
5057                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
5059  0003 7212525d      	bset	21085,#1
5061  0007 2004          	jra	L7352
5062  0009               L5352:
5063                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5065  0009 7213525d      	bres	21085,#1
5066  000d               L7352:
5067                     ; 1516 }
5070  000d 81            	ret
5106                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5106                     ; 1528 {
5107                     .text:	section	.text,new
5108  0000               _TIM1_OC3NPolarityConfig:
5112                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5114                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5116  0000 4d            	tnz	a
5117  0001 2706          	jreq	L7552
5118                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5120  0003 7216525d      	bset	21085,#3
5122  0007 2004          	jra	L1652
5123  0009               L7552:
5124                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5126  0009 7217525d      	bres	21085,#3
5127  000d               L1652:
5128                     ; 1541 }
5131  000d 81            	ret
5167                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5167                     ; 1552 {
5168                     .text:	section	.text,new
5169  0000               _TIM1_OC4PolarityConfig:
5173                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5175                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5177  0000 4d            	tnz	a
5178  0001 2706          	jreq	L1062
5179                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
5181  0003 721a525d      	bset	21085,#5
5183  0007 2004          	jra	L3062
5184  0009               L1062:
5185                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5187  0009 721b525d      	bres	21085,#5
5188  000d               L3062:
5189                     ; 1565 }
5192  000d 81            	ret
5237                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5237                     ; 1580 {
5238                     .text:	section	.text,new
5239  0000               _TIM1_CCxCmd:
5241  0000 89            	pushw	x
5242       00000000      OFST:	set	0
5245                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5247                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5249                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
5251  0001 9e            	ld	a,xh
5252  0002 4d            	tnz	a
5253  0003 2610          	jrne	L7262
5254                     ; 1588     if (NewState != DISABLE)
5256  0005 9f            	ld	a,xl
5257  0006 4d            	tnz	a
5258  0007 2706          	jreq	L1362
5259                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
5261  0009 7210525c      	bset	21084,#0
5263  000d 2040          	jra	L5362
5264  000f               L1362:
5265                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5267  000f 7211525c      	bres	21084,#0
5268  0013 203a          	jra	L5362
5269  0015               L7262:
5270                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
5272  0015 7b01          	ld	a,(OFST+1,sp)
5273  0017 a101          	cp	a,#1
5274  0019 2610          	jrne	L7362
5275                     ; 1601     if (NewState != DISABLE)
5277  001b 0d02          	tnz	(OFST+2,sp)
5278  001d 2706          	jreq	L1462
5279                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
5281  001f 7218525c      	bset	21084,#4
5283  0023 202a          	jra	L5362
5284  0025               L1462:
5285                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5287  0025 7219525c      	bres	21084,#4
5288  0029 2024          	jra	L5362
5289  002b               L7362:
5290                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
5292  002b 7b01          	ld	a,(OFST+1,sp)
5293  002d a102          	cp	a,#2
5294  002f 2610          	jrne	L7462
5295                     ; 1613     if (NewState != DISABLE)
5297  0031 0d02          	tnz	(OFST+2,sp)
5298  0033 2706          	jreq	L1562
5299                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
5301  0035 7210525d      	bset	21085,#0
5303  0039 2014          	jra	L5362
5304  003b               L1562:
5305                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5307  003b 7211525d      	bres	21085,#0
5308  003f 200e          	jra	L5362
5309  0041               L7462:
5310                     ; 1625     if (NewState != DISABLE)
5312  0041 0d02          	tnz	(OFST+2,sp)
5313  0043 2706          	jreq	L7562
5314                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
5316  0045 7218525d      	bset	21085,#4
5318  0049 2004          	jra	L5362
5319  004b               L7562:
5320                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5322  004b 7219525d      	bres	21085,#4
5323  004f               L5362:
5324                     ; 1634 }
5327  004f 85            	popw	x
5328  0050 81            	ret
5373                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5373                     ; 1648 {
5374                     .text:	section	.text,new
5375  0000               _TIM1_CCxNCmd:
5377  0000 89            	pushw	x
5378       00000000      OFST:	set	0
5381                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5383                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5385                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
5387  0001 9e            	ld	a,xh
5388  0002 4d            	tnz	a
5389  0003 2610          	jrne	L5072
5390                     ; 1656     if (NewState != DISABLE)
5392  0005 9f            	ld	a,xl
5393  0006 4d            	tnz	a
5394  0007 2706          	jreq	L7072
5395                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5397  0009 7214525c      	bset	21084,#2
5399  000d 202a          	jra	L3172
5400  000f               L7072:
5401                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5403  000f 7215525c      	bres	21084,#2
5404  0013 2024          	jra	L3172
5405  0015               L5072:
5406                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
5408  0015 7b01          	ld	a,(OFST+1,sp)
5409  0017 a101          	cp	a,#1
5410  0019 2610          	jrne	L5172
5411                     ; 1668     if (NewState != DISABLE)
5413  001b 0d02          	tnz	(OFST+2,sp)
5414  001d 2706          	jreq	L7172
5415                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5417  001f 721c525c      	bset	21084,#6
5419  0023 2014          	jra	L3172
5420  0025               L7172:
5421                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5423  0025 721d525c      	bres	21084,#6
5424  0029 200e          	jra	L3172
5425  002b               L5172:
5426                     ; 1680     if (NewState != DISABLE)
5428  002b 0d02          	tnz	(OFST+2,sp)
5429  002d 2706          	jreq	L5272
5430                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5432  002f 7214525d      	bset	21085,#2
5434  0033 2004          	jra	L3172
5435  0035               L5272:
5436                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5438  0035 7215525d      	bres	21085,#2
5439  0039               L3172:
5440                     ; 1689 }
5443  0039 85            	popw	x
5444  003a 81            	ret
5489                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5489                     ; 1713 {
5490                     .text:	section	.text,new
5491  0000               _TIM1_SelectOCxM:
5493  0000 89            	pushw	x
5494       00000000      OFST:	set	0
5497                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5499                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5501                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
5503  0001 9e            	ld	a,xh
5504  0002 4d            	tnz	a
5505  0003 2610          	jrne	L3572
5506                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5508  0005 7211525c      	bres	21084,#0
5509                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5509                     ; 1725                             | (uint8_t)TIM1_OCMode);
5511  0009 c65258        	ld	a,21080
5512  000c a48f          	and	a,#143
5513  000e 1a02          	or	a,(OFST+2,sp)
5514  0010 c75258        	ld	21080,a
5516  0013 203a          	jra	L5572
5517  0015               L3572:
5518                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
5520  0015 7b01          	ld	a,(OFST+1,sp)
5521  0017 a101          	cp	a,#1
5522  0019 2610          	jrne	L7572
5523                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5525  001b 7219525c      	bres	21084,#4
5526                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5526                     ; 1734                             | (uint8_t)TIM1_OCMode);
5528  001f c65259        	ld	a,21081
5529  0022 a48f          	and	a,#143
5530  0024 1a02          	or	a,(OFST+2,sp)
5531  0026 c75259        	ld	21081,a
5533  0029 2024          	jra	L5572
5534  002b               L7572:
5535                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
5537  002b 7b01          	ld	a,(OFST+1,sp)
5538  002d a102          	cp	a,#2
5539  002f 2610          	jrne	L3672
5540                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5542  0031 7211525d      	bres	21085,#0
5543                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5543                     ; 1743                             | (uint8_t)TIM1_OCMode);
5545  0035 c6525a        	ld	a,21082
5546  0038 a48f          	and	a,#143
5547  003a 1a02          	or	a,(OFST+2,sp)
5548  003c c7525a        	ld	21082,a
5550  003f 200e          	jra	L5572
5551  0041               L3672:
5552                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5554  0041 7219525d      	bres	21085,#4
5555                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5555                     ; 1752                             | (uint8_t)TIM1_OCMode);
5557  0045 c6525b        	ld	a,21083
5558  0048 a48f          	and	a,#143
5559  004a 1a02          	or	a,(OFST+2,sp)
5560  004c c7525b        	ld	21083,a
5561  004f               L5572:
5562                     ; 1754 }
5565  004f 85            	popw	x
5566  0050 81            	ret
5600                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
5600                     ; 1763 {
5601                     .text:	section	.text,new
5602  0000               _TIM1_SetCounter:
5606                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
5608  0000 9e            	ld	a,xh
5609  0001 c7525e        	ld	21086,a
5610                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
5612  0004 9f            	ld	a,xl
5613  0005 c7525f        	ld	21087,a
5614                     ; 1767 }
5617  0008 81            	ret
5651                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
5651                     ; 1776 {
5652                     .text:	section	.text,new
5653  0000               _TIM1_SetAutoreload:
5657                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5659  0000 9e            	ld	a,xh
5660  0001 c75262        	ld	21090,a
5661                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
5663  0004 9f            	ld	a,xl
5664  0005 c75263        	ld	21091,a
5665                     ; 1780  }
5668  0008 81            	ret
5702                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
5702                     ; 1789 {
5703                     .text:	section	.text,new
5704  0000               _TIM1_SetCompare1:
5708                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5710  0000 9e            	ld	a,xh
5711  0001 c75265        	ld	21093,a
5712                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
5714  0004 9f            	ld	a,xl
5715  0005 c75266        	ld	21094,a
5716                     ; 1793 }
5719  0008 81            	ret
5753                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
5753                     ; 1802 {
5754                     .text:	section	.text,new
5755  0000               _TIM1_SetCompare2:
5759                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5761  0000 9e            	ld	a,xh
5762  0001 c75267        	ld	21095,a
5763                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
5765  0004 9f            	ld	a,xl
5766  0005 c75268        	ld	21096,a
5767                     ; 1806 }
5770  0008 81            	ret
5804                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
5804                     ; 1815 {
5805                     .text:	section	.text,new
5806  0000               _TIM1_SetCompare3:
5810                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5812  0000 9e            	ld	a,xh
5813  0001 c75269        	ld	21097,a
5814                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
5816  0004 9f            	ld	a,xl
5817  0005 c7526a        	ld	21098,a
5818                     ; 1819 }
5821  0008 81            	ret
5855                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
5855                     ; 1828 {
5856                     .text:	section	.text,new
5857  0000               _TIM1_SetCompare4:
5861                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5863  0000 9e            	ld	a,xh
5864  0001 c7526b        	ld	21099,a
5865                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
5867  0004 9f            	ld	a,xl
5868  0005 c7526c        	ld	21100,a
5869                     ; 1832 }
5872  0008 81            	ret
5908                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5908                     ; 1845 {
5909                     .text:	section	.text,new
5910  0000               _TIM1_SetIC1Prescaler:
5912  0000 88            	push	a
5913       00000000      OFST:	set	0
5916                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5918                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5918                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
5920  0001 c65258        	ld	a,21080
5921  0004 a4f3          	and	a,#243
5922  0006 1a01          	or	a,(OFST+1,sp)
5923  0008 c75258        	ld	21080,a
5924                     ; 1852 }
5927  000b 84            	pop	a
5928  000c 81            	ret
5964                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5964                     ; 1865 {
5965                     .text:	section	.text,new
5966  0000               _TIM1_SetIC2Prescaler:
5968  0000 88            	push	a
5969       00000000      OFST:	set	0
5972                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5974                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
5974                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
5976  0001 c65259        	ld	a,21081
5977  0004 a4f3          	and	a,#243
5978  0006 1a01          	or	a,(OFST+1,sp)
5979  0008 c75259        	ld	21081,a
5980                     ; 1873 }
5983  000b 84            	pop	a
5984  000c 81            	ret
6020                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
6020                     ; 1886 {
6021                     .text:	section	.text,new
6022  0000               _TIM1_SetIC3Prescaler:
6024  0000 88            	push	a
6025       00000000      OFST:	set	0
6028                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
6030                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
6030                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
6032  0001 c6525a        	ld	a,21082
6033  0004 a4f3          	and	a,#243
6034  0006 1a01          	or	a,(OFST+1,sp)
6035  0008 c7525a        	ld	21082,a
6036                     ; 1894 }
6039  000b 84            	pop	a
6040  000c 81            	ret
6076                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6076                     ; 1907 {
6077                     .text:	section	.text,new
6078  0000               _TIM1_SetIC4Prescaler:
6080  0000 88            	push	a
6081       00000000      OFST:	set	0
6084                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6086                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6086                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
6088  0001 c6525b        	ld	a,21083
6089  0004 a4f3          	and	a,#243
6090  0006 1a01          	or	a,(OFST+1,sp)
6091  0008 c7525b        	ld	21083,a
6092                     ; 1915 }
6095  000b 84            	pop	a
6096  000c 81            	ret
6148                     ; 1922 uint16_t TIM1_GetCapture1(void)
6148                     ; 1923 {
6149                     .text:	section	.text,new
6150  0000               _TIM1_GetCapture1:
6152  0000 5204          	subw	sp,#4
6153       00000004      OFST:	set	4
6156                     ; 1926   uint16_t tmpccr1 = 0;
6158                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
6162                     ; 1929   tmpccr1h = TIM1->CCR1H;
6164  0002 c65265        	ld	a,21093
6165  0005 6b02          	ld	(OFST-2,sp),a
6167                     ; 1930   tmpccr1l = TIM1->CCR1L;
6169  0007 c65266        	ld	a,21094
6170  000a 6b01          	ld	(OFST-3,sp),a
6172                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
6174  000c 7b01          	ld	a,(OFST-3,sp)
6175  000e 5f            	clrw	x
6176  000f 97            	ld	xl,a
6177  0010 1f03          	ldw	(OFST-1,sp),x
6179                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6181  0012 7b02          	ld	a,(OFST-2,sp)
6182  0014 5f            	clrw	x
6183  0015 97            	ld	xl,a
6184  0016 4f            	clr	a
6185  0017 02            	rlwa	x,a
6186  0018 01            	rrwa	x,a
6187  0019 1a04          	or	a,(OFST+0,sp)
6188  001b 01            	rrwa	x,a
6189  001c 1a03          	or	a,(OFST-1,sp)
6190  001e 01            	rrwa	x,a
6191  001f 1f03          	ldw	(OFST-1,sp),x
6193                     ; 1935   return (uint16_t)tmpccr1;
6195  0021 1e03          	ldw	x,(OFST-1,sp)
6198  0023 5b04          	addw	sp,#4
6199  0025 81            	ret
6251                     ; 1943 uint16_t TIM1_GetCapture2(void)
6251                     ; 1944 {
6252                     .text:	section	.text,new
6253  0000               _TIM1_GetCapture2:
6255  0000 5204          	subw	sp,#4
6256       00000004      OFST:	set	4
6259                     ; 1947   uint16_t tmpccr2 = 0;
6261                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
6265                     ; 1950   tmpccr2h = TIM1->CCR2H;
6267  0002 c65267        	ld	a,21095
6268  0005 6b02          	ld	(OFST-2,sp),a
6270                     ; 1951   tmpccr2l = TIM1->CCR2L;
6272  0007 c65268        	ld	a,21096
6273  000a 6b01          	ld	(OFST-3,sp),a
6275                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
6277  000c 7b01          	ld	a,(OFST-3,sp)
6278  000e 5f            	clrw	x
6279  000f 97            	ld	xl,a
6280  0010 1f03          	ldw	(OFST-1,sp),x
6282                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6284  0012 7b02          	ld	a,(OFST-2,sp)
6285  0014 5f            	clrw	x
6286  0015 97            	ld	xl,a
6287  0016 4f            	clr	a
6288  0017 02            	rlwa	x,a
6289  0018 01            	rrwa	x,a
6290  0019 1a04          	or	a,(OFST+0,sp)
6291  001b 01            	rrwa	x,a
6292  001c 1a03          	or	a,(OFST-1,sp)
6293  001e 01            	rrwa	x,a
6294  001f 1f03          	ldw	(OFST-1,sp),x
6296                     ; 1956   return (uint16_t)tmpccr2;
6298  0021 1e03          	ldw	x,(OFST-1,sp)
6301  0023 5b04          	addw	sp,#4
6302  0025 81            	ret
6354                     ; 1964 uint16_t TIM1_GetCapture3(void)
6354                     ; 1965 {
6355                     .text:	section	.text,new
6356  0000               _TIM1_GetCapture3:
6358  0000 5204          	subw	sp,#4
6359       00000004      OFST:	set	4
6362                     ; 1967   uint16_t tmpccr3 = 0;
6364                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
6368                     ; 1970   tmpccr3h = TIM1->CCR3H;
6370  0002 c65269        	ld	a,21097
6371  0005 6b02          	ld	(OFST-2,sp),a
6373                     ; 1971   tmpccr3l = TIM1->CCR3L;
6375  0007 c6526a        	ld	a,21098
6376  000a 6b01          	ld	(OFST-3,sp),a
6378                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
6380  000c 7b01          	ld	a,(OFST-3,sp)
6381  000e 5f            	clrw	x
6382  000f 97            	ld	xl,a
6383  0010 1f03          	ldw	(OFST-1,sp),x
6385                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6387  0012 7b02          	ld	a,(OFST-2,sp)
6388  0014 5f            	clrw	x
6389  0015 97            	ld	xl,a
6390  0016 4f            	clr	a
6391  0017 02            	rlwa	x,a
6392  0018 01            	rrwa	x,a
6393  0019 1a04          	or	a,(OFST+0,sp)
6394  001b 01            	rrwa	x,a
6395  001c 1a03          	or	a,(OFST-1,sp)
6396  001e 01            	rrwa	x,a
6397  001f 1f03          	ldw	(OFST-1,sp),x
6399                     ; 1976   return (uint16_t)tmpccr3;
6401  0021 1e03          	ldw	x,(OFST-1,sp)
6404  0023 5b04          	addw	sp,#4
6405  0025 81            	ret
6457                     ; 1984 uint16_t TIM1_GetCapture4(void)
6457                     ; 1985 {
6458                     .text:	section	.text,new
6459  0000               _TIM1_GetCapture4:
6461  0000 5204          	subw	sp,#4
6462       00000004      OFST:	set	4
6465                     ; 1987   uint16_t tmpccr4 = 0;
6467                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
6471                     ; 1990   tmpccr4h = TIM1->CCR4H;
6473  0002 c6526b        	ld	a,21099
6474  0005 6b02          	ld	(OFST-2,sp),a
6476                     ; 1991   tmpccr4l = TIM1->CCR4L;
6478  0007 c6526c        	ld	a,21100
6479  000a 6b01          	ld	(OFST-3,sp),a
6481                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
6483  000c 7b01          	ld	a,(OFST-3,sp)
6484  000e 5f            	clrw	x
6485  000f 97            	ld	xl,a
6486  0010 1f03          	ldw	(OFST-1,sp),x
6488                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6490  0012 7b02          	ld	a,(OFST-2,sp)
6491  0014 5f            	clrw	x
6492  0015 97            	ld	xl,a
6493  0016 4f            	clr	a
6494  0017 02            	rlwa	x,a
6495  0018 01            	rrwa	x,a
6496  0019 1a04          	or	a,(OFST+0,sp)
6497  001b 01            	rrwa	x,a
6498  001c 1a03          	or	a,(OFST-1,sp)
6499  001e 01            	rrwa	x,a
6500  001f 1f03          	ldw	(OFST-1,sp),x
6502                     ; 1996   return (uint16_t)tmpccr4;
6504  0021 1e03          	ldw	x,(OFST-1,sp)
6507  0023 5b04          	addw	sp,#4
6508  0025 81            	ret
6542                     ; 2004 uint16_t TIM1_GetCounter(void)
6542                     ; 2005 {
6543                     .text:	section	.text,new
6544  0000               _TIM1_GetCounter:
6546  0000 89            	pushw	x
6547       00000002      OFST:	set	2
6550                     ; 2006   uint16_t tmpcntr = 0;
6552                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6554  0001 c6525e        	ld	a,21086
6555  0004 5f            	clrw	x
6556  0005 97            	ld	xl,a
6557  0006 4f            	clr	a
6558  0007 02            	rlwa	x,a
6559  0008 1f01          	ldw	(OFST-1,sp),x
6561                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6563  000a c6525f        	ld	a,21087
6564  000d 5f            	clrw	x
6565  000e 97            	ld	xl,a
6566  000f 01            	rrwa	x,a
6567  0010 1a02          	or	a,(OFST+0,sp)
6568  0012 01            	rrwa	x,a
6569  0013 1a01          	or	a,(OFST-1,sp)
6570  0015 01            	rrwa	x,a
6573  0016 5b02          	addw	sp,#2
6574  0018 81            	ret
6608                     ; 2019 uint16_t TIM1_GetPrescaler(void)
6608                     ; 2020 {
6609                     .text:	section	.text,new
6610  0000               _TIM1_GetPrescaler:
6612  0000 89            	pushw	x
6613       00000002      OFST:	set	2
6616                     ; 2021   uint16_t temp = 0;
6618                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
6620  0001 c65260        	ld	a,21088
6621  0004 5f            	clrw	x
6622  0005 97            	ld	xl,a
6623  0006 4f            	clr	a
6624  0007 02            	rlwa	x,a
6625  0008 1f01          	ldw	(OFST-1,sp),x
6627                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6629  000a c65261        	ld	a,21089
6630  000d 5f            	clrw	x
6631  000e 97            	ld	xl,a
6632  000f 01            	rrwa	x,a
6633  0010 1a02          	or	a,(OFST+0,sp)
6634  0012 01            	rrwa	x,a
6635  0013 1a01          	or	a,(OFST-1,sp)
6636  0015 01            	rrwa	x,a
6639  0016 5b02          	addw	sp,#2
6640  0018 81            	ret
6814                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6814                     ; 2048 {
6815                     .text:	section	.text,new
6816  0000               _TIM1_GetFlagStatus:
6818  0000 89            	pushw	x
6819  0001 89            	pushw	x
6820       00000002      OFST:	set	2
6823                     ; 2049   FlagStatus bitstatus = RESET;
6825                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6829                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6831                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6833  0002 9f            	ld	a,xl
6834  0003 c45255        	and	a,21077
6835  0006 6b01          	ld	(OFST-1,sp),a
6837                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6839  0008 7b03          	ld	a,(OFST+1,sp)
6840  000a 6b02          	ld	(OFST+0,sp),a
6842                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6844  000c c65256        	ld	a,21078
6845  000f 1402          	and	a,(OFST+0,sp)
6846  0011 1a01          	or	a,(OFST-1,sp)
6847  0013 2706          	jreq	L5643
6848                     ; 2060     bitstatus = SET;
6850  0015 a601          	ld	a,#1
6851  0017 6b02          	ld	(OFST+0,sp),a
6854  0019 2002          	jra	L7643
6855  001b               L5643:
6856                     ; 2064     bitstatus = RESET;
6858  001b 0f02          	clr	(OFST+0,sp)
6860  001d               L7643:
6861                     ; 2066   return (FlagStatus)(bitstatus);
6863  001d 7b02          	ld	a,(OFST+0,sp)
6866  001f 5b04          	addw	sp,#4
6867  0021 81            	ret
6902                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6902                     ; 2088 {
6903                     .text:	section	.text,new
6904  0000               _TIM1_ClearFlag:
6906  0000 89            	pushw	x
6907       00000000      OFST:	set	0
6910                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6912                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6914  0001 9f            	ld	a,xl
6915  0002 43            	cpl	a
6916  0003 c75255        	ld	21077,a
6917                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6917                     ; 2095                         (uint8_t)0x1E);
6919  0006 7b01          	ld	a,(OFST+1,sp)
6920  0008 43            	cpl	a
6921  0009 a41e          	and	a,#30
6922  000b c75256        	ld	21078,a
6923                     ; 2096 }
6926  000e 85            	popw	x
6927  000f 81            	ret
6991                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6991                     ; 2113 {
6992                     .text:	section	.text,new
6993  0000               _TIM1_GetITStatus:
6995  0000 88            	push	a
6996  0001 89            	pushw	x
6997       00000002      OFST:	set	2
7000                     ; 2114   ITStatus bitstatus = RESET;
7002                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
7006                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
7008                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
7010  0002 c45255        	and	a,21077
7011  0005 6b01          	ld	(OFST-1,sp),a
7013                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
7015  0007 c65254        	ld	a,21076
7016  000a 1403          	and	a,(OFST+1,sp)
7017  000c 6b02          	ld	(OFST+0,sp),a
7019                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
7021  000e 0d01          	tnz	(OFST-1,sp)
7022  0010 270a          	jreq	L1453
7024  0012 0d02          	tnz	(OFST+0,sp)
7025  0014 2706          	jreq	L1453
7026                     ; 2126     bitstatus = SET;
7028  0016 a601          	ld	a,#1
7029  0018 6b02          	ld	(OFST+0,sp),a
7032  001a 2002          	jra	L3453
7033  001c               L1453:
7034                     ; 2130     bitstatus = RESET;
7036  001c 0f02          	clr	(OFST+0,sp)
7038  001e               L3453:
7039                     ; 2132   return (ITStatus)(bitstatus);
7041  001e 7b02          	ld	a,(OFST+0,sp)
7044  0020 5b03          	addw	sp,#3
7045  0022 81            	ret
7081                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
7081                     ; 2150 {
7082                     .text:	section	.text,new
7083  0000               _TIM1_ClearITPendingBit:
7087                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
7089                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
7091  0000 43            	cpl	a
7092  0001 c75255        	ld	21077,a
7093                     ; 2156 }
7096  0004 81            	ret
7148                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
7148                     ; 2175                        uint8_t TIM1_ICSelection,
7148                     ; 2176                        uint8_t TIM1_ICFilter)
7148                     ; 2177 {
7149                     .text:	section	.text,new
7150  0000               L3_TI1_Config:
7152  0000 89            	pushw	x
7153  0001 88            	push	a
7154       00000001      OFST:	set	1
7157                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7159  0002 7211525c      	bres	21084,#0
7160                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
7160                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7162  0006 7b06          	ld	a,(OFST+5,sp)
7163  0008 97            	ld	xl,a
7164  0009 a610          	ld	a,#16
7165  000b 42            	mul	x,a
7166  000c 9f            	ld	a,xl
7167  000d 1a03          	or	a,(OFST+2,sp)
7168  000f 6b01          	ld	(OFST+0,sp),a
7170  0011 c65258        	ld	a,21080
7171  0014 a40c          	and	a,#12
7172  0016 1a01          	or	a,(OFST+0,sp)
7173  0018 c75258        	ld	21080,a
7174                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7176  001b 0d02          	tnz	(OFST+1,sp)
7177  001d 2706          	jreq	L1163
7178                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7180  001f 7212525c      	bset	21084,#1
7182  0023 2004          	jra	L3163
7183  0025               L1163:
7184                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7186  0025 7213525c      	bres	21084,#1
7187  0029               L3163:
7188                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7190  0029 7210525c      	bset	21084,#0
7191                     ; 2197 }
7194  002d 5b03          	addw	sp,#3
7195  002f 81            	ret
7247                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
7247                     ; 2216                        uint8_t TIM1_ICSelection,
7247                     ; 2217                        uint8_t TIM1_ICFilter)
7247                     ; 2218 {
7248                     .text:	section	.text,new
7249  0000               L5_TI2_Config:
7251  0000 89            	pushw	x
7252  0001 88            	push	a
7253       00000001      OFST:	set	1
7256                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7258  0002 7219525c      	bres	21084,#4
7259                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7259                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7261  0006 7b06          	ld	a,(OFST+5,sp)
7262  0008 97            	ld	xl,a
7263  0009 a610          	ld	a,#16
7264  000b 42            	mul	x,a
7265  000c 9f            	ld	a,xl
7266  000d 1a03          	or	a,(OFST+2,sp)
7267  000f 6b01          	ld	(OFST+0,sp),a
7269  0011 c65259        	ld	a,21081
7270  0014 a40c          	and	a,#12
7271  0016 1a01          	or	a,(OFST+0,sp)
7272  0018 c75259        	ld	21081,a
7273                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7275  001b 0d02          	tnz	(OFST+1,sp)
7276  001d 2706          	jreq	L3463
7277                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7279  001f 721a525c      	bset	21084,#5
7281  0023 2004          	jra	L5463
7282  0025               L3463:
7283                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7285  0025 721b525c      	bres	21084,#5
7286  0029               L5463:
7287                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7289  0029 7218525c      	bset	21084,#4
7290                     ; 2236 }
7293  002d 5b03          	addw	sp,#3
7294  002f 81            	ret
7346                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
7346                     ; 2255                        uint8_t TIM1_ICSelection,
7346                     ; 2256                        uint8_t TIM1_ICFilter)
7346                     ; 2257 {
7347                     .text:	section	.text,new
7348  0000               L7_TI3_Config:
7350  0000 89            	pushw	x
7351  0001 88            	push	a
7352       00000001      OFST:	set	1
7355                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7357  0002 7211525d      	bres	21085,#0
7358                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7358                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7360  0006 7b06          	ld	a,(OFST+5,sp)
7361  0008 97            	ld	xl,a
7362  0009 a610          	ld	a,#16
7363  000b 42            	mul	x,a
7364  000c 9f            	ld	a,xl
7365  000d 1a03          	or	a,(OFST+2,sp)
7366  000f 6b01          	ld	(OFST+0,sp),a
7368  0011 c6525a        	ld	a,21082
7369  0014 a40c          	and	a,#12
7370  0016 1a01          	or	a,(OFST+0,sp)
7371  0018 c7525a        	ld	21082,a
7372                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7374  001b 0d02          	tnz	(OFST+1,sp)
7375  001d 2706          	jreq	L5763
7376                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
7378  001f 7212525d      	bset	21085,#1
7380  0023 2004          	jra	L7763
7381  0025               L5763:
7382                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7384  0025 7213525d      	bres	21085,#1
7385  0029               L7763:
7386                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7388  0029 7210525d      	bset	21085,#0
7389                     ; 2276 }
7392  002d 5b03          	addw	sp,#3
7393  002f 81            	ret
7445                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
7445                     ; 2295                        uint8_t TIM1_ICSelection,
7445                     ; 2296                        uint8_t TIM1_ICFilter)
7445                     ; 2297 {
7446                     .text:	section	.text,new
7447  0000               L11_TI4_Config:
7449  0000 89            	pushw	x
7450  0001 88            	push	a
7451       00000001      OFST:	set	1
7454                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7456  0002 7219525d      	bres	21085,#4
7457                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7457                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7459  0006 7b06          	ld	a,(OFST+5,sp)
7460  0008 97            	ld	xl,a
7461  0009 a610          	ld	a,#16
7462  000b 42            	mul	x,a
7463  000c 9f            	ld	a,xl
7464  000d 1a03          	or	a,(OFST+2,sp)
7465  000f 6b01          	ld	(OFST+0,sp),a
7467  0011 c6525b        	ld	a,21083
7468  0014 a40c          	and	a,#12
7469  0016 1a01          	or	a,(OFST+0,sp)
7470  0018 c7525b        	ld	21083,a
7471                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7473  001b 0d02          	tnz	(OFST+1,sp)
7474  001d 2706          	jreq	L7273
7475                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
7477  001f 721a525d      	bset	21085,#5
7479  0023 2004          	jra	L1373
7480  0025               L7273:
7481                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7483  0025 721b525d      	bres	21085,#5
7484  0029               L1373:
7485                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7487  0029 7218525d      	bset	21085,#4
7488                     ; 2317 }
7491  002d 5b03          	addw	sp,#3
7492  002f 81            	ret
7505                     	xdef	_TIM1_ClearITPendingBit
7506                     	xdef	_TIM1_GetITStatus
7507                     	xdef	_TIM1_ClearFlag
7508                     	xdef	_TIM1_GetFlagStatus
7509                     	xdef	_TIM1_GetPrescaler
7510                     	xdef	_TIM1_GetCounter
7511                     	xdef	_TIM1_GetCapture4
7512                     	xdef	_TIM1_GetCapture3
7513                     	xdef	_TIM1_GetCapture2
7514                     	xdef	_TIM1_GetCapture1
7515                     	xdef	_TIM1_SetIC4Prescaler
7516                     	xdef	_TIM1_SetIC3Prescaler
7517                     	xdef	_TIM1_SetIC2Prescaler
7518                     	xdef	_TIM1_SetIC1Prescaler
7519                     	xdef	_TIM1_SetCompare4
7520                     	xdef	_TIM1_SetCompare3
7521                     	xdef	_TIM1_SetCompare2
7522                     	xdef	_TIM1_SetCompare1
7523                     	xdef	_TIM1_SetAutoreload
7524                     	xdef	_TIM1_SetCounter
7525                     	xdef	_TIM1_SelectOCxM
7526                     	xdef	_TIM1_CCxNCmd
7527                     	xdef	_TIM1_CCxCmd
7528                     	xdef	_TIM1_OC4PolarityConfig
7529                     	xdef	_TIM1_OC3NPolarityConfig
7530                     	xdef	_TIM1_OC3PolarityConfig
7531                     	xdef	_TIM1_OC2NPolarityConfig
7532                     	xdef	_TIM1_OC2PolarityConfig
7533                     	xdef	_TIM1_OC1NPolarityConfig
7534                     	xdef	_TIM1_OC1PolarityConfig
7535                     	xdef	_TIM1_GenerateEvent
7536                     	xdef	_TIM1_OC4FastConfig
7537                     	xdef	_TIM1_OC3FastConfig
7538                     	xdef	_TIM1_OC2FastConfig
7539                     	xdef	_TIM1_OC1FastConfig
7540                     	xdef	_TIM1_OC4PreloadConfig
7541                     	xdef	_TIM1_OC3PreloadConfig
7542                     	xdef	_TIM1_OC2PreloadConfig
7543                     	xdef	_TIM1_OC1PreloadConfig
7544                     	xdef	_TIM1_CCPreloadControl
7545                     	xdef	_TIM1_SelectCOM
7546                     	xdef	_TIM1_ARRPreloadConfig
7547                     	xdef	_TIM1_ForcedOC4Config
7548                     	xdef	_TIM1_ForcedOC3Config
7549                     	xdef	_TIM1_ForcedOC2Config
7550                     	xdef	_TIM1_ForcedOC1Config
7551                     	xdef	_TIM1_CounterModeConfig
7552                     	xdef	_TIM1_PrescalerConfig
7553                     	xdef	_TIM1_EncoderInterfaceConfig
7554                     	xdef	_TIM1_SelectMasterSlaveMode
7555                     	xdef	_TIM1_SelectSlaveMode
7556                     	xdef	_TIM1_SelectOutputTrigger
7557                     	xdef	_TIM1_SelectOnePulseMode
7558                     	xdef	_TIM1_SelectHallSensor
7559                     	xdef	_TIM1_UpdateRequestConfig
7560                     	xdef	_TIM1_UpdateDisableConfig
7561                     	xdef	_TIM1_SelectInputTrigger
7562                     	xdef	_TIM1_TIxExternalClockConfig
7563                     	xdef	_TIM1_ETRConfig
7564                     	xdef	_TIM1_ETRClockMode2Config
7565                     	xdef	_TIM1_ETRClockMode1Config
7566                     	xdef	_TIM1_InternalClockConfig
7567                     	xdef	_TIM1_ITConfig
7568                     	xdef	_TIM1_CtrlPWMOutputs
7569                     	xdef	_TIM1_Cmd
7570                     	xdef	_TIM1_PWMIConfig
7571                     	xdef	_TIM1_ICInit
7572                     	xdef	_TIM1_BDTRConfig
7573                     	xdef	_TIM1_OC4Init
7574                     	xdef	_TIM1_OC3Init
7575                     	xdef	_TIM1_OC2Init
7576                     	xdef	_TIM1_OC1Init
7577                     	xdef	_TIM1_TimeBaseInit
7578                     	xdef	_TIM1_DeInit
7597                     	end
