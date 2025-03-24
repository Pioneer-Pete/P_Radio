   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  65                     ; 35 void HD44780_config(uint8_t disp_attr)
  65                     ; 36 {
  67                     .text:	section	.text,new
  68  0000               _HD44780_config:
  70  0000 88            	push	a
  71       00000000      OFST:	set	0
  74                     ; 37 	DELAY_ms(HD44780_DELAY_POWER_ON);
  76  0001 ae0032        	ldw	x,#50
  77  0004 89            	pushw	x
  78  0005 ae0000        	ldw	x,#0
  79  0008 89            	pushw	x
  80  0009 cd0000        	call	_DELAY_ms
  82  000c 5b04          	addw	sp,#4
  83                     ; 39 	GPIO_Init(HD44780_GPIO_CONTROL, HD44780_PIN_RS, GPIO_MODE_OUT_PP_LOW_FAST);
  85  000e 4be0          	push	#224
  86  0010 4b10          	push	#16
  87  0012 ae500f        	ldw	x,#20495
  88  0015 cd0000        	call	_GPIO_Init
  90  0018 85            	popw	x
  91                     ; 40 	GPIO_Init(HD44780_GPIO_CONTROL, HD44780_PIN_RW, GPIO_MODE_OUT_PP_LOW_FAST);
  93  0019 4be0          	push	#224
  94  001b 4b20          	push	#32
  95  001d ae500f        	ldw	x,#20495
  96  0020 cd0000        	call	_GPIO_Init
  98  0023 85            	popw	x
  99                     ; 41 	GPIO_Init(HD44780_GPIO_CONTROL, HD44780_PIN_EN, GPIO_MODE_OUT_PP_LOW_FAST);
 101  0024 4be0          	push	#224
 102  0026 4b40          	push	#64
 103  0028 ae500f        	ldw	x,#20495
 104  002b cd0000        	call	_GPIO_Init
 106  002e 85            	popw	x
 107                     ; 43 	GPIO_Init(HD44780_GPIO_DATA, HD44780_PIN_D4, GPIO_MODE_OUT_PP_LOW_FAST);
 109  002f 4be0          	push	#224
 110  0031 4b08          	push	#8
 111  0033 ae500a        	ldw	x,#20490
 112  0036 cd0000        	call	_GPIO_Init
 114  0039 85            	popw	x
 115                     ; 44 	GPIO_Init(HD44780_GPIO_DATA, HD44780_PIN_D5, GPIO_MODE_OUT_PP_LOW_FAST);
 117  003a 4be0          	push	#224
 118  003c 4b10          	push	#16
 119  003e ae500a        	ldw	x,#20490
 120  0041 cd0000        	call	_GPIO_Init
 122  0044 85            	popw	x
 123                     ; 45 	GPIO_Init(HD44780_GPIO_DATA, HD44780_PIN_D6, GPIO_MODE_OUT_PP_LOW_FAST);
 125  0045 4be0          	push	#224
 126  0047 4b40          	push	#64
 127  0049 ae500a        	ldw	x,#20490
 128  004c cd0000        	call	_GPIO_Init
 130  004f 85            	popw	x
 131                     ; 46 	GPIO_Init(HD44780_GPIO_DATA, HD44780_PIN_D7, GPIO_MODE_OUT_PP_LOW_FAST);
 133  0050 4be0          	push	#224
 134  0052 4b80          	push	#128
 135  0054 ae500a        	ldw	x,#20490
 136  0057 cd0000        	call	_GPIO_Init
 138  005a 85            	popw	x
 139                     ; 49 	DELAY_ms(HD44780_DELAY_POWER_ON);										 // Delay power on
 141  005b ae0032        	ldw	x,#50
 142  005e 89            	pushw	x
 143  005f ae0000        	ldw	x,#0
 144  0062 89            	pushw	x
 145  0063 cd0000        	call	_DELAY_ms
 147  0066 5b04          	addw	sp,#4
 148                     ; 51 	GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D5);
 150  0068 4b10          	push	#16
 151  006a ae500a        	ldw	x,#20490
 152  006d cd0000        	call	_GPIO_WriteHigh
 154  0070 84            	pop	a
 155                     ; 52 	GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D4);
 157  0071 4b08          	push	#8
 158  0073 ae500a        	ldw	x,#20490
 159  0076 cd0000        	call	_GPIO_WriteHigh
 161  0079 84            	pop	a
 162                     ; 53 	HD44780_toggle_e();
 164  007a cd0000        	call	L3_HD44780_toggle_e
 166                     ; 55 	DELAY_ms(HD44780_DELAY_INIT);											 // Delay, busy flag can't be checked here
 168  007d ae000a        	ldw	x,#10
 169  0080 89            	pushw	x
 170  0081 ae0000        	ldw	x,#0
 171  0084 89            	pushw	x
 172  0085 cd0000        	call	_DELAY_ms
 174  0088 5b04          	addw	sp,#4
 175                     ; 56 	HD44780_toggle_e();														 // Repeat last command
 177  008a cd0000        	call	L3_HD44780_toggle_e
 179                     ; 57 	DELAY_us(HD44780_DELAY_INIT_REP);									 	// Delay, busy flag can't be checked here
 181  008d ae0080        	ldw	x,#128
 182  0090 89            	pushw	x
 183  0091 ae0000        	ldw	x,#0
 184  0094 89            	pushw	x
 185  0095 cd0000        	call	_DELAY_us
 187  0098 5b04          	addw	sp,#4
 188                     ; 58 	HD44780_toggle_e();														 // Repeat last command for third time
 190  009a cd0000        	call	L3_HD44780_toggle_e
 192                     ; 59 	DELAY_us(HD44780_DELAY_INIT_REP);									 	// Delay, busy flag can't be checked here
 194  009d ae0080        	ldw	x,#128
 195  00a0 89            	pushw	x
 196  00a1 ae0000        	ldw	x,#0
 197  00a4 89            	pushw	x
 198  00a5 cd0000        	call	_DELAY_us
 200  00a8 5b04          	addw	sp,#4
 201                     ; 61 	GPIO_WriteLow(HD44780_GPIO_DATA, HD44780_PIN_D4);
 203  00aa 4b08          	push	#8
 204  00ac ae500a        	ldw	x,#20490
 205  00af cd0000        	call	_GPIO_WriteLow
 207  00b2 84            	pop	a
 208                     ; 62 	HD44780_toggle_e();
 210  00b3 cd0000        	call	L3_HD44780_toggle_e
 212                     ; 63 	DELAY_us(HD44780_DELAY_INIT_4BIT);
 214  00b6 ae0080        	ldw	x,#128
 215  00b9 89            	pushw	x
 216  00ba ae0000        	ldw	x,#0
 217  00bd 89            	pushw	x
 218  00be cd0000        	call	_DELAY_us
 220  00c1 5b04          	addw	sp,#4
 221                     ; 67 	HD44780_write_command(HD44780_FUNCTION_SET | HD44780_4BIT_INTERFACE | HD44780_2LINE_MODE | HD44780_5X7DOT_FORMAT);
 223  00c3 a628          	ld	a,#40
 224  00c5 cd0000        	call	_HD44780_write_command
 226                     ; 68 	HD44780_write_command(HD44780_DISPLAY_CURSOR_ON_OFF | HD44780_DISPLAY_OFF);		 // Display off
 228  00c8 a608          	ld	a,#8
 229  00ca cd0000        	call	_HD44780_write_command
 231                     ; 69 	HD44780_clrscr();														 // Clear screen
 233  00cd cd0000        	call	_HD44780_clrscr
 235                     ; 70 	HD44780_entry_inc();													 // Entry mode
 237  00d0 cd0000        	call	_HD44780_entry_inc
 239                     ; 72 	display_cursor_on_off_control = disp_attr;							 // Display cursor on off
 241  00d3 7b01          	ld	a,(OFST+1,sp)
 242  00d5 b700          	ld	L7_display_cursor_on_off_control,a
 243                     ; 73 	HD44780_write_command( (uint8_t) (HD44780_DISPLAY_CURSOR_ON_OFF | display_cursor_on_off_control));
 245  00d7 b600          	ld	a,L7_display_cursor_on_off_control
 246  00d9 aa08          	or	a,#8
 247  00db cd0000        	call	_HD44780_write_command
 249                     ; 74 }
 252  00de 84            	pop	a
 253  00df 81            	ret
 290                     ; 77 void HD44780_write_command(uint8_t cmd)
 290                     ; 78 {
 291                     .text:	section	.text,new
 292  0000               _HD44780_write_command:
 294  0000 88            	push	a
 295       00000000      OFST:	set	0
 298                     ; 80 	DELAY_us(1000);
 300  0001 ae03e8        	ldw	x,#1000
 301  0004 89            	pushw	x
 302  0005 ae0000        	ldw	x,#0
 303  0008 89            	pushw	x
 304  0009 cd0000        	call	_DELAY_us
 306  000c 5b04          	addw	sp,#4
 307                     ; 81 	HD44780_write(cmd, 0);
 309  000e 7b01          	ld	a,(OFST+1,sp)
 310  0010 5f            	clrw	x
 311  0011 95            	ld	xh,a
 312  0012 cd0000        	call	L5_HD44780_write
 314                     ; 82 }
 317  0015 84            	pop	a
 318  0016 81            	ret
 354                     ; 85 void HD44780_write_data(uint8_t data)
 354                     ; 86 {
 355                     .text:	section	.text,new
 356  0000               _HD44780_write_data:
 358  0000 88            	push	a
 359       00000000      OFST:	set	0
 362                     ; 88 	DELAY_us(2);
 364  0001 ae0002        	ldw	x,#2
 365  0004 89            	pushw	x
 366  0005 ae0000        	ldw	x,#0
 367  0008 89            	pushw	x
 368  0009 cd0000        	call	_DELAY_us
 370  000c 5b04          	addw	sp,#4
 371                     ; 89 	HD44780_write(data, 1);
 373  000e 7b01          	ld	a,(OFST+1,sp)
 374  0010 ae0001        	ldw	x,#1
 375  0013 95            	ld	xh,a
 376  0014 cd0000        	call	L5_HD44780_write
 378                     ; 90 }
 381  0017 84            	pop	a
 382  0018 81            	ret
 408                     ; 93 static void HD44780_toggle_e()
 408                     ; 94 {
 409                     .text:	section	.text,new
 410  0000               L3_HD44780_toggle_e:
 414                     ; 96 	GPIO_WriteHigh(HD44780_GPIO_CONTROL, HD44780_PIN_EN);
 416  0000 4b40          	push	#64
 417  0002 ae500f        	ldw	x,#20495
 418  0005 cd0000        	call	_GPIO_WriteHigh
 420  0008 84            	pop	a
 421                     ; 97 	DELAY_us(HD44780_DELAY_ENABLE_PULSE);								// Pulse length in us (50)
 423  0009 ae0002        	ldw	x,#2
 424  000c 89            	pushw	x
 425  000d ae0000        	ldw	x,#0
 426  0010 89            	pushw	x
 427  0011 cd0000        	call	_DELAY_us
 429  0014 5b04          	addw	sp,#4
 430                     ; 98 	GPIO_WriteLow(HD44780_GPIO_CONTROL, HD44780_PIN_EN);
 432  0016 4b40          	push	#64
 433  0018 ae500f        	ldw	x,#20495
 434  001b cd0000        	call	_GPIO_WriteLow
 436  001e 84            	pop	a
 437                     ; 99 	DELAY_us(1);
 439  001f ae0001        	ldw	x,#1
 440  0022 89            	pushw	x
 441  0023 ae0000        	ldw	x,#0
 442  0026 89            	pushw	x
 443  0027 cd0000        	call	_DELAY_us
 445  002a 5b04          	addw	sp,#4
 446                     ; 100 }
 449  002c 81            	ret
 495                     ; 103 static void HD44780_write(uint8_t data, uint8_t rs)
 495                     ; 104 {
 496                     .text:	section	.text,new
 497  0000               L5_HD44780_write:
 499  0000 89            	pushw	x
 500       00000000      OFST:	set	0
 503                     ; 105 	GPIO_WriteLow(HD44780_GPIO_CONTROL, HD44780_PIN_RW);
 505  0001 4b20          	push	#32
 506  0003 ae500f        	ldw	x,#20495
 507  0006 cd0000        	call	_GPIO_WriteLow
 509  0009 84            	pop	a
 510                     ; 107 	if (rs)
 512  000a 0d02          	tnz	(OFST+2,sp)
 513  000c 270b          	jreq	L321
 514                     ; 108 		GPIO_WriteHigh(HD44780_GPIO_CONTROL, HD44780_PIN_RS);
 516  000e 4b10          	push	#16
 517  0010 ae500f        	ldw	x,#20495
 518  0013 cd0000        	call	_GPIO_WriteHigh
 520  0016 84            	pop	a
 522  0017 2009          	jra	L521
 523  0019               L321:
 524                     ; 110 		GPIO_WriteLow(HD44780_GPIO_CONTROL, HD44780_PIN_RS);
 526  0019 4b10          	push	#16
 527  001b ae500f        	ldw	x,#20495
 528  001e cd0000        	call	_GPIO_WriteLow
 530  0021 84            	pop	a
 531  0022               L521:
 532                     ; 112 	GPIO_WriteLow(HD44780_GPIO_DATA, HD44780_PIN_D7);
 534  0022 4b80          	push	#128
 535  0024 ae500a        	ldw	x,#20490
 536  0027 cd0000        	call	_GPIO_WriteLow
 538  002a 84            	pop	a
 539                     ; 113 	GPIO_WriteLow(HD44780_GPIO_DATA, HD44780_PIN_D6);
 541  002b 4b40          	push	#64
 542  002d ae500a        	ldw	x,#20490
 543  0030 cd0000        	call	_GPIO_WriteLow
 545  0033 84            	pop	a
 546                     ; 114 	GPIO_WriteLow(HD44780_GPIO_DATA, HD44780_PIN_D5);
 548  0034 4b10          	push	#16
 549  0036 ae500a        	ldw	x,#20490
 550  0039 cd0000        	call	_GPIO_WriteLow
 552  003c 84            	pop	a
 553                     ; 115 	GPIO_WriteLow(HD44780_GPIO_DATA, HD44780_PIN_D4);
 555  003d 4b08          	push	#8
 556  003f ae500a        	ldw	x,#20490
 557  0042 cd0000        	call	_GPIO_WriteLow
 559  0045 84            	pop	a
 560                     ; 117 	if (data & 0x80) GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D7);
 562  0046 7b01          	ld	a,(OFST+1,sp)
 563  0048 a580          	bcp	a,#128
 564  004a 2709          	jreq	L721
 567  004c 4b80          	push	#128
 568  004e ae500a        	ldw	x,#20490
 569  0051 cd0000        	call	_GPIO_WriteHigh
 571  0054 84            	pop	a
 572  0055               L721:
 573                     ; 118 	if (data & 0x40) GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D6);
 575  0055 7b01          	ld	a,(OFST+1,sp)
 576  0057 a540          	bcp	a,#64
 577  0059 2709          	jreq	L131
 580  005b 4b40          	push	#64
 581  005d ae500a        	ldw	x,#20490
 582  0060 cd0000        	call	_GPIO_WriteHigh
 584  0063 84            	pop	a
 585  0064               L131:
 586                     ; 119 	if (data & 0x20) GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D5);
 588  0064 7b01          	ld	a,(OFST+1,sp)
 589  0066 a520          	bcp	a,#32
 590  0068 2709          	jreq	L331
 593  006a 4b10          	push	#16
 594  006c ae500a        	ldw	x,#20490
 595  006f cd0000        	call	_GPIO_WriteHigh
 597  0072 84            	pop	a
 598  0073               L331:
 599                     ; 120 	if (data & 0x10) GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D4);
 601  0073 7b01          	ld	a,(OFST+1,sp)
 602  0075 a510          	bcp	a,#16
 603  0077 2709          	jreq	L531
 606  0079 4b08          	push	#8
 607  007b ae500a        	ldw	x,#20490
 608  007e cd0000        	call	_GPIO_WriteHigh
 610  0081 84            	pop	a
 611  0082               L531:
 612                     ; 122 	HD44780_toggle_e();
 614  0082 cd0000        	call	L3_HD44780_toggle_e
 616                     ; 124 	GPIO_WriteLow(HD44780_GPIO_DATA, HD44780_PIN_D7);
 618  0085 4b80          	push	#128
 619  0087 ae500a        	ldw	x,#20490
 620  008a cd0000        	call	_GPIO_WriteLow
 622  008d 84            	pop	a
 623                     ; 125 	GPIO_WriteLow(HD44780_GPIO_DATA, HD44780_PIN_D6);
 625  008e 4b40          	push	#64
 626  0090 ae500a        	ldw	x,#20490
 627  0093 cd0000        	call	_GPIO_WriteLow
 629  0096 84            	pop	a
 630                     ; 126 	GPIO_WriteLow(HD44780_GPIO_DATA, HD44780_PIN_D5);
 632  0097 4b10          	push	#16
 633  0099 ae500a        	ldw	x,#20490
 634  009c cd0000        	call	_GPIO_WriteLow
 636  009f 84            	pop	a
 637                     ; 127 	GPIO_WriteLow(HD44780_GPIO_DATA, HD44780_PIN_D4);
 639  00a0 4b08          	push	#8
 640  00a2 ae500a        	ldw	x,#20490
 641  00a5 cd0000        	call	_GPIO_WriteLow
 643  00a8 84            	pop	a
 644                     ; 129 	if (data & 0x08) GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D7);
 646  00a9 7b01          	ld	a,(OFST+1,sp)
 647  00ab a508          	bcp	a,#8
 648  00ad 2709          	jreq	L731
 651  00af 4b80          	push	#128
 652  00b1 ae500a        	ldw	x,#20490
 653  00b4 cd0000        	call	_GPIO_WriteHigh
 655  00b7 84            	pop	a
 656  00b8               L731:
 657                     ; 130 	if (data & 0x04) GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D6);
 659  00b8 7b01          	ld	a,(OFST+1,sp)
 660  00ba a504          	bcp	a,#4
 661  00bc 2709          	jreq	L141
 664  00be 4b40          	push	#64
 665  00c0 ae500a        	ldw	x,#20490
 666  00c3 cd0000        	call	_GPIO_WriteHigh
 668  00c6 84            	pop	a
 669  00c7               L141:
 670                     ; 131 	if (data & 0x02) GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D5);
 672  00c7 7b01          	ld	a,(OFST+1,sp)
 673  00c9 a502          	bcp	a,#2
 674  00cb 2709          	jreq	L341
 677  00cd 4b10          	push	#16
 678  00cf ae500a        	ldw	x,#20490
 679  00d2 cd0000        	call	_GPIO_WriteHigh
 681  00d5 84            	pop	a
 682  00d6               L341:
 683                     ; 132 	if (data & 0x01) GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D4);
 685  00d6 7b01          	ld	a,(OFST+1,sp)
 686  00d8 a501          	bcp	a,#1
 687  00da 2709          	jreq	L541
 690  00dc 4b08          	push	#8
 691  00de ae500a        	ldw	x,#20490
 692  00e1 cd0000        	call	_GPIO_WriteHigh
 694  00e4 84            	pop	a
 695  00e5               L541:
 696                     ; 134 	HD44780_toggle_e();
 698  00e5 cd0000        	call	L3_HD44780_toggle_e
 700                     ; 136 	GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D7);
 702  00e8 4b80          	push	#128
 703  00ea ae500a        	ldw	x,#20490
 704  00ed cd0000        	call	_GPIO_WriteHigh
 706  00f0 84            	pop	a
 707                     ; 137 	GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D6);
 709  00f1 4b40          	push	#64
 710  00f3 ae500a        	ldw	x,#20490
 711  00f6 cd0000        	call	_GPIO_WriteHigh
 713  00f9 84            	pop	a
 714                     ; 138 	GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D5);
 716  00fa 4b10          	push	#16
 717  00fc ae500a        	ldw	x,#20490
 718  00ff cd0000        	call	_GPIO_WriteHigh
 720  0102 84            	pop	a
 721                     ; 139 	GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D4);
 723  0103 4b08          	push	#8
 724  0105 ae500a        	ldw	x,#20490
 725  0108 cd0000        	call	_GPIO_WriteHigh
 727  010b 84            	pop	a
 728                     ; 140 }
 731  010c 85            	popw	x
 732  010d 81            	ret
 776                     ; 143 void HD44780_gotoxy(uint8_t x, uint8_t y)
 776                     ; 144 {
 777                     .text:	section	.text,new
 778  0000               _HD44780_gotoxy:
 780  0000 89            	pushw	x
 781       00000000      OFST:	set	0
 784                     ; 149 	if (y == 0)
 786  0001 9f            	ld	a,xl
 787  0002 4d            	tnz	a
 788  0003 2608          	jrne	L171
 789                     ; 150 		HD44780_write_command((uint8_t) (HD44780_SET_DDRAM_ADDRESS | (HD44780_START_LINE_1 + x)));
 791  0005 9e            	ld	a,xh
 792  0006 aa80          	or	a,#128
 793  0008 cd0000        	call	_HD44780_write_command
 796  000b 2009          	jra	L371
 797  000d               L171:
 798                     ; 152 		HD44780_write_command(( uint8_t) (HD44780_SET_DDRAM_ADDRESS | (HD44780_START_LINE_2 + x)));
 800  000d 7b01          	ld	a,(OFST+1,sp)
 801  000f ab40          	add	a,#64
 802  0011 aa80          	or	a,#128
 803  0013 cd0000        	call	_HD44780_write_command
 805  0016               L371:
 806                     ; 165 }
 809  0016 85            	popw	x
 810  0017 81            	ret
 845                     ; 169 void HD44780_putc(const char c)
 845                     ; 170 {
 846                     .text:	section	.text,new
 847  0000               _HD44780_putc:
 851                     ; 171 	HD44780_write_data(c);
 853  0000 cd0000        	call	_HD44780_write_data
 855                     ; 172 }
 858  0003 81            	ret
 894                     ; 175 void HD44780_puts(const char* s)
 894                     ; 176 {
 895                     .text:	section	.text,new
 896  0000               _HD44780_puts:
 898  0000 89            	pushw	x
 899       00000000      OFST:	set	0
 902  0001 200e          	jra	L332
 903  0003               L132:
 904                     ; 177 	while (*s) HD44780_putc(*s++);
 906  0003 1e01          	ldw	x,(OFST+1,sp)
 907  0005 1c0001        	addw	x,#1
 908  0008 1f01          	ldw	(OFST+1,sp),x
 909  000a 1d0001        	subw	x,#1
 910  000d f6            	ld	a,(x)
 911  000e cd0000        	call	_HD44780_putc
 913  0011               L332:
 916  0011 1e01          	ldw	x,(OFST+1,sp)
 917  0013 7d            	tnz	(x)
 918  0014 26ed          	jrne	L132
 919                     ; 178 }
 922  0016 85            	popw	x
 923  0017 81            	ret
 948                     ; 181 void HD44780_clrscr()
 948                     ; 182 {
 949                     .text:	section	.text,new
 950  0000               _HD44780_clrscr:
 954                     ; 183 	HD44780_write_command(HD44780_CLEAR_DISPLAY);
 956  0000 a601          	ld	a,#1
 957  0002 cd0000        	call	_HD44780_write_command
 959                     ; 184 	DELAY_us(1000);
 961  0005 ae03e8        	ldw	x,#1000
 962  0008 89            	pushw	x
 963  0009 ae0000        	ldw	x,#0
 964  000c 89            	pushw	x
 965  000d cd0000        	call	_DELAY_us
 967  0010 5b04          	addw	sp,#4
 968                     ; 185 }
 971  0012 81            	ret
 995                     ; 188 void HD44780_home()
 995                     ; 189 {
 996                     .text:	section	.text,new
 997  0000               _HD44780_home:
1001                     ; 190 	HD44780_write_command(HD44780_CURSOR_HOME);
1003  0000 a602          	ld	a,#2
1004  0002 cd0000        	call	_HD44780_write_command
1006                     ; 191 }
1009  0005 81            	ret
1065                     ; 194 void HD44780_create_custom_char(uint8_t location, uint8_t* data_bytes)
1065                     ; 195 {
1066                     .text:	section	.text,new
1067  0000               _HD44780_create_custom_char:
1069  0000 88            	push	a
1070  0001 89            	pushw	x
1071       00000002      OFST:	set	2
1074                     ; 198 	location &= 0x07;													 // We only have 8 locations 0-7 for custom chars
1076  0002 7b03          	ld	a,(OFST+1,sp)
1077  0004 a407          	and	a,#7
1078  0006 6b03          	ld	(OFST+1,sp),a
1079                     ; 199 	HD44780_write_command((uint8_t) (HD44780_SET_CGRAM_ADDRESS | (location << 3)));			 // Set CGRAM address
1081  0008 7b03          	ld	a,(OFST+1,sp)
1082  000a 48            	sll	a
1083  000b 48            	sll	a
1084  000c 48            	sll	a
1085  000d aa40          	or	a,#64
1086  000f cd0000        	call	_HD44780_write_command
1088                     ; 200 	for (i = 0; i < 8; i++)												 // Write 8 bytes custom char pattern
1090  0012 5f            	clrw	x
1091  0013 1f01          	ldw	(OFST-1,sp),x
1093  0015               L503:
1094                     ; 202 		HD44780_write_data(data_bytes[i]);
1096  0015 1e01          	ldw	x,(OFST-1,sp)
1097  0017 72fb06        	addw	x,(OFST+4,sp)
1098  001a f6            	ld	a,(x)
1099  001b cd0000        	call	_HD44780_write_data
1101                     ; 200 	for (i = 0; i < 8; i++)												 // Write 8 bytes custom char pattern
1103  001e 1e01          	ldw	x,(OFST-1,sp)
1104  0020 1c0001        	addw	x,#1
1105  0023 1f01          	ldw	(OFST-1,sp),x
1109  0025 9c            	rvf
1110  0026 1e01          	ldw	x,(OFST-1,sp)
1111  0028 a30008        	cpw	x,#8
1112  002b 2fe8          	jrslt	L503
1113                     ; 204 }
1116  002d 5b03          	addw	sp,#3
1117  002f 81            	ret
1172                     ; 207 void HD44780_put_custom_char(uint8_t x, uint8_t y, uint8_t location)
1172                     ; 208 {
1173                     .text:	section	.text,new
1174  0000               _HD44780_put_custom_char:
1176  0000 89            	pushw	x
1177       00000000      OFST:	set	0
1180                     ; 209 	HD44780_gotoxy(x, y);
1182  0001 9f            	ld	a,xl
1183  0002 97            	ld	xl,a
1184  0003 7b01          	ld	a,(OFST+1,sp)
1185  0005 95            	ld	xh,a
1186  0006 cd0000        	call	_HD44780_gotoxy
1188                     ; 210 	HD44780_write_data(location);
1190  0009 7b05          	ld	a,(OFST+5,sp)
1191  000b cd0000        	call	_HD44780_write_data
1193                     ; 211 }
1196  000e 85            	popw	x
1197  000f 81            	ret
1221                     ; 217 void HD44780_entry_inc()
1221                     ; 218 {
1222                     .text:	section	.text,new
1223  0000               _HD44780_entry_inc:
1227                     ; 219 	HD44780_write_command(HD44780_CHARACTER_ENTRY_MODE | HD44780_INCREMENT | HD44780_DISPLAY_SHIFT_OFF);
1229  0000 a606          	ld	a,#6
1230  0002 cd0000        	call	_HD44780_write_command
1232                     ; 220 }
1235  0005 81            	ret
1259                     ; 223 void HD44780_entry_dec()
1259                     ; 224 {
1260                     .text:	section	.text,new
1261  0000               _HD44780_entry_dec:
1265                     ; 225 	HD44780_write_command(HD44780_CHARACTER_ENTRY_MODE | HD44780_DECREMENT | HD44780_DISPLAY_SHIFT_OFF);
1267  0000 a604          	ld	a,#4
1268  0002 cd0000        	call	_HD44780_write_command
1270                     ; 226 }
1273  0005 81            	ret
1298                     ; 229 void HD44780_entry_inc_shift()
1298                     ; 230 {
1299                     .text:	section	.text,new
1300  0000               _HD44780_entry_inc_shift:
1304                     ; 231 	HD44780_write_command(HD44780_CHARACTER_ENTRY_MODE | HD44780_INCREMENT | HD44780_DISPLAY_SHIFT_ON);
1306  0000 a607          	ld	a,#7
1307  0002 cd0000        	call	_HD44780_write_command
1309                     ; 232 }
1312  0005 81            	ret
1337                     ; 235 void HD44780_entry_dec_shift()
1337                     ; 236 {
1338                     .text:	section	.text,new
1339  0000               _HD44780_entry_dec_shift:
1343                     ; 237 	HD44780_write_command(HD44780_CHARACTER_ENTRY_MODE | HD44780_DECREMENT | HD44780_DISPLAY_SHIFT_ON);
1345  0000 a605          	ld	a,#5
1346  0002 cd0000        	call	_HD44780_write_command
1348                     ; 238 }
1351  0005 81            	ret
1376                     ; 241 void HD44780_display_on()
1376                     ; 242 {
1377                     .text:	section	.text,new
1378  0000               _HD44780_display_on:
1382                     ; 243 	display_cursor_on_off_control |= HD44780_DISPLAY_ON;
1384  0000 72140000      	bset	L7_display_cursor_on_off_control,#2
1385                     ; 244 	HD44780_write_command((uint8_t) (HD44780_DISPLAY_CURSOR_ON_OFF | display_cursor_on_off_control));
1387  0004 b600          	ld	a,L7_display_cursor_on_off_control
1388  0006 aa08          	or	a,#8
1389  0008 cd0000        	call	_HD44780_write_command
1391                     ; 245 }
1394  000b 81            	ret
1420                     ; 248 void HD44780_display_off()
1420                     ; 249 {
1421                     .text:	section	.text,new
1422  0000               _HD44780_display_off:
1426                     ; 250 	display_cursor_on_off_control &= (uint8_t) ~HD44780_DISPLAY_ON;
1428  0000 72150000      	bres	L7_display_cursor_on_off_control,#2
1429                     ; 251 	HD44780_write_command( (uint8_t) (HD44780_DISPLAY_CURSOR_ON_OFF | display_cursor_on_off_control));
1431  0004 b600          	ld	a,L7_display_cursor_on_off_control
1432  0006 aa08          	or	a,#8
1433  0008 cd0000        	call	_HD44780_write_command
1435                     ; 252 }
1438  000b 81            	ret
1463                     ; 255 void HD44780_cursor_on()
1463                     ; 256 {
1464                     .text:	section	.text,new
1465  0000               _HD44780_cursor_on:
1469                     ; 257 	display_cursor_on_off_control |= HD44780_CURSOR_UNDERLINE_ON;
1471  0000 72120000      	bset	L7_display_cursor_on_off_control,#1
1472                     ; 258 	HD44780_write_command((uint8_t) (HD44780_DISPLAY_CURSOR_ON_OFF | display_cursor_on_off_control));
1474  0004 b600          	ld	a,L7_display_cursor_on_off_control
1475  0006 aa08          	or	a,#8
1476  0008 cd0000        	call	_HD44780_write_command
1478                     ; 259 }
1481  000b 81            	ret
1506                     ; 262 void HD44780_cursor_off()
1506                     ; 263 {
1507                     .text:	section	.text,new
1508  0000               _HD44780_cursor_off:
1512                     ; 264 	display_cursor_on_off_control &= (uint8_t) ~HD44780_CURSOR_UNDERLINE_ON;
1514  0000 72130000      	bres	L7_display_cursor_on_off_control,#1
1515                     ; 265 	HD44780_write_command(( uint8_t) (HD44780_DISPLAY_CURSOR_ON_OFF | display_cursor_on_off_control));
1517  0004 b600          	ld	a,L7_display_cursor_on_off_control
1518  0006 aa08          	or	a,#8
1519  0008 cd0000        	call	_HD44780_write_command
1521                     ; 266 }
1524  000b 81            	ret
1549                     ; 269 void HD44780_blink_on()
1549                     ; 270 {
1550                     .text:	section	.text,new
1551  0000               _HD44780_blink_on:
1555                     ; 271 	display_cursor_on_off_control |= HD44780_CURSOR_BLINK_ON;
1557  0000 72100000      	bset	L7_display_cursor_on_off_control,#0
1558                     ; 272 	HD44780_write_command((uint8_t) (HD44780_DISPLAY_CURSOR_ON_OFF | display_cursor_on_off_control));
1560  0004 b600          	ld	a,L7_display_cursor_on_off_control
1561  0006 aa08          	or	a,#8
1562  0008 cd0000        	call	_HD44780_write_command
1564                     ; 273 }
1567  000b 81            	ret
1592                     ; 276 void HD44780_blink_off()
1592                     ; 277 {
1593                     .text:	section	.text,new
1594  0000               _HD44780_blink_off:
1598                     ; 278 	display_cursor_on_off_control &= (uint8_t) ~HD44780_CURSOR_BLINK_ON;
1600  0000 72110000      	bres	L7_display_cursor_on_off_control,#0
1601                     ; 279 	HD44780_write_command((uint8_t) (HD44780_DISPLAY_CURSOR_ON_OFF | display_cursor_on_off_control));
1603  0004 b600          	ld	a,L7_display_cursor_on_off_control
1604  0006 aa08          	or	a,#8
1605  0008 cd0000        	call	_HD44780_write_command
1607                     ; 280 }
1610  000b 81            	ret
1635                     ; 283 void HD44780_display_shift_left()
1635                     ; 284 {
1636                     .text:	section	.text,new
1637  0000               _HD44780_display_shift_left:
1641                     ; 285 	HD44780_write_command(HD44780_DISPLAY_CURSOR_SHIFT | HD44780_DISPLAY_SHIFT | HD44780_LEFT_SHIFT);
1643  0000 a618          	ld	a,#24
1644  0002 cd0000        	call	_HD44780_write_command
1646                     ; 286 }
1649  0005 81            	ret
1674                     ; 289 void HD44780_display_shift_right()
1674                     ; 290 {
1675                     .text:	section	.text,new
1676  0000               _HD44780_display_shift_right:
1680                     ; 291 	HD44780_write_command(HD44780_DISPLAY_CURSOR_SHIFT | HD44780_DISPLAY_SHIFT | HD44780_RIGHT_SHIFT);
1682  0000 a61c          	ld	a,#28
1683  0002 cd0000        	call	_HD44780_write_command
1685                     ; 292 }
1688  0005 81            	ret
1713                     ; 295 void HD44780_cursor_shift_left()
1713                     ; 296 {
1714                     .text:	section	.text,new
1715  0000               _HD44780_cursor_shift_left:
1719                     ; 297 	HD44780_write_command(HD44780_DISPLAY_CURSOR_SHIFT | HD44780_DISPLAY_CURSOR_SHIFT | HD44780_LEFT_SHIFT);
1721  0000 a610          	ld	a,#16
1722  0002 cd0000        	call	_HD44780_write_command
1724                     ; 298 }
1727  0005 81            	ret
1752                     ; 301 void HD44780_cursor_shift_right()
1752                     ; 302 {
1753                     .text:	section	.text,new
1754  0000               _HD44780_cursor_shift_right:
1758                     ; 303 	HD44780_write_command(HD44780_DISPLAY_CURSOR_SHIFT | HD44780_DISPLAY_CURSOR_SHIFT | HD44780_RIGHT_SHIFT);
1760  0000 a614          	ld	a,#20
1761  0002 cd0000        	call	_HD44780_write_command
1763                     ; 304 }
1766  0005 81            	ret
1791                     	xdef	_HD44780_write_data
1792                     	xdef	_HD44780_write_command
1793                     	switch	.ubsct
1794  0000               L7_display_cursor_on_off_control:
1795  0000 00            	ds.b	1
1796                     	xdef	_HD44780_cursor_shift_right
1797                     	xdef	_HD44780_cursor_shift_left
1798                     	xdef	_HD44780_display_shift_right
1799                     	xdef	_HD44780_display_shift_left
1800                     	xdef	_HD44780_entry_dec_shift
1801                     	xdef	_HD44780_entry_inc_shift
1802                     	xdef	_HD44780_entry_dec
1803                     	xdef	_HD44780_entry_inc
1804                     	xdef	_HD44780_home
1805                     	xdef	_HD44780_blink_off
1806                     	xdef	_HD44780_blink_on
1807                     	xdef	_HD44780_cursor_off
1808                     	xdef	_HD44780_cursor_on
1809                     	xdef	_HD44780_display_off
1810                     	xdef	_HD44780_display_on
1811                     	xdef	_HD44780_put_custom_char
1812                     	xdef	_HD44780_create_custom_char
1813                     	xdef	_HD44780_puts
1814                     	xdef	_HD44780_putc
1815                     	xdef	_HD44780_gotoxy
1816                     	xdef	_HD44780_clrscr
1817                     	xdef	_HD44780_config
1818                     	xref	_DELAY_us
1819                     	xref	_DELAY_ms
1820                     	xref	_GPIO_WriteLow
1821                     	xref	_GPIO_WriteHigh
1822                     	xref	_GPIO_Init
1842                     	end
