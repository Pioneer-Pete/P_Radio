   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
 110                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 110                     ; 54 {
 112                     .text:	section	.text,new
 113  0000               _GPIO_DeInit:
 117                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 119  0000 7f            	clr	(x)
 120                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 122  0001 6f02          	clr	(2,x)
 123                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 125  0003 6f03          	clr	(3,x)
 126                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 128  0005 6f04          	clr	(4,x)
 129                     ; 59 }
 132  0007 81            	ret
 372                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 372                     ; 72 {
 373                     .text:	section	.text,new
 374  0000               _GPIO_Init:
 376  0000 89            	pushw	x
 377       00000000      OFST:	set	0
 380                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 382                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 384                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 386  0001 7b05          	ld	a,(OFST+5,sp)
 387  0003 43            	cpl	a
 388  0004 e404          	and	a,(4,x)
 389  0006 e704          	ld	(4,x),a
 390                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 392  0008 7b06          	ld	a,(OFST+6,sp)
 393  000a a580          	bcp	a,#128
 394  000c 271d          	jreq	L771
 395                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 397  000e 7b06          	ld	a,(OFST+6,sp)
 398  0010 a510          	bcp	a,#16
 399  0012 2706          	jreq	L102
 400                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 402  0014 f6            	ld	a,(x)
 403  0015 1a05          	or	a,(OFST+5,sp)
 404  0017 f7            	ld	(x),a
 406  0018 2007          	jra	L302
 407  001a               L102:
 408                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 410  001a 1e01          	ldw	x,(OFST+1,sp)
 411  001c 7b05          	ld	a,(OFST+5,sp)
 412  001e 43            	cpl	a
 413  001f f4            	and	a,(x)
 414  0020 f7            	ld	(x),a
 415  0021               L302:
 416                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 418  0021 1e01          	ldw	x,(OFST+1,sp)
 419  0023 e602          	ld	a,(2,x)
 420  0025 1a05          	or	a,(OFST+5,sp)
 421  0027 e702          	ld	(2,x),a
 423  0029 2009          	jra	L502
 424  002b               L771:
 425                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 427  002b 1e01          	ldw	x,(OFST+1,sp)
 428  002d 7b05          	ld	a,(OFST+5,sp)
 429  002f 43            	cpl	a
 430  0030 e402          	and	a,(2,x)
 431  0032 e702          	ld	(2,x),a
 432  0034               L502:
 433                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 435  0034 7b06          	ld	a,(OFST+6,sp)
 436  0036 a540          	bcp	a,#64
 437  0038 270a          	jreq	L702
 438                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 440  003a 1e01          	ldw	x,(OFST+1,sp)
 441  003c e603          	ld	a,(3,x)
 442  003e 1a05          	or	a,(OFST+5,sp)
 443  0040 e703          	ld	(3,x),a
 445  0042 2009          	jra	L112
 446  0044               L702:
 447                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 449  0044 1e01          	ldw	x,(OFST+1,sp)
 450  0046 7b05          	ld	a,(OFST+5,sp)
 451  0048 43            	cpl	a
 452  0049 e403          	and	a,(3,x)
 453  004b e703          	ld	(3,x),a
 454  004d               L112:
 455                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 457  004d 7b06          	ld	a,(OFST+6,sp)
 458  004f a520          	bcp	a,#32
 459  0051 270a          	jreq	L312
 460                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 462  0053 1e01          	ldw	x,(OFST+1,sp)
 463  0055 e604          	ld	a,(4,x)
 464  0057 1a05          	or	a,(OFST+5,sp)
 465  0059 e704          	ld	(4,x),a
 467  005b 2009          	jra	L512
 468  005d               L312:
 469                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 471  005d 1e01          	ldw	x,(OFST+1,sp)
 472  005f 7b05          	ld	a,(OFST+5,sp)
 473  0061 43            	cpl	a
 474  0062 e404          	and	a,(4,x)
 475  0064 e704          	ld	(4,x),a
 476  0066               L512:
 477                     ; 131 }
 480  0066 85            	popw	x
 481  0067 81            	ret
 527                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 527                     ; 142 {
 528                     .text:	section	.text,new
 529  0000               _GPIO_Write:
 531  0000 89            	pushw	x
 532       00000000      OFST:	set	0
 535                     ; 143   GPIOx->ODR = PortVal;
 537  0001 7b05          	ld	a,(OFST+5,sp)
 538  0003 1e01          	ldw	x,(OFST+1,sp)
 539  0005 f7            	ld	(x),a
 540                     ; 144 }
 543  0006 85            	popw	x
 544  0007 81            	ret
 591                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 591                     ; 155 {
 592                     .text:	section	.text,new
 593  0000               _GPIO_WriteHigh:
 595  0000 89            	pushw	x
 596       00000000      OFST:	set	0
 599                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 601  0001 f6            	ld	a,(x)
 602  0002 1a05          	or	a,(OFST+5,sp)
 603  0004 f7            	ld	(x),a
 604                     ; 157 }
 607  0005 85            	popw	x
 608  0006 81            	ret
 655                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 655                     ; 168 {
 656                     .text:	section	.text,new
 657  0000               _GPIO_WriteLow:
 659  0000 89            	pushw	x
 660       00000000      OFST:	set	0
 663                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 665  0001 7b05          	ld	a,(OFST+5,sp)
 666  0003 43            	cpl	a
 667  0004 f4            	and	a,(x)
 668  0005 f7            	ld	(x),a
 669                     ; 170 }
 672  0006 85            	popw	x
 673  0007 81            	ret
 720                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 720                     ; 181 {
 721                     .text:	section	.text,new
 722  0000               _GPIO_WriteReverse:
 724  0000 89            	pushw	x
 725       00000000      OFST:	set	0
 728                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 730  0001 f6            	ld	a,(x)
 731  0002 1805          	xor	a,(OFST+5,sp)
 732  0004 f7            	ld	(x),a
 733                     ; 183 }
 736  0005 85            	popw	x
 737  0006 81            	ret
 775                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 775                     ; 192 {
 776                     .text:	section	.text,new
 777  0000               _GPIO_ReadOutputData:
 781                     ; 193   return ((uint8_t)GPIOx->ODR);
 783  0000 f6            	ld	a,(x)
 786  0001 81            	ret
 823                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 823                     ; 203 {
 824                     .text:	section	.text,new
 825  0000               _GPIO_ReadInputData:
 829                     ; 204   return ((uint8_t)GPIOx->IDR);
 831  0000 e601          	ld	a,(1,x)
 834  0002 81            	ret
 902                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 902                     ; 214 {
 903                     .text:	section	.text,new
 904  0000               _GPIO_ReadInputPin:
 906  0000 89            	pushw	x
 907       00000000      OFST:	set	0
 910                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 912  0001 e601          	ld	a,(1,x)
 913  0003 1405          	and	a,(OFST+5,sp)
 916  0005 85            	popw	x
 917  0006 81            	ret
 995                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 995                     ; 226 {
 996                     .text:	section	.text,new
 997  0000               _GPIO_ExternalPullUpConfig:
 999  0000 89            	pushw	x
1000       00000000      OFST:	set	0
1003                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1005                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1007                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
1009  0001 0d06          	tnz	(OFST+6,sp)
1010  0003 2708          	jreq	L374
1011                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1013  0005 e603          	ld	a,(3,x)
1014  0007 1a05          	or	a,(OFST+5,sp)
1015  0009 e703          	ld	(3,x),a
1017  000b 2009          	jra	L574
1018  000d               L374:
1019                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1021  000d 1e01          	ldw	x,(OFST+1,sp)
1022  000f 7b05          	ld	a,(OFST+5,sp)
1023  0011 43            	cpl	a
1024  0012 e403          	and	a,(3,x)
1025  0014 e703          	ld	(3,x),a
1026  0016               L574:
1027                     ; 238 }
1030  0016 85            	popw	x
1031  0017 81            	ret
1044                     	xdef	_GPIO_ExternalPullUpConfig
1045                     	xdef	_GPIO_ReadInputPin
1046                     	xdef	_GPIO_ReadOutputData
1047                     	xdef	_GPIO_ReadInputData
1048                     	xdef	_GPIO_WriteReverse
1049                     	xdef	_GPIO_WriteLow
1050                     	xdef	_GPIO_WriteHigh
1051                     	xdef	_GPIO_Write
1052                     	xdef	_GPIO_Init
1053                     	xdef	_GPIO_DeInit
1072                     	end
