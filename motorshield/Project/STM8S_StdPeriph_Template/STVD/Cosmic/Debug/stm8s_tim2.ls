   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  49                     ; 52 void TIM2_DeInit(void)
  49                     ; 53 {
  51                     .text:	section	.text,new
  52  0000               _TIM2_DeInit:
  56                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  58  0000 725f5300      	clr	21248
  59                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  61  0004 725f5301      	clr	21249
  62                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  64  0008 725f5303      	clr	21251
  65                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  67  000c 725f5308      	clr	21256
  68                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  70  0010 725f5309      	clr	21257
  71                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  73  0014 725f5308      	clr	21256
  74                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  76  0018 725f5309      	clr	21257
  77                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  79  001c 725f5305      	clr	21253
  80                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  82  0020 725f5306      	clr	21254
  83                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  85  0024 725f5307      	clr	21255
  86                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  88  0028 725f530a      	clr	21258
  89                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  91  002c 725f530b      	clr	21259
  92                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  94  0030 725f530c      	clr	21260
  95                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  97  0034 35ff530d      	mov	21261,#255
  98                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
 100  0038 35ff530e      	mov	21262,#255
 101                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
 103  003c 725f530f      	clr	21263
 104                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 106  0040 725f5310      	clr	21264
 107                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 109  0044 725f5311      	clr	21265
 110                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 112  0048 725f5312      	clr	21266
 113                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 115  004c 725f5313      	clr	21267
 116                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 118  0050 725f5314      	clr	21268
 119                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 121  0054 725f5302      	clr	21250
 122                     ; 81 }
 125  0058 81            	ret	
 291                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 291                     ; 90                         uint16_t TIM2_Period)
 291                     ; 91 {
 292                     .text:	section	.text,new
 293  0000               _TIM2_TimeBaseInit:
 295  0000 88            	push	a
 296       00000000      OFST:	set	0
 299                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 301  0001 c7530c        	ld	21260,a
 302                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 304  0004 7b04          	ld	a,(OFST+4,sp)
 305  0006 c7530d        	ld	21261,a
 306                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 308  0009 7b05          	ld	a,(OFST+5,sp)
 309  000b c7530e        	ld	21262,a
 310                     ; 97 }
 313  000e 84            	pop	a
 314  000f 81            	ret	
 470                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 470                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 470                     ; 110                   uint16_t TIM2_Pulse,
 470                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 470                     ; 112 {
 471                     .text:	section	.text,new
 472  0000               _TIM2_OC1Init:
 474  0000 89            	pushw	x
 475  0001 88            	push	a
 476       00000001      OFST:	set	1
 479                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 481  0002 9e            	ld	a,xh
 482  0003 4d            	tnz	a
 483  0004 271e          	jreq	L61
 484  0006 9e            	ld	a,xh
 485  0007 a110          	cp	a,#16
 486  0009 2719          	jreq	L61
 487  000b 9e            	ld	a,xh
 488  000c a120          	cp	a,#32
 489  000e 2714          	jreq	L61
 490  0010 9e            	ld	a,xh
 491  0011 a130          	cp	a,#48
 492  0013 270f          	jreq	L61
 493  0015 9e            	ld	a,xh
 494  0016 a160          	cp	a,#96
 495  0018 270a          	jreq	L61
 496  001a 9e            	ld	a,xh
 497  001b a170          	cp	a,#112
 498  001d 2705          	jreq	L61
 499  001f ae0072        	ldw	x,#114
 500  0022 ad4b          	call	LC001
 501  0024               L61:
 502                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 504  0024 7b03          	ld	a,(OFST+2,sp)
 505  0026 2709          	jreq	L62
 506  0028 a111          	cp	a,#17
 507  002a 2705          	jreq	L62
 508  002c ae0073        	ldw	x,#115
 509  002f ad3e          	call	LC001
 510  0031               L62:
 511                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 513  0031 7b08          	ld	a,(OFST+7,sp)
 514  0033 2709          	jreq	L63
 515  0035 a122          	cp	a,#34
 516  0037 2705          	jreq	L63
 517  0039 ae0074        	ldw	x,#116
 518  003c ad31          	call	LC001
 519  003e               L63:
 520                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 522  003e c65308        	ld	a,21256
 523  0041 a4fc          	and	a,#252
 524  0043 c75308        	ld	21256,a
 525                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 525                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 527  0046 7b08          	ld	a,(OFST+7,sp)
 528  0048 a402          	and	a,#2
 529  004a 6b01          	ld	(OFST+0,sp),a
 531  004c 7b03          	ld	a,(OFST+2,sp)
 532  004e a401          	and	a,#1
 533  0050 1a01          	or	a,(OFST+0,sp)
 534  0052 ca5308        	or	a,21256
 535  0055 c75308        	ld	21256,a
 536                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 536                     ; 126                           (uint8_t)TIM2_OCMode);
 538  0058 c65305        	ld	a,21253
 539  005b a48f          	and	a,#143
 540  005d 1a02          	or	a,(OFST+1,sp)
 541  005f c75305        	ld	21253,a
 542                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 544  0062 7b06          	ld	a,(OFST+5,sp)
 545  0064 c7530f        	ld	21263,a
 546                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 548  0067 7b07          	ld	a,(OFST+6,sp)
 549  0069 c75310        	ld	21264,a
 550                     ; 131 }
 553  006c 5b03          	addw	sp,#3
 554  006e 81            	ret	
 555  006f               LC001:
 556  006f 89            	pushw	x
 557  0070 5f            	clrw	x
 558  0071 89            	pushw	x
 559  0072 ae0000        	ldw	x,#L302
 560  0075 cd0000        	call	_assert_failed
 562  0078 5b04          	addw	sp,#4
 563  007a 81            	ret	
 626                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 626                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 626                     ; 144                   uint16_t TIM2_Pulse,
 626                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 626                     ; 146 {
 627                     .text:	section	.text,new
 628  0000               _TIM2_OC2Init:
 630  0000 89            	pushw	x
 631  0001 88            	push	a
 632       00000001      OFST:	set	1
 635                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 637  0002 9e            	ld	a,xh
 638  0003 4d            	tnz	a
 639  0004 271e          	jreq	L05
 640  0006 9e            	ld	a,xh
 641  0007 a110          	cp	a,#16
 642  0009 2719          	jreq	L05
 643  000b 9e            	ld	a,xh
 644  000c a120          	cp	a,#32
 645  000e 2714          	jreq	L05
 646  0010 9e            	ld	a,xh
 647  0011 a130          	cp	a,#48
 648  0013 270f          	jreq	L05
 649  0015 9e            	ld	a,xh
 650  0016 a160          	cp	a,#96
 651  0018 270a          	jreq	L05
 652  001a 9e            	ld	a,xh
 653  001b a170          	cp	a,#112
 654  001d 2705          	jreq	L05
 655  001f ae0094        	ldw	x,#148
 656  0022 ad4b          	call	LC002
 657  0024               L05:
 658                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 660  0024 7b03          	ld	a,(OFST+2,sp)
 661  0026 2709          	jreq	L06
 662  0028 a111          	cp	a,#17
 663  002a 2705          	jreq	L06
 664  002c ae0095        	ldw	x,#149
 665  002f ad3e          	call	LC002
 666  0031               L06:
 667                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 669  0031 7b08          	ld	a,(OFST+7,sp)
 670  0033 2709          	jreq	L07
 671  0035 a122          	cp	a,#34
 672  0037 2705          	jreq	L07
 673  0039 ae0096        	ldw	x,#150
 674  003c ad31          	call	LC002
 675  003e               L07:
 676                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 678  003e c65308        	ld	a,21256
 679  0041 a4cf          	and	a,#207
 680  0043 c75308        	ld	21256,a
 681                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 681                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 683  0046 7b08          	ld	a,(OFST+7,sp)
 684  0048 a420          	and	a,#32
 685  004a 6b01          	ld	(OFST+0,sp),a
 687  004c 7b03          	ld	a,(OFST+2,sp)
 688  004e a410          	and	a,#16
 689  0050 1a01          	or	a,(OFST+0,sp)
 690  0052 ca5308        	or	a,21256
 691  0055 c75308        	ld	21256,a
 692                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 692                     ; 162                           (uint8_t)TIM2_OCMode);
 694  0058 c65306        	ld	a,21254
 695  005b a48f          	and	a,#143
 696  005d 1a02          	or	a,(OFST+1,sp)
 697  005f c75306        	ld	21254,a
 698                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 700  0062 7b06          	ld	a,(OFST+5,sp)
 701  0064 c75311        	ld	21265,a
 702                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 704  0067 7b07          	ld	a,(OFST+6,sp)
 705  0069 c75312        	ld	21266,a
 706                     ; 168 }
 709  006c 5b03          	addw	sp,#3
 710  006e 81            	ret	
 711  006f               LC002:
 712  006f 89            	pushw	x
 713  0070 5f            	clrw	x
 714  0071 89            	pushw	x
 715  0072 ae0000        	ldw	x,#L302
 716  0075 cd0000        	call	_assert_failed
 718  0078 5b04          	addw	sp,#4
 719  007a 81            	ret	
 782                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 782                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 782                     ; 181                   uint16_t TIM2_Pulse,
 782                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 782                     ; 183 {
 783                     .text:	section	.text,new
 784  0000               _TIM2_OC3Init:
 786  0000 89            	pushw	x
 787  0001 88            	push	a
 788       00000001      OFST:	set	1
 791                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 793  0002 9e            	ld	a,xh
 794  0003 4d            	tnz	a
 795  0004 271e          	jreq	L201
 796  0006 9e            	ld	a,xh
 797  0007 a110          	cp	a,#16
 798  0009 2719          	jreq	L201
 799  000b 9e            	ld	a,xh
 800  000c a120          	cp	a,#32
 801  000e 2714          	jreq	L201
 802  0010 9e            	ld	a,xh
 803  0011 a130          	cp	a,#48
 804  0013 270f          	jreq	L201
 805  0015 9e            	ld	a,xh
 806  0016 a160          	cp	a,#96
 807  0018 270a          	jreq	L201
 808  001a 9e            	ld	a,xh
 809  001b a170          	cp	a,#112
 810  001d 2705          	jreq	L201
 811  001f ae00b9        	ldw	x,#185
 812  0022 ad4b          	call	LC003
 813  0024               L201:
 814                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 816  0024 7b03          	ld	a,(OFST+2,sp)
 817  0026 2709          	jreq	L211
 818  0028 a111          	cp	a,#17
 819  002a 2705          	jreq	L211
 820  002c ae00ba        	ldw	x,#186
 821  002f ad3e          	call	LC003
 822  0031               L211:
 823                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 825  0031 7b08          	ld	a,(OFST+7,sp)
 826  0033 2709          	jreq	L221
 827  0035 a122          	cp	a,#34
 828  0037 2705          	jreq	L221
 829  0039 ae00bb        	ldw	x,#187
 830  003c ad31          	call	LC003
 831  003e               L221:
 832                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 834  003e c65309        	ld	a,21257
 835  0041 a4fc          	and	a,#252
 836  0043 c75309        	ld	21257,a
 837                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 837                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 839  0046 7b08          	ld	a,(OFST+7,sp)
 840  0048 a402          	and	a,#2
 841  004a 6b01          	ld	(OFST+0,sp),a
 843  004c 7b03          	ld	a,(OFST+2,sp)
 844  004e a401          	and	a,#1
 845  0050 1a01          	or	a,(OFST+0,sp)
 846  0052 ca5309        	or	a,21257
 847  0055 c75309        	ld	21257,a
 848                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 848                     ; 196                           (uint8_t)TIM2_OCMode);
 850  0058 c65307        	ld	a,21255
 851  005b a48f          	and	a,#143
 852  005d 1a02          	or	a,(OFST+1,sp)
 853  005f c75307        	ld	21255,a
 854                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 856  0062 7b06          	ld	a,(OFST+5,sp)
 857  0064 c75313        	ld	21267,a
 858                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 860  0067 7b07          	ld	a,(OFST+6,sp)
 861  0069 c75314        	ld	21268,a
 862                     ; 201 }
 865  006c 5b03          	addw	sp,#3
 866  006e 81            	ret	
 867  006f               LC003:
 868  006f 89            	pushw	x
 869  0070 5f            	clrw	x
 870  0071 89            	pushw	x
 871  0072 ae0000        	ldw	x,#L302
 872  0075 cd0000        	call	_assert_failed
 874  0078 5b04          	addw	sp,#4
 875  007a 81            	ret	
