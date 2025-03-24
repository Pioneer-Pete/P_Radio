   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  50                     .const:	section	.text
  51  0000               L6:
  52  0000 000f4240      	dc.l	1000000
  53                     ; 6 void I2C_config(void)
  53                     ; 7 {
  54                     	scross	off
  55                     .text:	section	.text,new
  56  0000               _I2C_config:
  60                     ; 8 	GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_OD_HIZ_FAST);
  62  0000 4bb0          	push	#176
  63  0002 4b10          	push	#16
  64  0004 ae5005        	ldw	x,#20485
  65  0007 cd0000        	call	_GPIO_Init
  67  000a 85            	popw	x
  68                     ; 9 	GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_FAST);
  70  000b 4bb0          	push	#176
  71  000d 4b20          	push	#32
  72  000f ae5005        	ldw	x,#20485
  73  0012 cd0000        	call	_GPIO_Init
  75  0015 85            	popw	x
  76                     ; 11 	I2C_DeInit(); 
  78  0016 cd0000        	call	_I2C_DeInit
  80                     ; 12 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
  82  0019 ae0001        	ldw	x,#1
  83  001c cd0000        	call	_CLK_PeripheralClockConfig
  85                     ; 14 	I2C_Init((uint32_t) I2C_MAX_STANDARD_FREQ, OWN_ADDRESS, I2C_DUTYCYCLE_2, I2C_ACK_CURR, 
  85                     ; 15 		I2C_ADDMODE_7BIT, (uint8_t) (CLK_GetClockFreq() / 1000000));
  87  001f cd0000        	call	_CLK_GetClockFreq
  89  0022 ae0000        	ldw	x,#L6
  90  0025 cd0000        	call	c_ludv
  92  0028 b603          	ld	a,c_lreg+3
  93  002a 88            	push	a
  94  002b 4b00          	push	#0
  95  002d 4b01          	push	#1
  96  002f 4b00          	push	#0
  97  0031 5f            	clrw	x
  98  0032 89            	pushw	x
  99  0033 ae86a0        	ldw	x,#34464
 100  0036 89            	pushw	x
 101  0037 ae0001        	ldw	x,#1
 102  003a 89            	pushw	x
 103  003b cd0000        	call	_I2C_Init
 105  003e 5b0a          	addw	sp,#10
 106                     ; 18 	I2C_Cmd(ENABLE);
 108  0040 a601          	ld	a,#1
 109  0042 cd0000        	call	_I2C_Cmd
 111                     ; 19 }
 114  0045 81            	ret
 171                     ; 24 void I2C_sendbyte_reg8(uint8_t dev_address, uint8_t reg8_register, uint8_t databyte)
 171                     ; 25 {
 172                     .text:	section	.text,new
 173  0000               _I2C_sendbyte_reg8:
 175  0000 89            	pushw	x
 176       00000000      OFST:	set	0
 179                     ; 26 	I2C_GenerateSTART(ENABLE);													//startbit
 181  0001 a601          	ld	a,#1
 182  0003 cd0000        	call	_I2C_GenerateSTART
 185  0006               L15:
 186                     ; 27 	while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));						//master-mode?
 188  0006 ae0301        	ldw	x,#769
 189  0009 cd0000        	call	_I2C_CheckEvent
 191  000c 4d            	tnz	a
 192  000d 27f7          	jreq	L15
 193                     ; 29 	I2C_Send7bitAddress(dev_address, I2C_DIRECTION_TX);							//write-address
 195  000f 7b01          	ld	a,(OFST+1,sp)
 196  0011 5f            	clrw	x
 197  0012 95            	ld	xh,a
 198  0013 cd0000        	call	_I2C_Send7bitAddress
 201  0016               L75:
 202                     ; 30 	while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));		//transmit-mode?
 204  0016 ae0782        	ldw	x,#1922
 205  0019 cd0000        	call	_I2C_CheckEvent
 207  001c 4d            	tnz	a
 208  001d 27f7          	jreq	L75
 209                     ; 32 	I2C_SendData((uint8_t) reg8_register);										//reg8 register
 211  001f 7b02          	ld	a,(OFST+2,sp)
 212  0021 cd0000        	call	_I2C_SendData
 215  0024               L56:
 216                     ; 33 	while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));	 				//byte is sent?
 218  0024 ae0784        	ldw	x,#1924
 219  0027 cd0000        	call	_I2C_CheckEvent
 221  002a 4d            	tnz	a
 222  002b 27f7          	jreq	L56
 223                     ; 35 	I2C_SendData(databyte);														//send data byte
 225  002d 7b05          	ld	a,(OFST+5,sp)
 226  002f cd0000        	call	_I2C_SendData
 229  0032               L37:
 230                     ; 36 	while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));					//byte is sent?
 232  0032 ae0784        	ldw	x,#1924
 233  0035 cd0000        	call	_I2C_CheckEvent
 235  0038 4d            	tnz	a
 236  0039 27f7          	jreq	L37
 237                     ; 38 	I2C_GenerateSTOP(ENABLE);													//stopbit
 239  003b a601          	ld	a,#1
 240  003d cd0000        	call	_I2C_GenerateSTOP
 242                     ; 39 }
 245  0040 85            	popw	x
 246  0041 81            	ret
 306                     ; 42 uint8_t I2C_readbyte_reg8(uint8_t dev_address, uint8_t reg8_register)
 306                     ; 43 {
 307                     .text:	section	.text,new
 308  0000               _I2C_readbyte_reg8:
 310  0000 89            	pushw	x
 311  0001 88            	push	a
 312       00000001      OFST:	set	1
 315                     ; 44 	uint8_t tmp = 0;
 317                     ; 46 	I2C_GenerateSTART(ENABLE);													//startbit
 319  0002 a601          	ld	a,#1
 320  0004 cd0000        	call	_I2C_GenerateSTART
 323  0007               L721:
 324                     ; 47 	while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));						//master mode?
 326  0007 ae0301        	ldw	x,#769
 327  000a cd0000        	call	_I2C_CheckEvent
 329  000d 4d            	tnz	a
 330  000e 27f7          	jreq	L721
 331                     ; 49 	I2C_Send7bitAddress(dev_address, I2C_DIRECTION_TX);							//write-address
 333  0010 7b02          	ld	a,(OFST+1,sp)
 334  0012 5f            	clrw	x
 335  0013 95            	ld	xh,a
 336  0014 cd0000        	call	_I2C_Send7bitAddress
 339  0017               L531:
 340                     ; 50 	while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));		//transmit-mode?
 342  0017 ae0782        	ldw	x,#1922
 343  001a cd0000        	call	_I2C_CheckEvent
 345  001d 4d            	tnz	a
 346  001e 27f7          	jreq	L531
 347                     ; 52 	I2C_SendData((uint8_t) reg8_register);										//register
 349  0020 7b03          	ld	a,(OFST+2,sp)
 350  0022 cd0000        	call	_I2C_SendData
 353  0025               L341:
 354                     ; 53 	while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));	 				//byte is sent?
 356  0025 ae0784        	ldw	x,#1924
 357  0028 cd0000        	call	_I2C_CheckEvent
 359  002b 4d            	tnz	a
 360  002c 27f7          	jreq	L341
 361                     ; 55 	I2C_GenerateSTART(ENABLE);													//repeat startbit
 363  002e a601          	ld	a,#1
 364  0030 cd0000        	call	_I2C_GenerateSTART
 367  0033               L151:
 368                     ; 56 	while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));						//master-mode?
 370  0033 ae0301        	ldw	x,#769
 371  0036 cd0000        	call	_I2C_CheckEvent
 373  0039 4d            	tnz	a
 374  003a 27f7          	jreq	L151
 375                     ; 58 	I2C_Send7bitAddress(dev_address, I2C_DIRECTION_RX);							//read-address
 377  003c 7b02          	ld	a,(OFST+1,sp)
 378  003e ae0001        	ldw	x,#1
 379  0041 95            	ld	xh,a
 380  0042 cd0000        	call	_I2C_Send7bitAddress
 383  0045               L751:
 384                     ; 59 	while(!I2C_CheckEvent( I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));			//receiver-mode?
 386  0045 ae0302        	ldw	x,#770
 387  0048 cd0000        	call	_I2C_CheckEvent
 389  004b 4d            	tnz	a
 390  004c 27f7          	jreq	L751
 391                     ; 62 	I2C_AcknowledgeConfig(I2C_ACK_NONE);
 393  004e 4f            	clr	a
 394  004f cd0000        	call	_I2C_AcknowledgeConfig
 396                     ; 63 	I2C_GenerateSTOP(ENABLE);													//stopbit
 398  0052 a601          	ld	a,#1
 399  0054 cd0000        	call	_I2C_GenerateSTOP
 402  0057               L561:
 403                     ; 64 	while(I2C_GetFlagStatus( I2C_FLAG_RXNOTEMPTY) == RESET);
 405  0057 ae0140        	ldw	x,#320
 406  005a cd0000        	call	_I2C_GetFlagStatus
 408  005d 4d            	tnz	a
 409  005e 27f7          	jreq	L561
 410                     ; 65 	tmp = I2C_ReceiveData();													//read byte
 412  0060 cd0000        	call	_I2C_ReceiveData
 414  0063 6b01          	ld	(OFST+0,sp),a
 416                     ; 68 	return tmp;
 418  0065 7b01          	ld	a,(OFST+0,sp)
 421  0067 5b03          	addw	sp,#3
 422  0069 81            	ret
 499                     ; 72 void I2C_sendarray_reg8(uint8_t dev_address, uint8_t reg8_register,  uint8_t *data_array, uint8_t datalength)
 499                     ; 73 {
 500                     .text:	section	.text,new
 501  0000               _I2C_sendarray_reg8:
 503  0000 89            	pushw	x
 504  0001 88            	push	a
 505       00000001      OFST:	set	1
 508                     ; 76 	i = 0;
 510  0002 0f01          	clr	(OFST+0,sp)
 512                     ; 78 	I2C_GenerateSTART(ENABLE);													//startbit
 514  0004 a601          	ld	a,#1
 515  0006 cd0000        	call	_I2C_GenerateSTART
 518  0009               L132:
 519                     ; 79 	while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));						//master-mode?
 521  0009 ae0301        	ldw	x,#769
 522  000c cd0000        	call	_I2C_CheckEvent
 524  000f 4d            	tnz	a
 525  0010 27f7          	jreq	L132
 526                     ; 81 	I2C_Send7bitAddress(dev_address, I2C_DIRECTION_TX);							//write-address-of reg16
 528  0012 7b02          	ld	a,(OFST+1,sp)
 529  0014 5f            	clrw	x
 530  0015 95            	ld	xh,a
 531  0016 cd0000        	call	_I2C_Send7bitAddress
 534  0019               L732:
 535                     ; 82 	while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));		//transmit-mode?
 537  0019 ae0782        	ldw	x,#1922
 538  001c cd0000        	call	_I2C_CheckEvent
 540  001f 4d            	tnz	a
 541  0020 27f7          	jreq	L732
 542                     ; 84 	I2C_SendData((uint8_t) reg8_register);										//reg8 register
 544  0022 7b03          	ld	a,(OFST+2,sp)
 545  0024 cd0000        	call	_I2C_SendData
 548  0027               L542:
 549                     ; 85 	while(I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET);				//byte is sent?
 551  0027 ae0104        	ldw	x,#260
 552  002a cd0000        	call	_I2C_GetFlagStatus
 554  002d 4d            	tnz	a
 555  002e 27f7          	jreq	L542
 557  0030 2018          	jra	L352
 558  0032               L152:
 559                     ; 89 		I2C_SendData(data_array[i++]);											//send reg16 data byte
 561  0032 7b01          	ld	a,(OFST+0,sp)
 562  0034 97            	ld	xl,a
 563  0035 0c01          	inc	(OFST+0,sp)
 565  0037 9f            	ld	a,xl
 566  0038 5f            	clrw	x
 567  0039 97            	ld	xl,a
 568  003a 72fb06        	addw	x,(OFST+5,sp)
 569  003d f6            	ld	a,(x)
 570  003e cd0000        	call	_I2C_SendData
 573  0041               L162:
 574                     ; 90 		while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));				//byte is sent?
 576  0041 ae0784        	ldw	x,#1924
 577  0044 cd0000        	call	_I2C_CheckEvent
 579  0047 4d            	tnz	a
 580  0048 27f7          	jreq	L162
 581  004a               L352:
 582                     ; 87 	while (i < datalength)
 584  004a 7b01          	ld	a,(OFST+0,sp)
 585  004c 1108          	cp	a,(OFST+7,sp)
 586  004e 25e2          	jrult	L152
 587                     ; 92 	I2C_GenerateSTOP(ENABLE);													//stopbit
 589  0050 a601          	ld	a,#1
 590  0052 cd0000        	call	_I2C_GenerateSTOP
 592                     ; 93 }
 595  0055 5b03          	addw	sp,#3
 596  0057 81            	ret
 675                     ; 96 void I2C_readarray_reg8(uint8_t dev_address, uint16_t reg8_register, uint8_t *data_array, uint8_t datalength)
 675                     ; 97 {
 676                     .text:	section	.text,new
 677  0000               _I2C_readarray_reg8:
 679  0000 88            	push	a
 680  0001 88            	push	a
 681       00000001      OFST:	set	1
 684                     ; 100 	i = 0;
 686  0002 0f01          	clr	(OFST+0,sp)
 688                     ; 102 	I2C_GenerateSTART(ENABLE);													//startbit
 690  0004 a601          	ld	a,#1
 691  0006 cd0000        	call	_I2C_GenerateSTART
 694  0009               L523:
 695                     ; 103 	while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));						//master mode?
 697  0009 ae0301        	ldw	x,#769
 698  000c cd0000        	call	_I2C_CheckEvent
 700  000f 4d            	tnz	a
 701  0010 27f7          	jreq	L523
 702                     ; 105 	I2C_Send7bitAddress(dev_address, I2C_DIRECTION_TX);							//write-address-of reg16
 704  0012 7b02          	ld	a,(OFST+1,sp)
 705  0014 5f            	clrw	x
 706  0015 95            	ld	xh,a
 707  0016 cd0000        	call	_I2C_Send7bitAddress
 710  0019               L333:
 711                     ; 106 	while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));		//transmit-mode?
 713  0019 ae0782        	ldw	x,#1922
 714  001c cd0000        	call	_I2C_CheckEvent
 716  001f 4d            	tnz	a
 717  0020 27f7          	jreq	L333
 718                     ; 108 	I2C_SendData((uint8_t) reg8_register);										//reg8 register
 720  0022 7b06          	ld	a,(OFST+5,sp)
 721  0024 cd0000        	call	_I2C_SendData
 724  0027               L143:
 725                     ; 109 	while(I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET);				//byte is sent?
 727  0027 ae0104        	ldw	x,#260
 728  002a cd0000        	call	_I2C_GetFlagStatus
 730  002d 4d            	tnz	a
 731  002e 27f7          	jreq	L143
 732                     ; 111 	I2C_GenerateSTART(ENABLE);													//repeat startbit
 734  0030 a601          	ld	a,#1
 735  0032 cd0000        	call	_I2C_GenerateSTART
 738  0035               L743:
 739                     ; 112 	while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));						//master-mode?
 741  0035 ae0301        	ldw	x,#769
 742  0038 cd0000        	call	_I2C_CheckEvent
 744  003b 4d            	tnz	a
 745  003c 27f7          	jreq	L743
 746                     ; 114 	I2C_Send7bitAddress(dev_address, I2C_DIRECTION_RX);							//read-address
 748  003e 7b02          	ld	a,(OFST+1,sp)
 749  0040 ae0001        	ldw	x,#1
 750  0043 95            	ld	xh,a
 751  0044 cd0000        	call	_I2C_Send7bitAddress
 754  0047               L553:
 755                     ; 115 	while(!I2C_CheckEvent( I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));			//receiver-mode?
 757  0047 ae0302        	ldw	x,#770
 758  004a cd0000        	call	_I2C_CheckEvent
 760  004d 4d            	tnz	a
 761  004e 27f7          	jreq	L553
 762                     ; 117 	I2C_AcknowledgeConfig(I2C_ACK_CURR);	
 764  0050 a601          	ld	a,#1
 765  0052 cd0000        	call	_I2C_AcknowledgeConfig
 768  0055 201a          	jra	L363
 769  0057               L173:
 770                     ; 120 		while(I2C_GetFlagStatus( I2C_FLAG_RXNOTEMPTY) == RESET);
 772  0057 ae0140        	ldw	x,#320
 773  005a cd0000        	call	_I2C_GetFlagStatus
 775  005d 4d            	tnz	a
 776  005e 27f7          	jreq	L173
 777                     ; 121 		data_array[i++] = I2C_ReceiveData();									//read byte
 779  0060 7b01          	ld	a,(OFST+0,sp)
 780  0062 97            	ld	xl,a
 781  0063 0c01          	inc	(OFST+0,sp)
 783  0065 9f            	ld	a,xl
 784  0066 5f            	clrw	x
 785  0067 97            	ld	xl,a
 786  0068 72fb07        	addw	x,(OFST+6,sp)
 787  006b 89            	pushw	x
 788  006c cd0000        	call	_I2C_ReceiveData
 790  006f 85            	popw	x
 791  0070 f7            	ld	(x),a
 792  0071               L363:
 793                     ; 118 	while (i < (datalength - 1))
 795  0071 9c            	rvf
 796  0072 7b09          	ld	a,(OFST+8,sp)
 797  0074 5f            	clrw	x
 798  0075 97            	ld	xl,a
 799  0076 5a            	decw	x
 800  0077 7b01          	ld	a,(OFST+0,sp)
 801  0079 905f          	clrw	y
 802  007b 9097          	ld	yl,a
 803  007d 90bf00        	ldw	c_y,y
 804  0080 b300          	cpw	x,c_y
 805  0082 2cd3          	jrsgt	L173
 806                     ; 124 	I2C_AcknowledgeConfig(I2C_ACK_NONE);
 808  0084 4f            	clr	a
 809  0085 cd0000        	call	_I2C_AcknowledgeConfig
 811                     ; 125 	I2C_GenerateSTOP(ENABLE);													//stopbit
 813  0088 a601          	ld	a,#1
 814  008a cd0000        	call	_I2C_GenerateSTOP
 817  008d               L773:
 818                     ; 126 	while(I2C_GetFlagStatus( I2C_FLAG_RXNOTEMPTY) == RESET);
 820  008d ae0140        	ldw	x,#320
 821  0090 cd0000        	call	_I2C_GetFlagStatus
 823  0093 4d            	tnz	a
 824  0094 27f7          	jreq	L773
 825                     ; 127 	data_array[i] = I2C_ReceiveData();											//read last byte
 827  0096 7b01          	ld	a,(OFST+0,sp)
 828  0098 5f            	clrw	x
 829  0099 97            	ld	xl,a
 830  009a 72fb07        	addw	x,(OFST+6,sp)
 831  009d 89            	pushw	x
 832  009e cd0000        	call	_I2C_ReceiveData
 834  00a1 85            	popw	x
 835  00a2 f7            	ld	(x),a
 836                     ; 128 }
 839  00a3 85            	popw	x
 840  00a4 81            	ret
 898                     ; 133 void I2C_sendbyte_reg16(uint8_t reg16_address, uint16_t reg16_register, uint8_t databyte)
 898                     ; 134 {
 899                     .text:	section	.text,new
 900  0000               _I2C_sendbyte_reg16:
 902  0000 88            	push	a
 903       00000000      OFST:	set	0
 906                     ; 135 	I2C_GenerateSTART(ENABLE);													//startbit
 908  0001 a601          	ld	a,#1
 909  0003 cd0000        	call	_I2C_GenerateSTART
 912  0006               L334:
 913                     ; 136 	while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));						//master-mode?
 915  0006 ae0301        	ldw	x,#769
 916  0009 cd0000        	call	_I2C_CheckEvent
 918  000c 4d            	tnz	a
 919  000d 27f7          	jreq	L334
 920                     ; 138 	I2C_Send7bitAddress(reg16_address, I2C_DIRECTION_TX);						//write-address-of reg16
 922  000f 7b01          	ld	a,(OFST+1,sp)
 923  0011 5f            	clrw	x
 924  0012 95            	ld	xh,a
 925  0013 cd0000        	call	_I2C_Send7bitAddress
 928  0016               L144:
 929                     ; 139 	while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));		//transmit-mode?
 931  0016 ae0782        	ldw	x,#1922
 932  0019 cd0000        	call	_I2C_CheckEvent
 934  001c 4d            	tnz	a
 935  001d 27f7          	jreq	L144
 936                     ; 141 	I2C_SendData((uint8_t) (reg16_register & 0xFF00) >> 8);						//reg16 register high
 938  001f 4f            	clr	a
 939  0020 cd0000        	call	_I2C_SendData
 942  0023               L744:
 943                     ; 142 	while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));	 				//byte is sent?
 945  0023 ae0784        	ldw	x,#1924
 946  0026 cd0000        	call	_I2C_CheckEvent
 948  0029 4d            	tnz	a
 949  002a 27f7          	jreq	L744
 950                     ; 143 	I2C_SendData((uint8_t) (reg16_register & 0x00FF));							//reg16 register low
 952  002c 7b05          	ld	a,(OFST+5,sp)
 953  002e a4ff          	and	a,#255
 954  0030 cd0000        	call	_I2C_SendData
 957  0033               L554:
 958                     ; 144 	while(I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET);				//byte is sent?
 960  0033 ae0104        	ldw	x,#260
 961  0036 cd0000        	call	_I2C_GetFlagStatus
 963  0039 4d            	tnz	a
 964  003a 27f7          	jreq	L554
 965                     ; 146 	I2C_SendData(databyte);														//send data byte
 967  003c 7b06          	ld	a,(OFST+6,sp)
 968  003e cd0000        	call	_I2C_SendData
 971  0041               L364:
 972                     ; 147 	while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));					//byte is sent?
 974  0041 ae0784        	ldw	x,#1924
 975  0044 cd0000        	call	_I2C_CheckEvent
 977  0047 4d            	tnz	a
 978  0048 27f7          	jreq	L364
 979                     ; 149 	I2C_GenerateSTOP(ENABLE);													//stopbit
 981  004a a601          	ld	a,#1
 982  004c cd0000        	call	_I2C_GenerateSTOP
 984                     ; 150 }
 987  004f 84            	pop	a
 988  0050 81            	ret
