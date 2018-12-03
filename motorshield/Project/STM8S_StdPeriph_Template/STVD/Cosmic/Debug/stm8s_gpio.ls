   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
 115                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 115                     ; 54 {
 117                     .text:	section	.text,new
 118  0000               _GPIO_DeInit:
 122                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 124  0000 7f            	clr	(x)
 125                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 127  0001 6f02          	clr	(2,x)
 128                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 130  0003 6f03          	clr	(3,x)
 131                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 133  0005 6f04          	clr	(4,x)
 134                     ; 59 }
 137  0007 81            	ret	
 377                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 377                     ; 72 {
 378                     .text:	section	.text,new
 379  0000               _GPIO_Init:
 381  0000 89            	pushw	x
 382       00000000      OFST:	set	0
 385                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 387  0001 7b05          	ld	a,(OFST+5,sp)
 388  0003 43            	cpl	a
 389  0004 e404          	and	a,(4,x)
 390  0006 e704          	ld	(4,x),a
 391                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 393  0008 7b06          	ld	a,(OFST+6,sp)
 394  000a 2a16          	jrpl	L771
 395                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 397  000c a510          	bcp	a,#16
 398  000e 2705          	jreq	L102
 399                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 401  0010 f6            	ld	a,(x)
 402  0011 1a05          	or	a,(OFST+5,sp)
 404  0013 2004          	jra	L302
 405  0015               L102:
 406                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 408  0015 7b05          	ld	a,(OFST+5,sp)
 409  0017 43            	cpl	a
 410  0018 f4            	and	a,(x)
 411  0019               L302:
 412  0019 f7            	ld	(x),a
 413                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 415  001a 1e01          	ldw	x,(OFST+1,sp)
 416  001c e602          	ld	a,(2,x)
 417  001e 1a05          	or	a,(OFST+5,sp)
 419  0020 2005          	jra	L502
 420  0022               L771:
 421                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 423  0022 7b05          	ld	a,(OFST+5,sp)
 424  0024 43            	cpl	a
 425  0025 e402          	and	a,(2,x)
 426  0027               L502:
 427  0027 e702          	ld	(2,x),a
 428                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 430  0029 7b06          	ld	a,(OFST+6,sp)
 431  002b a540          	bcp	a,#64
 432  002d 2706          	jreq	L702
 433                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 435  002f e603          	ld	a,(3,x)
 436  0031 1a05          	or	a,(OFST+5,sp)
 438  0033 2005          	jra	L112
 439  0035               L702:
 440                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 442  0035 7b05          	ld	a,(OFST+5,sp)
 443  0037 43            	cpl	a
 444  0038 e403          	and	a,(3,x)
 445  003a               L112:
 446  003a e703          	ld	(3,x),a
 447                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 449  003c 7b06          	ld	a,(OFST+6,sp)
 450  003e a520          	bcp	a,#32
 451  0040 2706          	jreq	L312
 452                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 454  0042 e604          	ld	a,(4,x)
 455  0044 1a05          	or	a,(OFST+5,sp)
 457  0046 2005          	jra	L512
 458  0048               L312:
 459                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 461  0048 7b05          	ld	a,(OFST+5,sp)
 462  004a 43            	cpl	a
 463  004b e404          	and	a,(4,x)
 464  004d               L512:
 465  004d e704          	ld	(4,x),a
 466                     ; 131 }
 469  004f 85            	popw	x
 470  0050 81            	ret	
 514                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 514                     ; 142 {
 515                     .text:	section	.text,new
 516  0000               _GPIO_Write:
 518  0000 89            	pushw	x
 519       00000000      OFST:	set	0
 522                     ; 143   GPIOx->ODR = PortVal;
 524  0001 7b05          	ld	a,(OFST+5,sp)
 525  0003 f7            	ld	(x),a
 526                     ; 144 }
 529  0004 85            	popw	x
 530  0005 81            	ret	
 577                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 577                     ; 155 {
 578                     .text:	section	.text,new
 579  0000               _GPIO_WriteHigh:
 581  0000 89            	pushw	x
 582       00000000      OFST:	set	0
 585                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 587  0001 f6            	ld	a,(x)
 588  0002 1a05          	or	a,(OFST+5,sp)
 589  0004 f7            	ld	(x),a
 590                     ; 157 }
 593  0005 85            	popw	x
 594  0006 81            	ret	
 641                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 641                     ; 168 {
 642                     .text:	section	.text,new
 643  0000               _GPIO_WriteLow:
 645  0000 89            	pushw	x
 646       00000000      OFST:	set	0
 649                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 651  0001 7b05          	ld	a,(OFST+5,sp)
 652  0003 43            	cpl	a
 653  0004 f4            	and	a,(x)
 654  0005 f7            	ld	(x),a
 655                     ; 170 }
 658  0006 85            	popw	x
 659  0007 81            	ret	
 706                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 706                     ; 181 {
 707                     .text:	section	.text,new
 708  0000               _GPIO_WriteReverse:
 710  0000 89            	pushw	x
 711       00000000      OFST:	set	0
 714                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 716  0001 f6            	ld	a,(x)
 717  0002 1805          	xor	a,(OFST+5,sp)
 718  0004 f7            	ld	(x),a
 719                     ; 183 }
 722  0005 85            	popw	x
 723  0006 81            	ret	
 761                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 761                     ; 192 {
 762                     .text:	section	.text,new
 763  0000               _GPIO_ReadOutputData:
 767                     ; 193   return ((uint8_t)GPIOx->ODR);
 769  0000 f6            	ld	a,(x)
 772  0001 81            	ret	
 809                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 809                     ; 203 {
 810                     .text:	section	.text,new
 811  0000               _GPIO_ReadInputData:
 815                     ; 204   return ((uint8_t)GPIOx->IDR);
 817  0000 e601          	ld	a,(1,x)
 820  0002 81            	ret	
 888                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 888                     ; 214 {
 889                     .text:	section	.text,new
 890  0000               _GPIO_ReadInputPin:
 892  0000 89            	pushw	x
 893       00000000      OFST:	set	0
 896                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 898  0001 e601          	ld	a,(1,x)
 899  0003 1405          	and	a,(OFST+5,sp)
 902  0005 85            	popw	x
 903  0006 81            	ret	
 982                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 982                     ; 226 {
 983                     .text:	section	.text,new
 984  0000               _GPIO_ExternalPullUpConfig:
 986  0000 89            	pushw	x
 987       00000000      OFST:	set	0
 990                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 992  0001 7b05          	ld	a,(OFST+5,sp)
 993  0003 2605          	jrne	L23
 994  0005 ae00e4        	ldw	x,#228
 995  0008 ad23          	call	LC001
 996  000a               L23:
 997                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 999  000a 7b06          	ld	a,(OFST+6,sp)
1000  000c 2708          	jreq	L24
1001  000e 4a            	dec	a
1002  000f 2705          	jreq	L24
1003  0011 ae00e5        	ldw	x,#229
1004  0014 ad17          	call	LC001
1005  0016               L24:
1006                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
1008  0016 7b06          	ld	a,(OFST+6,sp)
1009  0018 2708          	jreq	L374
1010                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1012  001a 1e01          	ldw	x,(OFST+1,sp)
1013  001c e603          	ld	a,(3,x)
1014  001e 1a05          	or	a,(OFST+5,sp)
1016  0020 2007          	jra	L574
1017  0022               L374:
1018                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1020  0022 1e01          	ldw	x,(OFST+1,sp)
1021  0024 7b05          	ld	a,(OFST+5,sp)
1022  0026 43            	cpl	a
1023  0027 e403          	and	a,(3,x)
1024  0029               L574:
1025  0029 e703          	ld	(3,x),a
1026                     ; 238 }
1029  002b 85            	popw	x
1030  002c 81            	ret	
1031  002d               LC001:
1032  002d 89            	pushw	x
1033  002e 5f            	clrw	x
1034  002f 89            	pushw	x
1035  0030 ae0000        	ldw	x,#L174
1036  0033 cd0000        	call	_assert_failed
1038  0036 5b04          	addw	sp,#4
1039  0038 81            	ret	
1052                     	xdef	_GPIO_ExternalPullUpConfig
1053                     	xdef	_GPIO_ReadInputPin
1054                     	xdef	_GPIO_ReadOutputData
1055                     	xdef	_GPIO_ReadInputData
1056                     	xdef	_GPIO_WriteReverse
1057                     	xdef	_GPIO_WriteLow
1058                     	xdef	_GPIO_WriteHigh
1059                     	xdef	_GPIO_Write
1060                     	xdef	_GPIO_Init
1061                     	xdef	_GPIO_DeInit
1062                     	xref	_assert_failed
1063                     .const:	section	.text
1064  0000               L174:
1065  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
1066  0012 6965735c7374  	dc.b	"ies\stm8s_stdperip"
1067  0024 685f64726976  	dc.b	"h_driver\src\stm8s"
1068  0036 5f6770696f2e  	dc.b	"_gpio.c",0
1088                     	end
