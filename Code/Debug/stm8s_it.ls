   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  45                     ; 5 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  45                     ; 6 {
  46                     .text:	section	.text,new
  47  0000               f_NonHandledInterrupt:
  51                     ; 8 }
  54  0000 80            	iret
  76                     ; 12 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  76                     ; 13 {
  77                     .text:	section	.text,new
  78  0000               f_TRAP_IRQHandler:
  82                     ; 15 }
  85  0000 80            	iret
 107                     ; 18 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 107                     ; 19 
 107                     ; 20 {
 108                     .text:	section	.text,new
 109  0000               f_TLI_IRQHandler:
 113                     ; 22 }
 116  0000 80            	iret
 138                     ; 25 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 138                     ; 26 {
 139                     .text:	section	.text,new
 140  0000               f_AWU_IRQHandler:
 144                     ; 30 }
 147  0000 80            	iret
 169                     ; 33 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 169                     ; 34 {
 170                     .text:	section	.text,new
 171  0000               f_CLK_IRQHandler:
 175                     ; 36 }
 178  0000 80            	iret
 201                     ; 39 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 201                     ; 40 {
 202                     .text:	section	.text,new
 203  0000               f_EXTI_PORTA_IRQHandler:
 207                     ; 42 }
 210  0000 80            	iret
 233                     ; 45 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 233                     ; 46 {
 234                     .text:	section	.text,new
 235  0000               f_EXTI_PORTB_IRQHandler:
 239                     ; 48 }
 242  0000 80            	iret
 265                     ; 51 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 265                     ; 52 {
 266                     .text:	section	.text,new
 267  0000               f_EXTI_PORTC_IRQHandler:
 271                     ; 54 }
 274  0000 80            	iret
 297                     ; 57 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 297                     ; 58 {
 298                     .text:	section	.text,new
 299  0000               f_EXTI_PORTD_IRQHandler:
 303                     ; 60 }
 306  0000 80            	iret
 329                     ; 63 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 329                     ; 64 {
 330                     .text:	section	.text,new
 331  0000               f_EXTI_PORTE_IRQHandler:
 335                     ; 66 }
 338  0000 80            	iret
 360                     ; 91 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 360                     ; 92 {
 361                     .text:	section	.text,new
 362  0000               f_SPI_IRQHandler:
 366                     ; 94 }
 369  0000 80            	iret
 392                     ; 102 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 392                     ; 103 {
 393                     .text:	section	.text,new
 394  0000               f_TIM1_CAP_COM_IRQHandler:
 398                     ; 105 }
 401  0000 80            	iret
 424                     ; 128  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 424                     ; 129  {
 425                     .text:	section	.text,new
 426  0000               f_TIM2_CAP_COM_IRQHandler:
 430                     ; 131  }
 433  0000 80            	iret
 471                     ; 158 INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 471                     ; 159 {
 472                     .text:	section	.text,new
 473  0000               f_UART1_TX_IRQHandler:
 475       00000001      OFST:	set	1
 476  0000 88            	push	a
 479                     ; 163 	if (UART1->SR & UART1_SR_TXE)
 481  0001 c65230        	ld	a,21040
 482  0004 a580          	bcp	a,#128
 483  0006 2721          	jreq	L771
 484                     ; 165 		if (UART1_txhead == UART1_txtail)
 486  0008 b600          	ld	a,_UART1_txhead
 487  000a b100          	cp	a,_UART1_txtail
 488  000c 2606          	jrne	L102
 489                     ; 167 			UART1->CR2 &= (uint8_t) ~UART1_CR2_TIEN;//disable TXE-irq: tx buffer empty
 491  000e 721f5235      	bres	21045,#7
 493  0012 2015          	jra	L771
 494  0014               L102:
 495                     ; 171 			tmp = (uint8_t) ((UART1_txtail + 1) & UART1_txbuff_mask);
 497  0014 b600          	ld	a,_UART1_txtail
 498  0016 4c            	inc	a
 499  0017 c40000        	and	a,_UART1_txbuff_mask
 500  001a 6b01          	ld	(OFST+0,sp),a
 502                     ; 172 			UART1_txtail = tmp;
 504  001c 7b01          	ld	a,(OFST+0,sp)
 505  001e b700          	ld	_UART1_txtail,a
 506                     ; 173 			UART1->DR = UART1_txbuff[tmp];			//send next byte from tx buffer
 508  0020 7b01          	ld	a,(OFST+0,sp)
 509  0022 5f            	clrw	x
 510  0023 97            	ld	xl,a
 511  0024 e600          	ld	a,(_UART1_txbuff,x)
 512  0026 c75231        	ld	21041,a
 513  0029               L771:
 514                     ; 177 }
 517  0029 84            	pop	a
 518  002a 80            	iret
 566                     ; 181  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 566                     ; 182  {
 567                     .text:	section	.text,new
 568  0000               f_UART1_RX_IRQHandler:
 570       00000002      OFST:	set	2
 571  0000 89            	pushw	x
 574                     ; 187 	if (UART1->SR & UART1_SR_RXNE)
 576  0001 c65230        	ld	a,21040
 577  0004 a520          	bcp	a,#32
 578  0006 2729          	jreq	L722
 579                     ; 189 		UART1_rxerror = 0;
 581  0008 5f            	clrw	x
 582  0009 bf00          	ldw	_UART1_rxerror,x
 583                     ; 190 		data = (uint8_t) UART1->DR;
 585  000b c65231        	ld	a,21041
 586  000e 6b01          	ld	(OFST-1,sp),a
 588                     ; 191 		tmp = (uint8_t) ((UART1_rxhead + 1) & UART1_rxbuff_mask);
 590  0010 b600          	ld	a,_UART1_rxhead
 591  0012 4c            	inc	a
 592  0013 c40000        	and	a,_UART1_rxbuff_mask
 593  0016 6b02          	ld	(OFST+0,sp),a
 595                     ; 193 		if (tmp == UART1_rxtail)					//buffer full!
 597  0018 7b02          	ld	a,(OFST+0,sp)
 598  001a b100          	cp	a,_UART1_rxtail
 599  001c 2607          	jrne	L132
 600                     ; 195 			UART1_rxerror = 1;
 602  001e ae0001        	ldw	x,#1
 603  0021 bf00          	ldw	_UART1_rxerror,x
 605  0023 200c          	jra	L722
 606  0025               L132:
 607                     ; 199 			UART1_rxbuff[tmp] = data;
 609  0025 7b02          	ld	a,(OFST+0,sp)
 610  0027 5f            	clrw	x
 611  0028 97            	ld	xl,a
 612  0029 7b01          	ld	a,(OFST-1,sp)
 613  002b e700          	ld	(_UART1_rxbuff,x),a
 614                     ; 200 			UART1_rxhead = tmp;
 616  002d 7b02          	ld	a,(OFST+0,sp)
 617  002f b700          	ld	_UART1_rxhead,a
 618  0031               L722:
 619                     ; 204  }
 622  0031 5b02          	addw	sp,#2
 623  0033 80            	iret
 645                     ; 232 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 645                     ; 233 {
 646                     .text:	section	.text,new
 647  0000               f_I2C_IRQHandler:
 651                     ; 235 }
 654  0000 80            	iret
 676                     ; 273  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 676                     ; 274  {
 677                     .text:	section	.text,new
 678  0000               f_ADC1_IRQHandler:
 682                     ; 294  }
 685  0000 80            	iret
 711                     ; 306  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 711                     ; 307  {
 712                     .text:	section	.text,new
 713  0000               f_TIM4_UPD_OVF_IRQHandler:
 715  0000 8a            	push	cc
 716  0001 84            	pop	a
 717  0002 a4bf          	and	a,#191
 718  0004 88            	push	a
 719  0005 86            	pop	cc
 720  0006 3b0002        	push	c_x+2
 721  0009 be00          	ldw	x,c_x
 722  000b 89            	pushw	x
 723  000c 3b0002        	push	c_y+2
 724  000f be00          	ldw	x,c_y
 725  0011 89            	pushw	x
 728                     ; 308 	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 730  0012 a601          	ld	a,#1
 731  0014 cd0000        	call	_TIM4_ClearFlag
 733                     ; 309 	millis++;
 735  0017 ae0000        	ldw	x,#_millis
 736  001a a601          	ld	a,#1
 737  001c cd0000        	call	c_lgadc
 739                     ; 310 	countflag = 1;																	//every ms set to 1
 741  001f 35010000      	mov	_countflag,#1
 742                     ; 311  }
 745  0023 85            	popw	x
 746  0024 bf00          	ldw	c_y,x
 747  0026 320002        	pop	c_y+2
 748  0029 85            	popw	x
 749  002a bf00          	ldw	c_x,x
 750  002c 320002        	pop	c_x+2
 751  002f 80            	iret
 774                     ; 316 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 774                     ; 317 {
 775                     .text:	section	.text,new
 776  0000               f_EEPROM_EEC_IRQHandler:
 780                     ; 319 }
 783  0000 80            	iret
 795                     	xdef	f_EEPROM_EEC_IRQHandler
 796                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 797                     	xdef	f_ADC1_IRQHandler
 798                     	xdef	f_UART1_RX_IRQHandler
 799                     	xdef	f_UART1_TX_IRQHandler
 800                     	xdef	f_TIM2_CAP_COM_IRQHandler
 801                     	xdef	f_I2C_IRQHandler
 802                     	xdef	f_TIM1_CAP_COM_IRQHandler
 803                     	xdef	f_SPI_IRQHandler
 804                     	xdef	f_EXTI_PORTE_IRQHandler
 805                     	xdef	f_EXTI_PORTD_IRQHandler
 806                     	xdef	f_EXTI_PORTC_IRQHandler
 807                     	xdef	f_EXTI_PORTB_IRQHandler
 808                     	xdef	f_EXTI_PORTA_IRQHandler
 809                     	xdef	f_CLK_IRQHandler
 810                     	xdef	f_AWU_IRQHandler
 811                     	xdef	f_TLI_IRQHandler
 812                     	xdef	f_TRAP_IRQHandler
 813                     	xdef	f_NonHandledInterrupt
 814                     	xref	_UART1_txbuff_mask
 815                     	xref	_UART1_rxbuff_mask
 816                     	xref.b	_UART1_rxerror
 817                     	xref.b	_UART1_txtail
 818                     	xref.b	_UART1_txhead
 819                     	xref.b	_UART1_rxtail
 820                     	xref.b	_UART1_rxhead
 821                     	xref.b	_UART1_txbuff
 822                     	xref.b	_UART1_rxbuff
 823                     	xref.b	_millis
 824                     	xref.b	_countflag
 825                     	xref	_TIM4_ClearFlag
 826                     	xref.b	c_x
 827                     	xref.b	c_y
 846                     	xref	c_lgadc
 847                     	end
