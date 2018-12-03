   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  49                     ; 67 void I2C_DeInit(void)
  49                     ; 68 {
  51                     .text:	section	.text,new
  52  0000               _I2C_DeInit:
  56                     ; 69   I2C->CR1 = I2C_CR1_RESET_VALUE;
  58  0000 725f5210      	clr	21008
  59                     ; 70   I2C->CR2 = I2C_CR2_RESET_VALUE;
  61  0004 725f5211      	clr	21009
  62                     ; 71   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  64  0008 725f5212      	clr	21010
  65                     ; 72   I2C->OARL = I2C_OARL_RESET_VALUE;
  67  000c 725f5213      	clr	21011
  68                     ; 73   I2C->OARH = I2C_OARH_RESET_VALUE;
  70  0010 725f5214      	clr	21012
  71                     ; 74   I2C->ITR = I2C_ITR_RESET_VALUE;
  73  0014 725f521a      	clr	21018
  74                     ; 75   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  76  0018 725f521b      	clr	21019
  77                     ; 76   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  79  001c 725f521c      	clr	21020
  80                     ; 77   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  82  0020 3502521d      	mov	21021,#2
  83                     ; 78 }
  86  0024 81            	ret	
 215                     .const:	section	.text
 216  0000               L01:
 217  0000 000186a1      	dc.l	100001
 218  0004               L21:
 219  0004 000f4240      	dc.l	1000000
 220                     ; 96 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 220                     ; 97               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 220                     ; 98               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 220                     ; 99 {
 221                     .text:	section	.text,new
 222  0000               _I2C_Init:
 224  0000 5209          	subw	sp,#9
 225       00000009      OFST:	set	9
 228                     ; 100   uint16_t result = 0x0004;
 230                     ; 101   uint16_t tmpval = 0;
 232                     ; 102   uint8_t tmpccrh = 0;
 234  0002 0f07          	clr	(OFST-2,sp)
 236                     ; 115   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 238  0004 c65212        	ld	a,21010
 239  0007 a4c0          	and	a,#192
 240  0009 c75212        	ld	21010,a
 241                     ; 117   I2C->FREQR |= InputClockFrequencyMHz;
 243  000c c65212        	ld	a,21010
 244  000f 1a15          	or	a,(OFST+12,sp)
 245  0011 c75212        	ld	21010,a
 246                     ; 121   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 248  0014 72115210      	bres	21008,#0
 249                     ; 124   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 251  0018 c6521c        	ld	a,21020
 252  001b a430          	and	a,#48
 253  001d c7521c        	ld	21020,a
 254                     ; 125   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 256  0020 725f521b      	clr	21019
 257                     ; 128   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 259  0024 96            	ldw	x,sp
 260  0025 1c000c        	addw	x,#OFST+3
 261  0028 cd0000        	call	c_ltor
 263  002b ae0000        	ldw	x,#L01
 264  002e cd0000        	call	c_lcmp
 266  0031 2560          	jrult	L77
 267                     ; 131     tmpccrh = I2C_CCRH_FS;
 269  0033 a680          	ld	a,#128
 270  0035 6b07          	ld	(OFST-2,sp),a
 272                     ; 133     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 274  0037 96            	ldw	x,sp
 275  0038 0d12          	tnz	(OFST+9,sp)
 276  003a 261d          	jrne	L101
 277                     ; 136       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 279  003c 1c000c        	addw	x,#OFST+3
 280  003f cd0000        	call	c_ltor
 282  0042 a603          	ld	a,#3
 283  0044 cd0000        	call	c_smul
 285  0047 96            	ldw	x,sp
 286  0048 5c            	incw	x
 287  0049 cd0000        	call	c_rtol
 290  004c 7b15          	ld	a,(OFST+12,sp)
 291  004e cd00f4        	call	LC001
 293  0051 96            	ldw	x,sp
 294  0052 cd0102        	call	LC002
 295  0055 1f08          	ldw	(OFST-1,sp),x
 298  0057 2021          	jra	L301
 299  0059               L101:
 300                     ; 141       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 302  0059 1c000c        	addw	x,#OFST+3
 303  005c cd0000        	call	c_ltor
 305  005f a619          	ld	a,#25
 306  0061 cd0000        	call	c_smul
 308  0064 96            	ldw	x,sp
 309  0065 5c            	incw	x
 310  0066 cd0000        	call	c_rtol
 313  0069 7b15          	ld	a,(OFST+12,sp)
 314  006b cd00f4        	call	LC001
 316  006e 96            	ldw	x,sp
 317  006f cd0102        	call	LC002
 318  0072 1f08          	ldw	(OFST-1,sp),x
 320                     ; 143       tmpccrh |= I2C_CCRH_DUTY;
 322  0074 7b07          	ld	a,(OFST-2,sp)
 323  0076 aa40          	or	a,#64
 324  0078 6b07          	ld	(OFST-2,sp),a
 326  007a               L301:
 327                     ; 147     if (result < (uint16_t)0x01)
 329  007a 1e08          	ldw	x,(OFST-1,sp)
 330  007c 2603          	jrne	L501
 331                     ; 150       result = (uint16_t)0x0001;
 333  007e 5c            	incw	x
 334  007f 1f08          	ldw	(OFST-1,sp),x
 336  0081               L501:
 337                     ; 156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 339  0081 7b15          	ld	a,(OFST+12,sp)
 340  0083 97            	ld	xl,a
 341  0084 a603          	ld	a,#3
 342  0086 42            	mul	x,a
 343  0087 a60a          	ld	a,#10
 344  0089 cd0000        	call	c_sdivx
 346  008c 5c            	incw	x
 347  008d 1f05          	ldw	(OFST-4,sp),x
 349                     ; 157     I2C->TRISER = (uint8_t)tmpval;
 351  008f 7b06          	ld	a,(OFST-3,sp)
 353  0091 2028          	jra	L701
 354  0093               L77:
 355                     ; 164     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 357  0093 96            	ldw	x,sp
 358  0094 1c000c        	addw	x,#OFST+3
 359  0097 cd0000        	call	c_ltor
 361  009a 3803          	sll	c_lreg+3
 362  009c 3902          	rlc	c_lreg+2
 363  009e 3901          	rlc	c_lreg+1
 364  00a0 96            	ldw	x,sp
 365  00a1 3900          	rlc	c_lreg
 366  00a3 5c            	incw	x
 367  00a4 cd0000        	call	c_rtol
 370  00a7 7b15          	ld	a,(OFST+12,sp)
 371  00a9 ad49          	call	LC001
 373  00ab 96            	ldw	x,sp
 374  00ac ad54          	call	LC002
 376                     ; 167     if (result < (uint16_t)0x0004)
 378  00ae a30004        	cpw	x,#4
 379  00b1 2403          	jruge	L111
 380                     ; 170       result = (uint16_t)0x0004;
 382  00b3 ae0004        	ldw	x,#4
 384  00b6               L111:
 385  00b6 1f08          	ldw	(OFST-1,sp),x
 386                     ; 176     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 388  00b8 7b15          	ld	a,(OFST+12,sp)
 389  00ba 4c            	inc	a
 390  00bb               L701:
 391  00bb c7521d        	ld	21021,a
 392                     ; 181   I2C->CCRL = (uint8_t)result;
 394  00be 7b09          	ld	a,(OFST+0,sp)
 395  00c0 c7521b        	ld	21019,a
 396                     ; 182   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 398  00c3 7b08          	ld	a,(OFST-1,sp)
 399  00c5 a40f          	and	a,#15
 400  00c7 1a07          	or	a,(OFST-2,sp)
 401  00c9 c7521c        	ld	21020,a
 402                     ; 185   I2C->CR1 |= I2C_CR1_PE;
 404  00cc 72105210      	bset	21008,#0
 405                     ; 189 	I2C->CR2 |= I2C_CR2_ACK;
 407  00d0 72145211      	bset	21009,#2
 408                     ; 190 	I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
 410  00d4 72175211      	bres	21009,#3
 411                     ; 194   I2C->OARL = (uint8_t)(OwnAddress);
 413  00d8 7b11          	ld	a,(OFST+8,sp)
 414  00da c75213        	ld	21011,a
 415                     ; 195   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 415                     ; 196                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 417  00dd 1e10          	ldw	x,(OFST+7,sp)
 418  00df 4f            	clr	a
 419  00e0 01            	rrwa	x,a
 420  00e1 48            	sll	a
 421  00e2 01            	rrwa	x,a
 422  00e3 49            	rlc	a
 423  00e4 a406          	and	a,#6
 424  00e6 6b04          	ld	(OFST-5,sp),a
 426  00e8 7b14          	ld	a,(OFST+11,sp)
 427  00ea aa40          	or	a,#64
 428  00ec 1a04          	or	a,(OFST-5,sp)
 429  00ee c75214        	ld	21012,a
 430                     ; 197 }
 433  00f1 5b09          	addw	sp,#9
 434  00f3 81            	ret	
 435  00f4               LC001:
 436  00f4 b703          	ld	c_lreg+3,a
 437  00f6 3f02          	clr	c_lreg+2
 438  00f8 3f01          	clr	c_lreg+1
 439  00fa 3f00          	clr	c_lreg
 440  00fc ae0004        	ldw	x,#L21
 441  00ff cc0000        	jp	c_lmul
 442  0102               LC002:
 443  0102 5c            	incw	x
 444  0103 cd0000        	call	c_ludv
 446  0106 be02          	ldw	x,c_lreg+2
 447  0108 81            	ret	
 502                     ; 205 void I2C_Cmd(FunctionalState NewState)
 502                     ; 206 {
 503                     .text:	section	.text,new
 504  0000               _I2C_Cmd:
 508                     ; 210   if (NewState != DISABLE)
 510  0000 4d            	tnz	a
 511  0001 2705          	jreq	L141
 512                     ; 213     I2C->CR1 |= I2C_CR1_PE;
 514  0003 72105210      	bset	21008,#0
 517  0007 81            	ret	
 518  0008               L141:
 519                     ; 218     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 521  0008 72115210      	bres	21008,#0
 522                     ; 220 }
 525  000c 81            	ret	
 561                     ; 228 void I2C_GeneralCallCmd(FunctionalState NewState)
 561                     ; 229 {
 562                     .text:	section	.text,new
 563  0000               _I2C_GeneralCallCmd:
 565  0000 88            	push	a
 566       00000000      OFST:	set	0
 569                     ; 231   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 571  0001 4d            	tnz	a
 572  0002 2711          	jreq	L42
 573  0004 4a            	dec	a
 574  0005 270e          	jreq	L42
 575  0007 ae00e7        	ldw	x,#231
 576  000a 89            	pushw	x
 577  000b 5f            	clrw	x
 578  000c 89            	pushw	x
 579  000d ae0008        	ldw	x,#L361
 580  0010 cd0000        	call	_assert_failed
 582  0013 5b04          	addw	sp,#4
 583  0015               L42:
 584                     ; 233   if (NewState != DISABLE)
 586  0015 7b01          	ld	a,(OFST+1,sp)
 587  0017 2706          	jreq	L561
 588                     ; 236     I2C->CR1 |= I2C_CR1_ENGC;
 590  0019 721c5210      	bset	21008,#6
 592  001d 2004          	jra	L761
 593  001f               L561:
 594                     ; 241     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 596  001f 721d5210      	bres	21008,#6
 597  0023               L761:
 598                     ; 243 }
 601  0023 84            	pop	a
 602  0024 81            	ret	
 638                     ; 253 void I2C_GenerateSTART(FunctionalState NewState)
 638                     ; 254 {
 639                     .text:	section	.text,new
 640  0000               _I2C_GenerateSTART:
 642  0000 88            	push	a
 643       00000000      OFST:	set	0
 646                     ; 256   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 648  0001 4d            	tnz	a
 649  0002 2711          	jreq	L63
 650  0004 4a            	dec	a
 651  0005 270e          	jreq	L63
 652  0007 ae0100        	ldw	x,#256
 653  000a 89            	pushw	x
 654  000b 5f            	clrw	x
 655  000c 89            	pushw	x
 656  000d ae0008        	ldw	x,#L361
 657  0010 cd0000        	call	_assert_failed
 659  0013 5b04          	addw	sp,#4
 660  0015               L63:
 661                     ; 258   if (NewState != DISABLE)
 663  0015 7b01          	ld	a,(OFST+1,sp)
 664  0017 2706          	jreq	L702
 665                     ; 261     I2C->CR2 |= I2C_CR2_START;
 667  0019 72105211      	bset	21009,#0
 669  001d 2004          	jra	L112
 670  001f               L702:
 671                     ; 266     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 673  001f 72115211      	bres	21009,#0
 674  0023               L112:
 675                     ; 268 }
 678  0023 84            	pop	a
 679  0024 81            	ret	
 715                     ; 276 void I2C_GenerateSTOP(FunctionalState NewState)
 715                     ; 277 {
 716                     .text:	section	.text,new
 717  0000               _I2C_GenerateSTOP:
 719  0000 88            	push	a
 720       00000000      OFST:	set	0
 723                     ; 279   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 725  0001 4d            	tnz	a
 726  0002 2711          	jreq	L05
 727  0004 4a            	dec	a
 728  0005 270e          	jreq	L05
 729  0007 ae0117        	ldw	x,#279
 730  000a 89            	pushw	x
 731  000b 5f            	clrw	x
 732  000c 89            	pushw	x
 733  000d ae0008        	ldw	x,#L361
 734  0010 cd0000        	call	_assert_failed
 736  0013 5b04          	addw	sp,#4
 737  0015               L05:
 738                     ; 281   if (NewState != DISABLE)
 740  0015 7b01          	ld	a,(OFST+1,sp)
 741  0017 2706          	jreq	L132
 742                     ; 284     I2C->CR2 |= I2C_CR2_STOP;
 744  0019 72125211      	bset	21009,#1
 746  001d 2004          	jra	L332
 747  001f               L132:
 748                     ; 289     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 750  001f 72135211      	bres	21009,#1
 751  0023               L332:
 752                     ; 291 }
 755  0023 84            	pop	a
 756  0024 81            	ret	
 793                     ; 299 void I2C_SoftwareResetCmd(FunctionalState NewState)
 793                     ; 300 {
 794                     .text:	section	.text,new
 795  0000               _I2C_SoftwareResetCmd:
 797  0000 88            	push	a
 798       00000000      OFST:	set	0
 801                     ; 302   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 803  0001 4d            	tnz	a
 804  0002 2711          	jreq	L26
 805  0004 4a            	dec	a
 806  0005 270e          	jreq	L26
 807  0007 ae012e        	ldw	x,#302
 808  000a 89            	pushw	x
 809  000b 5f            	clrw	x
 810  000c 89            	pushw	x
 811  000d ae0008        	ldw	x,#L361
 812  0010 cd0000        	call	_assert_failed
 814  0013 5b04          	addw	sp,#4
 815  0015               L26:
 816                     ; 304   if (NewState != DISABLE)
 818  0015 7b01          	ld	a,(OFST+1,sp)
 819  0017 2706          	jreq	L352
 820                     ; 307     I2C->CR2 |= I2C_CR2_SWRST;
 822  0019 721e5211      	bset	21009,#7
 824  001d 2004          	jra	L552
 825  001f               L352:
 826                     ; 312     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 828  001f 721f5211      	bres	21009,#7
 829  0023               L552:
 830                     ; 314 }
 833  0023 84            	pop	a
 834  0024 81            	ret	
 871                     ; 323 void I2C_StretchClockCmd(FunctionalState NewState)
 871                     ; 324 {
 872                     .text:	section	.text,new
 873  0000               _I2C_StretchClockCmd:
 875  0000 88            	push	a
 876       00000000      OFST:	set	0
 879                     ; 326   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 881  0001 4d            	tnz	a
 882  0002 2711          	jreq	L47
 883  0004 4a            	dec	a
 884  0005 270e          	jreq	L47
 885  0007 ae0146        	ldw	x,#326
 886  000a 89            	pushw	x
 887  000b 5f            	clrw	x
 888  000c 89            	pushw	x
 889  000d ae0008        	ldw	x,#L361
 890  0010 cd0000        	call	_assert_failed
 892  0013 5b04          	addw	sp,#4
 893  0015               L47:
 894                     ; 328   if (NewState != DISABLE)
 896  0015 7b01          	ld	a,(OFST+1,sp)
 897  0017 2706          	jreq	L572
 898                     ; 331     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 900  0019 721f5210      	bres	21008,#7
 902  001d 2004          	jra	L772
 903  001f               L572:
 904                     ; 337     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 906  001f 721e5210      	bset	21008,#7
 907  0023               L772:
 908                     ; 339 }
 911  0023 84            	pop	a
 912  0024 81            	ret	
 975                     ; 348 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 975                     ; 349 {
 976                     .text:	section	.text,new
 977  0000               _I2C_AcknowledgeConfig:
 979  0000 88            	push	a
 980       00000000      OFST:	set	0
 983                     ; 353   if (Ack == I2C_ACK_NONE)
 985  0001 4d            	tnz	a
 986  0002 2606          	jrne	L133
 987                     ; 356     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 989  0004 72155211      	bres	21009,#2
 991  0008 2011          	jra	L333
 992  000a               L133:
 993                     ; 361     I2C->CR2 |= I2C_CR2_ACK;
 995  000a 72145211      	bset	21009,#2
 996                     ; 363     if (Ack == I2C_ACK_CURR)
 998  000e 4a            	dec	a
 999  000f 2606          	jrne	L533
1000                     ; 366       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
1002  0011 72175211      	bres	21009,#3
1004  0015 2004          	jra	L333
1005  0017               L533:
1006                     ; 371       I2C->CR2 |= I2C_CR2_POS;
1008  0017 72165211      	bset	21009,#3
1009  001b               L333:
1010                     ; 374 }
1013  001b 84            	pop	a
1014  001c 81            	ret	
1087                     ; 384 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1087                     ; 385 {
1088                     .text:	section	.text,new
1089  0000               _I2C_ITConfig:
1091  0000 89            	pushw	x
1092       00000000      OFST:	set	0
1095                     ; 387   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1097  0001 9e            	ld	a,xh
1098  0002 4a            	dec	a
1099  0003 2723          	jreq	L011
1100  0005 9e            	ld	a,xh
1101  0006 a102          	cp	a,#2
1102  0008 271e          	jreq	L011
1103  000a 9e            	ld	a,xh
1104  000b a104          	cp	a,#4
1105  000d 2719          	jreq	L011
1106  000f 9e            	ld	a,xh
1107  0010 a103          	cp	a,#3
1108  0012 2714          	jreq	L011
1109  0014 9e            	ld	a,xh
1110  0015 a105          	cp	a,#5
1111  0017 270f          	jreq	L011
1112  0019 9e            	ld	a,xh
1113  001a a106          	cp	a,#6
1114  001c 270a          	jreq	L011
1115  001e 9e            	ld	a,xh
1116  001f a107          	cp	a,#7
1117  0021 2705          	jreq	L011
1118  0023 ae0183        	ldw	x,#387
1119  0026 ad22          	call	LC003
1120  0028               L011:
1121                     ; 388   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1123  0028 7b02          	ld	a,(OFST+2,sp)
1124  002a 2708          	jreq	L021
1125  002c 4a            	dec	a
1126  002d 2705          	jreq	L021
1127  002f ae0184        	ldw	x,#388
1128  0032 ad16          	call	LC003
1129  0034               L021:
1130                     ; 390   if (NewState != DISABLE)
1132  0034 7b02          	ld	a,(OFST+2,sp)
1133  0036 2707          	jreq	L573
1134                     ; 393     I2C->ITR |= (uint8_t)I2C_IT;
1136  0038 c6521a        	ld	a,21018
1137  003b 1a01          	or	a,(OFST+1,sp)
1139  003d 2006          	jra	L773
1140  003f               L573:
1141                     ; 398     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1143  003f 7b01          	ld	a,(OFST+1,sp)
1144  0041 43            	cpl	a
1145  0042 c4521a        	and	a,21018
1146  0045               L773:
1147  0045 c7521a        	ld	21018,a
1148                     ; 400 }
1151  0048 85            	popw	x
1152  0049 81            	ret	
1153  004a               LC003:
1154  004a 89            	pushw	x
1155  004b 5f            	clrw	x
1156  004c 89            	pushw	x
1157  004d ae0008        	ldw	x,#L361
1158  0050 cd0000        	call	_assert_failed
1160  0053 5b04          	addw	sp,#4
1161  0055 81            	ret	
1198                     ; 408 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1198                     ; 409 {
1199                     .text:	section	.text,new
1200  0000               _I2C_FastModeDutyCycleConfig:
1202  0000 88            	push	a
1203       00000000      OFST:	set	0
1206                     ; 411   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1208  0001 4d            	tnz	a
1209  0002 2712          	jreq	L231
1210  0004 a140          	cp	a,#64
1211  0006 270e          	jreq	L231
1212  0008 ae019b        	ldw	x,#411
1213  000b 89            	pushw	x
1214  000c 5f            	clrw	x
1215  000d 89            	pushw	x
1216  000e ae0008        	ldw	x,#L361
1217  0011 cd0000        	call	_assert_failed
1219  0014 5b04          	addw	sp,#4
1220  0016               L231:
1221                     ; 413   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1223  0016 7b01          	ld	a,(OFST+1,sp)
1224  0018 a140          	cp	a,#64
1225  001a 2606          	jrne	L714
1226                     ; 416     I2C->CCRH |= I2C_CCRH_DUTY;
1228  001c 721c521c      	bset	21020,#6
1230  0020 2004          	jra	L124
1231  0022               L714:
1232                     ; 421     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1234  0022 721d521c      	bres	21020,#6
1235  0026               L124:
1236                     ; 423 }
1239  0026 84            	pop	a
1240  0027 81            	ret	
1263                     ; 430 uint8_t I2C_ReceiveData(void)
1263                     ; 431 {
1264                     .text:	section	.text,new
1265  0000               _I2C_ReceiveData:
1269                     ; 433   return ((uint8_t)I2C->DR);
1271  0000 c65216        	ld	a,21014
1274  0003 81            	ret	
1337                     ; 443 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1337                     ; 444 {
1338                     .text:	section	.text,new
1339  0000               _I2C_Send7bitAddress:
1341  0000 89            	pushw	x
1342       00000000      OFST:	set	0
1345                     ; 450   Address &= (uint8_t)0xFE;
1347  0001 7b01          	ld	a,(OFST+1,sp)
1348  0003 a4fe          	and	a,#254
1349  0005 6b01          	ld	(OFST+1,sp),a
1350                     ; 453   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1352  0007 1a02          	or	a,(OFST+2,sp)
1353  0009 c75216        	ld	21014,a
1354                     ; 454 }
1357  000c 85            	popw	x
1358  000d 81            	ret	
1390                     ; 461 void I2C_SendData(uint8_t Data)
1390                     ; 462 {
1391                     .text:	section	.text,new
1392  0000               _I2C_SendData:
1396                     ; 464   I2C->DR = Data;
1398  0000 c75216        	ld	21014,a
1399                     ; 465 }
1402  0003 81            	ret	
1622                     ; 581 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1622                     ; 582 {
1623                     .text:	section	.text,new
1624  0000               _I2C_CheckEvent:
1626  0000 89            	pushw	x
1627  0001 5206          	subw	sp,#6
1628       00000006      OFST:	set	6
1631                     ; 583   __IO uint16_t lastevent = 0x00;
1633  0003 5f            	clrw	x
1634  0004 1f04          	ldw	(OFST-2,sp),x
1636                     ; 584   uint8_t flag1 = 0x00 ;
1638                     ; 585   uint8_t flag2 = 0x00;
1640                     ; 586   ErrorStatus status = ERROR;
1642                     ; 591   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1644  0006 1e07          	ldw	x,(OFST+1,sp)
1645  0008 a30004        	cpw	x,#4
1646  000b 2609          	jrne	L306
1647                     ; 593     lastevent = I2C->SR2 & I2C_SR2_AF;
1649  000d c65218        	ld	a,21016
1650  0010 a404          	and	a,#4
1651  0012 5f            	clrw	x
1652  0013 97            	ld	xl,a
1654  0014 201a          	jra	L506
1655  0016               L306:
1656                     ; 597     flag1 = I2C->SR1;
1658  0016 c65217        	ld	a,21015
1659  0019 6b03          	ld	(OFST-3,sp),a
1661                     ; 598     flag2 = I2C->SR3;
1663  001b c65219        	ld	a,21017
1664  001e 6b06          	ld	(OFST+0,sp),a
1666                     ; 599     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1668  0020 5f            	clrw	x
1669  0021 7b03          	ld	a,(OFST-3,sp)
1670  0023 97            	ld	xl,a
1671  0024 1f01          	ldw	(OFST-5,sp),x
1673  0026 5f            	clrw	x
1674  0027 7b06          	ld	a,(OFST+0,sp)
1675  0029 97            	ld	xl,a
1676  002a 7b02          	ld	a,(OFST-4,sp)
1677  002c 01            	rrwa	x,a
1678  002d 1a01          	or	a,(OFST-5,sp)
1679  002f 01            	rrwa	x,a
1680  0030               L506:
1681  0030 1f04          	ldw	(OFST-2,sp),x
1683                     ; 602   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1685  0032 1e04          	ldw	x,(OFST-2,sp)
1686  0034 01            	rrwa	x,a
1687  0035 1408          	and	a,(OFST+2,sp)
1688  0037 01            	rrwa	x,a
1689  0038 1407          	and	a,(OFST+1,sp)
1690  003a 01            	rrwa	x,a
1691  003b 1307          	cpw	x,(OFST+1,sp)
1692  003d 2604          	jrne	L706
1693                     ; 605     status = SUCCESS;
1695  003f a601          	ld	a,#1
1698  0041 2001          	jra	L116
1699  0043               L706:
1700                     ; 610     status = ERROR;
1702  0043 4f            	clr	a
1704  0044               L116:
1705                     ; 614   return status;
1709  0044 5b08          	addw	sp,#8
1710  0046 81            	ret	
1759                     ; 631 I2C_Event_TypeDef I2C_GetLastEvent(void)
1759                     ; 632 {
1760                     .text:	section	.text,new
1761  0000               _I2C_GetLastEvent:
1763  0000 5206          	subw	sp,#6
1764       00000006      OFST:	set	6
1767                     ; 633   __IO uint16_t lastevent = 0;
1769  0002 5f            	clrw	x
1770  0003 1f05          	ldw	(OFST-1,sp),x
1772                     ; 634   uint16_t flag1 = 0;
1774                     ; 635   uint16_t flag2 = 0;
1776                     ; 637   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1778  0005 7205521805    	btjf	21016,#2,L536
1779                     ; 639     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1781  000a ae0004        	ldw	x,#4
1783  000d 2013          	jra	L736
1784  000f               L536:
1785                     ; 644     flag1 = I2C->SR1;
1787  000f c65217        	ld	a,21015
1788  0012 97            	ld	xl,a
1789  0013 1f01          	ldw	(OFST-5,sp),x
1791                     ; 645     flag2 = I2C->SR3;
1793  0015 c65219        	ld	a,21017
1794  0018 5f            	clrw	x
1795  0019 97            	ld	xl,a
1796  001a 1f03          	ldw	(OFST-3,sp),x
1798                     ; 648     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1800  001c 7b02          	ld	a,(OFST-4,sp)
1801  001e 01            	rrwa	x,a
1802  001f 1a01          	or	a,(OFST-5,sp)
1803  0021 01            	rrwa	x,a
1804  0022               L736:
1805  0022 1f05          	ldw	(OFST-1,sp),x
1807                     ; 651   return (I2C_Event_TypeDef)lastevent;
1809  0024 1e05          	ldw	x,(OFST-1,sp)
1812  0026 5b06          	addw	sp,#6
1813  0028 81            	ret	
2024                     ; 682 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
2024                     ; 683 {
2025                     .text:	section	.text,new
2026  0000               _I2C_GetFlagStatus:
2028  0000 89            	pushw	x
2029  0001 89            	pushw	x
2030       00000002      OFST:	set	2
2033                     ; 684   uint8_t tempreg = 0;
2035  0002 0f02          	clr	(OFST+0,sp)
2037                     ; 685   uint8_t regindex = 0;
2039                     ; 686   FlagStatus bitstatus = RESET;
2041                     ; 692   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
2043  0004 9e            	ld	a,xh
2044  0005 6b01          	ld	(OFST-1,sp),a
2046                     ; 694   switch (regindex)
2049                     ; 711     default:
2049                     ; 712       break;
2050  0007 4a            	dec	a
2051  0008 2708          	jreq	L146
2052  000a 4a            	dec	a
2053  000b 270a          	jreq	L346
2054  000d 4a            	dec	a
2055  000e 270c          	jreq	L546
2056  0010 200f          	jra	L557
2057  0012               L146:
2058                     ; 697     case 0x01:
2058                     ; 698       tempreg = (uint8_t)I2C->SR1;
2060  0012 c65217        	ld	a,21015
2061                     ; 699       break;
2063  0015 2008          	jp	LC004
2064  0017               L346:
2065                     ; 702     case 0x02:
2065                     ; 703       tempreg = (uint8_t)I2C->SR2;
2067  0017 c65218        	ld	a,21016
2068                     ; 704       break;
2070  001a 2003          	jp	LC004
2071  001c               L546:
2072                     ; 707     case 0x03:
2072                     ; 708       tempreg = (uint8_t)I2C->SR3;
2074  001c c65219        	ld	a,21017
2075  001f               LC004:
2076  001f 6b02          	ld	(OFST+0,sp),a
2078                     ; 709       break;
2080                     ; 711     default:
2080                     ; 712       break;
2082  0021               L557:
2083                     ; 716   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2085  0021 7b04          	ld	a,(OFST+2,sp)
2086  0023 1502          	bcp	a,(OFST+0,sp)
2087  0025 2704          	jreq	L757
2088                     ; 719     bitstatus = SET;
2090  0027 a601          	ld	a,#1
2093  0029 2001          	jra	L167
2094  002b               L757:
2095                     ; 724     bitstatus = RESET;
2097  002b 4f            	clr	a
2099  002c               L167:
2100                     ; 727   return bitstatus;
2104  002c 5b04          	addw	sp,#4
2105  002e 81            	ret	
2147                     ; 762 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2147                     ; 763 {
2148                     .text:	section	.text,new
2149  0000               _I2C_ClearFlag:
2151  0000 89            	pushw	x
2152       00000002      OFST:	set	2
2155                     ; 764   uint16_t flagpos = 0;
2157                     ; 769   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2159  0001 01            	rrwa	x,a
2160  0002 5f            	clrw	x
2161  0003 02            	rlwa	x,a
2162  0004 1f01          	ldw	(OFST-1,sp),x
2164                     ; 771   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2166  0006 7b02          	ld	a,(OFST+0,sp)
2167  0008 43            	cpl	a
2168  0009 c75218        	ld	21016,a
2169                     ; 772 }
2172  000c 85            	popw	x
2173  000d 81            	ret	
2337                     ; 794 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2337                     ; 795 {
2338                     .text:	section	.text,new
2339  0000               _I2C_GetITStatus:
2341  0000 89            	pushw	x
2342  0001 5204          	subw	sp,#4
2343       00000004      OFST:	set	4
2346                     ; 796   ITStatus bitstatus = RESET;
2348                     ; 797   __IO uint8_t enablestatus = 0;
2350  0003 0f03          	clr	(OFST-1,sp)
2352                     ; 798   uint16_t tempregister = 0;
2354                     ; 803   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2356  0005 9e            	ld	a,xh
2357  0006 a407          	and	a,#7
2358  0008 5f            	clrw	x
2359  0009 97            	ld	xl,a
2360  000a 1f01          	ldw	(OFST-3,sp),x
2362                     ; 806   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2364  000c c6521a        	ld	a,21018
2365  000f 1402          	and	a,(OFST-2,sp)
2366  0011 6b03          	ld	(OFST-1,sp),a
2368                     ; 808   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2370  0013 7b05          	ld	a,(OFST+1,sp)
2371  0015 a430          	and	a,#48
2372  0017 97            	ld	xl,a
2373  0018 4f            	clr	a
2374  0019 02            	rlwa	x,a
2375  001a a30100        	cpw	x,#256
2376  001d 260d          	jrne	L7601
2377                     ; 811     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2379  001f c65217        	ld	a,21015
2380  0022 1506          	bcp	a,(OFST+2,sp)
2381  0024 2715          	jreq	L7701
2383  0026 0d03          	tnz	(OFST-1,sp)
2384  0028 2711          	jreq	L7701
2385                     ; 814       bitstatus = SET;
2387  002a 200b          	jp	LC006
2388                     ; 819       bitstatus = RESET;
2389  002c               L7601:
2390                     ; 825     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2392  002c c65218        	ld	a,21016
2393  002f 1506          	bcp	a,(OFST+2,sp)
2394  0031 2708          	jreq	L7701
2396  0033 0d03          	tnz	(OFST-1,sp)
2397  0035 2704          	jreq	L7701
2398                     ; 828       bitstatus = SET;
2400  0037               LC006:
2402  0037 a601          	ld	a,#1
2405  0039 2001          	jra	L5701
2406  003b               L7701:
2407                     ; 833       bitstatus = RESET;
2410  003b 4f            	clr	a
2412  003c               L5701:
2413                     ; 837   return  bitstatus;
2417  003c 5b06          	addw	sp,#6
2418  003e 81            	ret	
2461                     ; 874 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2461                     ; 875 {
2462                     .text:	section	.text,new
2463  0000               _I2C_ClearITPendingBit:
2465  0000 89            	pushw	x
2466       00000002      OFST:	set	2
2469                     ; 876   uint16_t flagpos = 0;
2471                     ; 882   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2473  0001 01            	rrwa	x,a
2474  0002 5f            	clrw	x
2475  0003 02            	rlwa	x,a
2476  0004 1f01          	ldw	(OFST-1,sp),x
2478                     ; 885   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2480  0006 7b02          	ld	a,(OFST+0,sp)
2481  0008 43            	cpl	a
2482  0009 c75218        	ld	21016,a
2483                     ; 886 }
2486  000c 85            	popw	x
2487  000d 81            	ret	
2500                     	xdef	_I2C_ClearITPendingBit
2501                     	xdef	_I2C_GetITStatus
2502                     	xdef	_I2C_ClearFlag
2503                     	xdef	_I2C_GetFlagStatus
2504                     	xdef	_I2C_GetLastEvent
2505                     	xdef	_I2C_CheckEvent
2506                     	xdef	_I2C_SendData
2507                     	xdef	_I2C_Send7bitAddress
2508                     	xdef	_I2C_ReceiveData
2509                     	xdef	_I2C_ITConfig
2510                     	xdef	_I2C_FastModeDutyCycleConfig
2511                     	xdef	_I2C_AcknowledgeConfig
2512                     	xdef	_I2C_StretchClockCmd
2513                     	xdef	_I2C_SoftwareResetCmd
2514                     	xdef	_I2C_GenerateSTOP
2515                     	xdef	_I2C_GenerateSTART
2516                     	xdef	_I2C_GeneralCallCmd
2517                     	xdef	_I2C_Cmd
2518                     	xdef	_I2C_Init
2519                     	xdef	_I2C_DeInit
2520                     	xref	_assert_failed
2521                     	switch	.const
2522  0008               L361:
2523  0008 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
2524  001a 6965735c7374  	dc.b	"ies\stm8s_stdperip"
2525  002c 685f64726976  	dc.b	"h_driver\src\stm8s"
2526  003e 5f6932632e63  	dc.b	"_i2c.c",0
2527                     	xref.b	c_lreg
2528                     	xref.b	c_x
2548                     	xref	c_sdivx
2549                     	xref	c_ludv
2550                     	xref	c_rtol
2551                     	xref	c_smul
2552                     	xref	c_lmul
2553                     	xref	c_lcmp
2554                     	xref	c_ltor
2555                     	end
