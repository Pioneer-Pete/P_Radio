   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  46                     ; 5 void ITC_config(void)
  46                     ; 6 {
  48                     .text:	section	.text,new
  49  0000               _ITC_config:
  53                     ; 7 	ITC_DeInit();
  55  0000 cd0000        	call	_ITC_DeInit
  57                     ; 9     ITC_SetSoftwarePriority(ITC_IRQ_PORTD, ITC_PRIORITYLEVEL_3);
  59  0003 ae0603        	ldw	x,#1539
  60  0006 cd0000        	call	_ITC_SetSoftwarePriority
  62                     ; 10 }
  65  0009 81            	ret
  78                     	xdef	_ITC_config
  79                     	xref	_ITC_SetSoftwarePriority
  80                     	xref	_ITC_DeInit
  99                     	end
