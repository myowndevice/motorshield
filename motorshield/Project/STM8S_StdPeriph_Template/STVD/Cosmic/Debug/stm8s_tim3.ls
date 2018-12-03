   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  49                     ; 51 void TIM3_DeInit(void)
  49                     ; 52 {
  51                     .text:	section	.text,new
  52  0000               _TIM3_DeInit:
  56                     ; 53   TIM3->CR1 = (uint8_t)TIM3_CR1_RESET_VALUE;
  58  0000 725f5320      	clr	21280
  59                     ; 54   TIM3->IER = (uint8_t)TIM3_IER_RESET_VALUE;
  61  0004 725f5321      	clr	21281
  62                     ; 55   TIM3->SR2 = (uint8_t)TIM3_SR2_RESET_VALUE;
  64  0008 725f5323      	clr	21283
  65                     ; 58   TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  67  000c 725f5327      	clr	21287
  68                     ; 61   TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  70  0010 725f5327      	clr	21287
  71                     ; 62   TIM3->CCMR1 = (uint8_t)TIM3_CCMR1_RESET_VALUE;
  73  0014 725f5325      	clr	21285
  74                     ; 63   TIM3->CCMR2 = (uint8_t)TIM3_CCMR2_RESET_VALUE;
  76  0018 725f5326      	clr	21286
  77                     ; 64   TIM3->CNTRH = (uint8_t)TIM3_CNTRH_RESET_VALUE;
  79  001c 725f5328      	clr	21288
  80                     ; 65   TIM3->CNTRL = (uint8_t)TIM3_CNTRL_RESET_VALUE;
  82  0020 725f5329      	clr	21289
  83                     ; 66   TIM3->PSCR = (uint8_t)TIM3_PSCR_RESET_VALUE;
  85  0024 725f532a      	clr	21290
  86                     ; 67   TIM3->ARRH  = (uint8_t)TIM3_ARRH_RESET_VALUE;
  88  0028 35ff532b      	mov	21291,#255
  89                     ; 68   TIM3->ARRL  = (uint8_t)TIM3_ARRL_RESET_VALUE;
  91  002c 35ff532c      	mov	21292,#255
  92                     ; 69   TIM3->CCR1H = (uint8_t)TIM3_CCR1H_RESET_VALUE;
  94  0030 725f532d      	clr	21293
  95                     ; 70   TIM3->CCR1L = (uint8_t)TIM3_CCR1L_RESET_VALUE;
  97  0034 725f532e      	clr	21294
  98                     ; 71   TIM3->CCR2H = (uint8_t)TIM3_CCR2H_RESET_VALUE;
 100  0038 725f532f      	clr	21295
 101                     ; 72   TIM3->CCR2L = (uint8_t)TIM3_CCR2L_RESET_VALUE;
 103  003c 725f5330      	clr	21296
 104                     ; 73   TIM3->SR1 = (uint8_t)TIM3_SR1_RESET_VALUE;
 106  0040 725f5322      	clr	21282
 107                     ; 74 }
 110  0044 81            	ret	
 276                     ; 82 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
 276                     ; 83                         uint16_t TIM3_Period)
 276                     ; 84 {
 277                     .text:	section	.text,new
 278  0000               _TIM3_TimeBaseInit:
 280  0000 88            	push	a
 281       00000000      OFST:	set	0
 284                     ; 86   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 286  0001 c7532a        	ld	21290,a
 287                     ; 88   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8);
 289  0004 7b04          	ld	a,(OFST+4,sp)
 290  0006 c7532b        	ld	21291,a
 291                     ; 89   TIM3->ARRL = (uint8_t)(TIM3_Period);
 293  0009 7b05          	ld	a,(OFST+5,sp)
 294  000b c7532c        	ld	21292,a
 295                     ; 90 }
 298  000e 84            	pop	a
 299  000f 81            	ret	
 455                     ; 100 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 455                     ; 101                   TIM3_OutputState_TypeDef TIM3_OutputState,
 455                     ; 102                   uint16_t TIM3_Pulse,
 455                     ; 103                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 455                     ; 104 {
 456                     .text:	section	.text,new
 457  0000               _TIM3_OC1Init:
 459  0000 89            	pushw	x
 460  0001 88            	push	a
 461       00000001      OFST:	set	1
 464                     ; 106   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 466  0002 9e            	ld	a,xh
 467  0003 4d            	tnz	a
 468  0004 271e          	jreq	L61
 469  0006 9e            	ld	a,xh
 470  0007 a110          	cp	a,#16
 471  0009 2719          	jreq	L61
 472  000b 9e            	ld	a,xh
 473  000c a120          	cp	a,#32
 474  000e 2714          	jreq	L61
 475  0010 9e            	ld	a,xh
 476  0011 a130          	cp	a,#48
 477  0013 270f          	jreq	L61
 478  0015 9e            	ld	a,xh
 479  0016 a160          	cp	a,#96
 480  0018 270a          	jreq	L61
 481  001a 9e            	ld	a,xh
 482  001b a170          	cp	a,#112
 483  001d 2705          	jreq	L61
 484  001f ae006a        	ldw	x,#106
 485  0022 ad4b          	call	LC001
 486  0024               L61:
 487                     ; 107   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 489  0024 7b03          	ld	a,(OFST+2,sp)
 490  0026 2709          	jreq	L62
 491  0028 a111          	cp	a,#17
 492  002a 2705          	jreq	L62
 493  002c ae006b        	ldw	x,#107
 494  002f ad3e          	call	LC001
 495  0031               L62:
 496                     ; 108   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 498  0031 7b08          	ld	a,(OFST+7,sp)
 499  0033 2709          	jreq	L63
 500  0035 a122          	cp	a,#34
 501  0037 2705          	jreq	L63
 502  0039 ae006c        	ldw	x,#108
 503  003c ad31          	call	LC001
 504  003e               L63:
 505                     ; 111   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
 507  003e c65327        	ld	a,21287
 508  0041 a4fc          	and	a,#252
 509  0043 c75327        	ld	21287,a
 510                     ; 113   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
 512  0046 7b08          	ld	a,(OFST+7,sp)
 513  0048 a402          	and	a,#2
 514  004a 6b01          	ld	(OFST+0,sp),a
 516  004c 7b03          	ld	a,(OFST+2,sp)
 517  004e a401          	and	a,#1
 518  0050 1a01          	or	a,(OFST+0,sp)
 519  0052 ca5327        	or	a,21287
 520  0055 c75327        	ld	21287,a
 521                     ; 116   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 523  0058 c65325        	ld	a,21285
 524  005b a48f          	and	a,#143
 525  005d 1a02          	or	a,(OFST+1,sp)
 526  005f c75325        	ld	21285,a
 527                     ; 119   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 529  0062 7b06          	ld	a,(OFST+5,sp)
 530  0064 c7532d        	ld	21293,a
 531                     ; 120   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 533  0067 7b07          	ld	a,(OFST+6,sp)
 534  0069 c7532e        	ld	21294,a
 535                     ; 121 }
 538  006c 5b03          	addw	sp,#3
 539  006e 81            	ret	
 540  006f               LC001:
 541  006f 89            	pushw	x
 542  0070 5f            	clrw	x
 543  0071 89            	pushw	x
 544  0072 ae0000        	ldw	x,#L102
 545  0075 cd0000        	call	_assert_failed
 547  0078 5b04          	addw	sp,#4
 548  007a 81            	ret	
 611                     ; 131 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 611                     ; 132                   TIM3_OutputState_TypeDef TIM3_OutputState,
 611                     ; 133                   uint16_t TIM3_Pulse,
 611                     ; 134                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 611                     ; 135 {
 612                     .text:	section	.text,new
 613  0000               _TIM3_OC2Init:
 615  0000 89            	pushw	x
 616  0001 88            	push	a
 617       00000001      OFST:	set	1
 620                     ; 137   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 622  0002 9e            	ld	a,xh
 623  0003 4d            	tnz	a
 624  0004 271e          	jreq	L05
 625  0006 9e            	ld	a,xh
 626  0007 a110          	cp	a,#16
 627  0009 2719          	jreq	L05
 628  000b 9e            	ld	a,xh
 629  000c a120          	cp	a,#32
 630  000e 2714          	jreq	L05
 631  0010 9e            	ld	a,xh
 632  0011 a130          	cp	a,#48
 633  0013 270f          	jreq	L05
 634  0015 9e            	ld	a,xh
 635  0016 a160          	cp	a,#96
 636  0018 270a          	jreq	L05
 637  001a 9e            	ld	a,xh
 638  001b a170          	cp	a,#112
 639  001d 2705          	jreq	L05
 640  001f ae0089        	ldw	x,#137
 641  0022 ad4b          	call	LC002
 642  0024               L05:
 643                     ; 138   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 645  0024 7b03          	ld	a,(OFST+2,sp)
 646  0026 2709          	jreq	L06
 647  0028 a111          	cp	a,#17
 648  002a 2705          	jreq	L06
 649  002c ae008a        	ldw	x,#138
 650  002f ad3e          	call	LC002
 651  0031               L06:
 652                     ; 139   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 654  0031 7b08          	ld	a,(OFST+7,sp)
 655  0033 2709          	jreq	L07
 656  0035 a122          	cp	a,#34
 657  0037 2705          	jreq	L07
 658  0039 ae008b        	ldw	x,#139
 659  003c ad31          	call	LC002
 660  003e               L07:
 661                     ; 143   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
 663  003e c65327        	ld	a,21287
 664  0041 a4cf          	and	a,#207
 665  0043 c75327        	ld	21287,a
 666                     ; 145   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
 668  0046 7b08          	ld	a,(OFST+7,sp)
 669  0048 a420          	and	a,#32
 670  004a 6b01          	ld	(OFST+0,sp),a
 672  004c 7b03          	ld	a,(OFST+2,sp)
 673  004e a410          	and	a,#16
 674  0050 1a01          	or	a,(OFST+0,sp)
 675  0052 ca5327        	or	a,21287
 676  0055 c75327        	ld	21287,a
 677                     ; 149   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 679  0058 c65326        	ld	a,21286
 680  005b a48f          	and	a,#143
 681  005d 1a02          	or	a,(OFST+1,sp)
 682  005f c75326        	ld	21286,a
 683                     ; 153   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 685  0062 7b06          	ld	a,(OFST+5,sp)
 686  0064 c7532f        	ld	21295,a
 687                     ; 154   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 689  0067 7b07          	ld	a,(OFST+6,sp)
 690  0069 c75330        	ld	21296,a
 691                     ; 155 }
 694  006c 5b03          	addw	sp,#3
 695  006e 81            	ret	
 696  006f               LC002:
 697  006f 89            	pushw	x
 698  0070 5f            	clrw	x
 699  0071 89            	pushw	x
 700  0072 ae0000        	ldw	x,#L102
 701  0075 cd0000        	call	_assert_failed
 703  0078 5b04          	addw	sp,#4
 704  007a 81            	ret	
 887                     ; 166 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
 887                     ; 167                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 887                     ; 168                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
 887                     ; 169                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 887                     ; 170                  uint8_t TIM3_ICFilter)
 887                     ; 171 {
 888                     .text:	section	.text,new
 889  0000               _TIM3_ICInit:
 891  0000 89            	pushw	x
 892       00000000      OFST:	set	0
 895                     ; 173   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
 897  0001 9e            	ld	a,xh
 898  0002 4d            	tnz	a
 899  0003 2709          	jreq	L201
 900  0005 9e            	ld	a,xh
 901  0006 4a            	dec	a
 902  0007 2705          	jreq	L201
 903  0009 ae00ad        	ldw	x,#173
 904  000c ad6d          	call	LC003
 905  000e               L201:
 906                     ; 174   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 908  000e 7b02          	ld	a,(OFST+2,sp)
 909  0010 2709          	jreq	L211
 910  0012 a144          	cp	a,#68
 911  0014 2705          	jreq	L211
 912  0016 ae00ae        	ldw	x,#174
 913  0019 ad60          	call	LC003
 914  001b               L211:
 915                     ; 175   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 917  001b 7b05          	ld	a,(OFST+5,sp)
 918  001d a101          	cp	a,#1
 919  001f 270d          	jreq	L221
 920  0021 a102          	cp	a,#2
 921  0023 2709          	jreq	L221
 922  0025 a103          	cp	a,#3
 923  0027 2705          	jreq	L221
 924  0029 ae00af        	ldw	x,#175
 925  002c ad4d          	call	LC003
 926  002e               L221:
 927                     ; 176   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 929  002e 7b06          	ld	a,(OFST+6,sp)
 930  0030 2711          	jreq	L231
 931  0032 a104          	cp	a,#4
 932  0034 270d          	jreq	L231
 933  0036 a108          	cp	a,#8
 934  0038 2709          	jreq	L231
 935  003a a10c          	cp	a,#12
 936  003c 2705          	jreq	L231
 937  003e ae00b0        	ldw	x,#176
 938  0041 ad38          	call	LC003
 939  0043               L231:
 940                     ; 177   assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
 942  0043 7b07          	ld	a,(OFST+7,sp)
 943  0045 a110          	cp	a,#16
 944  0047 2505          	jrult	L041
 945  0049 ae00b1        	ldw	x,#177
 946  004c ad2d          	call	LC003
 947  004e               L041:
 948                     ; 179   if (TIM3_Channel != TIM3_CHANNEL_2)
 950  004e 7b01          	ld	a,(OFST+1,sp)
 951  0050 4a            	dec	a
 952  0051 2714          	jreq	L533
 953                     ; 182     TI1_Config((uint8_t)TIM3_ICPolarity,
 953                     ; 183                (uint8_t)TIM3_ICSelection,
 953                     ; 184                (uint8_t)TIM3_ICFilter);
 955  0053 7b07          	ld	a,(OFST+7,sp)
 956  0055 88            	push	a
 957  0056 7b06          	ld	a,(OFST+6,sp)
 958  0058 97            	ld	xl,a
 959  0059 7b03          	ld	a,(OFST+3,sp)
 960  005b 95            	ld	xh,a
 961  005c cd0000        	call	L3_TI1_Config
 963  005f 84            	pop	a
 964                     ; 187     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
 966  0060 7b06          	ld	a,(OFST+6,sp)
 967  0062 cd0000        	call	_TIM3_SetIC1Prescaler
 970  0065 2012          	jra	L733
 971  0067               L533:
 972                     ; 192     TI2_Config((uint8_t)TIM3_ICPolarity,
 972                     ; 193                (uint8_t)TIM3_ICSelection,
 972                     ; 194                (uint8_t)TIM3_ICFilter);
 974  0067 7b07          	ld	a,(OFST+7,sp)
 975  0069 88            	push	a
 976  006a 7b06          	ld	a,(OFST+6,sp)
 977  006c 97            	ld	xl,a
 978  006d 7b03          	ld	a,(OFST+3,sp)
 979  006f 95            	ld	xh,a
 980  0070 cd0000        	call	L5_TI2_Config
 982  0073 84            	pop	a
 983                     ; 197     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
 985  0074 7b06          	ld	a,(OFST+6,sp)
 986  0076 cd0000        	call	_TIM3_SetIC2Prescaler
 988  0079               L733:
 989                     ; 199 }
 992  0079 85            	popw	x
 993  007a 81            	ret	
 994  007b               LC003:
 995  007b 89            	pushw	x
 996  007c 5f            	clrw	x
 997  007d 89            	pushw	x
 998  007e ae0000        	ldw	x,#L102
 999  0081 cd0000        	call	_assert_failed
