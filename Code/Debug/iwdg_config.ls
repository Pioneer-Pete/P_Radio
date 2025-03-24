   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  48                     ; 7 void IWDG_config(void)
  48                     ; 8 {
  50                     .text:	section	.text,new
  51  0000               _IWDG_config:
  55                     ; 9 	IWDG_Enable();
  57  0000 cd0000        	call	_IWDG_Enable
  59                     ; 10 	IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
  61  0003 a655          	ld	a,#85
  62  0005 cd0000        	call	_IWDG_WriteAccessCmd
  64                     ; 11 	IWDG_SetPrescaler(IWDG_Prescaler_256);					//64kHz / 256 = 250Hz
  66  0008 a606          	ld	a,#6
  67  000a cd0000        	call	_IWDG_SetPrescaler
  69                     ; 12 	IWDG_SetReload(255);									//250 Hz / 256 --> 1.024 seconds
  71  000d a6ff          	ld	a,#255
  72  000f cd0000        	call	_IWDG_SetReload
  74                     ; 13 	IWDG_WriteAccessCmd(IWDG_WriteAccess_Disable);
  76  0012 4f            	clr	a
  77  0013 cd0000        	call	_IWDG_WriteAccessCmd
  79                     ; 14 }
  82  0016 81            	ret
  95                     	xdef	_IWDG_config
  96                     	xref	_IWDG_Enable
  97                     	xref	_IWDG_SetReload
  98                     	xref	_IWDG_SetPrescaler
  99                     	xref	_IWDG_WriteAccessCmd
 118                     	end