1048                     ; 153 uint8_t I2C_readbyte_reg16(uint8_t reg16_address, uint16_t reg16_register)
1048                     ; 154 {
1049                     .text:	section	.text,new
1050  0000               _I2C_readbyte_reg16:
1052  0000 88            	push	a
1053  0001 88            	push	a
1054       00000001      OFST:	set	1
1057                     ; 155 	uint8_t tmp = 0;
1059                     ; 157 	I2C_GenerateSTART(ENABLE);													//startbit
1061  0002 a601          	ld	a,#1
1062  0004 cd0000        	call	_I2C_GenerateSTART
1065  0007               L715:
1066                     ; 158 	while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));						//master mode?
1068  0007 ae0301        	ldw	x,#769
1069  000a cd0000        	call	_I2C_CheckEvent
1071  000d 4d            	tnz	a
1072  000e 27f7          	jreq	L715
1073                     ; 160 	I2C_Send7bitAddress(reg16_address, I2C_DIRECTION_TX);						//write-address-of reg16
1075  0010 7b02          	ld	a,(OFST+1,sp)
1076  0012 5f            	clrw	x
1077  0013 95            	ld	xh,a
1078  0014 cd0000        	call	_I2C_Send7bitAddress
1081  0017               L525:
1082                     ; 161 	while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));		//transmit-mode?
1084  0017 ae0782        	ldw	x,#1922
1085  001a cd0000        	call	_I2C_CheckEvent
1087  001d 4d            	tnz	a
1088  001e 27f7          	jreq	L525
1089                     ; 163 	I2C_SendData((uint8_t) (reg16_register & 0xFF00) >> 8);						//reg16 register high
1091  0020 4f            	clr	a
1092  0021 cd0000        	call	_I2C_SendData
1095  0024               L335:
1096                     ; 164 	while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));	 				//byte is sent?
1098  0024 ae0784        	ldw	x,#1924
1099  0027 cd0000        	call	_I2C_CheckEvent
1101  002a 4d            	tnz	a
1102  002b 27f7          	jreq	L335
1103                     ; 165 	I2C_SendData((uint8_t) (reg16_register & 0x00FF));							//reg16 register low
1105  002d 7b06          	ld	a,(OFST+5,sp)
1106  002f a4ff          	and	a,#255
1107  0031 cd0000        	call	_I2C_SendData
1110  0034               L145:
1111                     ; 166 	while(I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET);				//byte is sent?
1113  0034 ae0104        	ldw	x,#260
1114  0037 cd0000        	call	_I2C_GetFlagStatus
1116  003a 4d            	tnz	a
1117  003b 27f7          	jreq	L145
1118                     ; 168 	I2C_GenerateSTART(ENABLE);													//repeat startbit
1120  003d a601          	ld	a,#1
1121  003f cd0000        	call	_I2C_GenerateSTART
1124  0042               L745:
1125                     ; 169 	while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));						//master-mode?
1127  0042 ae0301        	ldw	x,#769
1128  0045 cd0000        	call	_I2C_CheckEvent
1130  0048 4d            	tnz	a
1131  0049 27f7          	jreq	L745
1132                     ; 171 	I2C_Send7bitAddress(reg16_address, I2C_DIRECTION_RX);						//read-address
1134  004b 7b02          	ld	a,(OFST+1,sp)
1135  004d ae0001        	ldw	x,#1
1136  0050 95            	ld	xh,a
1137  0051 cd0000        	call	_I2C_Send7bitAddress
1140  0054               L555:
1141                     ; 172 	while(!I2C_CheckEvent( I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));			//receiver-mode?
1143  0054 ae0302        	ldw	x,#770
1144  0057 cd0000        	call	_I2C_CheckEvent
1146  005a 4d            	tnz	a
1147  005b 27f7          	jreq	L555
1148                     ; 175 	I2C_AcknowledgeConfig(I2C_ACK_NONE);
1150  005d 4f            	clr	a
1151  005e cd0000        	call	_I2C_AcknowledgeConfig
1153                     ; 176 	I2C_GenerateSTOP(ENABLE);													//stopbit
1155  0061 a601          	ld	a,#1
1156  0063 cd0000        	call	_I2C_GenerateSTOP
1159  0066               L365:
1160                     ; 177 	while(I2C_GetFlagStatus( I2C_FLAG_RXNOTEMPTY) == RESET);
1162  0066 ae0140        	ldw	x,#320
1163  0069 cd0000        	call	_I2C_GetFlagStatus
1165  006c 4d            	tnz	a
1166  006d 27f7          	jreq	L365
1167                     ; 178 	tmp = I2C_ReceiveData();													//read byte
1169  006f cd0000        	call	_I2C_ReceiveData
1171  0072 6b01          	ld	(OFST+0,sp),a
1173                     ; 181 	return tmp;
1175  0074 7b01          	ld	a,(OFST+0,sp)
1178  0076 85            	popw	x
1179  0077 81            	ret
1257                     ; 186 void I2C_sendarray_reg16(uint8_t reg16_address, uint16_t reg16_register,  uint8_t *data_array, uint8_t datalength)
1257                     ; 187 {
1258                     .text:	section	.text,new
1259  0000               _I2C_sendarray_reg16:
1261  0000 88            	push	a
1262  0001 88            	push	a
1263       00000001      OFST:	set	1
1266                     ; 190 	i = 0;
1268  0002 0f01          	clr	(OFST+0,sp)
1270                     ; 192 	I2C_GenerateSTART(ENABLE);													//startbit
1272  0004 a601          	ld	a,#1
1273  0006 cd0000        	call	_I2C_GenerateSTART
1276  0009               L726:
1277                     ; 193 	while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));						//master-mode?
1279  0009 ae0301        	ldw	x,#769
1280  000c cd0000        	call	_I2C_CheckEvent
1282  000f 4d            	tnz	a
1283  0010 27f7          	jreq	L726
1284                     ; 195 	I2C_Send7bitAddress(reg16_address, I2C_DIRECTION_TX);						//write-address-of reg16
1286  0012 7b02          	ld	a,(OFST+1,sp)
1287  0014 5f            	clrw	x
1288  0015 95            	ld	xh,a
1289  0016 cd0000        	call	_I2C_Send7bitAddress
1292  0019               L536:
1293                     ; 196 	while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));		//transmit-mode?
1295  0019 ae0782        	ldw	x,#1922
1296  001c cd0000        	call	_I2C_CheckEvent
1298  001f 4d            	tnz	a
1299  0020 27f7          	jreq	L536
1300                     ; 198 	I2C_SendData((uint8_t) (reg16_register & 0xFF00) >> 8);						//reg16 register high
1302  0022 4f            	clr	a
1303  0023 cd0000        	call	_I2C_SendData
1306  0026               L346:
1307                     ; 199 	while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));					//byte is sent?
1309  0026 ae0784        	ldw	x,#1924
1310  0029 cd0000        	call	_I2C_CheckEvent
1312  002c 4d            	tnz	a
1313  002d 27f7          	jreq	L346
1314                     ; 201 	I2C_SendData((uint8_t) (reg16_register & 0x00FF));							//reg16 register low
1316  002f 7b06          	ld	a,(OFST+5,sp)
1317  0031 a4ff          	and	a,#255
1318  0033 cd0000        	call	_I2C_SendData
1321  0036               L156:
1322                     ; 202 	while(I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET);				//byte is sent?
1324  0036 ae0104        	ldw	x,#260
1325  0039 cd0000        	call	_I2C_GetFlagStatus
1327  003c 4d            	tnz	a
1328  003d 27f7          	jreq	L156
1330  003f 2018          	jra	L756
1331  0041               L556:
1332                     ; 206 		I2C_SendData(data_array[i++]);											//send reg16 data byte
1334  0041 7b01          	ld	a,(OFST+0,sp)
1335  0043 97            	ld	xl,a
1336  0044 0c01          	inc	(OFST+0,sp)
1338  0046 9f            	ld	a,xl
1339  0047 5f            	clrw	x
1340  0048 97            	ld	xl,a
1341  0049 72fb07        	addw	x,(OFST+6,sp)
1342  004c f6            	ld	a,(x)
1343  004d cd0000        	call	_I2C_SendData
1346  0050               L566:
1347                     ; 207 		while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));				//byte is sent?
1349  0050 ae0784        	ldw	x,#1924
1350  0053 cd0000        	call	_I2C_CheckEvent
1352  0056 4d            	tnz	a
1353  0057 27f7          	jreq	L566
1354  0059               L756:
1355                     ; 204 	while (i < datalength)
1357  0059 7b01          	ld	a,(OFST+0,sp)
1358  005b 1109          	cp	a,(OFST+8,sp)
1359  005d 25e2          	jrult	L556
1360                     ; 209 	I2C_GenerateSTOP(ENABLE);													//stopbit
1362  005f a601          	ld	a,#1
1363  0061 cd0000        	call	_I2C_GenerateSTOP
1365                     ; 210 }
1368  0064 85            	popw	x
1369  0065 81            	ret
1449                     ; 213 void I2C_readarray_reg16(uint8_t reg16_address, uint16_t reg16_register, uint8_t *data_array, uint8_t datalength)
1449                     ; 214 {
1450                     .text:	section	.text,new
1451  0000               _I2C_readarray_reg16:
1453  0000 88            	push	a
1454  0001 88            	push	a
1455       00000001      OFST:	set	1
1458                     ; 217 	i = 0;
1460  0002 0f01          	clr	(OFST+0,sp)
1462                     ; 219 	I2C_GenerateSTART(ENABLE);													//startbit
1464  0004 a601          	ld	a,#1
1465  0006 cd0000        	call	_I2C_GenerateSTART
1468  0009               L137:
1469                     ; 220 	while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));						//master mode?
1471  0009 ae0301        	ldw	x,#769
1472  000c cd0000        	call	_I2C_CheckEvent
1474  000f 4d            	tnz	a
1475  0010 27f7          	jreq	L137
1476                     ; 222 	I2C_Send7bitAddress(reg16_address, I2C_DIRECTION_TX);						//write-address-of reg16
1478  0012 7b02          	ld	a,(OFST+1,sp)
1479  0014 5f            	clrw	x
1480  0015 95            	ld	xh,a
1481  0016 cd0000        	call	_I2C_Send7bitAddress
1484  0019               L737:
1485                     ; 223 	while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));		//transmit-mode?
1487  0019 ae0782        	ldw	x,#1922
1488  001c cd0000        	call	_I2C_CheckEvent
1490  001f 4d            	tnz	a
1491  0020 27f7          	jreq	L737
1492                     ; 225 	I2C_SendData((uint8_t) (reg16_register & 0xFF00) >> 8);						//reg16 register high
1494  0022 4f            	clr	a
1495  0023 cd0000        	call	_I2C_SendData
1498  0026               L547:
1499                     ; 226 	while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));	 				//byte is sent?
1501  0026 ae0784        	ldw	x,#1924
1502  0029 cd0000        	call	_I2C_CheckEvent
1504  002c 4d            	tnz	a
1505  002d 27f7          	jreq	L547
1506                     ; 227 	I2C_SendData((uint8_t) (reg16_register & 0x00FF));							//reg16 register low
1508  002f 7b06          	ld	a,(OFST+5,sp)
1509  0031 a4ff          	and	a,#255
1510  0033 cd0000        	call	_I2C_SendData
1513  0036               L357:
1514                     ; 228 	while(I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET);				//byte is sent?
1516  0036 ae0104        	ldw	x,#260
1517  0039 cd0000        	call	_I2C_GetFlagStatus
1519  003c 4d            	tnz	a
1520  003d 27f7          	jreq	L357
1521                     ; 230 	I2C_GenerateSTART(ENABLE);													//repeat startbit
1523  003f a601          	ld	a,#1
1524  0041 cd0000        	call	_I2C_GenerateSTART
1527  0044               L167:
1528                     ; 231 	while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));						//master-mode?
1530  0044 ae0301        	ldw	x,#769
1531  0047 cd0000        	call	_I2C_CheckEvent
1533  004a 4d            	tnz	a
1534  004b 27f7          	jreq	L167
1535                     ; 233 	I2C_Send7bitAddress(reg16_address, I2C_DIRECTION_RX);						//read-address
1537  004d 7b02          	ld	a,(OFST+1,sp)
1538  004f ae0001        	ldw	x,#1
1539  0052 95            	ld	xh,a
1540  0053 cd0000        	call	_I2C_Send7bitAddress
1543  0056               L767:
1544                     ; 234 	while(!I2C_CheckEvent( I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));			//receiver-mode?
1546  0056 ae0302        	ldw	x,#770
1547  0059 cd0000        	call	_I2C_CheckEvent
1549  005c 4d            	tnz	a
1550  005d 27f7          	jreq	L767
1551                     ; 236 	I2C_AcknowledgeConfig(I2C_ACK_CURR);	
1553  005f a601          	ld	a,#1
1554  0061 cd0000        	call	_I2C_AcknowledgeConfig
1557  0064 201a          	jra	L577
1558  0066               L3001:
1559                     ; 239 		while(I2C_GetFlagStatus( I2C_FLAG_RXNOTEMPTY) == RESET);
1561  0066 ae0140        	ldw	x,#320
1562  0069 cd0000        	call	_I2C_GetFlagStatus
1564  006c 4d            	tnz	a
1565  006d 27f7          	jreq	L3001
1566                     ; 240 		data_array[i++] = I2C_ReceiveData();									//read byte
1568  006f 7b01          	ld	a,(OFST+0,sp)
1569  0071 97            	ld	xl,a
1570  0072 0c01          	inc	(OFST+0,sp)
1572  0074 9f            	ld	a,xl
1573  0075 5f            	clrw	x
1574  0076 97            	ld	xl,a
1575  0077 72fb07        	addw	x,(OFST+6,sp)
1576  007a 89            	pushw	x
1577  007b cd0000        	call	_I2C_ReceiveData
1579  007e 85            	popw	x
1580  007f f7            	ld	(x),a
1581  0080               L577:
1582                     ; 237 	while (i < (datalength - 1))
1584  0080 9c            	rvf
1585  0081 7b09          	ld	a,(OFST+8,sp)
1586  0083 5f            	clrw	x
1587  0084 97            	ld	xl,a
1588  0085 5a            	decw	x
1589  0086 7b01          	ld	a,(OFST+0,sp)
1590  0088 905f          	clrw	y
1591  008a 9097          	ld	yl,a
1592  008c 90bf00        	ldw	c_y,y
1593  008f b300          	cpw	x,c_y
1594  0091 2cd3          	jrsgt	L3001
1595                     ; 243 	I2C_AcknowledgeConfig(I2C_ACK_NONE);
1597  0093 4f            	clr	a
1598  0094 cd0000        	call	_I2C_AcknowledgeConfig
1600                     ; 244 	I2C_GenerateSTOP(ENABLE);													//stopbit
1602  0097 a601          	ld	a,#1
1603  0099 cd0000        	call	_I2C_GenerateSTOP
1606  009c               L1101:
1607                     ; 245 	while(I2C_GetFlagStatus( I2C_FLAG_RXNOTEMPTY) == RESET);
1609  009c ae0140        	ldw	x,#320
1610  009f cd0000        	call	_I2C_GetFlagStatus
1612  00a2 4d            	tnz	a
1613  00a3 27f7          	jreq	L1101
1614                     ; 246 	data_array[i] = I2C_ReceiveData();											//read last byte
1616  00a5 7b01          	ld	a,(OFST+0,sp)
1617  00a7 5f            	clrw	x
1618  00a8 97            	ld	xl,a
1619  00a9 72fb07        	addw	x,(OFST+6,sp)
1620  00ac 89            	pushw	x
1621  00ad cd0000        	call	_I2C_ReceiveData
1623  00b0 85            	popw	x
1624  00b1 f7            	ld	(x),a
1625                     ; 247 }
1628  00b2 85            	popw	x
1629  00b3 81            	ret
1642                     	xdef	_I2C_readarray_reg16
1643                     	xdef	_I2C_sendarray_reg16
1644                     	xdef	_I2C_readbyte_reg16
1645                     	xdef	_I2C_sendbyte_reg16
1646                     	xdef	_I2C_readarray_reg8
1647                     	xdef	_I2C_sendarray_reg8
1648                     	xdef	_I2C_readbyte_reg8
1649                     	xdef	_I2C_sendbyte_reg8
1650                     	xdef	_I2C_config
1651                     	xref	_I2C_GetFlagStatus
1652                     	xref	_I2C_CheckEvent
1653                     	xref	_I2C_SendData
1654                     	xref	_I2C_Send7bitAddress
1655                     	xref	_I2C_ReceiveData
1656                     	xref	_I2C_AcknowledgeConfig
1657                     	xref	_I2C_GenerateSTOP
1658                     	xref	_I2C_GenerateSTART
1659                     	xref	_I2C_Cmd
1660                     	xref	_I2C_Init
1661                     	xref	_I2C_DeInit
1662                     	xref	_GPIO_Init
1663                     	xref	_CLK_GetClockFreq
1664                     	xref	_CLK_PeripheralClockConfig
1665                     	xref.b	c_lreg
1666                     	xref.b	c_x
1667                     	xref.b	c_y
1686                     	xref	c_ludv
1687                     	end