1001  0084 5b04          	addw	sp,#4
1002  0086 81            	ret	
1093                     ; 210 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
1093                     ; 211                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
1093                     ; 212                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
1093                     ; 213                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
1093                     ; 214                      uint8_t TIM3_ICFilter)
1093                     ; 215 {
1094                     .text:	section	.text,new
1095  0000               _TIM3_PWMIConfig:
1097  0000 89            	pushw	x
1098  0001 89            	pushw	x
1099       00000002      OFST:	set	2
1102                     ; 216   uint8_t icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
1104                     ; 217   uint8_t icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
1106                     ; 220   assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
1108  0002 9e            	ld	a,xh
1109  0003 4d            	tnz	a
1110  0004 270a          	jreq	L261
1111  0006 9e            	ld	a,xh
1112  0007 4a            	dec	a
1113  0008 2706          	jreq	L261
1114  000a ae00dc        	ldw	x,#220
1115  000d cd00b4        	call	LC004
1116  0010               L261:
1117                     ; 221   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
1119  0010 7b04          	ld	a,(OFST+2,sp)
1120  0012 270a          	jreq	L271
1121  0014 a144          	cp	a,#68
1122  0016 2706          	jreq	L271
1123  0018 ae00dd        	ldw	x,#221
1124  001b cd00b4        	call	LC004
1125  001e               L271:
1126                     ; 222   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
1128  001e 7b07          	ld	a,(OFST+5,sp)
1129  0020 a101          	cp	a,#1
1130  0022 270e          	jreq	L202
1131  0024 a102          	cp	a,#2
1132  0026 270a          	jreq	L202
1133  0028 a103          	cp	a,#3
1134  002a 2706          	jreq	L202
1135  002c ae00de        	ldw	x,#222
1136  002f cd00b4        	call	LC004
1137  0032               L202:
1138                     ; 223   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
1140  0032 7b08          	ld	a,(OFST+6,sp)
1141  0034 2711          	jreq	L212
1142  0036 a104          	cp	a,#4
1143  0038 270d          	jreq	L212
1144  003a a108          	cp	a,#8
1145  003c 2709          	jreq	L212
1146  003e a10c          	cp	a,#12
1147  0040 2705          	jreq	L212
1148  0042 ae00df        	ldw	x,#223
1149  0045 ad6d          	call	LC004
1150  0047               L212:
1151                     ; 226   if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
1153  0047 7b04          	ld	a,(OFST+2,sp)
1154  0049 a144          	cp	a,#68
1155  004b 2706          	jreq	L104
1156                     ; 228     icpolarity = (uint8_t)TIM3_ICPOLARITY_FALLING;
1158  004d a644          	ld	a,#68
1159  004f 6b01          	ld	(OFST-1,sp),a
1162  0051 2002          	jra	L304
1163  0053               L104:
1164                     ; 232     icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
1166  0053 0f01          	clr	(OFST-1,sp)
1168  0055               L304:
1169                     ; 236   if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
1171  0055 7b07          	ld	a,(OFST+5,sp)
1172  0057 4a            	dec	a
1173  0058 2604          	jrne	L504
1174                     ; 238     icselection = (uint8_t)TIM3_ICSELECTION_INDIRECTTI;
1176  005a a602          	ld	a,#2
1178  005c 2002          	jra	L704
1179  005e               L504:
1180                     ; 242     icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
1182  005e a601          	ld	a,#1
1183  0060               L704:
1184  0060 6b02          	ld	(OFST+0,sp),a
1186                     ; 245   if (TIM3_Channel != TIM3_CHANNEL_2)
1188  0062 7b03          	ld	a,(OFST+1,sp)
1189  0064 4a            	dec	a
1190  0065 2726          	jreq	L114
1191                     ; 248     TI1_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1191                     ; 249                (uint8_t)TIM3_ICFilter);
1193  0067 7b09          	ld	a,(OFST+7,sp)
1194  0069 88            	push	a
1195  006a 7b08          	ld	a,(OFST+6,sp)
1196  006c 97            	ld	xl,a
1197  006d 7b05          	ld	a,(OFST+3,sp)
1198  006f 95            	ld	xh,a
1199  0070 cd0000        	call	L3_TI1_Config
1201  0073 84            	pop	a
1202                     ; 252     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1204  0074 7b08          	ld	a,(OFST+6,sp)
1205  0076 cd0000        	call	_TIM3_SetIC1Prescaler
1207                     ; 255     TI2_Config(icpolarity, icselection, TIM3_ICFilter);
1209  0079 7b09          	ld	a,(OFST+7,sp)
1210  007b 88            	push	a
1211  007c 7b03          	ld	a,(OFST+1,sp)
1212  007e 97            	ld	xl,a
1213  007f 7b02          	ld	a,(OFST+0,sp)
1214  0081 95            	ld	xh,a
1215  0082 cd0000        	call	L5_TI2_Config
1217  0085 84            	pop	a
1218                     ; 258     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1220  0086 7b08          	ld	a,(OFST+6,sp)
1221  0088 cd0000        	call	_TIM3_SetIC2Prescaler
1224  008b 2024          	jra	L314
1225  008d               L114:
1226                     ; 263     TI2_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1226                     ; 264                (uint8_t)TIM3_ICFilter);
1228  008d 7b09          	ld	a,(OFST+7,sp)
1229  008f 88            	push	a
1230  0090 7b08          	ld	a,(OFST+6,sp)
1231  0092 97            	ld	xl,a
1232  0093 7b05          	ld	a,(OFST+3,sp)
1233  0095 95            	ld	xh,a
1234  0096 cd0000        	call	L5_TI2_Config
1236  0099 84            	pop	a
1237                     ; 267     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1239  009a 7b08          	ld	a,(OFST+6,sp)
1240  009c cd0000        	call	_TIM3_SetIC2Prescaler
1242                     ; 270     TI1_Config(icpolarity, icselection, TIM3_ICFilter);
1244  009f 7b09          	ld	a,(OFST+7,sp)
1245  00a1 88            	push	a
1246  00a2 7b03          	ld	a,(OFST+1,sp)
1247  00a4 97            	ld	xl,a
1248  00a5 7b02          	ld	a,(OFST+0,sp)
1249  00a7 95            	ld	xh,a
1250  00a8 cd0000        	call	L3_TI1_Config
1252  00ab 84            	pop	a
1253                     ; 273     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1255  00ac 7b08          	ld	a,(OFST+6,sp)
1256  00ae cd0000        	call	_TIM3_SetIC1Prescaler
1258  00b1               L314:
1259                     ; 275 }
1262  00b1 5b04          	addw	sp,#4
1263  00b3 81            	ret	
1264  00b4               LC004:
1265  00b4 89            	pushw	x
1266  00b5 5f            	clrw	x
1267  00b6 89            	pushw	x
1268  00b7 ae0000        	ldw	x,#L102
1269  00ba cd0000        	call	_assert_failed
1271  00bd 5b04          	addw	sp,#4
1272  00bf 81            	ret	
1328                     ; 283 void TIM3_Cmd(FunctionalState NewState)
1328                     ; 284 {
1329                     .text:	section	.text,new
1330  0000               _TIM3_Cmd:
1332  0000 88            	push	a
1333       00000000      OFST:	set	0
1336                     ; 286   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1338  0001 4d            	tnz	a
1339  0002 2711          	jreq	L442
1340  0004 4a            	dec	a
1341  0005 270e          	jreq	L442
1342  0007 ae011e        	ldw	x,#286
1343  000a 89            	pushw	x
1344  000b 5f            	clrw	x
1345  000c 89            	pushw	x
1346  000d ae0000        	ldw	x,#L102
1347  0010 cd0000        	call	_assert_failed
1349  0013 5b04          	addw	sp,#4
1350  0015               L442:
1351                     ; 289   if (NewState != DISABLE)
1353  0015 7b01          	ld	a,(OFST+1,sp)
1354  0017 2706          	jreq	L344
1355                     ; 291     TIM3->CR1 |= (uint8_t)TIM3_CR1_CEN;
1357  0019 72105320      	bset	21280,#0
1359  001d 2004          	jra	L544
1360  001f               L344:
1361                     ; 295     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_CEN);
1363  001f 72115320      	bres	21280,#0
1364  0023               L544:
1365                     ; 297 }
1368  0023 84            	pop	a
1369  0024 81            	ret	
1442                     ; 311 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1442                     ; 312 {
1443                     .text:	section	.text,new
1444  0000               _TIM3_ITConfig:
1446  0000 89            	pushw	x
1447       00000000      OFST:	set	0
1450                     ; 314   assert_param(IS_TIM3_IT_OK(TIM3_IT));
1452  0001 9e            	ld	a,xh
1453  0002 4d            	tnz	a
1454  0003 2705          	jreq	L252
1455  0005 9e            	ld	a,xh
1456  0006 a108          	cp	a,#8
1457  0008 2505          	jrult	L452
1458  000a               L252:
1459  000a ae013a        	ldw	x,#314
1460  000d ad22          	call	LC005
1461  000f               L452:
1462                     ; 315   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1464  000f 7b02          	ld	a,(OFST+2,sp)
1465  0011 2708          	jreq	L462
1466  0013 4a            	dec	a
1467  0014 2705          	jreq	L462
1468  0016 ae013b        	ldw	x,#315
1469  0019 ad16          	call	LC005
1470  001b               L462:
1471                     ; 317   if (NewState != DISABLE)
1473  001b 7b02          	ld	a,(OFST+2,sp)
1474  001d 2707          	jreq	L305
1475                     ; 320     TIM3->IER |= (uint8_t)TIM3_IT;
1477  001f c65321        	ld	a,21281
1478  0022 1a01          	or	a,(OFST+1,sp)
1480  0024 2006          	jra	L505
1481  0026               L305:
1482                     ; 325     TIM3->IER &= (uint8_t)(~TIM3_IT);
1484  0026 7b01          	ld	a,(OFST+1,sp)
1485  0028 43            	cpl	a
1486  0029 c45321        	and	a,21281
1487  002c               L505:
1488  002c c75321        	ld	21281,a
1489                     ; 327 }
1492  002f 85            	popw	x
1493  0030 81            	ret	
1494  0031               LC005:
1495  0031 89            	pushw	x
1496  0032 5f            	clrw	x
1497  0033 89            	pushw	x
1498  0034 ae0000        	ldw	x,#L102
1499  0037 cd0000        	call	_assert_failed
1501  003a 5b04          	addw	sp,#4
1502  003c 81            	ret	
1539                     ; 335 void TIM3_UpdateDisableConfig(FunctionalState NewState)
1539                     ; 336 {
1540                     .text:	section	.text,new
1541  0000               _TIM3_UpdateDisableConfig:
1543  0000 88            	push	a
1544       00000000      OFST:	set	0
1547                     ; 338   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1549  0001 4d            	tnz	a
1550  0002 2711          	jreq	L672
1551  0004 4a            	dec	a
1552  0005 270e          	jreq	L672
1553  0007 ae0152        	ldw	x,#338
1554  000a 89            	pushw	x
1555  000b 5f            	clrw	x
1556  000c 89            	pushw	x
1557  000d ae0000        	ldw	x,#L102
1558  0010 cd0000        	call	_assert_failed
1560  0013 5b04          	addw	sp,#4
1561  0015               L672:
1562                     ; 341   if (NewState != DISABLE)
1564  0015 7b01          	ld	a,(OFST+1,sp)
1565  0017 2706          	jreq	L525
1566                     ; 343     TIM3->CR1 |= TIM3_CR1_UDIS;
1568  0019 72125320      	bset	21280,#1
1570  001d 2004          	jra	L725
1571  001f               L525:
1572                     ; 347     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_UDIS);
1574  001f 72135320      	bres	21280,#1
1575  0023               L725:
1576                     ; 349 }
1579  0023 84            	pop	a
1580  0024 81            	ret	
1639                     ; 359 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
1639                     ; 360 {
1640                     .text:	section	.text,new
1641  0000               _TIM3_UpdateRequestConfig:
1643  0000 88            	push	a
1644       00000000      OFST:	set	0
1647                     ; 362   assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
1649  0001 4d            	tnz	a
1650  0002 2711          	jreq	L013
1651  0004 4a            	dec	a
1652  0005 270e          	jreq	L013
1653  0007 ae016a        	ldw	x,#362
1654  000a 89            	pushw	x
1655  000b 5f            	clrw	x
1656  000c 89            	pushw	x
1657  000d ae0000        	ldw	x,#L102
1658  0010 cd0000        	call	_assert_failed
1660  0013 5b04          	addw	sp,#4
1661  0015               L013:
1662                     ; 365   if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
1664  0015 7b01          	ld	a,(OFST+1,sp)
1665  0017 2706          	jreq	L755
1666                     ; 367     TIM3->CR1 |= TIM3_CR1_URS;
1668  0019 72145320      	bset	21280,#2
1670  001d 2004          	jra	L165
1671  001f               L755:
1672                     ; 371     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_URS);
1674  001f 72155320      	bres	21280,#2
1675  0023               L165:
1676                     ; 373 }
1679  0023 84            	pop	a
1680  0024 81            	ret	
1738                     ; 383 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1738                     ; 384 {
1739                     .text:	section	.text,new
1740  0000               _TIM3_SelectOnePulseMode:
1742  0000 88            	push	a
1743       00000000      OFST:	set	0
1746                     ; 386   assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
1748  0001 a101          	cp	a,#1
1749  0003 2711          	jreq	L223
1750  0005 4d            	tnz	a
1751  0006 270e          	jreq	L223
1752  0008 ae0182        	ldw	x,#386
1753  000b 89            	pushw	x
1754  000c 5f            	clrw	x
1755  000d 89            	pushw	x
1756  000e ae0000        	ldw	x,#L102
1757  0011 cd0000        	call	_assert_failed
1759  0014 5b04          	addw	sp,#4
1760  0016               L223:
1761                     ; 389   if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
1763  0016 7b01          	ld	a,(OFST+1,sp)
1764  0018 2706          	jreq	L116
1765                     ; 391     TIM3->CR1 |= TIM3_CR1_OPM;
1767  001a 72165320      	bset	21280,#3
1769  001e 2004          	jra	L316
1770  0020               L116:
1771                     ; 395     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_OPM);
1773  0020 72175320      	bres	21280,#3
1774  0024               L316:
1775                     ; 397 }
1778  0024 84            	pop	a
1779  0025 81            	ret	
1848                     ; 427 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
1848                     ; 428                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
1848                     ; 429 {
1849                     .text:	section	.text,new
1850  0000               _TIM3_PrescalerConfig:
1852  0000 89            	pushw	x
1853       00000000      OFST:	set	0
1856                     ; 431   assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
1858  0001 9f            	ld	a,xl
1859  0002 4d            	tnz	a
1860  0003 2709          	jreq	L433
1861  0005 9f            	ld	a,xl
1862  0006 4a            	dec	a
1863  0007 2705          	jreq	L433
1864  0009 ae01af        	ldw	x,#431
1865  000c ad51          	call	LC006
1866  000e               L433:
1867                     ; 432   assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
1869  000e 7b01          	ld	a,(OFST+1,sp)
1870  0010 2743          	jreq	L443
1871  0012 a101          	cp	a,#1
1872  0014 273f          	jreq	L443
1873  0016 a102          	cp	a,#2
1874  0018 273b          	jreq	L443
1875  001a a103          	cp	a,#3
1876  001c 2737          	jreq	L443
1877  001e a104          	cp	a,#4
1878  0020 2733          	jreq	L443
1879  0022 a105          	cp	a,#5
1880  0024 272f          	jreq	L443
1881  0026 a106          	cp	a,#6
1882  0028 272b          	jreq	L443
1883  002a a107          	cp	a,#7
1884  002c 2727          	jreq	L443
1885  002e a108          	cp	a,#8
1886  0030 2723          	jreq	L443
1887  0032 a109          	cp	a,#9
1888  0034 271f          	jreq	L443
1889  0036 a10a          	cp	a,#10
1890  0038 271b          	jreq	L443
1891  003a a10b          	cp	a,#11
1892  003c 2717          	jreq	L443
1893  003e a10c          	cp	a,#12
1894  0040 2713          	jreq	L443
1895  0042 a10d          	cp	a,#13
1896  0044 270f          	jreq	L443
1897  0046 a10e          	cp	a,#14
1898  0048 270b          	jreq	L443
1899  004a a10f          	cp	a,#15
1900  004c 2707          	jreq	L443
1901  004e ae01b0        	ldw	x,#432
1902  0051 ad0c          	call	LC006
1903  0053 7b01          	ld	a,(OFST+1,sp)
1904  0055               L443:
1905                     ; 435   TIM3->PSCR = (uint8_t)Prescaler;
1907  0055 c7532a        	ld	21290,a
1908                     ; 438   TIM3->EGR = (uint8_t)TIM3_PSCReloadMode;
1910  0058 7b02          	ld	a,(OFST+2,sp)
1911  005a c75324        	ld	21284,a
1912                     ; 439 }
1915  005d 85            	popw	x
1916  005e 81            	ret	
1917  005f               LC006:
1918  005f 89            	pushw	x
1919  0060 5f            	clrw	x
1920  0061 89            	pushw	x
1921  0062 ae0000        	ldw	x,#L102
1922  0065 cd0000        	call	_assert_failed
1924  0068 5b04          	addw	sp,#4
1925  006a 81            	ret	
1984                     ; 450 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1984                     ; 451 {
1985                     .text:	section	.text,new
1986  0000               _TIM3_ForcedOC1Config:
1988  0000 88            	push	a
1989       00000000      OFST:	set	0
1992                     ; 453   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1994  0001 a150          	cp	a,#80
1995  0003 2712          	jreq	L653
1996  0005 a140          	cp	a,#64
1997  0007 270e          	jreq	L653
1998  0009 ae01c5        	ldw	x,#453
1999  000c 89            	pushw	x
2000  000d 5f            	clrw	x
2001  000e 89            	pushw	x
2002  000f ae0000        	ldw	x,#L102
2003  0012 cd0000        	call	_assert_failed
2005  0015 5b04          	addw	sp,#4
2006  0017               L653:
2007                     ; 456   TIM3->CCMR1 =  (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM))  | (uint8_t)TIM3_ForcedAction);
2009  0017 c65325        	ld	a,21285
2010  001a a48f          	and	a,#143
2011  001c 1a01          	or	a,(OFST+1,sp)
2012  001e c75325        	ld	21285,a
2013                     ; 457 }
2016  0021 84            	pop	a
2017  0022 81            	ret	
2054                     ; 468 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
2054                     ; 469 {
2055                     .text:	section	.text,new
2056  0000               _TIM3_ForcedOC2Config:
2058  0000 88            	push	a
2059       00000000      OFST:	set	0
2062                     ; 471   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
2064  0001 a150          	cp	a,#80
2065  0003 2712          	jreq	L073
2066  0005 a140          	cp	a,#64
2067  0007 270e          	jreq	L073
2068  0009 ae01d7        	ldw	x,#471
2069  000c 89            	pushw	x
2070  000d 5f            	clrw	x
2071  000e 89            	pushw	x
2072  000f ae0000        	ldw	x,#L102
2073  0012 cd0000        	call	_assert_failed
2075  0015 5b04          	addw	sp,#4
2076  0017               L073:
2077                     ; 474   TIM3->CCMR2 =  (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_ForcedAction);
2079  0017 c65326        	ld	a,21286
2080  001a a48f          	and	a,#143
2081  001c 1a01          	or	a,(OFST+1,sp)
2082  001e c75326        	ld	21286,a
2083                     ; 475 }
2086  0021 84            	pop	a
2087  0022 81            	ret	
2124                     ; 483 void TIM3_ARRPreloadConfig(FunctionalState NewState)
2124                     ; 484 {
2125                     .text:	section	.text,new
2126  0000               _TIM3_ARRPreloadConfig:
2128  0000 88            	push	a
2129       00000000      OFST:	set	0
2132                     ; 486   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2134  0001 4d            	tnz	a
2135  0002 2711          	jreq	L204
2136  0004 4a            	dec	a
2137  0005 270e          	jreq	L204
2138  0007 ae01e6        	ldw	x,#486
2139  000a 89            	pushw	x
2140  000b 5f            	clrw	x
2141  000c 89            	pushw	x
2142  000d ae0000        	ldw	x,#L102
2143  0010 cd0000        	call	_assert_failed
2145  0013 5b04          	addw	sp,#4
2146  0015               L204:
2147                     ; 489   if (NewState != DISABLE)
2149  0015 7b01          	ld	a,(OFST+1,sp)
2150  0017 2706          	jreq	L137
2151                     ; 491     TIM3->CR1 |= TIM3_CR1_ARPE;
2153  0019 721e5320      	bset	21280,#7
2155  001d 2004          	jra	L337
2156  001f               L137:
2157                     ; 495     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_ARPE);
2159  001f 721f5320      	bres	21280,#7
2160  0023               L337:
2161                     ; 497 }
2164  0023 84            	pop	a
2165  0024 81            	ret	
2202                     ; 505 void TIM3_OC1PreloadConfig(FunctionalState NewState)
2202                     ; 506 {
2203                     .text:	section	.text,new
2204  0000               _TIM3_OC1PreloadConfig:
2206  0000 88            	push	a
2207       00000000      OFST:	set	0
2210                     ; 508   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2212  0001 4d            	tnz	a
2213  0002 2711          	jreq	L414
2214  0004 4a            	dec	a
2215  0005 270e          	jreq	L414
2216  0007 ae01fc        	ldw	x,#508
2217  000a 89            	pushw	x
2218  000b 5f            	clrw	x
2219  000c 89            	pushw	x
2220  000d ae0000        	ldw	x,#L102
2221  0010 cd0000        	call	_assert_failed
2223  0013 5b04          	addw	sp,#4
2224  0015               L414:
2225                     ; 511   if (NewState != DISABLE)
2227  0015 7b01          	ld	a,(OFST+1,sp)
2228  0017 2706          	jreq	L357
2229                     ; 513     TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
2231  0019 72165325      	bset	21285,#3
2233  001d 2004          	jra	L557
2234  001f               L357:
2235                     ; 517     TIM3->CCMR1 &= (uint8_t)(~TIM3_CCMR_OCxPE);
2237  001f 72175325      	bres	21285,#3
2238  0023               L557:
2239                     ; 519 }
2242  0023 84            	pop	a
2243  0024 81            	ret	
2280                     ; 527 void TIM3_OC2PreloadConfig(FunctionalState NewState)
2280                     ; 528 {
2281                     .text:	section	.text,new
2282  0000               _TIM3_OC2PreloadConfig:
2284  0000 88            	push	a
2285       00000000      OFST:	set	0
2288                     ; 530   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2290  0001 4d            	tnz	a
2291  0002 2711          	jreq	L624
2292  0004 4a            	dec	a
2293  0005 270e          	jreq	L624
2294  0007 ae0212        	ldw	x,#530
2295  000a 89            	pushw	x
2296  000b 5f            	clrw	x
2297  000c 89            	pushw	x
2298  000d ae0000        	ldw	x,#L102
2299  0010 cd0000        	call	_assert_failed
2301  0013 5b04          	addw	sp,#4
2302  0015               L624:
2303                     ; 533   if (NewState != DISABLE)
2305  0015 7b01          	ld	a,(OFST+1,sp)
2306  0017 2706          	jreq	L577
2307                     ; 535     TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
2309  0019 72165326      	bset	21286,#3
2311  001d 2004          	jra	L777
2312  001f               L577:
2313                     ; 539     TIM3->CCMR2 &= (uint8_t)(~TIM3_CCMR_OCxPE);
2315  001f 72175326      	bres	21286,#3
2316  0023               L777:
2317                     ; 541 }
2320  0023 84            	pop	a
2321  0024 81            	ret	
2387                     ; 552 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
2387                     ; 553 {
2388                     .text:	section	.text,new
2389  0000               _TIM3_GenerateEvent:
2391  0000 88            	push	a
2392       00000000      OFST:	set	0
2395                     ; 555   assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
2397  0001 4d            	tnz	a
2398  0002 260e          	jrne	L634
2399  0004 ae022b        	ldw	x,#555
2400  0007 89            	pushw	x
2401  0008 5f            	clrw	x
2402  0009 89            	pushw	x
2403  000a ae0000        	ldw	x,#L102
2404  000d cd0000        	call	_assert_failed
2406  0010 5b04          	addw	sp,#4
2407  0012               L634:
2408                     ; 558   TIM3->EGR = (uint8_t)TIM3_EventSource;
2410  0012 7b01          	ld	a,(OFST+1,sp)
2411  0014 c75324        	ld	21284,a
2412                     ; 559 }
2415  0017 84            	pop	a
2416  0018 81            	ret	
2453                     ; 569 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2453                     ; 570 {
2454                     .text:	section	.text,new
2455  0000               _TIM3_OC1PolarityConfig:
2457  0000 88            	push	a
2458       00000000      OFST:	set	0
2461                     ; 572   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2463  0001 4d            	tnz	a
2464  0002 2712          	jreq	L054
2465  0004 a122          	cp	a,#34
2466  0006 270e          	jreq	L054
2467  0008 ae023c        	ldw	x,#572
2468  000b 89            	pushw	x
2469  000c 5f            	clrw	x
2470  000d 89            	pushw	x
2471  000e ae0000        	ldw	x,#L102
2472  0011 cd0000        	call	_assert_failed
2474  0014 5b04          	addw	sp,#4
2475  0016               L054:
2476                     ; 575   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2478  0016 7b01          	ld	a,(OFST+1,sp)
2479  0018 2706          	jreq	L7401
2480                     ; 577     TIM3->CCER1 |= TIM3_CCER1_CC1P;
2482  001a 72125327      	bset	21287,#1
2484  001e 2004          	jra	L1501
2485  0020               L7401:
2486                     ; 581     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
2488  0020 72135327      	bres	21287,#1
2489  0024               L1501:
2490                     ; 583 }
2493  0024 84            	pop	a
2494  0025 81            	ret	
2531                     ; 593 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2531                     ; 594 {
2532                     .text:	section	.text,new
2533  0000               _TIM3_OC2PolarityConfig:
2535  0000 88            	push	a
2536       00000000      OFST:	set	0
2539                     ; 596   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2541  0001 4d            	tnz	a
2542  0002 2712          	jreq	L264
2543  0004 a122          	cp	a,#34
2544  0006 270e          	jreq	L264
2545  0008 ae0254        	ldw	x,#596
2546  000b 89            	pushw	x
2547  000c 5f            	clrw	x
2548  000d 89            	pushw	x
2549  000e ae0000        	ldw	x,#L102
2550  0011 cd0000        	call	_assert_failed
2552  0014 5b04          	addw	sp,#4
2553  0016               L264:
2554                     ; 599   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2556  0016 7b01          	ld	a,(OFST+1,sp)
2557  0018 2706          	jreq	L1701
2558                     ; 601     TIM3->CCER1 |= TIM3_CCER1_CC2P;
2560  001a 721a5327      	bset	21287,#5
2562  001e 2004          	jra	L3701
2563  0020               L1701:
2564                     ; 605     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
2566  0020 721b5327      	bres	21287,#5
2567  0024               L3701:
2568                     ; 607 }
2571  0024 84            	pop	a
2572  0025 81            	ret	
2618                     ; 619 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
2618                     ; 620 {
2619                     .text:	section	.text,new
2620  0000               _TIM3_CCxCmd:
2622  0000 89            	pushw	x
2623       00000000      OFST:	set	0
2626                     ; 622   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2628  0001 9e            	ld	a,xh
2629  0002 4d            	tnz	a
2630  0003 2709          	jreq	L474
2631  0005 9e            	ld	a,xh
2632  0006 4a            	dec	a
2633  0007 2705          	jreq	L474
2634  0009 ae026e        	ldw	x,#622
2635  000c ad30          	call	LC007
2636  000e               L474:
2637                     ; 623   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2639  000e 7b02          	ld	a,(OFST+2,sp)
2640  0010 2708          	jreq	L405
2641  0012 4a            	dec	a
2642  0013 2705          	jreq	L405
2643  0015 ae026f        	ldw	x,#623
2644  0018 ad24          	call	LC007
2645  001a               L405:
2646                     ; 625   if (TIM3_Channel == TIM3_CHANNEL_1)
2648  001a 7b01          	ld	a,(OFST+1,sp)
2649  001c 2610          	jrne	L7111
2650                     ; 628     if (NewState != DISABLE)
2652  001e 7b02          	ld	a,(OFST+2,sp)
2653  0020 2706          	jreq	L1211
2654                     ; 630       TIM3->CCER1 |= TIM3_CCER1_CC1E;
2656  0022 72105327      	bset	21287,#0
2658  0026 2014          	jra	L5211
2659  0028               L1211:
2660                     ; 634       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2662  0028 72115327      	bres	21287,#0
2663  002c 200e          	jra	L5211
2664  002e               L7111:
2665                     ; 641     if (NewState != DISABLE)
2667  002e 7b02          	ld	a,(OFST+2,sp)
2668  0030 2706          	jreq	L7211
2669                     ; 643       TIM3->CCER1 |= TIM3_CCER1_CC2E;
2671  0032 72185327      	bset	21287,#4
2673  0036 2004          	jra	L5211
2674  0038               L7211:
2675                     ; 647       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2677  0038 72195327      	bres	21287,#4
2678  003c               L5211:
2679                     ; 650 }
2682  003c 85            	popw	x
2683  003d 81            	ret	
2684  003e               LC007:
2685  003e 89            	pushw	x
2686  003f 5f            	clrw	x
2687  0040 89            	pushw	x
2688  0041 ae0000        	ldw	x,#L102
2689  0044 cd0000        	call	_assert_failed
2691  0047 5b04          	addw	sp,#4
2692  0049 81            	ret	
2738                     ; 671 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
2738                     ; 672 {
2739                     .text:	section	.text,new
2740  0000               _TIM3_SelectOCxM:
2742  0000 89            	pushw	x
2743       00000000      OFST:	set	0
2746                     ; 674   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2748  0001 9e            	ld	a,xh
2749  0002 4d            	tnz	a
2750  0003 2709          	jreq	L615
2751  0005 9e            	ld	a,xh
2752  0006 4a            	dec	a
2753  0007 2705          	jreq	L615
2754  0009 ae02a2        	ldw	x,#674
2755  000c ad49          	call	LC008
2756  000e               L615:
2757                     ; 675   assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
2759  000e 7b02          	ld	a,(OFST+2,sp)
2760  0010 2721          	jreq	L625
2761  0012 a110          	cp	a,#16
2762  0014 271d          	jreq	L625
2763  0016 a120          	cp	a,#32
2764  0018 2719          	jreq	L625
2765  001a a130          	cp	a,#48
2766  001c 2715          	jreq	L625
2767  001e a160          	cp	a,#96
2768  0020 2711          	jreq	L625
2769  0022 a170          	cp	a,#112
2770  0024 270d          	jreq	L625
2771  0026 a150          	cp	a,#80
2772  0028 2709          	jreq	L625
2773  002a a140          	cp	a,#64
2774  002c 2705          	jreq	L625
2775  002e ae02a3        	ldw	x,#675
2776  0031 ad24          	call	LC008
2777  0033               L625:
2778                     ; 677   if (TIM3_Channel == TIM3_CHANNEL_1)
2780  0033 7b01          	ld	a,(OFST+1,sp)
2781  0035 2610          	jrne	L5511
2782                     ; 680     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2784  0037 72115327      	bres	21287,#0
2785                     ; 683     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2787  003b c65325        	ld	a,21285
2788  003e a48f          	and	a,#143
2789  0040 1a02          	or	a,(OFST+2,sp)
2790  0042 c75325        	ld	21285,a
2792  0045 200e          	jra	L7511
2793  0047               L5511:
2794                     ; 688     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2796  0047 72195327      	bres	21287,#4
2797                     ; 691     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2799  004b c65326        	ld	a,21286
2800  004e a48f          	and	a,#143
2801  0050 1a02          	or	a,(OFST+2,sp)
2802  0052 c75326        	ld	21286,a
2803  0055               L7511:
2804                     ; 693 }
2807  0055 85            	popw	x
2808  0056 81            	ret	
2809  0057               LC008:
2810  0057 89            	pushw	x
2811  0058 5f            	clrw	x
2812  0059 89            	pushw	x
2813  005a ae0000        	ldw	x,#L102
2814  005d cd0000        	call	_assert_failed
2816  0060 5b04          	addw	sp,#4
2817  0062 81            	ret	
2849                     ; 701 void TIM3_SetCounter(uint16_t Counter)
2849                     ; 702 {
2850                     .text:	section	.text,new
2851  0000               _TIM3_SetCounter:
2855                     ; 704   TIM3->CNTRH = (uint8_t)(Counter >> 8);
2857  0000 9e            	ld	a,xh
2858  0001 c75328        	ld	21288,a
2859                     ; 705   TIM3->CNTRL = (uint8_t)(Counter);
2861  0004 9f            	ld	a,xl
2862  0005 c75329        	ld	21289,a
2863                     ; 706 }
2866  0008 81            	ret	
2898                     ; 714 void TIM3_SetAutoreload(uint16_t Autoreload)
2898                     ; 715 {
2899                     .text:	section	.text,new
2900  0000               _TIM3_SetAutoreload:
2904                     ; 717   TIM3->ARRH = (uint8_t)(Autoreload >> 8);
2906  0000 9e            	ld	a,xh
2907  0001 c7532b        	ld	21291,a
2908                     ; 718   TIM3->ARRL = (uint8_t)(Autoreload);
2910  0004 9f            	ld	a,xl
2911  0005 c7532c        	ld	21292,a
2912                     ; 719 }
2915  0008 81            	ret	
2947                     ; 727 void TIM3_SetCompare1(uint16_t Compare1)
2947                     ; 728 {
2948                     .text:	section	.text,new
2949  0000               _TIM3_SetCompare1:
2953                     ; 730   TIM3->CCR1H = (uint8_t)(Compare1 >> 8);
2955  0000 9e            	ld	a,xh
2956  0001 c7532d        	ld	21293,a
2957                     ; 731   TIM3->CCR1L = (uint8_t)(Compare1);
2959  0004 9f            	ld	a,xl
2960  0005 c7532e        	ld	21294,a
2961                     ; 732 }
2964  0008 81            	ret	
2996                     ; 740 void TIM3_SetCompare2(uint16_t Compare2)
2996                     ; 741 {
2997                     .text:	section	.text,new
2998  0000               _TIM3_SetCompare2:
3002                     ; 743   TIM3->CCR2H = (uint8_t)(Compare2 >> 8);
3004  0000 9e            	ld	a,xh
3005  0001 c7532f        	ld	21295,a
3006                     ; 744   TIM3->CCR2L = (uint8_t)(Compare2);
3008  0004 9f            	ld	a,xl
3009  0005 c75330        	ld	21296,a
3010                     ; 745 }
3013  0008 81            	ret	
3050                     ; 757 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
3050                     ; 758 {
3051                     .text:	section	.text,new
3052  0000               _TIM3_SetIC1Prescaler:
3054  0000 88            	push	a
3055       00000000      OFST:	set	0
3058                     ; 760   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
3060  0001 4d            	tnz	a
3061  0002 271a          	jreq	L055
3062  0004 a104          	cp	a,#4
3063  0006 2716          	jreq	L055
3064  0008 a108          	cp	a,#8
3065  000a 2712          	jreq	L055
3066  000c a10c          	cp	a,#12
3067  000e 270e          	jreq	L055
3068  0010 ae02f8        	ldw	x,#760
3069  0013 89            	pushw	x
3070  0014 5f            	clrw	x
3071  0015 89            	pushw	x
3072  0016 ae0000        	ldw	x,#L102
3073  0019 cd0000        	call	_assert_failed
3075  001c 5b04          	addw	sp,#4
3076  001e               L055:
3077                     ; 763   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC1Prescaler);
3079  001e c65325        	ld	a,21285
3080  0021 a4f3          	and	a,#243
3081  0023 1a01          	or	a,(OFST+1,sp)
3082  0025 c75325        	ld	21285,a
3083                     ; 764 }
3086  0028 84            	pop	a
3087  0029 81            	ret	
3124                     ; 776 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
3124                     ; 777 {
3125                     .text:	section	.text,new
3126  0000               _TIM3_SetIC2Prescaler:
3128  0000 88            	push	a
3129       00000000      OFST:	set	0
3132                     ; 779   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
3134  0001 4d            	tnz	a
3135  0002 271a          	jreq	L265
3136  0004 a104          	cp	a,#4
3137  0006 2716          	jreq	L265
3138  0008 a108          	cp	a,#8
3139  000a 2712          	jreq	L265
3140  000c a10c          	cp	a,#12
3141  000e 270e          	jreq	L265
3142  0010 ae030b        	ldw	x,#779
3143  0013 89            	pushw	x
3144  0014 5f            	clrw	x
3145  0015 89            	pushw	x
3146  0016 ae0000        	ldw	x,#L102
3147  0019 cd0000        	call	_assert_failed
3149  001c 5b04          	addw	sp,#4
3150  001e               L265:
3151                     ; 782   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC2Prescaler);
3153  001e c65326        	ld	a,21286
3154  0021 a4f3          	and	a,#243
3155  0023 1a01          	or	a,(OFST+1,sp)
3156  0025 c75326        	ld	21286,a
3157                     ; 783 }
3160  0028 84            	pop	a
3161  0029 81            	ret	
3207                     ; 790 uint16_t TIM3_GetCapture1(void)
3207                     ; 791 {
3208                     .text:	section	.text,new
3209  0000               _TIM3_GetCapture1:
3211  0000 5204          	subw	sp,#4
3212       00000004      OFST:	set	4
3215                     ; 793   uint16_t tmpccr1 = 0;
3217                     ; 794   uint8_t tmpccr1l=0, tmpccr1h=0;
3221                     ; 796   tmpccr1h = TIM3->CCR1H;
3223  0002 c6532d        	ld	a,21293
3224  0005 6b02          	ld	(OFST-2,sp),a
3226                     ; 797   tmpccr1l = TIM3->CCR1L;
3228  0007 c6532e        	ld	a,21294
3229  000a 6b01          	ld	(OFST-3,sp),a
3231                     ; 799   tmpccr1 = (uint16_t)(tmpccr1l);
3233  000c 5f            	clrw	x
3234  000d 97            	ld	xl,a
3235  000e 1f03          	ldw	(OFST-1,sp),x
3237                     ; 800   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3239  0010 5f            	clrw	x
3240  0011 7b02          	ld	a,(OFST-2,sp)
3241  0013 97            	ld	xl,a
3242  0014 7b04          	ld	a,(OFST+0,sp)
3243  0016 01            	rrwa	x,a
3244  0017 1a03          	or	a,(OFST-1,sp)
3245  0019 01            	rrwa	x,a
3247                     ; 802   return (uint16_t)tmpccr1;
3251  001a 5b04          	addw	sp,#4
3252  001c 81            	ret	
3298                     ; 810 uint16_t TIM3_GetCapture2(void)
3298                     ; 811 {
3299                     .text:	section	.text,new
3300  0000               _TIM3_GetCapture2:
3302  0000 5204          	subw	sp,#4
3303       00000004      OFST:	set	4
3306                     ; 813   uint16_t tmpccr2 = 0;
3308                     ; 814   uint8_t tmpccr2l=0, tmpccr2h=0;
3312                     ; 816   tmpccr2h = TIM3->CCR2H;
3314  0002 c6532f        	ld	a,21295
3315  0005 6b02          	ld	(OFST-2,sp),a
3317                     ; 817   tmpccr2l = TIM3->CCR2L;
3319  0007 c65330        	ld	a,21296
3320  000a 6b01          	ld	(OFST-3,sp),a
3322                     ; 819   tmpccr2 = (uint16_t)(tmpccr2l);
3324  000c 5f            	clrw	x
3325  000d 97            	ld	xl,a
3326  000e 1f03          	ldw	(OFST-1,sp),x
3328                     ; 820   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3330  0010 5f            	clrw	x
3331  0011 7b02          	ld	a,(OFST-2,sp)
3332  0013 97            	ld	xl,a
3333  0014 7b04          	ld	a,(OFST+0,sp)
3334  0016 01            	rrwa	x,a
3335  0017 1a03          	or	a,(OFST-1,sp)
3336  0019 01            	rrwa	x,a
3338                     ; 822   return (uint16_t)tmpccr2;
3342  001a 5b04          	addw	sp,#4
3343  001c 81            	ret	
3375                     ; 830 uint16_t TIM3_GetCounter(void)
3375                     ; 831 {
3376                     .text:	section	.text,new
3377  0000               _TIM3_GetCounter:
3379  0000 89            	pushw	x
3380       00000002      OFST:	set	2
3383                     ; 832   uint16_t tmpcntr = 0;
3385                     ; 834   tmpcntr = ((uint16_t)TIM3->CNTRH << 8);
3387  0001 c65328        	ld	a,21288
3388  0004 97            	ld	xl,a
3389  0005 4f            	clr	a
3390  0006 02            	rlwa	x,a
3391  0007 1f01          	ldw	(OFST-1,sp),x
3393                     ; 836   return (uint16_t)( tmpcntr| (uint16_t)(TIM3->CNTRL));
3395  0009 c65329        	ld	a,21289
3396  000c 5f            	clrw	x
3397  000d 97            	ld	xl,a
3398  000e 01            	rrwa	x,a
3399  000f 1a02          	or	a,(OFST+0,sp)
3400  0011 01            	rrwa	x,a
3401  0012 1a01          	or	a,(OFST-1,sp)
3402  0014 01            	rrwa	x,a
3405  0015 5b02          	addw	sp,#2
3406  0017 81            	ret	
3430                     ; 844 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
3430                     ; 845 {
3431                     .text:	section	.text,new
3432  0000               _TIM3_GetPrescaler:
3436                     ; 847   return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
3438  0000 c6532a        	ld	a,21290
3441  0003 81            	ret	
3563                     ; 861 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
3563                     ; 862 {
3564                     .text:	section	.text,new
3565  0000               _TIM3_GetFlagStatus:
3567  0000 89            	pushw	x
3568  0001 89            	pushw	x
3569       00000002      OFST:	set	2
3572                     ; 863   FlagStatus bitstatus = RESET;
3574                     ; 864   uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
3578                     ; 867   assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
3580  0002 a30001        	cpw	x,#1
3581  0005 2722          	jreq	L406
3582  0007 a30002        	cpw	x,#2
3583  000a 271d          	jreq	L406
3584  000c a30004        	cpw	x,#4
3585  000f 2718          	jreq	L406
3586  0011 a30200        	cpw	x,#512
3587  0014 2713          	jreq	L406
3588  0016 a30400        	cpw	x,#1024
3589  0019 270e          	jreq	L406
3590  001b ae0363        	ldw	x,#867
3591  001e 89            	pushw	x
3592  001f 5f            	clrw	x
3593  0020 89            	pushw	x
3594  0021 ae0000        	ldw	x,#L102
3595  0024 cd0000        	call	_assert_failed
3597  0027 5b04          	addw	sp,#4
3598  0029               L406:
3599                     ; 869   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_FLAG);
3601  0029 c65322        	ld	a,21282
3602  002c 1404          	and	a,(OFST+2,sp)
3603  002e 6b01          	ld	(OFST-1,sp),a
3605                     ; 870   tim3_flag_h = (uint8_t)((uint16_t)TIM3_FLAG >> 8);
3607  0030 7b03          	ld	a,(OFST+1,sp)
3608  0032 6b02          	ld	(OFST+0,sp),a
3610                     ; 872   if (((tim3_flag_l) | (uint8_t)(TIM3->SR2 & tim3_flag_h)) != (uint8_t)RESET )
3612  0034 c45323        	and	a,21283
3613  0037 1a01          	or	a,(OFST-1,sp)
3614  0039 2702          	jreq	L5341
3615                     ; 874     bitstatus = SET;
3617  003b a601          	ld	a,#1
3620  003d               L5341:
3621                     ; 878     bitstatus = RESET;
3624                     ; 880   return (FlagStatus)bitstatus;
3628  003d 5b04          	addw	sp,#4
3629  003f 81            	ret	
3665                     ; 894 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3665                     ; 895 {
3666                     .text:	section	.text,new
3667  0000               _TIM3_ClearFlag:
3669  0000 89            	pushw	x
3670       00000000      OFST:	set	0
3673                     ; 897   assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
3675  0001 01            	rrwa	x,a
3676  0002 a4f8          	and	a,#248
3677  0004 01            	rrwa	x,a
3678  0005 a4f9          	and	a,#249
3679  0007 01            	rrwa	x,a
3680  0008 5d            	tnzw	x
3681  0009 2604          	jrne	L216
3682  000b 1e01          	ldw	x,(OFST+1,sp)
3683  000d 260e          	jrne	L416
3684  000f               L216:
3685  000f ae0381        	ldw	x,#897
3686  0012 89            	pushw	x
3687  0013 5f            	clrw	x
3688  0014 89            	pushw	x
3689  0015 ae0000        	ldw	x,#L102
3690  0018 cd0000        	call	_assert_failed
3692  001b 5b04          	addw	sp,#4
3693  001d               L416:
3694                     ; 900   TIM3->SR1 = (uint8_t)(~((uint8_t)(TIM3_FLAG)));
3696  001d 7b02          	ld	a,(OFST+2,sp)
3697  001f 43            	cpl	a
3698  0020 c75322        	ld	21282,a
3699                     ; 901   TIM3->SR2 = (uint8_t)(~((uint8_t)((uint16_t)TIM3_FLAG >> 8)));
3701  0023 7b01          	ld	a,(OFST+1,sp)
3702  0025 43            	cpl	a
3703  0026 c75323        	ld	21283,a
3704                     ; 902 }
3707  0029 85            	popw	x
3708  002a 81            	ret	
3769                     ; 913 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
3769                     ; 914 {
3770                     .text:	section	.text,new
3771  0000               _TIM3_GetITStatus:
3773  0000 88            	push	a
3774  0001 89            	pushw	x
3775       00000002      OFST:	set	2
3778                     ; 915   ITStatus bitstatus = RESET;
3780                     ; 916   uint8_t TIM3_itStatus = 0, TIM3_itEnable = 0;
3784                     ; 919   assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
3786  0002 a101          	cp	a,#1
3787  0004 2716          	jreq	L626
3788  0006 a102          	cp	a,#2
3789  0008 2712          	jreq	L626
3790  000a a104          	cp	a,#4
3791  000c 270e          	jreq	L626
3792  000e ae0397        	ldw	x,#919
3793  0011 89            	pushw	x
3794  0012 5f            	clrw	x
3795  0013 89            	pushw	x
3796  0014 ae0000        	ldw	x,#L102
3797  0017 cd0000        	call	_assert_failed
3799  001a 5b04          	addw	sp,#4
3800  001c               L626:
3801                     ; 921   TIM3_itStatus = (uint8_t)(TIM3->SR1 & TIM3_IT);
3803  001c c65322        	ld	a,21282
3804  001f 1403          	and	a,(OFST+1,sp)
3805  0021 6b01          	ld	(OFST-1,sp),a
3807                     ; 923   TIM3_itEnable = (uint8_t)(TIM3->IER & TIM3_IT);
3809  0023 c65321        	ld	a,21281
3810  0026 1403          	and	a,(OFST+1,sp)
3811  0028 6b02          	ld	(OFST+0,sp),a
3813                     ; 925   if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET ))
3815  002a 7b01          	ld	a,(OFST-1,sp)
3816  002c 2708          	jreq	L5051
3818  002e 7b02          	ld	a,(OFST+0,sp)
3819  0030 2704          	jreq	L5051
3820                     ; 927     bitstatus = SET;
3822  0032 a601          	ld	a,#1
3825  0034 2001          	jra	L7051
3826  0036               L5051:
3827                     ; 931     bitstatus = RESET;
3829  0036 4f            	clr	a
3831  0037               L7051:
3832                     ; 933   return (ITStatus)(bitstatus);
3836  0037 5b03          	addw	sp,#3
3837  0039 81            	ret	
3874                     ; 945 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
3874                     ; 946 {
3875                     .text:	section	.text,new
3876  0000               _TIM3_ClearITPendingBit:
3878  0000 88            	push	a
3879       00000000      OFST:	set	0
3882                     ; 948   assert_param(IS_TIM3_IT_OK(TIM3_IT));
3884  0001 4d            	tnz	a
3885  0002 2704          	jreq	L436
3886  0004 a108          	cp	a,#8
3887  0006 250e          	jrult	L636
3888  0008               L436:
3889  0008 ae03b4        	ldw	x,#948
3890  000b 89            	pushw	x
3891  000c 5f            	clrw	x
3892  000d 89            	pushw	x
3893  000e ae0000        	ldw	x,#L102
3894  0011 cd0000        	call	_assert_failed
3896  0014 5b04          	addw	sp,#4
3897  0016               L636:
3898                     ; 951   TIM3->SR1 = (uint8_t)(~TIM3_IT);
3900  0016 7b01          	ld	a,(OFST+1,sp)
3901  0018 43            	cpl	a
3902  0019 c75322        	ld	21282,a
3903                     ; 952 }
3906  001c 84            	pop	a
3907  001d 81            	ret	
3953                     ; 970 static void TI1_Config(uint8_t TIM3_ICPolarity,
3953                     ; 971                        uint8_t TIM3_ICSelection,
3953                     ; 972                        uint8_t TIM3_ICFilter)
3953                     ; 973 {
3954                     .text:	section	.text,new
3955  0000               L3_TI1_Config:
3957  0000 89            	pushw	x
3958  0001 88            	push	a
3959       00000001      OFST:	set	1
3962                     ; 975   TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
3964  0002 72115327      	bres	21287,#0
3965                     ; 978   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~( TIM3_CCMR_CCxS | TIM3_CCMR_ICxF))) | (uint8_t)(( (TIM3_ICSelection)) | ((uint8_t)( TIM3_ICFilter << 4))));
3967  0006 7b06          	ld	a,(OFST+5,sp)
3968  0008 97            	ld	xl,a
3969  0009 a610          	ld	a,#16
3970  000b 42            	mul	x,a
3971  000c 9f            	ld	a,xl
3972  000d 1a03          	or	a,(OFST+2,sp)
3973  000f 6b01          	ld	(OFST+0,sp),a
3975  0011 c65325        	ld	a,21285
3976  0014 a40c          	and	a,#12
3977  0016 1a01          	or	a,(OFST+0,sp)
3978  0018 c75325        	ld	21285,a
3979                     ; 981   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3981  001b 7b02          	ld	a,(OFST+1,sp)
3982  001d 2706          	jreq	L7451
3983                     ; 983     TIM3->CCER1 |= TIM3_CCER1_CC1P;
3985  001f 72125327      	bset	21287,#1
3987  0023 2004          	jra	L1551
3988  0025               L7451:
3989                     ; 987     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
3991  0025 72135327      	bres	21287,#1
3992  0029               L1551:
3993                     ; 990   TIM3->CCER1 |= TIM3_CCER1_CC1E;
3995  0029 72105327      	bset	21287,#0
3996                     ; 991 }
3999  002d 5b03          	addw	sp,#3
4000  002f 81            	ret	
4046                     ; 1009 static void TI2_Config(uint8_t TIM3_ICPolarity,
4046                     ; 1010                        uint8_t TIM3_ICSelection,
4046                     ; 1011                        uint8_t TIM3_ICFilter)
4046                     ; 1012 {
4047                     .text:	section	.text,new
4048  0000               L5_TI2_Config:
4050  0000 89            	pushw	x
4051  0001 88            	push	a
4052       00000001      OFST:	set	1
4055                     ; 1014   TIM3->CCER1 &=  (uint8_t)(~TIM3_CCER1_CC2E);
4057  0002 72195327      	bres	21287,#4
4058                     ; 1017   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~( TIM3_CCMR_CCxS |
4058                     ; 1018                                                               TIM3_CCMR_ICxF    ))) | (uint8_t)(( (TIM3_ICSelection)) | 
4058                     ; 1019                                                                                                 ((uint8_t)( TIM3_ICFilter << 4))));
4060  0006 7b06          	ld	a,(OFST+5,sp)
4061  0008 97            	ld	xl,a
4062  0009 a610          	ld	a,#16
4063  000b 42            	mul	x,a
4064  000c 9f            	ld	a,xl
4065  000d 1a03          	or	a,(OFST+2,sp)
4066  000f 6b01          	ld	(OFST+0,sp),a
4068  0011 c65326        	ld	a,21286
4069  0014 a40c          	and	a,#12
4070  0016 1a01          	or	a,(OFST+0,sp)
4071  0018 c75326        	ld	21286,a
4072                     ; 1022   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
4074  001b 7b02          	ld	a,(OFST+1,sp)
4075  001d 2706          	jreq	L3751
4076                     ; 1024     TIM3->CCER1 |= TIM3_CCER1_CC2P;
4078  001f 721a5327      	bset	21287,#5
4080  0023 2004          	jra	L5751
4081  0025               L3751:
4082                     ; 1028     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
4084  0025 721b5327      	bres	21287,#5
4085  0029               L5751:
4086                     ; 1032   TIM3->CCER1 |= TIM3_CCER1_CC2E;
4088  0029 72185327      	bset	21287,#4
4089                     ; 1033 }
4092  002d 5b03          	addw	sp,#3
4093  002f 81            	ret	
4106                     	xdef	_TIM3_ClearITPendingBit
4107                     	xdef	_TIM3_GetITStatus
4108                     	xdef	_TIM3_ClearFlag
4109                     	xdef	_TIM3_GetFlagStatus
4110                     	xdef	_TIM3_GetPrescaler
4111                     	xdef	_TIM3_GetCounter
4112                     	xdef	_TIM3_GetCapture2
4113                     	xdef	_TIM3_GetCapture1
4114                     	xdef	_TIM3_SetIC2Prescaler
4115                     	xdef	_TIM3_SetIC1Prescaler
4116                     	xdef	_TIM3_SetCompare2
4117                     	xdef	_TIM3_SetCompare1
4118                     	xdef	_TIM3_SetAutoreload
4119                     	xdef	_TIM3_SetCounter
4120                     	xdef	_TIM3_SelectOCxM
4121                     	xdef	_TIM3_CCxCmd
4122                     	xdef	_TIM3_OC2PolarityConfig
4123                     	xdef	_TIM3_OC1PolarityConfig
4124                     	xdef	_TIM3_GenerateEvent
4125                     	xdef	_TIM3_OC2PreloadConfig
4126                     	xdef	_TIM3_OC1PreloadConfig
4127                     	xdef	_TIM3_ARRPreloadConfig
4128                     	xdef	_TIM3_ForcedOC2Config
4129                     	xdef	_TIM3_ForcedOC1Config
4130                     	xdef	_TIM3_PrescalerConfig
4131                     	xdef	_TIM3_SelectOnePulseMode
4132                     	xdef	_TIM3_UpdateRequestConfig
4133                     	xdef	_TIM3_UpdateDisableConfig
4134                     	xdef	_TIM3_ITConfig
4135                     	xdef	_TIM3_Cmd
4136                     	xdef	_TIM3_PWMIConfig
4137                     	xdef	_TIM3_ICInit
4138                     	xdef	_TIM3_OC2Init
4139                     	xdef	_TIM3_OC1Init
4140                     	xdef	_TIM3_TimeBaseInit
4141                     	xdef	_TIM3_DeInit
4142                     	xref	_assert_failed
4143                     .const:	section	.text
4144  0000               L102:
4145  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
4146  0012 6965735c7374  	dc.b	"ies\stm8s_stdperip"
4147  0024 685f64726976  	dc.b	"h_driver\src\stm8s"
4148  0036 5f74696d332e  	dc.b	"_tim3.c",0
4168                     	end
