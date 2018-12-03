   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  50                     ; 53 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  50                     ; 54 {
  51                     .text:	section	.text,new
  52  0000               f_NonHandledInterrupt:
  56                     ; 58 }
  59  0000 80            	iret	
  81                     ; 66 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  81                     ; 67 {
  82                     .text:	section	.text,new
  83  0000               f_TRAP_IRQHandler:
  87                     ; 71 }
  90  0000 80            	iret	
 112                     ; 78 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 112                     ; 79 
 112                     ; 80 {
 113                     .text:	section	.text,new
 114  0000               f_TLI_IRQHandler:
 118                     ; 84 }
 121  0000 80            	iret	
 143                     ; 91 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 143                     ; 92 {
 144                     .text:	section	.text,new
 145  0000               f_AWU_IRQHandler:
 149                     ; 96 }
 152  0000 80            	iret	
 174                     ; 103 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 174                     ; 104 {
 175                     .text:	section	.text,new
 176  0000               f_CLK_IRQHandler:
 180                     ; 108 }
 183  0000 80            	iret	
 206                     ; 115 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 206                     ; 116 {
 207                     .text:	section	.text,new
 208  0000               f_EXTI_PORTA_IRQHandler:
 212                     ; 120 }
 215  0000 80            	iret	
 238                     ; 127 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 238                     ; 128 {
 239                     .text:	section	.text,new
 240  0000               f_EXTI_PORTB_IRQHandler:
 244                     ; 132 }
 247  0000 80            	iret	
 270                     ; 139 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 270                     ; 140 {
 271                     .text:	section	.text,new
 272  0000               f_EXTI_PORTC_IRQHandler:
 276                     ; 144 }
 279  0000 80            	iret	
 302                     ; 151 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 302                     ; 152 {
 303                     .text:	section	.text,new
 304  0000               f_EXTI_PORTD_IRQHandler:
 308                     ; 156 }
 311  0000 80            	iret	
 334                     ; 163 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 334                     ; 164 {
 335                     .text:	section	.text,new
 336  0000               f_EXTI_PORTE_IRQHandler:
 340                     ; 168 }
 343  0000 80            	iret	
 365                     ; 215 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 365                     ; 216 {
 366                     .text:	section	.text,new
 367  0000               f_SPI_IRQHandler:
 371                     ; 220 }
 374  0000 80            	iret	
 397                     ; 259  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 397                     ; 260  {
 398                     .text:	section	.text,new
 399  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 403                     ; 264  }
 406  0000 80            	iret	
 429                     ; 271  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 429                     ; 272  {
 430                     .text:	section	.text,new
 431  0000               f_TIM2_CAP_COM_IRQHandler:
 435                     ; 276  }
 438  0000 80            	iret	
 461                     ; 286  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 461                     ; 287  {
 462                     .text:	section	.text,new
 463  0000               f_TIM3_UPD_OVF_BRK_IRQHandler:
 467                     ; 291  }
 470  0000 80            	iret	
 493                     ; 298  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 493                     ; 299  {
 494                     .text:	section	.text,new
 495  0000               f_TIM3_CAP_COM_IRQHandler:
 499                     ; 303  }
 502  0000 80            	iret	
 524                     ; 359 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 524                     ; 360 {
 525                     .text:	section	.text,new
 526  0000               f_I2C_IRQHandler:
 530                     ; 364 }
 533  0000 80            	iret	
 556                     ; 372  INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 556                     ; 373  {
 557                     .text:	section	.text,new
 558  0000               f_UART2_TX_IRQHandler:
 562                     ; 377  }
 565  0000 80            	iret	
 588                     ; 384  INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
 588                     ; 385  {
 589                     .text:	section	.text,new
 590  0000               f_UART2_RX_IRQHandler:
 594                     ; 389  }
 597  0000 80            	iret	
 619                     ; 438  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 619                     ; 439  {
 620                     .text:	section	.text,new
 621  0000               f_ADC1_IRQHandler:
 625                     ; 443  }
 628  0000 80            	iret	
 651                     ; 472 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 651                     ; 473 {
 652                     .text:	section	.text,new
 653  0000               f_EEPROM_EEC_IRQHandler:
 657                     ; 477 }
 660  0000 80            	iret	
 672                     	xdef	f_EEPROM_EEC_IRQHandler
 673                     	xdef	f_ADC1_IRQHandler
 674                     	xdef	f_UART2_TX_IRQHandler
 675                     	xdef	f_UART2_RX_IRQHandler
 676                     	xdef	f_I2C_IRQHandler
 677                     	xdef	f_TIM3_CAP_COM_IRQHandler
 678                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 679                     	xdef	f_TIM2_CAP_COM_IRQHandler
 680                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 681                     	xdef	f_SPI_IRQHandler
 682                     	xdef	f_EXTI_PORTE_IRQHandler
 683                     	xdef	f_EXTI_PORTD_IRQHandler
 684                     	xdef	f_EXTI_PORTC_IRQHandler
 685                     	xdef	f_EXTI_PORTB_IRQHandler
 686                     	xdef	f_EXTI_PORTA_IRQHandler
 687                     	xdef	f_CLK_IRQHandler
 688                     	xdef	f_AWU_IRQHandler
 689                     	xdef	f_TLI_IRQHandler
 690                     	xdef	f_TRAP_IRQHandler
 691                     	xdef	f_NonHandledInterrupt
 710                     	end