1067                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
1067                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1067                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
1067                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1067                     ; 216                  uint8_t TIM2_ICFilter)
1067                     ; 217 {
1068                     .text:	section	.text,new
1069  0000               _TIM2_ICInit:
1071  0000 89            	pushw	x
1072       00000000      OFST:	set	0
1075                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
1077  0001 9e            	ld	a,xh
1078  0002 4d            	tnz	a
1079  0003 270f          	jreq	L431
1080  0005 9e            	ld	a,xh
1081  0006 4a            	dec	a
1082  0007 270b          	jreq	L431
1083  0009 9e            	ld	a,xh
1084  000a a102          	cp	a,#2
1085  000c 2706          	jreq	L431
1086  000e ae00db        	ldw	x,#219
1087  0011 cd0097        	call	LC004
1088  0014               L431:
1089                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1091  0014 7b02          	ld	a,(OFST+2,sp)
1092  0016 2709          	jreq	L441
1093  0018 a144          	cp	a,#68
1094  001a 2705          	jreq	L441
1095  001c ae00dc        	ldw	x,#220
1096  001f ad76          	call	LC004
1097  0021               L441:
1098                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1100  0021 7b05          	ld	a,(OFST+5,sp)
1101  0023 a101          	cp	a,#1
1102  0025 270d          	jreq	L451
1103  0027 a102          	cp	a,#2
1104  0029 2709          	jreq	L451
1105  002b a103          	cp	a,#3
1106  002d 2705          	jreq	L451
1107  002f ae00dd        	ldw	x,#221
1108  0032 ad63          	call	LC004
1109  0034               L451:
1110                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1112  0034 7b06          	ld	a,(OFST+6,sp)
1113  0036 2711          	jreq	L461
1114  0038 a104          	cp	a,#4
1115  003a 270d          	jreq	L461
1116  003c a108          	cp	a,#8
1117  003e 2709          	jreq	L461
1118  0040 a10c          	cp	a,#12
1119  0042 2705          	jreq	L461
1120  0044 ae00de        	ldw	x,#222
1121  0047 ad4e          	call	LC004
1122  0049               L461:
1123                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
1125  0049 7b07          	ld	a,(OFST+7,sp)
1126  004b a110          	cp	a,#16
1127  004d 2505          	jrult	L271
1128  004f ae00df        	ldw	x,#223
1129  0052 ad43          	call	LC004
1130  0054               L271:
1131                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
1133  0054 7b01          	ld	a,(OFST+1,sp)
1134  0056 2614          	jrne	L173
1135                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
1135                     ; 229                (uint8_t)TIM2_ICSelection,
1135                     ; 230                (uint8_t)TIM2_ICFilter);
1137  0058 7b07          	ld	a,(OFST+7,sp)
1138  005a 88            	push	a
1139  005b 7b06          	ld	a,(OFST+6,sp)
1140  005d 97            	ld	xl,a
1141  005e 7b03          	ld	a,(OFST+3,sp)
1142  0060 95            	ld	xh,a
1143  0061 cd0000        	call	L3_TI1_Config
1145  0064 84            	pop	a
1146                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1148  0065 7b06          	ld	a,(OFST+6,sp)
1149  0067 cd0000        	call	_TIM2_SetIC1Prescaler
1152  006a 2029          	jra	L373
1153  006c               L173:
1154                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
1156  006c 4a            	dec	a
1157  006d 2614          	jrne	L573
1158                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
1158                     ; 239                (uint8_t)TIM2_ICSelection,
1158                     ; 240                (uint8_t)TIM2_ICFilter);
1160  006f 7b07          	ld	a,(OFST+7,sp)
1161  0071 88            	push	a
1162  0072 7b06          	ld	a,(OFST+6,sp)
1163  0074 97            	ld	xl,a
1164  0075 7b03          	ld	a,(OFST+3,sp)
1165  0077 95            	ld	xh,a
1166  0078 cd0000        	call	L5_TI2_Config
1168  007b 84            	pop	a
1169                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1171  007c 7b06          	ld	a,(OFST+6,sp)
1172  007e cd0000        	call	_TIM2_SetIC2Prescaler
1175  0081 2012          	jra	L373
1176  0083               L573:
1177                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
1177                     ; 249                (uint8_t)TIM2_ICSelection,
1177                     ; 250                (uint8_t)TIM2_ICFilter);
1179  0083 7b07          	ld	a,(OFST+7,sp)
1180  0085 88            	push	a
1181  0086 7b06          	ld	a,(OFST+6,sp)
1182  0088 97            	ld	xl,a
1183  0089 7b03          	ld	a,(OFST+3,sp)
1184  008b 95            	ld	xh,a
1185  008c cd0000        	call	L7_TI3_Config
1187  008f 84            	pop	a
1188                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1190  0090 7b06          	ld	a,(OFST+6,sp)
1191  0092 cd0000        	call	_TIM2_SetIC3Prescaler
1193  0095               L373:
1194                     ; 255 }
1197  0095 85            	popw	x
1198  0096 81            	ret	
1199  0097               LC004:
1200  0097 89            	pushw	x
1201  0098 5f            	clrw	x
1202  0099 89            	pushw	x
1203  009a ae0000        	ldw	x,#L302
1204  009d cd0000        	call	_assert_failed
1206  00a0 5b04          	addw	sp,#4
1207  00a2 81            	ret	
1298                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1298                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1298                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1298                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1298                     ; 270                      uint8_t TIM2_ICFilter)
1298                     ; 271 {
1299                     .text:	section	.text,new
1300  0000               _TIM2_PWMIConfig:
1302  0000 89            	pushw	x
1303  0001 89            	pushw	x
1304       00000002      OFST:	set	2
1307                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1309                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1311                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1313  0002 9e            	ld	a,xh
1314  0003 4d            	tnz	a
1315  0004 270a          	jreq	L022
1316  0006 9e            	ld	a,xh
1317  0007 4a            	dec	a
1318  0008 2706          	jreq	L022
1319  000a ae0114        	ldw	x,#276
1320  000d cd00b3        	call	LC005
1321  0010               L022:
1322                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1324  0010 7b04          	ld	a,(OFST+2,sp)
1325  0012 270a          	jreq	L032
1326  0014 a144          	cp	a,#68
1327  0016 2706          	jreq	L032
1328  0018 ae0115        	ldw	x,#277
1329  001b cd00b3        	call	LC005
1330  001e               L032:
1331                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1333  001e 7b07          	ld	a,(OFST+5,sp)
1334  0020 a101          	cp	a,#1
1335  0022 270e          	jreq	L042
1336  0024 a102          	cp	a,#2
1337  0026 270a          	jreq	L042
1338  0028 a103          	cp	a,#3
1339  002a 2706          	jreq	L042
1340  002c ae0116        	ldw	x,#278
1341  002f cd00b3        	call	LC005
1342  0032               L042:
1343                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1345  0032 7b08          	ld	a,(OFST+6,sp)
1346  0034 2711          	jreq	L052
1347  0036 a104          	cp	a,#4
1348  0038 270d          	jreq	L052
1349  003a a108          	cp	a,#8
1350  003c 2709          	jreq	L052
1351  003e a10c          	cp	a,#12
1352  0040 2705          	jreq	L052
1353  0042 ae0117        	ldw	x,#279
1354  0045 ad6c          	call	LC005
1355  0047               L052:
1356                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1358  0047 7b04          	ld	a,(OFST+2,sp)
1359  0049 a144          	cp	a,#68
1360  004b 2706          	jreq	L144
1361                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1363  004d a644          	ld	a,#68
1364  004f 6b01          	ld	(OFST-1,sp),a
1367  0051 2002          	jra	L344
1368  0053               L144:
1369                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1371  0053 0f01          	clr	(OFST-1,sp)
1373  0055               L344:
1374                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1376  0055 7b07          	ld	a,(OFST+5,sp)
1377  0057 4a            	dec	a
1378  0058 2604          	jrne	L544
1379                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1381  005a a602          	ld	a,#2
1383  005c 2002          	jra	L744
1384  005e               L544:
1385                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1387  005e a601          	ld	a,#1
1388  0060               L744:
1389  0060 6b02          	ld	(OFST+0,sp),a
1391                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1393  0062 7b03          	ld	a,(OFST+1,sp)
1394  0064 2626          	jrne	L154
1395                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1395                     ; 305                (uint8_t)TIM2_ICFilter);
1397  0066 7b09          	ld	a,(OFST+7,sp)
1398  0068 88            	push	a
1399  0069 7b08          	ld	a,(OFST+6,sp)
1400  006b 97            	ld	xl,a
1401  006c 7b05          	ld	a,(OFST+3,sp)
1402  006e 95            	ld	xh,a
1403  006f cd0000        	call	L3_TI1_Config
1405  0072 84            	pop	a
1406                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1408  0073 7b08          	ld	a,(OFST+6,sp)
1409  0075 cd0000        	call	_TIM2_SetIC1Prescaler
1411                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1413  0078 7b09          	ld	a,(OFST+7,sp)
1414  007a 88            	push	a
1415  007b 7b03          	ld	a,(OFST+1,sp)
1416  007d 97            	ld	xl,a
1417  007e 7b02          	ld	a,(OFST+0,sp)
1418  0080 95            	ld	xh,a
1419  0081 cd0000        	call	L5_TI2_Config
1421  0084 84            	pop	a
1422                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1424  0085 7b08          	ld	a,(OFST+6,sp)
1425  0087 cd0000        	call	_TIM2_SetIC2Prescaler
1428  008a 2024          	jra	L354
1429  008c               L154:
1430                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1430                     ; 320                (uint8_t)TIM2_ICFilter);
1432  008c 7b09          	ld	a,(OFST+7,sp)
1433  008e 88            	push	a
1434  008f 7b08          	ld	a,(OFST+6,sp)
1435  0091 97            	ld	xl,a
1436  0092 7b05          	ld	a,(OFST+3,sp)
1437  0094 95            	ld	xh,a
1438  0095 cd0000        	call	L5_TI2_Config
1440  0098 84            	pop	a
1441                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1443  0099 7b08          	ld	a,(OFST+6,sp)
1444  009b cd0000        	call	_TIM2_SetIC2Prescaler
1446                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1448  009e 7b09          	ld	a,(OFST+7,sp)
1449  00a0 88            	push	a
1450  00a1 7b03          	ld	a,(OFST+1,sp)
1451  00a3 97            	ld	xl,a
1452  00a4 7b02          	ld	a,(OFST+0,sp)
1453  00a6 95            	ld	xh,a
1454  00a7 cd0000        	call	L3_TI1_Config
1456  00aa 84            	pop	a
1457                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1459  00ab 7b08          	ld	a,(OFST+6,sp)
1460  00ad cd0000        	call	_TIM2_SetIC1Prescaler
1462  00b0               L354:
1463                     ; 331 }
1466  00b0 5b04          	addw	sp,#4
1467  00b2 81            	ret	
1468  00b3               LC005:
1469  00b3 89            	pushw	x
1470  00b4 5f            	clrw	x
1471  00b5 89            	pushw	x
1472  00b6 ae0000        	ldw	x,#L302
1473  00b9 cd0000        	call	_assert_failed
1475  00bc 5b04          	addw	sp,#4
1476  00be 81            	ret	
1532                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1532                     ; 340 {
1533                     .text:	section	.text,new
1534  0000               _TIM2_Cmd:
1536  0000 88            	push	a
1537       00000000      OFST:	set	0
1540                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1542  0001 4d            	tnz	a
1543  0002 2711          	jreq	L203
1544  0004 4a            	dec	a
1545  0005 270e          	jreq	L203
1546  0007 ae0156        	ldw	x,#342
1547  000a 89            	pushw	x
1548  000b 5f            	clrw	x
1549  000c 89            	pushw	x
1550  000d ae0000        	ldw	x,#L302
1551  0010 cd0000        	call	_assert_failed
1553  0013 5b04          	addw	sp,#4
1554  0015               L203:
1555                     ; 345   if (NewState != DISABLE)
1557  0015 7b01          	ld	a,(OFST+1,sp)
1558  0017 2706          	jreq	L305
1559                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1561  0019 72105300      	bset	21248,#0
1563  001d 2004          	jra	L505
1564  001f               L305:
1565                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1567  001f 72115300      	bres	21248,#0
1568  0023               L505:
1569                     ; 353 }
1572  0023 84            	pop	a
1573  0024 81            	ret	
1653                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1653                     ; 369 {
1654                     .text:	section	.text,new
1655  0000               _TIM2_ITConfig:
1657  0000 89            	pushw	x
1658       00000000      OFST:	set	0
1661                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1663  0001 9e            	ld	a,xh
1664  0002 4d            	tnz	a
1665  0003 2705          	jreq	L013
1666  0005 9e            	ld	a,xh
1667  0006 a110          	cp	a,#16
1668  0008 2505          	jrult	L213
1669  000a               L013:
1670  000a ae0173        	ldw	x,#371
1671  000d ad22          	call	LC006
1672  000f               L213:
1673                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1675  000f 7b02          	ld	a,(OFST+2,sp)
1676  0011 2708          	jreq	L223
1677  0013 4a            	dec	a
1678  0014 2705          	jreq	L223
1679  0016 ae0174        	ldw	x,#372
1680  0019 ad16          	call	LC006
1681  001b               L223:
1682                     ; 374   if (NewState != DISABLE)
1684  001b 7b02          	ld	a,(OFST+2,sp)
1685  001d 2707          	jreq	L545
1686                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1688  001f c65301        	ld	a,21249
1689  0022 1a01          	or	a,(OFST+1,sp)
1691  0024 2006          	jra	L745
1692  0026               L545:
1693                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1695  0026 7b01          	ld	a,(OFST+1,sp)
1696  0028 43            	cpl	a
1697  0029 c45301        	and	a,21249
1698  002c               L745:
1699  002c c75301        	ld	21249,a
1700                     ; 384 }
1703  002f 85            	popw	x
1704  0030 81            	ret	
1705  0031               LC006:
1706  0031 89            	pushw	x
1707  0032 5f            	clrw	x
1708  0033 89            	pushw	x
1709  0034 ae0000        	ldw	x,#L302
1710  0037 cd0000        	call	_assert_failed
1712  003a 5b04          	addw	sp,#4
1713  003c 81            	ret	
1750                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1750                     ; 393 {
1751                     .text:	section	.text,new
1752  0000               _TIM2_UpdateDisableConfig:
1754  0000 88            	push	a
1755       00000000      OFST:	set	0
1758                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1760  0001 4d            	tnz	a
1761  0002 2711          	jreq	L433
1762  0004 4a            	dec	a
1763  0005 270e          	jreq	L433
1764  0007 ae018b        	ldw	x,#395
1765  000a 89            	pushw	x
1766  000b 5f            	clrw	x
1767  000c 89            	pushw	x
1768  000d ae0000        	ldw	x,#L302
1769  0010 cd0000        	call	_assert_failed
1771  0013 5b04          	addw	sp,#4
1772  0015               L433:
1773                     ; 398   if (NewState != DISABLE)
1775  0015 7b01          	ld	a,(OFST+1,sp)
1776  0017 2706          	jreq	L765
1777                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1779  0019 72125300      	bset	21248,#1
1781  001d 2004          	jra	L175
1782  001f               L765:
1783                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1785  001f 72135300      	bres	21248,#1
1786  0023               L175:
1787                     ; 406 }
1790  0023 84            	pop	a
1791  0024 81            	ret	
1850                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1850                     ; 417 {
1851                     .text:	section	.text,new
1852  0000               _TIM2_UpdateRequestConfig:
1854  0000 88            	push	a
1855       00000000      OFST:	set	0
1858                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1860  0001 4d            	tnz	a
1861  0002 2711          	jreq	L643
1862  0004 4a            	dec	a
1863  0005 270e          	jreq	L643
1864  0007 ae01a3        	ldw	x,#419
1865  000a 89            	pushw	x
1866  000b 5f            	clrw	x
1867  000c 89            	pushw	x
1868  000d ae0000        	ldw	x,#L302
1869  0010 cd0000        	call	_assert_failed
1871  0013 5b04          	addw	sp,#4
1872  0015               L643:
1873                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1875  0015 7b01          	ld	a,(OFST+1,sp)
1876  0017 2706          	jreq	L126
1877                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1879  0019 72145300      	bset	21248,#2
1881  001d 2004          	jra	L326
1882  001f               L126:
1883                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1885  001f 72155300      	bres	21248,#2
1886  0023               L326:
1887                     ; 430 }
1890  0023 84            	pop	a
1891  0024 81            	ret	
1949                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1949                     ; 441 {
1950                     .text:	section	.text,new
1951  0000               _TIM2_SelectOnePulseMode:
1953  0000 88            	push	a
1954       00000000      OFST:	set	0
1957                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1959  0001 a101          	cp	a,#1
1960  0003 2711          	jreq	L063
1961  0005 4d            	tnz	a
1962  0006 270e          	jreq	L063
1963  0008 ae01bb        	ldw	x,#443
1964  000b 89            	pushw	x
1965  000c 5f            	clrw	x
1966  000d 89            	pushw	x
1967  000e ae0000        	ldw	x,#L302
1968  0011 cd0000        	call	_assert_failed
1970  0014 5b04          	addw	sp,#4
1971  0016               L063:
1972                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1974  0016 7b01          	ld	a,(OFST+1,sp)
1975  0018 2706          	jreq	L356
1976                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1978  001a 72165300      	bset	21248,#3
1980  001e 2004          	jra	L556
1981  0020               L356:
1982                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1984  0020 72175300      	bres	21248,#3
1985  0024               L556:
1986                     ; 454 }
1989  0024 84            	pop	a
1990  0025 81            	ret	
2059                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
2059                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
2059                     ; 486 {
2060                     .text:	section	.text,new
2061  0000               _TIM2_PrescalerConfig:
2063  0000 89            	pushw	x
2064       00000000      OFST:	set	0
2067                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
2069  0001 9f            	ld	a,xl
2070  0002 4d            	tnz	a
2071  0003 2709          	jreq	L273
2072  0005 9f            	ld	a,xl
2073  0006 4a            	dec	a
2074  0007 2705          	jreq	L273
2075  0009 ae01e8        	ldw	x,#488
2076  000c ad51          	call	LC007
2077  000e               L273:
2078                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
2080  000e 7b01          	ld	a,(OFST+1,sp)
2081  0010 2743          	jreq	L204
2082  0012 a101          	cp	a,#1
2083  0014 273f          	jreq	L204
2084  0016 a102          	cp	a,#2
2085  0018 273b          	jreq	L204
2086  001a a103          	cp	a,#3
2087  001c 2737          	jreq	L204
2088  001e a104          	cp	a,#4
2089  0020 2733          	jreq	L204
2090  0022 a105          	cp	a,#5
2091  0024 272f          	jreq	L204
2092  0026 a106          	cp	a,#6
2093  0028 272b          	jreq	L204
2094  002a a107          	cp	a,#7
2095  002c 2727          	jreq	L204
2096  002e a108          	cp	a,#8
2097  0030 2723          	jreq	L204
2098  0032 a109          	cp	a,#9
2099  0034 271f          	jreq	L204
2100  0036 a10a          	cp	a,#10
2101  0038 271b          	jreq	L204
2102  003a a10b          	cp	a,#11
2103  003c 2717          	jreq	L204
2104  003e a10c          	cp	a,#12
2105  0040 2713          	jreq	L204
2106  0042 a10d          	cp	a,#13
2107  0044 270f          	jreq	L204
2108  0046 a10e          	cp	a,#14
2109  0048 270b          	jreq	L204
2110  004a a10f          	cp	a,#15
2111  004c 2707          	jreq	L204
2112  004e ae01e9        	ldw	x,#489
2113  0051 ad0c          	call	LC007
2114  0053 7b01          	ld	a,(OFST+1,sp)
2115  0055               L204:
2116                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
2118  0055 c7530c        	ld	21260,a
2119                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
2121  0058 7b02          	ld	a,(OFST+2,sp)
2122  005a c75304        	ld	21252,a
2123                     ; 496 }
2126  005d 85            	popw	x
2127  005e 81            	ret	
2128  005f               LC007:
2129  005f 89            	pushw	x
2130  0060 5f            	clrw	x
2131  0061 89            	pushw	x
2132  0062 ae0000        	ldw	x,#L302
2133  0065 cd0000        	call	_assert_failed
2135  0068 5b04          	addw	sp,#4
2136  006a 81            	ret	
2195                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2195                     ; 508 {
2196                     .text:	section	.text,new
2197  0000               _TIM2_ForcedOC1Config:
2199  0000 88            	push	a
2200       00000000      OFST:	set	0
2203                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2205  0001 a150          	cp	a,#80
2206  0003 2712          	jreq	L414
2207  0005 a140          	cp	a,#64
2208  0007 270e          	jreq	L414
2209  0009 ae01fe        	ldw	x,#510
2210  000c 89            	pushw	x
2211  000d 5f            	clrw	x
2212  000e 89            	pushw	x
2213  000f ae0000        	ldw	x,#L302
2214  0012 cd0000        	call	_assert_failed
2216  0015 5b04          	addw	sp,#4
2217  0017               L414:
2218                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
2218                     ; 514                             | (uint8_t)TIM2_ForcedAction);
2220  0017 c65305        	ld	a,21253
2221  001a a48f          	and	a,#143
2222  001c 1a01          	or	a,(OFST+1,sp)
2223  001e c75305        	ld	21253,a
2224                     ; 515 }
2227  0021 84            	pop	a
2228  0022 81            	ret	
2265                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2265                     ; 527 {
2266                     .text:	section	.text,new
2267  0000               _TIM2_ForcedOC2Config:
2269  0000 88            	push	a
2270       00000000      OFST:	set	0
2273                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2275  0001 a150          	cp	a,#80
2276  0003 2712          	jreq	L624
2277  0005 a140          	cp	a,#64
2278  0007 270e          	jreq	L624
2279  0009 ae0211        	ldw	x,#529
2280  000c 89            	pushw	x
2281  000d 5f            	clrw	x
2282  000e 89            	pushw	x
2283  000f ae0000        	ldw	x,#L302
2284  0012 cd0000        	call	_assert_failed
2286  0015 5b04          	addw	sp,#4
2287  0017               L624:
2288                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
2288                     ; 533                           | (uint8_t)TIM2_ForcedAction);
2290  0017 c65306        	ld	a,21254
2291  001a a48f          	and	a,#143
2292  001c 1a01          	or	a,(OFST+1,sp)
2293  001e c75306        	ld	21254,a
2294                     ; 534 }
2297  0021 84            	pop	a
2298  0022 81            	ret	
2335                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2335                     ; 546 {
2336                     .text:	section	.text,new
2337  0000               _TIM2_ForcedOC3Config:
2339  0000 88            	push	a
2340       00000000      OFST:	set	0
2343                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2345  0001 a150          	cp	a,#80
2346  0003 2712          	jreq	L044
2347  0005 a140          	cp	a,#64
2348  0007 270e          	jreq	L044
2349  0009 ae0224        	ldw	x,#548
2350  000c 89            	pushw	x
2351  000d 5f            	clrw	x
2352  000e 89            	pushw	x
2353  000f ae0000        	ldw	x,#L302
2354  0012 cd0000        	call	_assert_failed
2356  0015 5b04          	addw	sp,#4
2357  0017               L044:
2358                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2358                     ; 552                             | (uint8_t)TIM2_ForcedAction);
2360  0017 c65307        	ld	a,21255
2361  001a a48f          	and	a,#143
2362  001c 1a01          	or	a,(OFST+1,sp)
2363  001e c75307        	ld	21255,a
2364                     ; 553 }
2367  0021 84            	pop	a
2368  0022 81            	ret	
2405                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
2405                     ; 562 {
2406                     .text:	section	.text,new
2407  0000               _TIM2_ARRPreloadConfig:
2409  0000 88            	push	a
2410       00000000      OFST:	set	0
2413                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2415  0001 4d            	tnz	a
2416  0002 2711          	jreq	L254
2417  0004 4a            	dec	a
2418  0005 270e          	jreq	L254
2419  0007 ae0234        	ldw	x,#564
2420  000a 89            	pushw	x
2421  000b 5f            	clrw	x
2422  000c 89            	pushw	x
2423  000d ae0000        	ldw	x,#L302
2424  0010 cd0000        	call	_assert_failed
2426  0013 5b04          	addw	sp,#4
2427  0015               L254:
2428                     ; 567   if (NewState != DISABLE)
2430  0015 7b01          	ld	a,(OFST+1,sp)
2431  0017 2706          	jreq	L1101
2432                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
2434  0019 721e5300      	bset	21248,#7
2436  001d 2004          	jra	L3101
2437  001f               L1101:
2438                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2440  001f 721f5300      	bres	21248,#7
2441  0023               L3101:
2442                     ; 575 }
2445  0023 84            	pop	a
2446  0024 81            	ret	
2483                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2483                     ; 584 {
2484                     .text:	section	.text,new
2485  0000               _TIM2_OC1PreloadConfig:
2487  0000 88            	push	a
2488       00000000      OFST:	set	0
2491                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2493  0001 4d            	tnz	a
2494  0002 2711          	jreq	L464
2495  0004 4a            	dec	a
2496  0005 270e          	jreq	L464
2497  0007 ae024a        	ldw	x,#586
2498  000a 89            	pushw	x
2499  000b 5f            	clrw	x
2500  000c 89            	pushw	x
2501  000d ae0000        	ldw	x,#L302
2502  0010 cd0000        	call	_assert_failed
2504  0013 5b04          	addw	sp,#4
2505  0015               L464:
2506                     ; 589   if (NewState != DISABLE)
2508  0015 7b01          	ld	a,(OFST+1,sp)
2509  0017 2706          	jreq	L3301
2510                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2512  0019 72165305      	bset	21253,#3
2514  001d 2004          	jra	L5301
2515  001f               L3301:
2516                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2518  001f 72175305      	bres	21253,#3
2519  0023               L5301:
2520                     ; 597 }
2523  0023 84            	pop	a
2524  0024 81            	ret	
2561                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2561                     ; 606 {
2562                     .text:	section	.text,new
2563  0000               _TIM2_OC2PreloadConfig:
2565  0000 88            	push	a
2566       00000000      OFST:	set	0
2569                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2571  0001 4d            	tnz	a
2572  0002 2711          	jreq	L674
2573  0004 4a            	dec	a
2574  0005 270e          	jreq	L674
2575  0007 ae0260        	ldw	x,#608
2576  000a 89            	pushw	x
2577  000b 5f            	clrw	x
2578  000c 89            	pushw	x
2579  000d ae0000        	ldw	x,#L302
2580  0010 cd0000        	call	_assert_failed
2582  0013 5b04          	addw	sp,#4
2583  0015               L674:
2584                     ; 611   if (NewState != DISABLE)
2586  0015 7b01          	ld	a,(OFST+1,sp)
2587  0017 2706          	jreq	L5501
2588                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2590  0019 72165306      	bset	21254,#3
2592  001d 2004          	jra	L7501
2593  001f               L5501:
2594                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2596  001f 72175306      	bres	21254,#3
2597  0023               L7501:
2598                     ; 619 }
2601  0023 84            	pop	a
2602  0024 81            	ret	
2639                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2639                     ; 628 {
2640                     .text:	section	.text,new
2641  0000               _TIM2_OC3PreloadConfig:
2643  0000 88            	push	a
2644       00000000      OFST:	set	0
2647                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2649  0001 4d            	tnz	a
2650  0002 2711          	jreq	L015
2651  0004 4a            	dec	a
2652  0005 270e          	jreq	L015
2653  0007 ae0276        	ldw	x,#630
2654  000a 89            	pushw	x
2655  000b 5f            	clrw	x
2656  000c 89            	pushw	x
2657  000d ae0000        	ldw	x,#L302
2658  0010 cd0000        	call	_assert_failed
2660  0013 5b04          	addw	sp,#4
2661  0015               L015:
2662                     ; 633   if (NewState != DISABLE)
2664  0015 7b01          	ld	a,(OFST+1,sp)
2665  0017 2706          	jreq	L7701
2666                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2668  0019 72165307      	bset	21255,#3
2670  001d 2004          	jra	L1011
2671  001f               L7701:
2672                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2674  001f 72175307      	bres	21255,#3
2675  0023               L1011:
2676                     ; 641 }
2679  0023 84            	pop	a
2680  0024 81            	ret	
2754                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2754                     ; 654 {
2755                     .text:	section	.text,new
2756  0000               _TIM2_GenerateEvent:
2758  0000 88            	push	a
2759       00000000      OFST:	set	0
2762                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2764  0001 4d            	tnz	a
2765  0002 260e          	jrne	L025
2766  0004 ae0290        	ldw	x,#656
2767  0007 89            	pushw	x
2768  0008 5f            	clrw	x
2769  0009 89            	pushw	x
2770  000a ae0000        	ldw	x,#L302
2771  000d cd0000        	call	_assert_failed
2773  0010 5b04          	addw	sp,#4
2774  0012               L025:
2775                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
2777  0012 7b01          	ld	a,(OFST+1,sp)
2778  0014 c75304        	ld	21252,a
2779                     ; 660 }
2782  0017 84            	pop	a
2783  0018 81            	ret	
2820                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2820                     ; 671 {
2821                     .text:	section	.text,new
2822  0000               _TIM2_OC1PolarityConfig:
2824  0000 88            	push	a
2825       00000000      OFST:	set	0
2828                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2830  0001 4d            	tnz	a
2831  0002 2712          	jreq	L235
2832  0004 a122          	cp	a,#34
2833  0006 270e          	jreq	L235
2834  0008 ae02a1        	ldw	x,#673
2835  000b 89            	pushw	x
2836  000c 5f            	clrw	x
2837  000d 89            	pushw	x
2838  000e ae0000        	ldw	x,#L302
2839  0011 cd0000        	call	_assert_failed
2841  0014 5b04          	addw	sp,#4
2842  0016               L235:
2843                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2845  0016 7b01          	ld	a,(OFST+1,sp)
2846  0018 2706          	jreq	L3511
2847                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2849  001a 72125308      	bset	21256,#1
2851  001e 2004          	jra	L5511
2852  0020               L3511:
2853                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2855  0020 72135308      	bres	21256,#1
2856  0024               L5511:
2857                     ; 684 }
2860  0024 84            	pop	a
2861  0025 81            	ret	
2898                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2898                     ; 695 {
2899                     .text:	section	.text,new
2900  0000               _TIM2_OC2PolarityConfig:
2902  0000 88            	push	a
2903       00000000      OFST:	set	0
2906                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2908  0001 4d            	tnz	a
2909  0002 2712          	jreq	L445
2910  0004 a122          	cp	a,#34
2911  0006 270e          	jreq	L445
2912  0008 ae02b9        	ldw	x,#697
2913  000b 89            	pushw	x
2914  000c 5f            	clrw	x
2915  000d 89            	pushw	x
2916  000e ae0000        	ldw	x,#L302
2917  0011 cd0000        	call	_assert_failed
2919  0014 5b04          	addw	sp,#4
2920  0016               L445:
2921                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2923  0016 7b01          	ld	a,(OFST+1,sp)
2924  0018 2706          	jreq	L5711
2925                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
2927  001a 721a5308      	bset	21256,#5
2929  001e 2004          	jra	L7711
2930  0020               L5711:
2931                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2933  0020 721b5308      	bres	21256,#5
2934  0024               L7711:
2935                     ; 708 }
2938  0024 84            	pop	a
2939  0025 81            	ret	
2976                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2976                     ; 719 {
2977                     .text:	section	.text,new
2978  0000               _TIM2_OC3PolarityConfig:
2980  0000 88            	push	a
2981       00000000      OFST:	set	0
2984                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2986  0001 4d            	tnz	a
2987  0002 2712          	jreq	L655
2988  0004 a122          	cp	a,#34
2989  0006 270e          	jreq	L655
2990  0008 ae02d1        	ldw	x,#721
2991  000b 89            	pushw	x
2992  000c 5f            	clrw	x
2993  000d 89            	pushw	x
2994  000e ae0000        	ldw	x,#L302
2995  0011 cd0000        	call	_assert_failed
2997  0014 5b04          	addw	sp,#4
2998  0016               L655:
2999                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3001  0016 7b01          	ld	a,(OFST+1,sp)
3002  0018 2706          	jreq	L7121
3003                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
3005  001a 72125309      	bset	21257,#1
3007  001e 2004          	jra	L1221
3008  0020               L7121:
3009                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
3011  0020 72135309      	bres	21257,#1
3012  0024               L1221:
3013                     ; 732 }
3016  0024 84            	pop	a
3017  0025 81            	ret	
3063                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
3063                     ; 746 {
3064                     .text:	section	.text,new
3065  0000               _TIM2_CCxCmd:
3067  0000 89            	pushw	x
3068       00000000      OFST:	set	0
3071                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3073  0001 9e            	ld	a,xh
3074  0002 4d            	tnz	a
3075  0003 270e          	jreq	L075
3076  0005 9e            	ld	a,xh
3077  0006 4a            	dec	a
3078  0007 270a          	jreq	L075
3079  0009 9e            	ld	a,xh
3080  000a a102          	cp	a,#2
3081  000c 2705          	jreq	L075
3082  000e ae02ec        	ldw	x,#748
3083  0011 ad43          	call	LC008
3084  0013               L075:
3085                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3087  0013 7b02          	ld	a,(OFST+2,sp)
3088  0015 2708          	jreq	L006
3089  0017 4a            	dec	a
3090  0018 2705          	jreq	L006
3091  001a ae02ed        	ldw	x,#749
3092  001d ad37          	call	LC008
3093  001f               L006:
3094                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
3096  001f 7b01          	ld	a,(OFST+1,sp)
3097  0021 2610          	jrne	L5421
3098                     ; 754     if (NewState != DISABLE)
3100  0023 7b02          	ld	a,(OFST+2,sp)
3101  0025 2706          	jreq	L7421
3102                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
3104  0027 72105308      	bset	21256,#0
3106  002b 2027          	jra	L3521
3107  002d               L7421:
3108                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3110  002d 72115308      	bres	21256,#0
3111  0031 2021          	jra	L3521
3112  0033               L5421:
3113                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
3115  0033 4a            	dec	a
3116  0034 2610          	jrne	L5521
3117                     ; 767     if (NewState != DISABLE)
3119  0036 7b02          	ld	a,(OFST+2,sp)
3120  0038 2706          	jreq	L7521
3121                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
3123  003a 72185308      	bset	21256,#4
3125  003e 2014          	jra	L3521
3126  0040               L7521:
3127                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3129  0040 72195308      	bres	21256,#4
3130  0044 200e          	jra	L3521
3131  0046               L5521:
3132                     ; 779     if (NewState != DISABLE)
3134  0046 7b02          	ld	a,(OFST+2,sp)
3135  0048 2706          	jreq	L5621
3136                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
3138  004a 72105309      	bset	21257,#0
3140  004e 2004          	jra	L3521
3141  0050               L5621:
3142                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3144  0050 72115309      	bres	21257,#0
3145  0054               L3521:
3146                     ; 788 }
3149  0054 85            	popw	x
3150  0055 81            	ret	
3151  0056               LC008:
3152  0056 89            	pushw	x
3153  0057 5f            	clrw	x
3154  0058 89            	pushw	x
3155  0059 ae0000        	ldw	x,#L302
3156  005c cd0000        	call	_assert_failed
3158  005f 5b04          	addw	sp,#4
3159  0061 81            	ret	
3205                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
3205                     ; 811 {
3206                     .text:	section	.text,new
3207  0000               _TIM2_SelectOCxM:
3209  0000 89            	pushw	x
3210       00000000      OFST:	set	0
3213                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3215  0001 9e            	ld	a,xh
3216  0002 4d            	tnz	a
3217  0003 270e          	jreq	L216
3218  0005 9e            	ld	a,xh
3219  0006 4a            	dec	a
3220  0007 270a          	jreq	L216
3221  0009 9e            	ld	a,xh
3222  000a a102          	cp	a,#2
3223  000c 2705          	jreq	L216
3224  000e ae032d        	ldw	x,#813
3225  0011 ad5c          	call	LC009
3226  0013               L216:
3227                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
3229  0013 7b02          	ld	a,(OFST+2,sp)
3230  0015 2721          	jreq	L226
3231  0017 a110          	cp	a,#16
3232  0019 271d          	jreq	L226
3233  001b a120          	cp	a,#32
3234  001d 2719          	jreq	L226
3235  001f a130          	cp	a,#48
3236  0021 2715          	jreq	L226
3237  0023 a160          	cp	a,#96
3238  0025 2711          	jreq	L226
3239  0027 a170          	cp	a,#112
3240  0029 270d          	jreq	L226
3241  002b a150          	cp	a,#80
3242  002d 2709          	jreq	L226
3243  002f a140          	cp	a,#64
3244  0031 2705          	jreq	L226
3245  0033 ae032e        	ldw	x,#814
3246  0036 ad37          	call	LC009
3247  0038               L226:
3248                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
3250  0038 7b01          	ld	a,(OFST+1,sp)
3251  003a 2610          	jrne	L3131
3252                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3254  003c 72115308      	bres	21256,#0
3255                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
3255                     ; 823                             | (uint8_t)TIM2_OCMode);
3257  0040 c65305        	ld	a,21253
3258  0043 a48f          	and	a,#143
3259  0045 1a02          	or	a,(OFST+2,sp)
3260  0047 c75305        	ld	21253,a
3262  004a 2021          	jra	L5131
3263  004c               L3131:
3264                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
3266  004c 4a            	dec	a
3267  004d 2610          	jrne	L7131
3268                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3270  004f 72195308      	bres	21256,#4
3271                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
3271                     ; 832                             | (uint8_t)TIM2_OCMode);
3273  0053 c65306        	ld	a,21254
3274  0056 a48f          	and	a,#143
3275  0058 1a02          	or	a,(OFST+2,sp)
3276  005a c75306        	ld	21254,a
3278  005d 200e          	jra	L5131
3279  005f               L7131:
3280                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3282  005f 72115309      	bres	21257,#0
3283                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
3283                     ; 841                             | (uint8_t)TIM2_OCMode);
3285  0063 c65307        	ld	a,21255
3286  0066 a48f          	and	a,#143
3287  0068 1a02          	or	a,(OFST+2,sp)
3288  006a c75307        	ld	21255,a
3289  006d               L5131:
3290                     ; 843 }
3293  006d 85            	popw	x
3294  006e 81            	ret	
3295  006f               LC009:
3296  006f 89            	pushw	x
3297  0070 5f            	clrw	x
3298  0071 89            	pushw	x
3299  0072 ae0000        	ldw	x,#L302
3300  0075 cd0000        	call	_assert_failed
3302  0078 5b04          	addw	sp,#4
3303  007a 81            	ret	
3335                     ; 851 void TIM2_SetCounter(uint16_t Counter)
3335                     ; 852 {
3336                     .text:	section	.text,new
3337  0000               _TIM2_SetCounter:
3341                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
3343  0000 9e            	ld	a,xh
3344  0001 c7530a        	ld	21258,a
3345                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
3347  0004 9f            	ld	a,xl
3348  0005 c7530b        	ld	21259,a
3349                     ; 856 }
3352  0008 81            	ret	
3384                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
3384                     ; 865 {
3385                     .text:	section	.text,new
3386  0000               _TIM2_SetAutoreload:
3390                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
3392  0000 9e            	ld	a,xh
3393  0001 c7530d        	ld	21261,a
3394                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
3396  0004 9f            	ld	a,xl
3397  0005 c7530e        	ld	21262,a
3398                     ; 869 }
3401  0008 81            	ret	
3433                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
3433                     ; 878 {
3434                     .text:	section	.text,new
3435  0000               _TIM2_SetCompare1:
3439                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
3441  0000 9e            	ld	a,xh
3442  0001 c7530f        	ld	21263,a
3443                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
3445  0004 9f            	ld	a,xl
3446  0005 c75310        	ld	21264,a
3447                     ; 882 }
3450  0008 81            	ret	
3482                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
3482                     ; 891 {
3483                     .text:	section	.text,new
3484  0000               _TIM2_SetCompare2:
3488                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
3490  0000 9e            	ld	a,xh
3491  0001 c75311        	ld	21265,a
3492                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
3494  0004 9f            	ld	a,xl
3495  0005 c75312        	ld	21266,a
3496                     ; 895 }
3499  0008 81            	ret	
3531                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
3531                     ; 904 {
3532                     .text:	section	.text,new
3533  0000               _TIM2_SetCompare3:
3537                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
3539  0000 9e            	ld	a,xh
3540  0001 c75313        	ld	21267,a
3541                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
3543  0004 9f            	ld	a,xl
3544  0005 c75314        	ld	21268,a
3545                     ; 908 }
3548  0008 81            	ret	
3585                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
3585                     ; 921 {
3586                     .text:	section	.text,new
3587  0000               _TIM2_SetIC1Prescaler:
3589  0000 88            	push	a
3590       00000000      OFST:	set	0
3593                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
3595  0001 4d            	tnz	a
3596  0002 271a          	jreq	L646
3597  0004 a104          	cp	a,#4
3598  0006 2716          	jreq	L646
3599  0008 a108          	cp	a,#8
3600  000a 2712          	jreq	L646
3601  000c a10c          	cp	a,#12
3602  000e 270e          	jreq	L646
3603  0010 ae039b        	ldw	x,#923
3604  0013 89            	pushw	x
3605  0014 5f            	clrw	x
3606  0015 89            	pushw	x
3607  0016 ae0000        	ldw	x,#L302
3608  0019 cd0000        	call	_assert_failed
3610  001c 5b04          	addw	sp,#4
3611  001e               L646:
3612                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3612                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
3614  001e c65305        	ld	a,21253
3615  0021 a4f3          	and	a,#243
3616  0023 1a01          	or	a,(OFST+1,sp)
3617  0025 c75305        	ld	21253,a
3618                     ; 928 }
3621  0028 84            	pop	a
3622  0029 81            	ret	
3659                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3659                     ; 941 {
3660                     .text:	section	.text,new
3661  0000               _TIM2_SetIC2Prescaler:
3663  0000 88            	push	a
3664       00000000      OFST:	set	0
3667                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3669  0001 4d            	tnz	a
3670  0002 271a          	jreq	L066
3671  0004 a104          	cp	a,#4
3672  0006 2716          	jreq	L066
3673  0008 a108          	cp	a,#8
3674  000a 2712          	jreq	L066
3675  000c a10c          	cp	a,#12
3676  000e 270e          	jreq	L066
3677  0010 ae03af        	ldw	x,#943
3678  0013 89            	pushw	x
3679  0014 5f            	clrw	x
3680  0015 89            	pushw	x
3681  0016 ae0000        	ldw	x,#L302
3682  0019 cd0000        	call	_assert_failed
3684  001c 5b04          	addw	sp,#4
3685  001e               L066:
3686                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3686                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
3688  001e c65306        	ld	a,21254
3689  0021 a4f3          	and	a,#243
3690  0023 1a01          	or	a,(OFST+1,sp)
3691  0025 c75306        	ld	21254,a
3692                     ; 948 }
3695  0028 84            	pop	a
3696  0029 81            	ret	
3733                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3733                     ; 961 {
3734                     .text:	section	.text,new
3735  0000               _TIM2_SetIC3Prescaler:
3737  0000 88            	push	a
3738       00000000      OFST:	set	0
3741                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3743  0001 4d            	tnz	a
3744  0002 271a          	jreq	L276
3745  0004 a104          	cp	a,#4
3746  0006 2716          	jreq	L276
3747  0008 a108          	cp	a,#8
3748  000a 2712          	jreq	L276
3749  000c a10c          	cp	a,#12
3750  000e 270e          	jreq	L276
3751  0010 ae03c4        	ldw	x,#964
3752  0013 89            	pushw	x
3753  0014 5f            	clrw	x
3754  0015 89            	pushw	x
3755  0016 ae0000        	ldw	x,#L302
3756  0019 cd0000        	call	_assert_failed
3758  001c 5b04          	addw	sp,#4
3759  001e               L276:
3760                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3760                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
3762  001e c65307        	ld	a,21255
3763  0021 a4f3          	and	a,#243
3764  0023 1a01          	or	a,(OFST+1,sp)
3765  0025 c75307        	ld	21255,a
3766                     ; 968 }
3769  0028 84            	pop	a
3770  0029 81            	ret	
3816                     ; 975 uint16_t TIM2_GetCapture1(void)
3816                     ; 976 {
3817                     .text:	section	.text,new
3818  0000               _TIM2_GetCapture1:
3820  0000 5204          	subw	sp,#4
3821       00000004      OFST:	set	4
3824                     ; 978   uint16_t tmpccr1 = 0;
3826                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
3830                     ; 981   tmpccr1h = TIM2->CCR1H;
3832  0002 c6530f        	ld	a,21263
3833  0005 6b02          	ld	(OFST-2,sp),a
3835                     ; 982   tmpccr1l = TIM2->CCR1L;
3837  0007 c65310        	ld	a,21264
3838  000a 6b01          	ld	(OFST-3,sp),a
3840                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
3842  000c 5f            	clrw	x
3843  000d 97            	ld	xl,a
3844  000e 1f03          	ldw	(OFST-1,sp),x
3846                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3848  0010 5f            	clrw	x
3849  0011 7b02          	ld	a,(OFST-2,sp)
3850  0013 97            	ld	xl,a
3851  0014 7b04          	ld	a,(OFST+0,sp)
3852  0016 01            	rrwa	x,a
3853  0017 1a03          	or	a,(OFST-1,sp)
3854  0019 01            	rrwa	x,a
3856                     ; 987   return (uint16_t)tmpccr1;
3860  001a 5b04          	addw	sp,#4
3861  001c 81            	ret	
3907                     ; 995 uint16_t TIM2_GetCapture2(void)
3907                     ; 996 {
3908                     .text:	section	.text,new
3909  0000               _TIM2_GetCapture2:
3911  0000 5204          	subw	sp,#4
3912       00000004      OFST:	set	4
3915                     ; 998   uint16_t tmpccr2 = 0;
3917                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
3921                     ; 1001   tmpccr2h = TIM2->CCR2H;
3923  0002 c65311        	ld	a,21265
3924  0005 6b02          	ld	(OFST-2,sp),a
3926                     ; 1002   tmpccr2l = TIM2->CCR2L;
3928  0007 c65312        	ld	a,21266
3929  000a 6b01          	ld	(OFST-3,sp),a
3931                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
3933  000c 5f            	clrw	x
3934  000d 97            	ld	xl,a
3935  000e 1f03          	ldw	(OFST-1,sp),x
3937                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3939  0010 5f            	clrw	x
3940  0011 7b02          	ld	a,(OFST-2,sp)
3941  0013 97            	ld	xl,a
3942  0014 7b04          	ld	a,(OFST+0,sp)
3943  0016 01            	rrwa	x,a
3944  0017 1a03          	or	a,(OFST-1,sp)
3945  0019 01            	rrwa	x,a
3947                     ; 1007   return (uint16_t)tmpccr2;
3951  001a 5b04          	addw	sp,#4
3952  001c 81            	ret	
3998                     ; 1015 uint16_t TIM2_GetCapture3(void)
3998                     ; 1016 {
3999                     .text:	section	.text,new
4000  0000               _TIM2_GetCapture3:
4002  0000 5204          	subw	sp,#4
4003       00000004      OFST:	set	4
4006                     ; 1018   uint16_t tmpccr3 = 0;
4008                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
4012                     ; 1021   tmpccr3h = TIM2->CCR3H;
4014  0002 c65313        	ld	a,21267
4015  0005 6b02          	ld	(OFST-2,sp),a
4017                     ; 1022   tmpccr3l = TIM2->CCR3L;
4019  0007 c65314        	ld	a,21268
4020  000a 6b01          	ld	(OFST-3,sp),a
4022                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
4024  000c 5f            	clrw	x
4025  000d 97            	ld	xl,a
4026  000e 1f03          	ldw	(OFST-1,sp),x
4028                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4030  0010 5f            	clrw	x
4031  0011 7b02          	ld	a,(OFST-2,sp)
4032  0013 97            	ld	xl,a
4033  0014 7b04          	ld	a,(OFST+0,sp)
4034  0016 01            	rrwa	x,a
4035  0017 1a03          	or	a,(OFST-1,sp)
4036  0019 01            	rrwa	x,a
4038                     ; 1027   return (uint16_t)tmpccr3;
4042  001a 5b04          	addw	sp,#4
4043  001c 81            	ret	
4075                     ; 1035 uint16_t TIM2_GetCounter(void)
4075                     ; 1036 {
4076                     .text:	section	.text,new
4077  0000               _TIM2_GetCounter:
4079  0000 89            	pushw	x
4080       00000002      OFST:	set	2
4083                     ; 1037   uint16_t tmpcntr = 0;
4085                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
4087  0001 c6530a        	ld	a,21258
4088  0004 97            	ld	xl,a
4089  0005 4f            	clr	a
4090  0006 02            	rlwa	x,a
4091  0007 1f01          	ldw	(OFST-1,sp),x
4093                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
4095  0009 c6530b        	ld	a,21259
4096  000c 5f            	clrw	x
4097  000d 97            	ld	xl,a
4098  000e 01            	rrwa	x,a
4099  000f 1a02          	or	a,(OFST+0,sp)
4100  0011 01            	rrwa	x,a
4101  0012 1a01          	or	a,(OFST-1,sp)
4102  0014 01            	rrwa	x,a
4105  0015 5b02          	addw	sp,#2
4106  0017 81            	ret	
4130                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
4130                     ; 1050 {
4131                     .text:	section	.text,new
4132  0000               _TIM2_GetPrescaler:
4136                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
4138  0000 c6530c        	ld	a,21260
4141  0003 81            	ret	
4277                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
4277                     ; 1069 {
4278                     .text:	section	.text,new
4279  0000               _TIM2_GetFlagStatus:
4281  0000 89            	pushw	x
4282  0001 89            	pushw	x
4283       00000002      OFST:	set	2
4286                     ; 1070   FlagStatus bitstatus = RESET;
4288                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
4292                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
4294  0002 a30001        	cpw	x,#1
4295  0005 272c          	jreq	L617
4296  0007 a30002        	cpw	x,#2
4297  000a 2727          	jreq	L617
4298  000c a30004        	cpw	x,#4
4299  000f 2722          	jreq	L617
4300  0011 a30008        	cpw	x,#8
4301  0014 271d          	jreq	L617
4302  0016 a30200        	cpw	x,#512
4303  0019 2718          	jreq	L617
4304  001b a30400        	cpw	x,#1024
4305  001e 2713          	jreq	L617
4306  0020 a30800        	cpw	x,#2048
4307  0023 270e          	jreq	L617
4308  0025 ae0432        	ldw	x,#1074
4309  0028 89            	pushw	x
4310  0029 5f            	clrw	x
4311  002a 89            	pushw	x
4312  002b ae0000        	ldw	x,#L302
4313  002e cd0000        	call	_assert_failed
4315  0031 5b04          	addw	sp,#4
4316  0033               L617:
4317                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
4319  0033 c65302        	ld	a,21250
4320  0036 1404          	and	a,(OFST+2,sp)
4321  0038 6b01          	ld	(OFST-1,sp),a
4323                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
4325  003a 7b03          	ld	a,(OFST+1,sp)
4326  003c 6b02          	ld	(OFST+0,sp),a
4328                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
4330  003e c45303        	and	a,21251
4331  0041 1a01          	or	a,(OFST-1,sp)
4332  0043 2702          	jreq	L5561
4333                     ; 1081     bitstatus = SET;
4335  0045 a601          	ld	a,#1
4338  0047               L5561:
4339                     ; 1085     bitstatus = RESET;
4342                     ; 1087   return (FlagStatus)bitstatus;
4346  0047 5b04          	addw	sp,#4
4347  0049 81            	ret	
4383                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
4383                     ; 1104 {
4384                     .text:	section	.text,new
4385  0000               _TIM2_ClearFlag:
4387  0000 89            	pushw	x
4388       00000000      OFST:	set	0
4391                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
4393  0001 01            	rrwa	x,a
4394  0002 a4f0          	and	a,#240
4395  0004 01            	rrwa	x,a
4396  0005 a4f1          	and	a,#241
4397  0007 01            	rrwa	x,a
4398  0008 5d            	tnzw	x
4399  0009 2604          	jrne	L427
4400  000b 1e01          	ldw	x,(OFST+1,sp)
4401  000d 260e          	jrne	L627
4402  000f               L427:
4403  000f ae0452        	ldw	x,#1106
4404  0012 89            	pushw	x
4405  0013 5f            	clrw	x
4406  0014 89            	pushw	x
4407  0015 ae0000        	ldw	x,#L302
4408  0018 cd0000        	call	_assert_failed
4410  001b 5b04          	addw	sp,#4
4411  001d               L627:
4412                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
4414  001d 7b02          	ld	a,(OFST+2,sp)
4415  001f 43            	cpl	a
4416  0020 c75302        	ld	21250,a
4417                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
4419  0023 35ff5303      	mov	21251,#255
4420                     ; 1111 }
4423  0027 85            	popw	x
4424  0028 81            	ret	
4485                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
4485                     ; 1124 {
4486                     .text:	section	.text,new
4487  0000               _TIM2_GetITStatus:
4489  0000 88            	push	a
4490  0001 89            	pushw	x
4491       00000002      OFST:	set	2
4494                     ; 1125   ITStatus bitstatus = RESET;
4496                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
4500                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
4502  0002 a101          	cp	a,#1
4503  0004 271a          	jreq	L047
4504  0006 a102          	cp	a,#2
4505  0008 2716          	jreq	L047
4506  000a a104          	cp	a,#4
4507  000c 2712          	jreq	L047
4508  000e a108          	cp	a,#8
4509  0010 270e          	jreq	L047
4510  0012 ae0469        	ldw	x,#1129
4511  0015 89            	pushw	x
4512  0016 5f            	clrw	x
4513  0017 89            	pushw	x
4514  0018 ae0000        	ldw	x,#L302
4515  001b cd0000        	call	_assert_failed
4517  001e 5b04          	addw	sp,#4
4518  0020               L047:
4519                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
4521  0020 c65302        	ld	a,21250
4522  0023 1403          	and	a,(OFST+1,sp)
4523  0025 6b01          	ld	(OFST-1,sp),a
4525                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
4527  0027 c65301        	ld	a,21249
4528  002a 1403          	and	a,(OFST+1,sp)
4529  002c 6b02          	ld	(OFST+0,sp),a
4531                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
4533  002e 7b01          	ld	a,(OFST-1,sp)
4534  0030 2708          	jreq	L5271
4536  0032 7b02          	ld	a,(OFST+0,sp)
4537  0034 2704          	jreq	L5271
4538                     ; 1137     bitstatus = SET;
4540  0036 a601          	ld	a,#1
4543  0038 2001          	jra	L7271
4544  003a               L5271:
4545                     ; 1141     bitstatus = RESET;
4547  003a 4f            	clr	a
4549  003b               L7271:
4550                     ; 1143   return (ITStatus)(bitstatus);
4554  003b 5b03          	addw	sp,#3
4555  003d 81            	ret	
4592                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
4592                     ; 1157 {
4593                     .text:	section	.text,new
4594  0000               _TIM2_ClearITPendingBit:
4596  0000 88            	push	a
4597       00000000      OFST:	set	0
4600                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
4602  0001 4d            	tnz	a
4603  0002 2704          	jreq	L647
4604  0004 a110          	cp	a,#16
4605  0006 250e          	jrult	L057
4606  0008               L647:
4607  0008 ae0487        	ldw	x,#1159
4608  000b 89            	pushw	x
4609  000c 5f            	clrw	x
4610  000d 89            	pushw	x
4611  000e ae0000        	ldw	x,#L302
4612  0011 cd0000        	call	_assert_failed
4614  0014 5b04          	addw	sp,#4
4615  0016               L057:
4616                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
4618  0016 7b01          	ld	a,(OFST+1,sp)
4619  0018 43            	cpl	a
4620  0019 c75302        	ld	21250,a
4621                     ; 1163 }
4624  001c 84            	pop	a
4625  001d 81            	ret	
4671                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
4671                     ; 1182                        uint8_t TIM2_ICSelection,
4671                     ; 1183                        uint8_t TIM2_ICFilter)
4671                     ; 1184 {
4672                     .text:	section	.text,new
4673  0000               L3_TI1_Config:
4675  0000 89            	pushw	x
4676  0001 88            	push	a
4677       00000001      OFST:	set	1
4680                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
4682  0002 72115308      	bres	21256,#0
4683                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
4683                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4685  0006 7b06          	ld	a,(OFST+5,sp)
4686  0008 97            	ld	xl,a
4687  0009 a610          	ld	a,#16
4688  000b 42            	mul	x,a
4689  000c 9f            	ld	a,xl
4690  000d 1a03          	or	a,(OFST+2,sp)
4691  000f 6b01          	ld	(OFST+0,sp),a
4693  0011 c65305        	ld	a,21253
4694  0014 a40c          	and	a,#12
4695  0016 1a01          	or	a,(OFST+0,sp)
4696  0018 c75305        	ld	21253,a
4697                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4699  001b 7b02          	ld	a,(OFST+1,sp)
4700  001d 2706          	jreq	L7671
4701                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
4703  001f 72125308      	bset	21256,#1
4705  0023 2004          	jra	L1771
4706  0025               L7671:
4707                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
4709  0025 72135308      	bres	21256,#1
4710  0029               L1771:
4711                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
4713  0029 72105308      	bset	21256,#0
4714                     ; 1203 }
4717  002d 5b03          	addw	sp,#3
4718  002f 81            	ret	
4764                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
4764                     ; 1222                        uint8_t TIM2_ICSelection,
4764                     ; 1223                        uint8_t TIM2_ICFilter)
4764                     ; 1224 {
4765                     .text:	section	.text,new
4766  0000               L5_TI2_Config:
4768  0000 89            	pushw	x
4769  0001 88            	push	a
4770       00000001      OFST:	set	1
4773                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4775  0002 72195308      	bres	21256,#4
4776                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4776                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4778  0006 7b06          	ld	a,(OFST+5,sp)
4779  0008 97            	ld	xl,a
4780  0009 a610          	ld	a,#16
4781  000b 42            	mul	x,a
4782  000c 9f            	ld	a,xl
4783  000d 1a03          	or	a,(OFST+2,sp)
4784  000f 6b01          	ld	(OFST+0,sp),a
4786  0011 c65306        	ld	a,21254
4787  0014 a40c          	and	a,#12
4788  0016 1a01          	or	a,(OFST+0,sp)
4789  0018 c75306        	ld	21254,a
4790                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4792  001b 7b02          	ld	a,(OFST+1,sp)
4793  001d 2706          	jreq	L3102
4794                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
4796  001f 721a5308      	bset	21256,#5
4798  0023 2004          	jra	L5102
4799  0025               L3102:
4800                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4802  0025 721b5308      	bres	21256,#5
4803  0029               L5102:
4804                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
4806  0029 72185308      	bset	21256,#4
4807                     ; 1245 }
4810  002d 5b03          	addw	sp,#3
4811  002f 81            	ret	
4857                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4857                     ; 1262                        uint8_t TIM2_ICFilter)
4857                     ; 1263 {
4858                     .text:	section	.text,new
4859  0000               L7_TI3_Config:
4861  0000 89            	pushw	x
4862  0001 88            	push	a
4863       00000001      OFST:	set	1
4866                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4868  0002 72115309      	bres	21257,#0
4869                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4869                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4871  0006 7b06          	ld	a,(OFST+5,sp)
4872  0008 97            	ld	xl,a
4873  0009 a610          	ld	a,#16
4874  000b 42            	mul	x,a
4875  000c 9f            	ld	a,xl
4876  000d 1a03          	or	a,(OFST+2,sp)
4877  000f 6b01          	ld	(OFST+0,sp),a
4879  0011 c65307        	ld	a,21255
4880  0014 a40c          	and	a,#12
4881  0016 1a01          	or	a,(OFST+0,sp)
4882  0018 c75307        	ld	21255,a
4883                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4885  001b 7b02          	ld	a,(OFST+1,sp)
4886  001d 2706          	jreq	L7302
4887                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
4889  001f 72125309      	bset	21257,#1
4891  0023 2004          	jra	L1402
4892  0025               L7302:
4893                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4895  0025 72135309      	bres	21257,#1
4896  0029               L1402:
4897                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
4899  0029 72105309      	bset	21257,#0
4900                     ; 1283 }
4903  002d 5b03          	addw	sp,#3
4904  002f 81            	ret	
4917                     	xdef	_TIM2_ClearITPendingBit
4918                     	xdef	_TIM2_GetITStatus
4919                     	xdef	_TIM2_ClearFlag
4920                     	xdef	_TIM2_GetFlagStatus
4921                     	xdef	_TIM2_GetPrescaler
4922                     	xdef	_TIM2_GetCounter
4923                     	xdef	_TIM2_GetCapture3
4924                     	xdef	_TIM2_GetCapture2
4925                     	xdef	_TIM2_GetCapture1
4926                     	xdef	_TIM2_SetIC3Prescaler
4927                     	xdef	_TIM2_SetIC2Prescaler
4928                     	xdef	_TIM2_SetIC1Prescaler
4929                     	xdef	_TIM2_SetCompare3
4930                     	xdef	_TIM2_SetCompare2
4931                     	xdef	_TIM2_SetCompare1
4932                     	xdef	_TIM2_SetAutoreload
4933                     	xdef	_TIM2_SetCounter
4934                     	xdef	_TIM2_SelectOCxM
4935                     	xdef	_TIM2_CCxCmd
4936                     	xdef	_TIM2_OC3PolarityConfig
4937                     	xdef	_TIM2_OC2PolarityConfig
4938                     	xdef	_TIM2_OC1PolarityConfig
4939                     	xdef	_TIM2_GenerateEvent
4940                     	xdef	_TIM2_OC3PreloadConfig
4941                     	xdef	_TIM2_OC2PreloadConfig
4942                     	xdef	_TIM2_OC1PreloadConfig
4943                     	xdef	_TIM2_ARRPreloadConfig
4944                     	xdef	_TIM2_ForcedOC3Config
4945                     	xdef	_TIM2_ForcedOC2Config
4946                     	xdef	_TIM2_ForcedOC1Config
4947                     	xdef	_TIM2_PrescalerConfig
4948                     	xdef	_TIM2_SelectOnePulseMode
4949                     	xdef	_TIM2_UpdateRequestConfig
4950                     	xdef	_TIM2_UpdateDisableConfig
4951                     	xdef	_TIM2_ITConfig
4952                     	xdef	_TIM2_Cmd
4953                     	xdef	_TIM2_PWMIConfig
4954                     	xdef	_TIM2_ICInit
4955                     	xdef	_TIM2_OC3Init
4956                     	xdef	_TIM2_OC2Init
4957                     	xdef	_TIM2_OC1Init
4958                     	xdef	_TIM2_TimeBaseInit
4959                     	xdef	_TIM2_DeInit
4960                     	xref	_assert_failed
4961                     .const:	section	.text
4962  0000               L302:
4963  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
4964  0012 6965735c7374  	dc.b	"ies\stm8s_stdperip"
4965  0024 685f64726976  	dc.b	"h_driver\src\stm8s"
4966  0036 5f74696d322e  	dc.b	"_tim2.c",0
4986                     	end
