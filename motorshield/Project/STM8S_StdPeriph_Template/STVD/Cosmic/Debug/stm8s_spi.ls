   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  49                     ; 50 void SPI_DeInit(void)
  49                     ; 51 {
  51                     .text:	section	.text,new
  52  0000               _SPI_DeInit:
  56                     ; 52   SPI->CR1    = SPI_CR1_RESET_VALUE;
  58  0000 725f5200      	clr	20992
  59                     ; 53   SPI->CR2    = SPI_CR2_RESET_VALUE;
  61  0004 725f5201      	clr	20993
  62                     ; 54   SPI->ICR    = SPI_ICR_RESET_VALUE;
  64  0008 725f5202      	clr	20994
  65                     ; 55   SPI->SR     = SPI_SR_RESET_VALUE;
  67  000c 35025203      	mov	20995,#2
  68                     ; 56   SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  70  0010 35075205      	mov	20997,#7
  71                     ; 57 }
  74  0014 81            	ret	
 388                     ; 78 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 388                     ; 79 {
 389                     .text:	section	.text,new
 390  0000               _SPI_Init:
 392  0000 89            	pushw	x
 393  0001 88            	push	a
 394       00000001      OFST:	set	1
 397                     ; 91   SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 397                     ; 92                        (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 399  0002 7b07          	ld	a,(OFST+6,sp)
 400  0004 1a08          	or	a,(OFST+7,sp)
 401  0006 6b01          	ld	(OFST+0,sp),a
 403  0008 9f            	ld	a,xl
 404  0009 1a02          	or	a,(OFST+1,sp)
 405  000b 1a01          	or	a,(OFST+0,sp)
 406  000d c75200        	ld	20992,a
 407                     ; 95   SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 409  0010 7b09          	ld	a,(OFST+8,sp)
 410  0012 1a0a          	or	a,(OFST+9,sp)
 411  0014 c75201        	ld	20993,a
 412                     ; 97   if (Mode == SPI_MODE_MASTER)
 414  0017 7b06          	ld	a,(OFST+5,sp)
 415  0019 a104          	cp	a,#4
 416  001b 2606          	jrne	L102
 417                     ; 99     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 419  001d 72105201      	bset	20993,#0
 421  0021 2004          	jra	L302
 422  0023               L102:
 423                     ; 103     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 425  0023 72115201      	bres	20993,#0
 426  0027               L302:
 427                     ; 107   SPI->CR1 |= (uint8_t)(Mode);
 429  0027 c65200        	ld	a,20992
 430  002a 1a06          	or	a,(OFST+5,sp)
 431  002c c75200        	ld	20992,a
 432                     ; 110   SPI->CRCPR = (uint8_t)CRCPolynomial;
 434  002f 7b0b          	ld	a,(OFST+10,sp)
 435  0031 c75205        	ld	20997,a
 436                     ; 111 }
 439  0034 5b03          	addw	sp,#3
 440  0036 81            	ret	
 495                     ; 119 void SPI_Cmd(FunctionalState NewState)
 495                     ; 120 {
 496                     .text:	section	.text,new
 497  0000               _SPI_Cmd:
 501                     ; 124   if (NewState != DISABLE)
 503  0000 4d            	tnz	a
 504  0001 2705          	jreq	L332
 505                     ; 126     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 507  0003 721c5200      	bset	20992,#6
 510  0007 81            	ret	
 511  0008               L332:
 512                     ; 130     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 514  0008 721d5200      	bres	20992,#6
 515                     ; 132 }
 518  000c 81            	ret	
 626                     ; 141 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 626                     ; 142 {
 627                     .text:	section	.text,new
 628  0000               _SPI_ITConfig:
 630  0000 89            	pushw	x
 631  0001 88            	push	a
 632       00000001      OFST:	set	1
 635                     ; 143   uint8_t itpos = 0;
 637                     ; 145   assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 639  0002 9e            	ld	a,xh
 640  0003 a117          	cp	a,#23
 641  0005 2714          	jreq	L02
 642  0007 9e            	ld	a,xh
 643  0008 a106          	cp	a,#6
 644  000a 270f          	jreq	L02
 645  000c 9e            	ld	a,xh
 646  000d a105          	cp	a,#5
 647  000f 270a          	jreq	L02
 648  0011 9e            	ld	a,xh
 649  0012 a134          	cp	a,#52
 650  0014 2705          	jreq	L02
 651  0016 ae0091        	ldw	x,#145
 652  0019 ad32          	call	LC001
 653  001b               L02:
 654                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 656  001b 7b03          	ld	a,(OFST+2,sp)
 657  001d 2708          	jreq	L03
 658  001f 4a            	dec	a
 659  0020 2705          	jreq	L03
 660  0022 ae0092        	ldw	x,#146
 661  0025 ad26          	call	LC001
 662  0027               L03:
 663                     ; 149   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 665  0027 7b02          	ld	a,(OFST+1,sp)
 666  0029 a40f          	and	a,#15
 667  002b 5f            	clrw	x
 668  002c 97            	ld	xl,a
 669  002d a601          	ld	a,#1
 670  002f 5d            	tnzw	x
 671  0030 2704          	jreq	L43
 672  0032               L63:
 673  0032 48            	sll	a
 674  0033 5a            	decw	x
 675  0034 26fc          	jrne	L63
 676  0036               L43:
 677  0036 6b01          	ld	(OFST+0,sp),a
 679                     ; 151   if (NewState != DISABLE)
 681  0038 0d03          	tnz	(OFST+2,sp)
 682  003a 2707          	jreq	L703
 683                     ; 153     SPI->ICR |= itpos; /* Enable interrupt*/
 685  003c c65202        	ld	a,20994
 686  003f 1a01          	or	a,(OFST+0,sp)
 688  0041 2004          	jra	L113
 689  0043               L703:
 690                     ; 157     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 692  0043 43            	cpl	a
 693  0044 c45202        	and	a,20994
 694  0047               L113:
 695  0047 c75202        	ld	20994,a
 696                     ; 159 }
 699  004a 5b03          	addw	sp,#3
 700  004c 81            	ret	
 701  004d               LC001:
 702  004d 89            	pushw	x
 703  004e 5f            	clrw	x
 704  004f 89            	pushw	x
 705  0050 ae0000        	ldw	x,#L503
 706  0053 cd0000        	call	_assert_failed
 708  0056 5b04          	addw	sp,#4
 709  0058 81            	ret	
 741                     ; 166 void SPI_SendData(uint8_t Data)
 741                     ; 167 {
 742                     .text:	section	.text,new
 743  0000               _SPI_SendData:
 747                     ; 168   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 749  0000 c75204        	ld	20996,a
 750                     ; 169 }
 753  0003 81            	ret	
 776                     ; 176 uint8_t SPI_ReceiveData(void)
 776                     ; 177 {
 777                     .text:	section	.text,new
 778  0000               _SPI_ReceiveData:
 782                     ; 178   return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 784  0000 c65204        	ld	a,20996
 787  0003 81            	ret	
 824                     ; 187 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 824                     ; 188 {
 825                     .text:	section	.text,new
 826  0000               _SPI_NSSInternalSoftwareCmd:
 828  0000 88            	push	a
 829       00000000      OFST:	set	0
 832                     ; 190   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 834  0001 4d            	tnz	a
 835  0002 2711          	jreq	L25
 836  0004 4a            	dec	a
 837  0005 270e          	jreq	L25
 838  0007 ae00be        	ldw	x,#190
 839  000a 89            	pushw	x
 840  000b 5f            	clrw	x
 841  000c 89            	pushw	x
 842  000d ae0000        	ldw	x,#L503
 843  0010 cd0000        	call	_assert_failed
 845  0013 5b04          	addw	sp,#4
 846  0015               L25:
 847                     ; 192   if (NewState != DISABLE)
 849  0015 7b01          	ld	a,(OFST+1,sp)
 850  0017 2706          	jreq	L553
 851                     ; 194     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 853  0019 72105201      	bset	20993,#0
 855  001d 2004          	jra	L753
 856  001f               L553:
 857                     ; 198     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 859  001f 72115201      	bres	20993,#0
 860  0023               L753:
 861                     ; 200 }
 864  0023 84            	pop	a
 865  0024 81            	ret	
 888                     ; 207 void SPI_TransmitCRC(void)
 888                     ; 208 {
 889                     .text:	section	.text,new
 890  0000               _SPI_TransmitCRC:
 894                     ; 209   SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 896  0000 72185201      	bset	20993,#4
 897                     ; 210 }
 900  0004 81            	ret	
 937                     ; 218 void SPI_CalculateCRCCmd(FunctionalState NewState)
 937                     ; 219 {
 938                     .text:	section	.text,new
 939  0000               _SPI_CalculateCRCCmd:
 941  0000 88            	push	a
 942       00000000      OFST:	set	0
 945                     ; 221   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 947  0001 4d            	tnz	a
 948  0002 2711          	jreq	L66
 949  0004 4a            	dec	a
 950  0005 270e          	jreq	L66
 951  0007 ae00dd        	ldw	x,#221
 952  000a 89            	pushw	x
 953  000b 5f            	clrw	x
 954  000c 89            	pushw	x
 955  000d ae0000        	ldw	x,#L503
 956  0010 cd0000        	call	_assert_failed
 958  0013 5b04          	addw	sp,#4
 959  0015               L66:
 960                     ; 223   if (NewState != DISABLE)
 962  0015 7b01          	ld	a,(OFST+1,sp)
 963  0017 2706          	jreq	L704
 964                     ; 225     SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
 966  0019 721a5201      	bset	20993,#5
 968  001d 2004          	jra	L114
 969  001f               L704:
 970                     ; 229     SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
 972  001f 721b5201      	bres	20993,#5
 973  0023               L114:
 974                     ; 231 }
 977  0023 84            	pop	a
 978  0024 81            	ret	
1041                     ; 238 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
1041                     ; 239 {
1042                     .text:	section	.text,new
1043  0000               _SPI_GetCRC:
1045  0000 88            	push	a
1046  0001 88            	push	a
1047       00000001      OFST:	set	1
1050                     ; 240   uint8_t crcreg = 0;
1052                     ; 243   assert_param(IS_SPI_CRC_OK(SPI_CRC));
1054  0002 a101          	cp	a,#1
1055  0004 2711          	jreq	L001
1056  0006 4d            	tnz	a
1057  0007 270e          	jreq	L001
1058  0009 ae00f3        	ldw	x,#243
1059  000c 89            	pushw	x
1060  000d 5f            	clrw	x
1061  000e 89            	pushw	x
1062  000f ae0000        	ldw	x,#L503
1063  0012 cd0000        	call	_assert_failed
1065  0015 5b04          	addw	sp,#4
1066  0017               L001:
1067                     ; 245   if (SPI_CRC != SPI_CRC_RX)
1069  0017 7b02          	ld	a,(OFST+1,sp)
1070  0019 2705          	jreq	L344
1071                     ; 247     crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1073  001b c65207        	ld	a,20999
1076  001e 2003          	jra	L544
1077  0020               L344:
1078                     ; 251     crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1080  0020 c65206        	ld	a,20998
1082  0023               L544:
1083                     ; 255   return crcreg;
1087  0023 85            	popw	x
1088  0024 81            	ret	
1113                     ; 263 void SPI_ResetCRC(void)
1113                     ; 264 {
1114                     .text:	section	.text,new
1115  0000               _SPI_ResetCRC:
1119                     ; 267   SPI_CalculateCRCCmd(ENABLE);
1121  0000 a601          	ld	a,#1
1122  0002 cd0000        	call	_SPI_CalculateCRCCmd
1124                     ; 270   SPI_Cmd(ENABLE);
1126  0005 a601          	ld	a,#1
1128                     ; 271 }
1131  0007 cc0000        	jp	_SPI_Cmd
1155                     ; 278 uint8_t SPI_GetCRCPolynomial(void)
1155                     ; 279 {
1156                     .text:	section	.text,new
1157  0000               _SPI_GetCRCPolynomial:
1161                     ; 280   return SPI->CRCPR; /* Return the CRC polynomial register */
1163  0000 c65205        	ld	a,20997
1166  0003 81            	ret	
1223                     ; 288 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1223                     ; 289 {
1224                     .text:	section	.text,new
1225  0000               _SPI_BiDirectionalLineConfig:
1227  0000 88            	push	a
1228       00000000      OFST:	set	0
1231                     ; 291   assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1233  0001 4d            	tnz	a
1234  0002 2711          	jreq	L221
1235  0004 4a            	dec	a
1236  0005 270e          	jreq	L221
1237  0007 ae0123        	ldw	x,#291
1238  000a 89            	pushw	x
1239  000b 5f            	clrw	x
1240  000c 89            	pushw	x
1241  000d ae0000        	ldw	x,#L503
1242  0010 cd0000        	call	_assert_failed
1244  0013 5b04          	addw	sp,#4
1245  0015               L221:
1246                     ; 293   if (SPI_Direction != SPI_DIRECTION_RX)
1248  0015 7b01          	ld	a,(OFST+1,sp)
1249  0017 2706          	jreq	L515
1250                     ; 295     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1252  0019 721c5201      	bset	20993,#6
1254  001d 2004          	jra	L715
1255  001f               L515:
1256                     ; 299     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1258  001f 721d5201      	bres	20993,#6
1259  0023               L715:
1260                     ; 301 }
1263  0023 84            	pop	a
1264  0024 81            	ret	
1385                     ; 311 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1385                     ; 312 {
1386                     .text:	section	.text,new
1387  0000               _SPI_GetFlagStatus:
1389  0000 88            	push	a
1390       00000001      OFST:	set	1
1393                     ; 313   FlagStatus status = RESET;
1395                     ; 318   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1397  0001 c45203        	and	a,20995
1398  0004 2702          	jreq	L575
1399                     ; 320     status = SET; /* SPI_FLAG is set */
1401  0006 a601          	ld	a,#1
1404  0008               L575:
1405                     ; 324     status = RESET; /* SPI_FLAG is reset*/
1408                     ; 328   return status;
1412  0008 5b01          	addw	sp,#1
1413  000a 81            	ret	
1449                     ; 346 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1449                     ; 347 {
1450                     .text:	section	.text,new
1451  0000               _SPI_ClearFlag:
1453  0000 88            	push	a
1454       00000000      OFST:	set	0
1457                     ; 348   assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1459  0001 a110          	cp	a,#16
1460  0003 2712          	jreq	L631
1461  0005 a108          	cp	a,#8
1462  0007 270e          	jreq	L631
1463  0009 ae015c        	ldw	x,#348
1464  000c 89            	pushw	x
1465  000d 5f            	clrw	x
1466  000e 89            	pushw	x
1467  000f ae0000        	ldw	x,#L503
1468  0012 cd0000        	call	_assert_failed
1470  0015 5b04          	addw	sp,#4
1471  0017               L631:
1472                     ; 350   SPI->SR = (uint8_t)(~SPI_FLAG);
1474  0017 7b01          	ld	a,(OFST+1,sp)
1475  0019 43            	cpl	a
1476  001a c75203        	ld	20995,a
1477                     ; 351 }
1480  001d 84            	pop	a
1481  001e 81            	ret	
1556                     ; 366 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1556                     ; 367 {
1557                     .text:	section	.text,new
1558  0000               _SPI_GetITStatus:
1560  0000 88            	push	a
1561  0001 89            	pushw	x
1562       00000002      OFST:	set	2
1565                     ; 368   ITStatus pendingbitstatus = RESET;
1567                     ; 369   uint8_t itpos = 0;
1569                     ; 370   uint8_t itmask1 = 0;
1571                     ; 371   uint8_t itmask2 = 0;
1573                     ; 372   uint8_t enablestatus = 0;
1575                     ; 373   assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1577  0002 a165          	cp	a,#101
1578  0004 2722          	jreq	L051
1579  0006 a155          	cp	a,#85
1580  0008 271e          	jreq	L051
1581  000a a145          	cp	a,#69
1582  000c 271a          	jreq	L051
1583  000e a134          	cp	a,#52
1584  0010 2716          	jreq	L051
1585  0012 a117          	cp	a,#23
1586  0014 2712          	jreq	L051
1587  0016 a106          	cp	a,#6
1588  0018 270e          	jreq	L051
1589  001a ae0175        	ldw	x,#373
1590  001d 89            	pushw	x
1591  001e 5f            	clrw	x
1592  001f 89            	pushw	x
1593  0020 ae0000        	ldw	x,#L503
1594  0023 cd0000        	call	_assert_failed
1596  0026 5b04          	addw	sp,#4
1597  0028               L051:
1598                     ; 375   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1600  0028 7b03          	ld	a,(OFST+1,sp)
1601  002a a40f          	and	a,#15
1602  002c 5f            	clrw	x
1603  002d 97            	ld	xl,a
1604  002e a601          	ld	a,#1
1605  0030 5d            	tnzw	x
1606  0031 2704          	jreq	L451
1607  0033               L651:
1608  0033 48            	sll	a
1609  0034 5a            	decw	x
1610  0035 26fc          	jrne	L651
1611  0037               L451:
1612  0037 6b01          	ld	(OFST-1,sp),a
1614                     ; 378   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1616  0039 7b03          	ld	a,(OFST+1,sp)
1617  003b 4e            	swap	a
1618  003c a40f          	and	a,#15
1619  003e 6b02          	ld	(OFST+0,sp),a
1621                     ; 380   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1623  0040 5f            	clrw	x
1624  0041 97            	ld	xl,a
1625  0042 a601          	ld	a,#1
1626  0044 5d            	tnzw	x
1627  0045 2704          	jreq	L061
1628  0047               L261:
1629  0047 48            	sll	a
1630  0048 5a            	decw	x
1631  0049 26fc          	jrne	L261
1632  004b               L061:
1634                     ; 382   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1636  004b c45203        	and	a,20995
1637  004e 6b02          	ld	(OFST+0,sp),a
1639                     ; 384   if (((SPI->ICR & itpos) != RESET) && enablestatus)
1641  0050 c65202        	ld	a,20994
1642  0053 1501          	bcp	a,(OFST-1,sp)
1643  0055 2708          	jreq	L156
1645  0057 7b02          	ld	a,(OFST+0,sp)
1646  0059 2704          	jreq	L156
1647                     ; 387     pendingbitstatus = SET;
1649  005b a601          	ld	a,#1
1652  005d 2001          	jra	L356
1653  005f               L156:
1654                     ; 392     pendingbitstatus = RESET;
1656  005f 4f            	clr	a
1658  0060               L356:
1659                     ; 395   return  pendingbitstatus;
1663  0060 5b03          	addw	sp,#3
1664  0062 81            	ret	
1708                     ; 412 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1708                     ; 413 {
1709                     .text:	section	.text,new
1710  0000               _SPI_ClearITPendingBit:
1712  0000 88            	push	a
1713  0001 88            	push	a
1714       00000001      OFST:	set	1
1717                     ; 414   uint8_t itpos = 0;
1719                     ; 415   assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
1721  0002 a145          	cp	a,#69
1722  0004 2712          	jreq	L271
1723  0006 a134          	cp	a,#52
1724  0008 270e          	jreq	L271
1725  000a ae019f        	ldw	x,#415
1726  000d 89            	pushw	x
1727  000e 5f            	clrw	x
1728  000f 89            	pushw	x
1729  0010 ae0000        	ldw	x,#L503
1730  0013 cd0000        	call	_assert_failed
1732  0016 5b04          	addw	sp,#4
1733  0018               L271:
1734                     ; 420   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
1736  0018 7b02          	ld	a,(OFST+1,sp)
1737  001a 4e            	swap	a
1738  001b a40f          	and	a,#15
1739  001d 5f            	clrw	x
1740  001e 97            	ld	xl,a
1741  001f a601          	ld	a,#1
1742  0021 5d            	tnzw	x
1743  0022 2704          	jreq	L671
1744  0024               L002:
1745  0024 48            	sll	a
1746  0025 5a            	decw	x
1747  0026 26fc          	jrne	L002
1748  0028               L671:
1750                     ; 422   SPI->SR = (uint8_t)(~itpos);
1752  0028 43            	cpl	a
1753  0029 c75203        	ld	20995,a
1754                     ; 424 }
1757  002c 85            	popw	x
1758  002d 81            	ret	
1771                     	xdef	_SPI_ClearITPendingBit
1772                     	xdef	_SPI_GetITStatus
1773                     	xdef	_SPI_ClearFlag
1774                     	xdef	_SPI_GetFlagStatus
1775                     	xdef	_SPI_BiDirectionalLineConfig
1776                     	xdef	_SPI_GetCRCPolynomial
1777                     	xdef	_SPI_ResetCRC
1778                     	xdef	_SPI_GetCRC
1779                     	xdef	_SPI_CalculateCRCCmd
1780                     	xdef	_SPI_TransmitCRC
1781                     	xdef	_SPI_NSSInternalSoftwareCmd
1782                     	xdef	_SPI_ReceiveData
1783                     	xdef	_SPI_SendData
1784                     	xdef	_SPI_ITConfig
1785                     	xdef	_SPI_Cmd
1786                     	xdef	_SPI_Init
1787                     	xdef	_SPI_DeInit
1788                     	xref	_assert_failed
1789                     .const:	section	.text
1790  0000               L503:
1791  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
1792  0012 6965735c7374  	dc.b	"ies\stm8s_stdperip"
1793  0024 685f64726976  	dc.b	"h_driver\src\stm8s"
1794  0036 5f7370692e63  	dc.b	"_spi.c",0
1814                     	end
