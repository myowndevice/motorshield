   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  21                     	bsct
  22  0000               _timetest:
  23  0000 00            	dc.b	0
  24  0001               _timedelay:
  25  0001 0000          	dc.w	0
  26  0003               _RXready:
  27  0003 01            	dc.b	1
  28  0004               _RXtek:
  29  0004 00            	dc.b	0
  30  0005               _mot_scor:
  31  0005 00            	dc.b	0
  32  0006 00            	dc.b	0
  33  0007 00            	dc.b	0
  34  0008 00            	dc.b	0
  35  0009               _mot_time:
  36  0009 00            	dc.b	0
  37  000a 00            	dc.b	0
  38  000b 00            	dc.b	0
  39  000c 00            	dc.b	0
  40  000d               _newspeed:
  41  000d 00            	dc.b	0
  88                     .const:	section	.text
  89  0000               L27:
  90  0000 0000007f      	dc.l	127
  91                     ; 24 void changespeed(void)
  91                     ; 25 {
  92                     	scross	off
  93                     .text:	section	.text,new
  94  0000               _changespeed:
  96  0000 88            	push	a
  97       00000001      OFST:	set	1
 100                     ; 30 	for (i=0;i<4;i++) {
 102  0001 4f            	clr	a
 103  0002 6b01          	ld	(OFST+0,sp),a
 105  0004               L76:
 106                     ; 31 		if ( mot_scor[i] == mot_newscor[i]) {
 108  0004 5f            	clrw	x
 109  0005 97            	ld	xl,a
 110  0006 905f          	clrw	y
 111  0008 9097          	ld	yl,a
 112  000a 90e605        	ld	a,(_mot_scor,y)
 113  000d e100          	cp	a,(_mot_newscor,x)
 114  000f 2603cc017e    	jreq	L17
 115                     ; 33 			continue;		
 117                     ; 34 		}else if (mot_scor[i]*mot_newscor[i] > 0) {
 119  0014 7b01          	ld	a,(OFST+0,sp)
 120  0016 5f            	clrw	x
 121  0017 97            	ld	xl,a
 122  0018 e605          	ld	a,(_mot_scor,x)
 123  001a 5f            	clrw	x
 124  001b 4d            	tnz	a
 125  001c 2a01          	jrpl	L6
 126  001e 53            	cplw	x
 127  001f               L6:
 128  001f 97            	ld	xl,a
 129  0020 7b01          	ld	a,(OFST+0,sp)
 130  0022 905f          	clrw	y
 131  0024 9097          	ld	yl,a
 132  0026 90e600        	ld	a,(_mot_newscor,y)
 133  0029 905f          	clrw	y
 134  002b 4d            	tnz	a
 135  002c 2a02          	jrpl	L01
 136  002e 9053          	cplw	y
 137  0030               L01:
 138  0030 9097          	ld	yl,a
 139  0032 cd0000        	call	c_imul
 141  0035 9c            	rvf	
 142  0036 5d            	tnzw	x
 143  0037 2d51          	jrsle	L101
 145  0039               L77:
 146                     ; 109 		ccrval = (u32)((mot_newscor[i]>0) ? mot_newscor[i] : (-mot_newscor[i]))*MAXPWM/127;
 148  0039 7b01          	ld	a,(OFST+0,sp)
 149  003b 5f            	clrw	x
 150  003c 97            	ld	xl,a
 151  003d 9c            	rvf	
 152  003e e600          	ld	a,(_mot_newscor,x)
 153  0040 2d0e          	jrsle	L26
 154  0042 7b01          	ld	a,(OFST+0,sp)
 155  0044 5f            	clrw	x
 156  0045 97            	ld	xl,a
 157  0046 e600          	ld	a,(_mot_newscor,x)
 158  0048 5f            	clrw	x
 159  0049 4d            	tnz	a
 160  004a 2a01          	jrpl	L46
 161  004c 53            	cplw	x
 162  004d               L46:
 163  004d 97            	ld	xl,a
 164  004e 200d          	jra	L66
 165  0050               L26:
 166  0050 7b01          	ld	a,(OFST+0,sp)
 167  0052 5f            	clrw	x
 168  0053 97            	ld	xl,a
 169  0054 e600          	ld	a,(_mot_newscor,x)
 170  0056 5f            	clrw	x
 171  0057 4d            	tnz	a
 172  0058 2a01          	jrpl	L07
 173  005a 53            	cplw	x
 174  005b               L07:
 175  005b 97            	ld	xl,a
 176  005c 50            	negw	x
 177  005d               L66:
 178  005d 90ae0fff      	ldw	y,#4095
 179  0061 cd0000        	call	c_vmul
 181  0064 ae0000        	ldw	x,#L27
 182  0067 cd0000        	call	c_ludv
 184  006a be02          	ldw	x,c_lreg+2
 185  006c bf04          	ldw	_ccrval,x
 186                     ; 111 		switch (i) {
 188  006e 7b01          	ld	a,(OFST+0,sp)
 190                     ; 127 			break;
 191  0070 2603cc0174    	jreq	L33
 192  0075 4a            	dec	a
 193  0076 2603cc019c    	jreq	L53
 194  007b 4a            	dec	a
 195  007c 2603cc01a8    	jreq	L73
 196  0081 4a            	dec	a
 197  0082 2603cc01b4    	jreq	L14
 198  0087 cc017e        	jra	L17
 199  008a               L101:
 200                     ; 42 			if (mot_scor[i]*mot_newscor[i] < 0) {
 202  008a 7b01          	ld	a,(OFST+0,sp)
 203  008c 5f            	clrw	x
 204  008d 97            	ld	xl,a
 205  008e e605          	ld	a,(_mot_scor,x)
 206  0090 5f            	clrw	x
 207  0091 4d            	tnz	a
 208  0092 2a01          	jrpl	L21
 209  0094 53            	cplw	x
 210  0095               L21:
 211  0095 97            	ld	xl,a
 212  0096 7b01          	ld	a,(OFST+0,sp)
 213  0098 905f          	clrw	y
 214  009a 9097          	ld	yl,a
 215  009c 90e600        	ld	a,(_mot_newscor,y)
 216  009f 905f          	clrw	y
 217  00a1 4d            	tnz	a
 218  00a2 2a02          	jrpl	L41
 219  00a4 9053          	cplw	y
 220  00a6               L41:
 221  00a6 9097          	ld	yl,a
 222  00a8 cd0000        	call	c_imul
 224  00ab 2e08          	jrsge	L501
 225                     ; 43 				mot_time[i]=100;//сразу заблокируем дрыганье ногами пока не дойдет до нуля!
 227  00ad 7b01          	ld	a,(OFST+0,sp)
 228  00af 5f            	clrw	x
 229  00b0 97            	ld	xl,a
 230  00b1 a664          	ld	a,#100
 232  00b3 2006          	jra	L701
 233  00b5               L501:
 234                     ; 44 			}	else mot_time[i]=2;
 236  00b5 7b01          	ld	a,(OFST+0,sp)
 237  00b7 5f            	clrw	x
 238  00b8 97            	ld	xl,a
 239  00b9 a602          	ld	a,#2
 240  00bb               L701:
 241  00bb e709          	ld	(_mot_time,x),a
 242                     ; 50 			switch (i) {
 244  00bd 7b01          	ld	a,(OFST+0,sp)
 246                     ; 67 					break;
 247  00bf 270b          	jreq	L3
 248  00c1 4a            	dec	a
 249  00c2 271e          	jreq	L5
 250  00c4 4a            	dec	a
 251  00c5 272b          	jreq	L7
 252  00c7 4a            	dec	a
 253  00c8 2735          	jreq	L11
 254  00ca 2045          	jra	L311
 255  00cc               L3:
 256                     ; 51 				case 0:
 256                     ; 52 					GPIO_WriteLow(GPIOD,GPIO_PIN_0|GPIO_PIN_2);
 258  00cc 4b05          	push	#5
 259  00ce ae500f        	ldw	x,#20495
 260  00d1 cd0000        	call	_GPIO_WriteLow
 262  00d4 84            	pop	a
 263                     ; 53 					GPIO_WriteLow(GPIOE,GPIO_PIN_5);
 265  00d5 4b20          	push	#32
 266  00d7 ae5014        	ldw	x,#20500
 267  00da cd0000        	call	_GPIO_WriteLow
 269  00dd 84            	pop	a
 270                     ; 54 					GPIO_WriteLow(GPIOC,GPIO_PIN_1);
 272  00de 4b02          	push	#2
 274                     ; 55 					break;
 276  00e0 2028          	jp	LC003
 277  00e2               L5:
 278                     ; 56 				case 1:
 278                     ; 57 					GPIO_WriteLow(GPIOC,GPIO_PIN_4|GPIO_PIN_5);
 280  00e2 4b30          	push	#48
 281  00e4 ae500a        	ldw	x,#20490
 282  00e7 cd0000        	call	_GPIO_WriteLow
 284  00ea 84            	pop	a
 285                     ; 58 					GPIO_WriteLow(GPIOB,GPIO_PIN_2|GPIO_PIN_3);
 287  00eb 4b0c          	push	#12
 288  00ed ae5005        	ldw	x,#20485
 290                     ; 59 					break;
 292  00f0 201b          	jp	LC002
 293  00f2               L7:
 294                     ; 60 				case 2:
 294                     ; 61 					GPIO_WriteLow(GPIOB,GPIO_PIN_0|GPIO_PIN_1);
 296  00f2 4b03          	push	#3
 297  00f4 ae5005        	ldw	x,#20485
 298  00f7 cd0000        	call	_GPIO_WriteLow
 300  00fa 84            	pop	a
 301                     ; 62 					GPIO_WriteLow(GPIOC,GPIO_PIN_6|GPIO_PIN_7);
 303  00fb 4bc0          	push	#192
 305                     ; 63 					break;
 307  00fd 200b          	jp	LC003
 308  00ff               L11:
 309                     ; 64 				case 3:
 309                     ; 65 					GPIO_WriteLow(GPIOD,GPIO_PIN_3|GPIO_PIN_4);
 311  00ff 4b18          	push	#24
 312  0101 ae500f        	ldw	x,#20495
 313  0104 cd0000        	call	_GPIO_WriteLow
 315  0107 84            	pop	a
 316                     ; 66 					GPIO_WriteLow(GPIOC,GPIO_PIN_2|GPIO_PIN_3);
 318  0108 4b0c          	push	#12
 319  010a               LC003:
 320  010a ae500a        	ldw	x,#20490
 322  010d               LC002:
 323  010d cd0000        	call	_GPIO_WriteLow
 324  0110 84            	pop	a
 325                     ; 67 					break;
 327  0111               L311:
 328                     ; 69 			Delay(1);//чтобы исключить deadtime
 330  0111 ae0001        	ldw	x,#1
 331  0114 cd0000        	call	_Delay
 333                     ; 71 			if (mot_scor[i]>0) {
 335  0117 7b01          	ld	a,(OFST+0,sp)
 336  0119 5f            	clrw	x
 337  011a 97            	ld	xl,a
 338  011b 9c            	rvf	
 339  011c e605          	ld	a,(_mot_scor,x)
 340  011e 2d26          	jrsle	L511
 341                     ; 73 				switch (i) {
 343  0120 7b01          	ld	a,(OFST+0,sp)
 345                     ; 85 						break;
 346  0122 270c          	jreq	L31
 347  0124 4a            	dec	a
 348  0125 2710          	jreq	L51
 349  0127 4a            	dec	a
 350  0128 2711          	jreq	L71
 351  012a 4a            	dec	a
 352  012b 2712          	jreq	L12
 353  012d cc0039        	jra	L77
 354  0130               L31:
 355                     ; 74 					case 0:
 355                     ; 75 						GPIO_WriteHigh(GPIOC,GPIO_PIN_1);
 357  0130 4b02          	push	#2
 358  0132 ae500a        	ldw	x,#20490
 360                     ; 76 						break;
 362  0135 202f          	jp	LC001
 363  0137               L51:
 364                     ; 77 					case 1:
 364                     ; 78 						GPIO_WriteHigh(GPIOB,GPIO_PIN_2);
 366  0137 4b04          	push	#4
 368                     ; 79 						break;
 370  0139 2028          	jp	LC004
 371  013b               L71:
 372                     ; 80 					case 2:
 372                     ; 81 						GPIO_WriteHigh(GPIOB,GPIO_PIN_0);
 374  013b 4b01          	push	#1
 376                     ; 82 						break;
 378  013d 2024          	jp	LC004
 379  013f               L12:
 380                     ; 83 					case 3:
 380                     ; 84 						GPIO_WriteHigh(GPIOC,GPIO_PIN_3);
 382  013f 4b08          	push	#8
 383  0141 ae500a        	ldw	x,#20490
 385                     ; 85 						break;
 387  0144 2020          	jp	LC001
 389  0146               L511:
 390                     ; 89 				switch (i) {
 392  0146 7b01          	ld	a,(OFST+0,sp)
 394                     ; 101 						break;
 395  0148 270c          	jreq	L32
 396  014a 4a            	dec	a
 397  014b 2710          	jreq	L52
 398  014d 4a            	dec	a
 399  014e 2711          	jreq	L72
 400  0150 4a            	dec	a
 401  0151 271a          	jreq	L13
 402  0153 cc0039        	jra	L77
 403  0156               L32:
 404                     ; 90 					case 0:
 404                     ; 91 						GPIO_WriteHigh(GPIOE,GPIO_PIN_5);
 406  0156 4b20          	push	#32
 407  0158 ae5014        	ldw	x,#20500
 409                     ; 92 						break;
 411  015b 2009          	jp	LC001
 412  015d               L52:
 413                     ; 93 					case 1:
 413                     ; 94 						GPIO_WriteHigh(GPIOB,GPIO_PIN_3);
 415  015d 4b08          	push	#8
 417                     ; 95 						break;
 419  015f 2002          	jp	LC004
 420  0161               L72:
 421                     ; 96 					case 2:
 421                     ; 97 						GPIO_WriteHigh(GPIOB,GPIO_PIN_1);
 423  0161 4b02          	push	#2
 424  0163               LC004:
 425  0163 ae5005        	ldw	x,#20485
 427  0166               LC001:
 428  0166 cd0000        	call	_GPIO_WriteHigh
 429  0169 84            	pop	a
 430                     ; 98 						break;
 432  016a cc0039        	jra	L77
 433  016d               L13:
 434                     ; 99 					case 3:
 434                     ; 100 						GPIO_WriteHigh(GPIOC,GPIO_PIN_2);
 436  016d 4b04          	push	#4
 437  016f ae500a        	ldw	x,#20490
 439                     ; 101 						break;
 441  0172 20f2          	jp	LC001
 442  0174               L33:
 443                     ; 112 		case 0:
 443                     ; 113 			TIM1->CCR1H = (uint8_t)(ccrval>> 8);
 445  0174 5500045265    	mov	21093,_ccrval
 446                     ; 114 			TIM1->CCR1L = (uint8_t)(ccrval);
 448  0179 5500055266    	mov	21094,_ccrval+1
 449                     ; 115 			break;
 450  017e               L17:
 451                     ; 30 	for (i=0;i<4;i++) {
 453  017e 0c01          	inc	(OFST+0,sp)
 457  0180 7b01          	ld	a,(OFST+0,sp)
 458  0182 a104          	cp	a,#4
 459  0184 2403cc0004    	jrult	L76
 460                     ; 132 	for (i=0;i<4;i++) {
 462  0189 4f            	clr	a
 463  018a 6b01          	ld	(OFST+0,sp),a
 465  018c               L531:
 466                     ; 133 		mot_scor[i]=mot_newscor[i];
 468  018c 5f            	clrw	x
 469  018d 97            	ld	xl,a
 470  018e e600          	ld	a,(_mot_newscor,x)
 471  0190 e705          	ld	(_mot_scor,x),a
 472                     ; 132 	for (i=0;i<4;i++) {
 474  0192 0c01          	inc	(OFST+0,sp)
 478  0194 7b01          	ld	a,(OFST+0,sp)
 479  0196 a104          	cp	a,#4
 480  0198 25f2          	jrult	L531
 481                     ; 135 }
 484  019a 84            	pop	a
 485  019b 81            	ret	
 486  019c               L53:
 487                     ; 116 		case 1:
 487                     ; 117 			TIM1->CCR2H = (uint8_t)(ccrval>> 8);
 489  019c 5500045267    	mov	21095,_ccrval
 490                     ; 118 			TIM1->CCR2L = (uint8_t)(ccrval);
 492  01a1 5500055268    	mov	21096,_ccrval+1
 493                     ; 119 			break;
 495  01a6 20d6          	jra	L17
 496  01a8               L73:
 497                     ; 120 		case 2:
 497                     ; 121 			TIM1->CCR3H = (uint8_t)(ccrval>> 8);
 499  01a8 5500045269    	mov	21097,_ccrval
 500                     ; 122 			TIM1->CCR3L = (uint8_t)(ccrval);
 502  01ad 550005526a    	mov	21098,_ccrval+1
 503                     ; 123 			break;
 505  01b2 20ca          	jra	L17
 506  01b4               L14:
 507                     ; 124 		case 3:
 507                     ; 125 			TIM1->CCR4H = (uint8_t)(ccrval>> 8);
 509  01b4 550004526b    	mov	21099,_ccrval
 510                     ; 126 			TIM1->CCR4L = (uint8_t)(ccrval);
 512  01b9 550005526c    	mov	21100,_ccrval+1
 513                     ; 127 			break;
 515  01be 20be          	jra	L17
 583                     ; 137 void main(void)
 583                     ; 138 {
 584                     .text:	section	.text,new
 585  0000               _main:
 587  0000 5203          	subw	sp,#3
 588       00000003      OFST:	set	3
 591                     ; 141 	int fl=0;
 593  0002 5f            	clrw	x
 594  0003 1f02          	ldw	(OFST-1,sp),x
 596                     ; 152 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);//16mhg
 598  0005 4f            	clr	a
 599  0006 cd0000        	call	_CLK_HSIPrescalerConfig
 601                     ; 160 	TIM4_TimeBaseInit(TIM4_PRESCALER_128, 124);//1sec!!!
 603  0009 ae077c        	ldw	x,#1916
 604  000c cd0000        	call	_TIM4_TimeBaseInit
 606                     ; 161   TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 608  000f a601          	ld	a,#1
 609  0011 cd0000        	call	_TIM4_ClearFlag
 611                     ; 162 	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
 613  0014 ae0101        	ldw	x,#257
 614  0017 cd0000        	call	_TIM4_ITConfig
 616                     ; 166 	enableInterrupts();
 619  001a 9a            	rim	
 621                     ; 169 	TIM4_Cmd(ENABLE);
 624  001b a601          	ld	a,#1
 625  001d cd0000        	call	_TIM4_Cmd
 627                     ; 182 	GPIO_Init(GPIOB,GPIO_PIN_0|GPIO_PIN_1|GPIO_PIN_2|GPIO_PIN_3,GPIO_MODE_OUT_PP_LOW_FAST);
 629  0020 4be0          	push	#224
 630  0022 4b0f          	push	#15
 631  0024 ae5005        	ldw	x,#20485
 632  0027 cd0000        	call	_GPIO_Init
 634  002a 85            	popw	x
 635                     ; 183 	GPIO_Init(GPIOC,GPIO_PIN_1|GPIO_PIN_2|GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7,GPIO_MODE_OUT_PP_LOW_FAST);
 637  002b 4be0          	push	#224
 638  002d 4bfe          	push	#254
 639  002f ae500a        	ldw	x,#20490
 640  0032 cd0000        	call	_GPIO_Init
 642  0035 85            	popw	x
 643                     ; 184 	GPIO_Init(GPIOD,GPIO_PIN_0|GPIO_PIN_2|GPIO_PIN_3|GPIO_PIN_4,GPIO_MODE_OUT_PP_LOW_FAST);
 645  0036 4be0          	push	#224
 646  0038 4b1d          	push	#29
 647  003a ae500f        	ldw	x,#20495
 648  003d cd0000        	call	_GPIO_Init
 650  0040 85            	popw	x
 651                     ; 185 	GPIO_Init(GPIOE,GPIO_PIN_5,GPIO_MODE_OUT_PP_LOW_FAST);
 653  0041 4be0          	push	#224
 654  0043 4b20          	push	#32
 655  0045 ae5014        	ldw	x,#20500
 656  0048 cd0000        	call	_GPIO_Init
 658  004b 85            	popw	x
 659                     ; 192 	TIM1_DeInit();
 661  004c cd0000        	call	_TIM1_DeInit
 663                     ; 193 	TIM1_TimeBaseInit(0, TIM1_COUNTERMODE_UP, MAXPWM, 0);
 665  004f 4b00          	push	#0
 666  0051 ae0fff        	ldw	x,#4095
 667  0054 89            	pushw	x
 668  0055 4b00          	push	#0
 669  0057 5f            	clrw	x
 670  0058 cd0000        	call	_TIM1_TimeBaseInit
 672  005b 5b04          	addw	sp,#4
 673                     ; 208 	TIM1_CCPreloadControl(DISABLE);
 675  005d 4f            	clr	a
 676  005e cd0000        	call	_TIM1_CCPreloadControl
 678                     ; 210 	TIM1_BDTRConfig(TIM1_OSSISTATE_DISABLE,
 678                     ; 211                      TIM1_LOCKLEVEL_OFF,
 678                     ; 212                      0,
 678                     ; 213                      TIM1_BREAK_DISABLE,
 678                     ; 214                      TIM1_BREAKPOLARITY_LOW,TIM1_AUTOMATICOUTPUT_DISABLE);
 680  0061 4b00          	push	#0
 681  0063 4b00          	push	#0
 682  0065 4b00          	push	#0
 683  0067 4b00          	push	#0
 684  0069 5f            	clrw	x
 685  006a cd0000        	call	_TIM1_BDTRConfig
 687  006d 5b04          	addw	sp,#4
 688                     ; 216 	TIM1_OC1Init(TIM1_OCMODE_PWM2, TIM1_OUTPUTSTATE_DISABLE, TIM1_OUTPUTNSTATE_DISABLE,
 688                     ; 217                0, TIM1_OCPOLARITY_LOW, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET,
 688                     ; 218                TIM1_OCNIDLESTATE_RESET); 
 690  006f 4b00          	push	#0
 691  0071 4b55          	push	#85
 692  0073 4b00          	push	#0
 693  0075 4b22          	push	#34
 694  0077 5f            	clrw	x
 695  0078 89            	pushw	x
 696  0079 4b00          	push	#0
 697  007b ae7000        	ldw	x,#28672
 698  007e cd0000        	call	_TIM1_OC1Init
 700  0081 5b07          	addw	sp,#7
 701                     ; 221   TIM1_OC2Init(TIM1_OCMODE_PWM2,  TIM1_OUTPUTSTATE_DISABLE, TIM1_OUTPUTNSTATE_DISABLE,
 701                     ; 222                0, TIM1_OCPOLARITY_LOW, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET, 
 701                     ; 223                TIM1_OCNIDLESTATE_RESET);
 703  0083 4b00          	push	#0
 704  0085 4b55          	push	#85
 705  0087 4b00          	push	#0
 706  0089 4b22          	push	#34
 707  008b 5f            	clrw	x
 708  008c 89            	pushw	x
 709  008d 4b00          	push	#0
 710  008f ae7000        	ldw	x,#28672
 711  0092 cd0000        	call	_TIM1_OC2Init
 713  0095 5b07          	addw	sp,#7
 714                     ; 226   TIM1_OC3Init(TIM1_OCMODE_PWM2,  TIM1_OUTPUTSTATE_DISABLE, TIM1_OUTPUTNSTATE_DISABLE,
 714                     ; 227                0, TIM1_OCPOLARITY_LOW, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET,
 714                     ; 228                TIM1_OCNIDLESTATE_RESET);
 716  0097 4b00          	push	#0
 717  0099 4b55          	push	#85
 718  009b 4b00          	push	#0
 719  009d 4b22          	push	#34
 720  009f 5f            	clrw	x
 721  00a0 89            	pushw	x
 722  00a1 4b00          	push	#0
 723  00a3 ae7000        	ldw	x,#28672
 724  00a6 cd0000        	call	_TIM1_OC3Init
 726  00a9 5b07          	addw	sp,#7
 727                     ; 231   TIM1_OC4Init(TIM1_OCMODE_PWM2, TIM1_OUTPUTSTATE_DISABLE, 0, TIM1_OCPOLARITY_LOW,
 727                     ; 232                TIM1_OCIDLESTATE_SET);
 729  00ab 4b55          	push	#85
 730  00ad 4b22          	push	#34
 731  00af 5f            	clrw	x
 732  00b0 89            	pushw	x
 733  00b1 ae7000        	ldw	x,#28672
 734  00b4 cd0000        	call	_TIM1_OC4Init
 736  00b7 5b04          	addw	sp,#4
 737                     ; 235   TIM1_CtrlPWMOutputs(DISABLE); //vse v preryvanii!
 739  00b9 4f            	clr	a
 740  00ba cd0000        	call	_TIM1_CtrlPWMOutputs
 742                     ; 237 	TIM1_Cmd(ENABLE);
 744  00bd a601          	ld	a,#1
 745  00bf cd0000        	call	_TIM1_Cmd
 747                     ; 244 	GPIO_Init(GPIOD,GPIO_PIN_6,GPIO_MODE_IN_PU_NO_IT);//UART RX
 749  00c2 4b40          	push	#64
 750  00c4 4b40          	push	#64
 751  00c6 ae500f        	ldw	x,#20495
 752  00c9 cd0000        	call	_GPIO_Init
 754  00cc 85            	popw	x
 755                     ; 249 	UART1_DeInit();
 757  00cd cd0000        	call	_UART1_DeInit
 759                     ; 250   UART1_Init((uint32_t)9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
 759                     ; 251               UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TX_DISABLE|UART1_MODE_RX_ENABLE);
 761  00d0 4b88          	push	#136
 762  00d2 4b80          	push	#128
 763  00d4 4b00          	push	#0
 764  00d6 4b00          	push	#0
 765  00d8 4b00          	push	#0
 766  00da ae2580        	ldw	x,#9600
 767  00dd 89            	pushw	x
 768  00de 5f            	clrw	x
 769  00df 89            	pushw	x
 770  00e0 cd0000        	call	_UART1_Init
 772  00e3 5b09          	addw	sp,#9
 773                     ; 253 	UART1_ITConfig(UART1_IT_RXNE_OR,ENABLE);
 775  00e5 4b01          	push	#1
 776  00e7 ae0205        	ldw	x,#517
 777  00ea cd0000        	call	_UART1_ITConfig
 779  00ed ae1f01        	ldw	x,#7937
 780  00f0 84            	pop	a
 781                     ; 265 	TIM1_ITConfig(TIM1_IT_UPDATE|TIM1_IT_CC1|TIM1_IT_CC2|TIM1_IT_CC3|TIM1_IT_CC4, ENABLE);
 783  00f1 cd0000        	call	_TIM1_ITConfig
 785                     ; 271 	timetest=1;
 787  00f4 35010000      	mov	_timetest,#1
 788                     ; 272 	mot_newscor[0]=0;
 790  00f8 3f00          	clr	_mot_newscor
 791                     ; 273 	mot_newscor[1]=0;
 793  00fa 3f01          	clr	_mot_newscor+1
 794                     ; 274 	mot_newscor[2]=0;
 796  00fc 3f02          	clr	_mot_newscor+2
 797                     ; 275 	mot_newscor[3]=0;
 799  00fe 3f03          	clr	_mot_newscor+3
 800  0100               L561:
 801                     ; 290 		if (RXready==5) {
 803  0100 b603          	ld	a,_RXready
 804  0102 a105          	cp	a,#5
 805  0104 2609          	jrne	L171
 806                     ; 292 			timetest = 3;
 808  0106 35030000      	mov	_timetest,#3
 809                     ; 293 			changespeed();
 811  010a cd0000        	call	_changespeed
 813                     ; 294 			RXready=0;
 815  010d 3f03          	clr	_RXready
 816  010f               L171:
 817                     ; 297 		if (timetest==0) {
 819  010f b600          	ld	a,_timetest
 820  0111 26ed          	jrne	L561
 821                     ; 300 			RXready=5;
 823  0113 35050003      	mov	_RXready,#5
 824                     ; 301 			for (i=0;i<4;i++)
 826  0117 6b01          	ld	(OFST-2,sp),a
 828  0119               L571:
 829                     ; 302 				mot_newscor[i]=0;
 831  0119 5f            	clrw	x
 832  011a 97            	ld	xl,a
 833  011b 6f00          	clr	(_mot_newscor,x)
 834                     ; 301 			for (i=0;i<4;i++)
 836  011d 0c01          	inc	(OFST-2,sp)
 840  011f 7b01          	ld	a,(OFST-2,sp)
 841  0121 a104          	cp	a,#4
 842  0123 25f4          	jrult	L571
 843                     ; 303 			changespeed();
 845  0125 cd0000        	call	_changespeed
 847                     ; 304 			RXready=0;
 849  0128 3f03          	clr	_RXready
 850                     ; 305 			timetest = 3;
 852  012a 35030000      	mov	_timetest,#3
 853  012e 20d0          	jra	L561
 888                     ; 334 void assert_failed(u8* file, u32 line)
 888                     ; 335 { 
 889                     .text:	section	.text,new
 890  0000               _assert_failed:
 894  0000               L122:
 895  0000 20fe          	jra	L122
 930                     ; 347 void Delay(u16 nCount)
 930                     ; 348 {
 931                     .text:	section	.text,new
 932  0000               _Delay:
 936                     ; 350     timedelay=nCount;
 938  0000 bf01          	ldw	_timedelay,x
 940  0002               L742:
 941                     ; 352 		while (timedelay);
 943  0002 be01          	ldw	x,_timedelay
 944  0004 26fc          	jrne	L742
 945                     ; 353 }
 948  0006 81            	ret	
 951                     	bsct
 952  000e               _timesec:
 953  000e 03e8          	dc.w	1000
 991                     ; 357 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 991                     ; 358  {
 993                     .text:	section	.text,new
 994  0000               f_TIM4_UPD_OVF_IRQHandler:
 996  0000 8a            	push	cc
 997  0001 84            	pop	a
 998  0002 a4bf          	and	a,#191
 999  0004 88            	push	a
1000  0005 86            	pop	cc
1001       00000001      OFST:	set	1
1002  0006 3b0002        	push	c_x+2
1003  0009 be00          	ldw	x,c_x
1004  000b 89            	pushw	x
1005  000c 3b0002        	push	c_y+2
1006  000f be00          	ldw	x,c_y
1007  0011 89            	pushw	x
1008  0012 88            	push	a
1011                     ; 362 	if (timedelay) timedelay--;
1013  0013 be01          	ldw	x,_timedelay
1014  0015 2703          	jreq	L172
1017  0017 5a            	decw	x
1018  0018 bf01          	ldw	_timedelay,x
1019  001a               L172:
1020                     ; 363 	if (timesec) timesec--;
1022  001a be0e          	ldw	x,_timesec
1023  001c 2703          	jreq	L372
1026  001e 5a            	decw	x
1027  001f bf0e          	ldw	_timesec,x
1028  0021               L372:
1029                     ; 367 		for ( i=0;i<4;i++) {
1031  0021 4f            	clr	a
1032  0022 6b01          	ld	(OFST+0,sp),a
1034  0024               L572:
1035                     ; 368 			if (mot_time[i]) mot_time[i]--;
1037  0024 5f            	clrw	x
1038  0025 97            	ld	xl,a
1039  0026 6d09          	tnz	(_mot_time,x)
1040  0028 2704          	jreq	L303
1043  002a 5f            	clrw	x
1044  002b 97            	ld	xl,a
1045  002c 6a09          	dec	(_mot_time,x)
1046  002e               L303:
1047                     ; 367 		for ( i=0;i<4;i++) {
1049  002e 0c01          	inc	(OFST+0,sp)
1053  0030 7b01          	ld	a,(OFST+0,sp)
1054  0032 a104          	cp	a,#4
1055  0034 25ee          	jrult	L572
1056                     ; 372 	if (timesec==0) {
1058  0036 be0e          	ldw	x,_timesec
1059  0038 260b          	jrne	L503
1060                     ; 374 		if (timetest) timetest--;
1062  003a b600          	ld	a,_timetest
1063  003c 2702          	jreq	L703
1066  003e 3a00          	dec	_timetest
1067  0040               L703:
1068                     ; 376 		timesec = 1000;
1070  0040 ae03e8        	ldw	x,#1000
1071  0043 bf0e          	ldw	_timesec,x
1072  0045               L503:
1073                     ; 380 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
1075  0045 a601          	ld	a,#1
1076  0047 cd0000        	call	_TIM4_ClearITPendingBit
1078                     ; 382  }
1081  004a 84            	pop	a
1082  004b 85            	popw	x
1083  004c bf00          	ldw	c_y,x
1084  004e 320002        	pop	c_y+2
1085  0051 85            	popw	x
1086  0052 bf00          	ldw	c_x,x
1087  0054 320002        	pop	c_x+2
1088  0057 80            	iret	
1126                     ; 384  INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
1126                     ; 385 {
1127                     .text:	section	.text,new
1128  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
1130  0000 8a            	push	cc
1131  0001 84            	pop	a
1132  0002 a4bf          	and	a,#191
1133  0004 88            	push	a
1134  0005 86            	pop	cc
1135       00000001      OFST:	set	1
1136  0006 3b0002        	push	c_x+2
1137  0009 be00          	ldw	x,c_x
1138  000b 89            	pushw	x
1139  000c 3b0002        	push	c_y+2
1140  000f be00          	ldw	x,c_y
1141  0011 89            	pushw	x
1142  0012 88            	push	a
1145                     ; 389 	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
1147  0013 a601          	ld	a,#1
1148  0015 cd0000        	call	_TIM1_ClearITPendingBit
1150                     ; 395 		for (i=0;i<4;i++) {
1152  0018 4f            	clr	a
1153  0019 6b01          	ld	(OFST+0,sp),a
1155  001b               L733:
1156                     ; 396 			if (mot_scor[i] && mot_time[i]==0) {
1158  001b 5f            	clrw	x
1159  001c 97            	ld	xl,a
1160  001d 6d05          	tnz	(_mot_scor,x)
1161  001f 275a          	jreq	L543
1163  0021 5f            	clrw	x
1164  0022 97            	ld	xl,a
1165  0023 6d09          	tnz	(_mot_time,x)
1166  0025 2654          	jrne	L543
1167                     ; 397 				switch (i) {
1170                     ; 413 					break;
1171  0027 4d            	tnz	a
1172  0028 270b          	jreq	L113
1173  002a 4a            	dec	a
1174  002b 2716          	jreq	L313
1175  002d 4a            	dec	a
1176  002e 2723          	jreq	L513
1177  0030 4a            	dec	a
1178  0031 2733          	jreq	L713
1179  0033 2046          	jra	L543
1180  0035               L113:
1181                     ; 398 					case 0:
1181                     ; 399 						if (mot_scor[i] > 0) GPIO_WriteHigh(GPIOD,GPIO_PIN_0); //1NL
1183  0035 8d910091      	callf	LC008
1184  0039 2d04          	jrsle	L353
1187  003b 4b01          	push	#1
1190  003d 2035          	jpf	LC006
1191  003f               L353:
1192                     ; 400 						else GPIO_WriteHigh(GPIOD,GPIO_PIN_2);//1NR
1194  003f 4b04          	push	#4
1196  0041 2031          	jpf	LC006
1197  0043               L313:
1198                     ; 402 					case 1:
1198                     ; 403 						if (mot_scor[i] > 0) GPIO_WriteHigh(GPIOC,GPIO_PIN_4); //2NL
1200  0043 7b01          	ld	a,(OFST+0,sp)
1201  0045 8d910091      	callf	LC008
1202  0049 2d04          	jrsle	L753
1205  004b 4b10          	push	#16
1208  004d 200e          	jpf	LC007
1209  004f               L753:
1210                     ; 404 						else GPIO_WriteHigh(GPIOC,GPIO_PIN_5);//2NR
1212  004f 4b20          	push	#32
1214  0051 200a          	jpf	LC007
1215  0053               L513:
1216                     ; 406 					case 2:
1216                     ; 407 						if (mot_scor[i] > 0) GPIO_WriteHigh(GPIOC,GPIO_PIN_6); //3NL
1218  0053 7b01          	ld	a,(OFST+0,sp)
1219  0055 8d910091      	callf	LC008
1220  0059 2d07          	jrsle	L363
1223  005b 4b40          	push	#64
1224  005d               LC007:
1225  005d ae500a        	ldw	x,#20490
1228  0060 2015          	jpf	LC005
1229  0062               L363:
1230                     ; 408 						else GPIO_WriteHigh(GPIOC,GPIO_PIN_7);//3NR
1232  0062 4b80          	push	#128
1234  0064 20f7          	jpf	LC007
1235  0066               L713:
1236                     ; 410 					case 3:
1236                     ; 411 						if (mot_scor[i] > 0) GPIO_WriteHigh(GPIOD,GPIO_PIN_3); //4NL
1238  0066 7b01          	ld	a,(OFST+0,sp)
1239  0068 8d910091      	callf	LC008
1240  006c 2d04          	jrsle	L763
1243  006e 4b08          	push	#8
1246  0070 2002          	jpf	LC006
1247  0072               L763:
1248                     ; 412 						else GPIO_WriteHigh(GPIOD,GPIO_PIN_4);//4NR
1250  0072 4b10          	push	#16
1251  0074               LC006:
1252  0074 ae500f        	ldw	x,#20495
1254  0077               LC005:
1255  0077 cd0000        	call	_GPIO_WriteHigh
1256  007a 84            	pop	a
1257  007b               L543:
1258                     ; 395 		for (i=0;i<4;i++) {
1260  007b 0c01          	inc	(OFST+0,sp)
1264  007d 7b01          	ld	a,(OFST+0,sp)
1265  007f a104          	cp	a,#4
1266  0081 2598          	jrult	L733
1267                     ; 418 }
1270  0083 84            	pop	a
1271  0084 85            	popw	x
1272  0085 bf00          	ldw	c_y,x
1273  0087 320002        	pop	c_y+2
1274  008a 85            	popw	x
1275  008b bf00          	ldw	c_x,x
1276  008d 320002        	pop	c_x+2
1277  0090 80            	iret	
1278  0091               LC008:
1279  0091 5f            	clrw	x
1280  0092 97            	ld	xl,a
1281  0093 9c            	rvf	
1282  0094 e605          	ld	a,(_mot_scor,x)
1283  0096 87            	retf	
1309                     ; 425 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
1309                     ; 426 {
1310                     .text:	section	.text,new
1311  0000               f_TIM1_CAP_COM_IRQHandler:
1313  0000 8a            	push	cc
1314  0001 84            	pop	a
1315  0002 a4bf          	and	a,#191
1316  0004 88            	push	a
1317  0005 86            	pop	cc
1318  0006 3b0002        	push	c_x+2
1319  0009 be00          	ldw	x,c_x
1320  000b 89            	pushw	x
1321  000c 3b0002        	push	c_y+2
1322  000f be00          	ldw	x,c_y
1323  0011 89            	pushw	x
1326                     ; 430 	if (TIM1_GetITStatus(TIM1_IT_CC1) != RESET)  //capture compare 1motor
1328  0012 a602          	ld	a,#2
1329  0014 cd0000        	call	_TIM1_GetITStatus
1331  0017 4d            	tnz	a
1332  0018 270e          	jreq	L304
1333                     ; 432 		TIM1_ClearITPendingBit(TIM1_IT_CC1);
1335  001a a602          	ld	a,#2
1336  001c cd0000        	call	_TIM1_ClearITPendingBit
1338                     ; 434 		GPIO_WriteLow(GPIOD,GPIO_PIN_0|GPIO_PIN_2); //1NRL
1340  001f 4b05          	push	#5
1341  0021 ae500f        	ldw	x,#20495
1342  0024 cd0000        	call	_GPIO_WriteLow
1344  0027 84            	pop	a
1345  0028               L304:
1346                     ; 436 	if (TIM1_GetITStatus(TIM1_IT_CC2) != RESET)  //capture compare 1motor
1348  0028 a604          	ld	a,#4
1349  002a cd0000        	call	_TIM1_GetITStatus
1351  002d 4d            	tnz	a
1352  002e 270e          	jreq	L504
1353                     ; 438 		TIM1_ClearITPendingBit(TIM1_IT_CC2);
1355  0030 a604          	ld	a,#4
1356  0032 cd0000        	call	_TIM1_ClearITPendingBit
1358                     ; 440 		GPIO_WriteLow(GPIOC,GPIO_PIN_4|GPIO_PIN_5);//2NRL
1360  0035 4b30          	push	#48
1361  0037 ae500a        	ldw	x,#20490
1362  003a cd0000        	call	_GPIO_WriteLow
1364  003d 84            	pop	a
1365  003e               L504:
1366                     ; 442 	if (TIM1_GetITStatus(TIM1_IT_CC3) != RESET)  //capture compare 1motor
1368  003e a608          	ld	a,#8
1369  0040 cd0000        	call	_TIM1_GetITStatus
1371  0043 4d            	tnz	a
1372  0044 270e          	jreq	L704
1373                     ; 444 		TIM1_ClearITPendingBit(TIM1_IT_CC3);
1375  0046 a608          	ld	a,#8
1376  0048 cd0000        	call	_TIM1_ClearITPendingBit
1378                     ; 446 		GPIO_WriteLow(GPIOC,GPIO_PIN_6|GPIO_PIN_7); //3NRL
1380  004b 4bc0          	push	#192
1381  004d ae500a        	ldw	x,#20490
1382  0050 cd0000        	call	_GPIO_WriteLow
1384  0053 84            	pop	a
1385  0054               L704:
1386                     ; 448 	if (TIM1_GetITStatus(TIM1_IT_CC4) != RESET)  //capture compare 1motor
1388  0054 a610          	ld	a,#16
1389  0056 cd0000        	call	_TIM1_GetITStatus
1391  0059 4d            	tnz	a
1392  005a 270e          	jreq	L114
1393                     ; 450 		TIM1_ClearITPendingBit(TIM1_IT_CC4);
1395  005c a610          	ld	a,#16
1396  005e cd0000        	call	_TIM1_ClearITPendingBit
1398                     ; 452 		GPIO_WriteLow(GPIOD,GPIO_PIN_3|GPIO_PIN_4); //4NRL
1400  0061 4b18          	push	#24
1401  0063 ae500f        	ldw	x,#20495
1402  0066 cd0000        	call	_GPIO_WriteLow
1404  0069 84            	pop	a
1405  006a               L114:
1406                     ; 454 }
1409  006a 85            	popw	x
1410  006b bf00          	ldw	c_y,x
1411  006d 320002        	pop	c_y+2
1412  0070 85            	popw	x
1413  0071 bf00          	ldw	c_x,x
1414  0073 320002        	pop	c_x+2
1415  0076 80            	iret	
1472                     ; 457 INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
1472                     ; 458  {
1473                     .text:	section	.text,new
1474  0000               f_UART1_RX_IRQHandler:
1476  0000 8a            	push	cc
1477  0001 84            	pop	a
1478  0002 a4bf          	and	a,#191
1479  0004 88            	push	a
1480  0005 86            	pop	cc
1481       00000003      OFST:	set	3
1482  0006 3b0002        	push	c_x+2
1483  0009 be00          	ldw	x,c_x
1484  000b 89            	pushw	x
1485  000c 3b0002        	push	c_y+2
1486  000f be00          	ldw	x,c_y
1487  0011 89            	pushw	x
1488  0012 5203          	subw	sp,#3
1491                     ; 463 		char c=0;
1493  0014 0f03          	clr	(OFST+0,sp)
1495                     ; 468 		if (UART1_GetFlagStatus(UART1_FLAG_RXNE) != RESET )
1497  0016 ae0020        	ldw	x,#32
1498  0019 cd0000        	call	_UART1_GetFlagStatus
1500  001c 4d            	tnz	a
1501  001d 2705          	jreq	L144
1502                     ; 469 			c = UART1_ReceiveData8();
1504  001f cd0000        	call	_UART1_ReceiveData8
1506  0022 6b03          	ld	(OFST+0,sp),a
1508  0024               L144:
1509                     ; 477 		if (RXready==5) return;
1511  0024 b603          	ld	a,_RXready
1512  0026 a105          	cp	a,#5
1513  0028 275d          	jreq	L364
1516                     ; 479 		if (RXready==2) {
1518  002a a102          	cp	a,#2
1519  002c 2635          	jrne	L544
1520                     ; 480 			if (RXtek>=4) {
1522  002e b604          	ld	a,_RXtek
1523  0030 a104          	cp	a,#4
1524  0032 2523          	jrult	L744
1525                     ; 481 				u8 tmp=0;
1527  0034 0f01          	clr	(OFST-2,sp)
1529                     ; 484 				for (i=0;i<4;i++) {
1531  0036 4f            	clr	a
1532  0037 6b02          	ld	(OFST-1,sp),a
1534  0039               L154:
1535                     ; 485 					tmp += mot_newscor[i];
1537  0039 5f            	clrw	x
1538  003a 97            	ld	xl,a
1539  003b 7b01          	ld	a,(OFST-2,sp)
1540  003d eb00          	add	a,(_mot_newscor,x)
1541  003f 6b01          	ld	(OFST-2,sp),a
1543                     ; 484 				for (i=0;i<4;i++) {
1545  0041 0c02          	inc	(OFST-1,sp)
1549  0043 7b02          	ld	a,(OFST-1,sp)
1550  0045 a104          	cp	a,#4
1551  0047 25f0          	jrult	L154
1552                     ; 488 				if (tmp == c) RXready = 5;
1554  0049 7b01          	ld	a,(OFST-2,sp)
1555  004b 1103          	cp	a,(OFST+0,sp)
1556  004d 2606          	jrne	L754
1559  004f 35050003      	mov	_RXready,#5
1561  0053 2002          	jra	L744
1562  0055               L754:
1563                     ; 489 				else RXready = 0;
1565  0055 3f03          	clr	_RXready
1566  0057               L744:
1567                     ; 492 			mot_newscor[RXtek] = c;
1569  0057 b604          	ld	a,_RXtek
1570  0059 5f            	clrw	x
1571  005a 97            	ld	xl,a
1572  005b 7b03          	ld	a,(OFST+0,sp)
1573  005d e700          	ld	(_mot_newscor,x),a
1574                     ; 493 			RXtek++;
1576  005f 3c04          	inc	_RXtek
1578  0061 2024          	jra	L364
1579  0063               L544:
1580                     ; 495 			if ((RXready==0) && (c==1) ) {
1582  0063 b603          	ld	a,_RXready
1583  0065 260b          	jrne	L564
1585  0067 7b03          	ld	a,(OFST+0,sp)
1586  0069 4a            	dec	a
1587  006a 2606          	jrne	L564
1588                     ; 496 				RXready = 1;
1590  006c 35010003      	mov	_RXready,#1
1592  0070 2015          	jra	L364
1593  0072               L564:
1594                     ; 498 			else if ((RXready==1) && (c==2) ) {
1596  0072 b603          	ld	a,_RXready
1597  0074 4a            	dec	a
1598  0075 260e          	jrne	L174
1600  0077 7b03          	ld	a,(OFST+0,sp)
1601  0079 a102          	cp	a,#2
1602  007b 2608          	jrne	L174
1603                     ; 499 				RXready = 2;
1605  007d 35020003      	mov	_RXready,#2
1606                     ; 500 				RXtek=0;
1608  0081 3f04          	clr	_RXtek
1610  0083 2002          	jra	L364
1611  0085               L174:
1612                     ; 502 			else RXready=0;
1614  0085 3f03          	clr	_RXready
1615  0087               L364:
1616                     ; 505  }
1619  0087 5b03          	addw	sp,#3
1620  0089 85            	popw	x
1621  008a bf00          	ldw	c_y,x
1622  008c 320002        	pop	c_y+2
1623  008f 85            	popw	x
1624  0090 bf00          	ldw	c_x,x
1625  0092 320002        	pop	c_x+2
1626  0095 80            	iret	
1743                     	xdef	f_UART1_RX_IRQHandler
1744                     	xdef	f_TIM1_CAP_COM_IRQHandler
1745                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1746                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1747                     	xdef	_timesec
1748                     	xdef	_main
1749                     	xdef	_changespeed
1750                     	xdef	_newspeed
1751                     	xdef	_mot_time
1752                     	switch	.ubsct
1753  0000               _mot_newscor:
1754  0000 00000000      	ds.b	4
1755                     	xdef	_mot_newscor
1756                     	xdef	_mot_scor
1757  0004               _ccrval:
1758  0004 0000          	ds.b	2
1759                     	xdef	_ccrval
1760                     	xdef	_RXtek
1761                     	xdef	_RXready
1762  0006               _buff:
1763  0006 0000000000    	ds.b	5
1764                     	xdef	_buff
1765                     	xdef	_timedelay
1766                     	xdef	_Delay
1767                     	xdef	_timetest
1768                     	xdef	_assert_failed
1769                     	xref	_UART1_GetFlagStatus
1770                     	xref	_UART1_ReceiveData8
1771                     	xref	_UART1_ITConfig
1772                     	xref	_UART1_Init
1773                     	xref	_UART1_DeInit
1774                     	xref	_TIM4_ClearITPendingBit
1775                     	xref	_TIM4_ClearFlag
1776                     	xref	_TIM4_ITConfig
1777                     	xref	_TIM4_Cmd
1778                     	xref	_TIM4_TimeBaseInit
1779                     	xref	_TIM1_ClearITPendingBit
1780                     	xref	_TIM1_GetITStatus
1781                     	xref	_TIM1_CCPreloadControl
1782                     	xref	_TIM1_ITConfig
1783                     	xref	_TIM1_CtrlPWMOutputs
1784                     	xref	_TIM1_Cmd
1785                     	xref	_TIM1_BDTRConfig
1786                     	xref	_TIM1_OC4Init
1787                     	xref	_TIM1_OC3Init
1788                     	xref	_TIM1_OC2Init
1789                     	xref	_TIM1_OC1Init
1790                     	xref	_TIM1_TimeBaseInit
1791                     	xref	_TIM1_DeInit
1792                     	xref	_GPIO_WriteLow
1793                     	xref	_GPIO_WriteHigh
1794                     	xref	_GPIO_Init
1795                     	xref	_CLK_HSIPrescalerConfig
1796                     	xref.b	c_lreg
1797                     	xref.b	c_x
1798                     	xref.b	c_y
1818                     	xref	c_ludv
1819                     	xref	c_vmul
1820                     	xref	c_imul
1821                     	end
