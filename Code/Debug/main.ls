   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  16                     .const:	section	.text
  17  0000               _notes:
  18  0000 06a4          	dc.w	1700
  19  0002 06a4          	dc.w	1700
  20  0004 0000          	dc.w	0
  21  0006 06a4          	dc.w	1700
  22  0008 0547          	dc.w	1351
  23  000a 0547          	dc.w	1351
  24  000c 0000          	dc.w	0
  25  000e 0547          	dc.w	1351
  26  0010 04fb          	dc.w	1275
  27  0012 0000          	dc.w	0
  28  0014 04fb          	dc.w	1275
  29  0016 03f4          	dc.w	1012
  30  0018 0000          	dc.w	0
  31  001a 03f4          	dc.w	1012
  32  001c 0470          	dc.w	1136
  33  001e 0000          	dc.w	0
  34  0020 0547          	dc.w	1351
  35  0022 0547          	dc.w	1351
  36  0024 0000          	dc.w	0
  37  0026 0547          	dc.w	1351
  38  0028 04fb          	dc.w	1275
  39  002a 04fb          	dc.w	1275
  40  002c 0000          	dc.w	0
  41  002e 04fb          	dc.w	1275
  42  0030 0470          	dc.w	1136
  43  0032 0470          	dc.w	1136
  44  0034 0000          	dc.w	0
  45  0036 03f4          	dc.w	1012
  46  0038 013e          	dc.w	318
  47  003a 0151          	dc.w	337
  48  003c 0470          	dc.w	1136
  49  003e 017b          	dc.w	379
  50  0040 06a4          	dc.w	1700
  51  0042 06a4          	dc.w	1700
  52  0044 0151          	dc.w	337
  53  0046 06a4          	dc.w	1700
  54  0048 0547          	dc.w	1351
  55  004a 0547          	dc.w	1351
  56  004c 0353          	dc.w	851
  57  004e 0547          	dc.w	1351
  58  0050 04fb          	dc.w	1275
  59  0052 0000          	dc.w	0
  60  0054 04fb          	dc.w	1275
  61  0056 03f4          	dc.w	1012
  62  0058 013e          	dc.w	318
  63  005a 0151          	dc.w	337
  64  005c 0470          	dc.w	1136
  65  005e 017b          	dc.w	379
  66  0060 06a4          	dc.w	1700
  67  0062 06a4          	dc.w	1700
  68  0064 0151          	dc.w	337
  69  0066 06a4          	dc.w	1700
  70  0068 01a9          	dc.w	425
  71  006a 0547          	dc.w	1351
  72  006c 017b          	dc.w	379
  73  006e 0238          	dc.w	568
  74  0070 04fb          	dc.w	1275
  75  0072 0000          	dc.w	0
  76  0074 04fb          	dc.w	1275
  77  0076 03f4          	dc.w	1012
  78  0078 0000          	dc.w	0
  79  007a 03f4          	dc.w	1012
  80  007c 0470          	dc.w	1136
  81  007e 0000          	dc.w	0
  82  0080 017b          	dc.w	379
  83  0082 0353          	dc.w	851
  84  0084 0151          	dc.w	337
  85  0086 013e          	dc.w	318
  86  0088 027d          	dc.w	637
  87  008a 017b          	dc.w	379
  88  008c 017b          	dc.w	379
  89  008e 0000          	dc.w	0
  90  0090 01c2          	dc.w	450
  91  0092 0386          	dc.w	902
  92  0094 01a9          	dc.w	425
  93  0096 017b          	dc.w	379
  94  0098 02f6          	dc.w	758
  95  009a 0238          	dc.w	568
  96  009c 0470          	dc.w	1136
  97  009e 0000          	dc.w	0
  98  00a0 0238          	dc.w	568
  99  00a2 0238          	dc.w	568
 100  00a4 0238          	dc.w	568
 101  00a6 06a4          	dc.w	1700
 102  00a8 0547          	dc.w	1351
 103  00aa 0547          	dc.w	1351
 104  00ac 0353          	dc.w	851
 105  00ae 0547          	dc.w	1351
 106  00b0 04fb          	dc.w	1275
 107  00b2 0000          	dc.w	0
 108  00b4 04fb          	dc.w	1275
 109  00b6 03f4          	dc.w	1012
 110  00b8 013e          	dc.w	318
 111  00ba 0151          	dc.w	337
 112  00bc 0470          	dc.w	1136
 113  00be 017b          	dc.w	379
 114  00c0 06a4          	dc.w	1700
 115  00c2 06a4          	dc.w	1700
 116  00c4 0151          	dc.w	337
 117  00c6 06a4          	dc.w	1700
 118  00c8 0547          	dc.w	1351
 119  00ca 0547          	dc.w	1351
 120  00cc 0353          	dc.w	851
 121  00ce 0547          	dc.w	1351
 122  00d0 04fb          	dc.w	1275
 123  00d2 0000          	dc.w	0
 124  00d4 04fb          	dc.w	1275
 125  00d6 03f4          	dc.w	1012
 126  00d8 013e          	dc.w	318
 127  00da 0151          	dc.w	337
 128  00dc 0470          	dc.w	1136
 129  00de 017b          	dc.w	379
 130  00e0 06a4          	dc.w	1700
 131  00e2 06a4          	dc.w	1700
 132  00e4 0151          	dc.w	337
 133  00e6 06a4          	dc.w	1700
 134  00e8 01a9          	dc.w	425
 135  00ea 0547          	dc.w	1351
 136  00ec 017b          	dc.w	379
 137  00ee 0238          	dc.w	568
 138  00f0 04fb          	dc.w	1275
 139  00f2 0000          	dc.w	0
 140  00f4 04fb          	dc.w	1275
 141  00f6 03f4          	dc.w	1012
 142  00f8 0000          	dc.w	0
 143  00fa 03f4          	dc.w	1012
 144  00fc 0470          	dc.w	1136
 145  00fe 0000          	dc.w	0
 146  0100 017b          	dc.w	379
 147  0102 0353          	dc.w	851
 148  0104 0151          	dc.w	337
 149  0106 013e          	dc.w	318
 150  0108 027d          	dc.w	637
 151  010a 017b          	dc.w	379
 152  010c 017b          	dc.w	379
 153  010e 0000          	dc.w	0
 154  0110 01c2          	dc.w	450
 155  0112 0386          	dc.w	902
 156  0114 01a9          	dc.w	425
 157  0116 017b          	dc.w	379
 158  0118 02f6          	dc.w	758
 159  011a 0238          	dc.w	568
 160  011c 0470          	dc.w	1136
 161  011e 0000          	dc.w	0
 162  0120 0218          	dc.w	536
 163  0122 0218          	dc.w	536
 164  0124 0430          	dc.w	1072
 165  0126 01a9          	dc.w	425
 166  0128 01a9          	dc.w	425
 167  012a 0353          	dc.w	851
 168  012c 0165          	dc.w	357
 169  012e 0165          	dc.w	357
 170  0130 0165          	dc.w	357
 171  0132 0000          	dc.w	0
 172  0134 011c          	dc.w	284
 173  0136 010c          	dc.w	268
 174  0138 011c          	dc.w	284
 175  013a 0165          	dc.w	357
 176  013c 01a9          	dc.w	425
 177  013e 0000          	dc.w	0
 178  0140 0218          	dc.w	536
 179  0142 0218          	dc.w	536
 180  0144 02f6          	dc.w	758
 181  0146 01c2          	dc.w	450
 182  0148 01c2          	dc.w	450
 183  014a 0386          	dc.w	902
 184  014c 017b          	dc.w	379
 185  014e 017b          	dc.w	379
 186  0150 017b          	dc.w	379
 187  0152 0000          	dc.w	0
 188  0154 013e          	dc.w	318
 189  0156 011c          	dc.w	284
 190  0158 013e          	dc.w	318
 191  015a 017b          	dc.w	379
 192  015c 01c2          	dc.w	450
 193  015e 0000          	dc.w	0
 194                     	bsct
 195  0000               _current_note:
 196  0000 00            	dc.b	0
 227                     ; 56 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 227                     ; 57 {
 228                     .text:	section	.text,new
 229  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 231  0000 8a            	push	cc
 232  0001 84            	pop	a
 233  0002 a4bf          	and	a,#191
 234  0004 88            	push	a
 235  0005 86            	pop	cc
 236  0006 3b0002        	push	c_x+2
 237  0009 be00          	ldw	x,c_x
 238  000b 89            	pushw	x
 239  000c 3b0002        	push	c_y+2
 240  000f be00          	ldw	x,c_y
 241  0011 89            	pushw	x
 244                     ; 58 	GPIO_WriteReverse(GPIOC, GPIO_PIN_7);		// toggle buzzer state
 246  0012 4b80          	push	#128
 247  0014 ae500a        	ldw	x,#20490
 248  0017 cd0000        	call	_GPIO_WriteReverse
 250  001a 84            	pop	a
 251                     ; 59 	TIM1->SR1 &= (uint8_t) ~TIM1_SR1_UIF;		// clear interrupt flag
 253  001b 72115255      	bres	21077,#0
 254                     ; 60 }
 257  001f 85            	popw	x
 258  0020 bf00          	ldw	c_y,x
 259  0022 320002        	pop	c_y+2
 260  0025 85            	popw	x
 261  0026 bf00          	ldw	c_x,x
 262  0028 320002        	pop	c_x+2
 263  002b 80            	iret
 290                     ; 62  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 290                     ; 63 {
 291                     .text:	section	.text,new
 292  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 294  0000 8a            	push	cc
 295  0001 84            	pop	a
 296  0002 a4bf          	and	a,#191
 297  0004 88            	push	a
 298  0005 86            	pop	cc
 299  0006 3b0002        	push	c_x+2
 300  0009 be00          	ldw	x,c_x
 301  000b 89            	pushw	x
 302  000c 3b0002        	push	c_y+2
 303  000f be00          	ldw	x,c_y
 304  0011 89            	pushw	x
 307                     ; 64 	if (notes[current_note] == 0) {
 309  0012 b600          	ld	a,_current_note
 310  0014 5f            	clrw	x
 311  0015 97            	ld	xl,a
 312  0016 58            	sllw	x
 313  0017 d60001        	ld	a,(_notes+1,x)
 314  001a da0000        	or	a,(_notes,x)
 315  001d 2606          	jrne	L13
 316                     ; 65 			TIM1_Cmd(DISABLE);  // stop TIM1 if the note is 0
 318  001f 4f            	clr	a
 319  0020 cd0000        	call	_TIM1_Cmd
 322  0023 2010          	jra	L33
 323  0025               L13:
 324                     ; 67 			TIM1_SetAutoreload(notes[current_note]);
 326  0025 b600          	ld	a,_current_note
 327  0027 5f            	clrw	x
 328  0028 97            	ld	xl,a
 329  0029 58            	sllw	x
 330  002a de0000        	ldw	x,(_notes,x)
 331  002d cd0000        	call	_TIM1_SetAutoreload
 333                     ; 68 			TIM1_Cmd(ENABLE);   // start TIM1
 335  0030 a601          	ld	a,#1
 336  0032 cd0000        	call	_TIM1_Cmd
 338  0035               L33:
 339                     ; 70 	current_note = (current_note + 1) % 176;
 341  0035 b600          	ld	a,_current_note
 342  0037 5f            	clrw	x
 343  0038 97            	ld	xl,a
 344  0039 5c            	incw	x
 345  003a 90ae00b0      	ldw	y,#176
 346  003e cd0000        	call	c_idiv
 348  0041 51            	exgw	x,y
 349  0042 01            	rrwa	x,a
 350  0043 b700          	ld	_current_note,a
 351  0045 02            	rlwa	x,a
 352                     ; 71 	TIM2->SR1 &= (uint8_t) ~TIM2_SR1_UIF;		// clear interrupt flag
 354  0046 72115304      	bres	21252,#0
 355                     ; 72 }
 358  004a 85            	popw	x
 359  004b bf00          	ldw	c_y,x
 360  004d 320002        	pop	c_y+2
 361  0050 85            	popw	x
 362  0051 bf00          	ldw	c_x,x
 363  0053 320002        	pop	c_x+2
 364  0056 80            	iret
 397                     ; 74 int main(void)
 397                     ; 75 {
 399                     .text:	section	.text,new
 400  0000               _main:
 404                     ; 76 	disableInterrupts(); // disable interrupts temporarily
 407  0000 9b            sim
 409                     ; 77   GPIO_DeInit(GPIOC); // deinitialize port C
 412  0001 ae500a        	ldw	x,#20490
 413  0004 cd0000        	call	_GPIO_DeInit
 415                     ; 79 	GPIO_Init (GPIOC, GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_SLOW); //Declare PC7 as a default low push-pull output pin
 417  0007 4bc0          	push	#192
 418  0009 4b80          	push	#128
 419  000b ae500a        	ldw	x,#20490
 420  000e cd0000        	call	_GPIO_Init
 422  0011 85            	popw	x
 423                     ; 81 	TIM1_TimeBaseInit(1, TIM1_COUNTERMODE_UP, notes[0], 0);
 425  0012 4b00          	push	#0
 426  0014 ae06a4        	ldw	x,#1700
 427  0017 89            	pushw	x
 428  0018 4b00          	push	#0
 429  001a ae0001        	ldw	x,#1
 430  001d cd0000        	call	_TIM1_TimeBaseInit
 432  0020 5b04          	addw	sp,#4
 433                     ; 82 	TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);
 435  0022 ae0101        	ldw	x,#257
 436  0025 cd0000        	call	_TIM1_ITConfig
 438                     ; 83 	TIM1->CR1 |= TIM1_CR1_ARPE; // enable shadow register for period
 440  0028 721e5250      	bset	21072,#7
 441                     ; 84 	TIM1_Cmd(ENABLE);
 443  002c a601          	ld	a,#1
 444  002e cd0000        	call	_TIM1_Cmd
 446                     ; 86 	TIM2_TimeBaseInit(TIM2_PRESCALER_256, ((uint16_t) (F_CLK / 512)));
 448  0031 ae03d0        	ldw	x,#976
 449  0034 89            	pushw	x
 450  0035 a608          	ld	a,#8
 451  0037 cd0000        	call	_TIM2_TimeBaseInit
 453  003a 85            	popw	x
 454                     ; 87 	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
 456  003b ae0101        	ldw	x,#257
 457  003e cd0000        	call	_TIM2_ITConfig
 459                     ; 88 	TIM2_Cmd(ENABLE);
 461  0041 a601          	ld	a,#1
 462  0043 cd0000        	call	_TIM2_Cmd
 464                     ; 90 	enableInterrupts(); // re-enable interrupts
 467  0046 9a            rim
 469  0047               L54:
 471  0047 20fe          	jra	L54
 505                     	xdef	_main
 506                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 507                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 508                     	xdef	_current_note
 509                     	xdef	_notes
 510                     	xref	_TIM2_ITConfig
 511                     	xref	_TIM2_Cmd
 512                     	xref	_TIM2_TimeBaseInit
 513                     	xref	_TIM1_SetAutoreload
 514                     	xref	_TIM1_ITConfig
 515                     	xref	_TIM1_Cmd
 516                     	xref	_TIM1_TimeBaseInit
 517                     	xref	_GPIO_WriteReverse
 518                     	xref	_GPIO_Init
 519                     	xref	_GPIO_DeInit
 520                     	xref.b	c_x
 521                     	xref.b	c_y
 540                     	xref	c_idiv
 541                     	end
