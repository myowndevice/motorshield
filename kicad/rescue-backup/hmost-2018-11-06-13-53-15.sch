EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:stm8
LIBS:hmost-cache
EELAYER 25 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	10700 2350 11300 2350
Text Label 10700 2350 0    60   ~ 0
M1_HL
Wire Wire Line
	15050 2250 15800 2250
$Comp
L 2N7002 Q23
U 1 1 584C1880
P 14850 2250
F 0 "Q23" H 15150 2300 50  0000 R CNN
F 1 "2n7002" H 15450 2200 50  0000 R CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 15050 2350 50  0000 C CNN
F 3 "" H 14850 2250 50  0000 C CNN
	1    14850 2250
	-1   0    0    -1  
$EndComp
$Comp
L 2N7002 Q13
U 1 1 584C17E1
P 11500 2350
F 0 "Q13" H 11800 2400 50  0000 R CNN
F 1 "2n7002" H 12100 2300 50  0000 R CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 11700 2450 50  0000 C CNN
F 3 "" H 11500 2350 50  0000 C CNN
	1    11500 2350
	1    0    0    -1  
$EndComp
Connection ~ 11700 2050
Text Label 11400 3500 0    60   ~ 0
M1_NL
Wire Wire Line
	11400 3500 11750 3500
Text Label 14850 3500 2    60   ~ 0
M1_NR
Wire Wire Line
	14300 3500 14850 3500
Connection ~ 13500 3850
Wire Wire Line
	13500 3850 13500 3950
Wire Wire Line
	13700 3850 13700 3700
Wire Wire Line
	12350 3850 13700 3850
Wire Wire Line
	12350 3700 12350 3850
Connection ~ 13700 1750
Wire Wire Line
	14300 1950 14300 2050
$Comp
L R_Small R37
U 1 1 584C0569
P 14300 1850
F 0 "R37" H 14330 1870 50  0000 L CNN
F 1 "200" H 14330 1810 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 14300 1850 50  0000 C CNN
F 3 "" H 14300 1850 50  0000 C CNN
	1    14300 1850
	-1   0    0    1   
$EndComp
Connection ~ 12350 1750
$Comp
L R_Small R24
U 1 1 584BF188
P 11700 1850
F 0 "R24" H 11730 1870 50  0000 L CNN
F 1 "200" H 11730 1810 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 11700 1850 50  0000 C CNN
F 3 "" H 11700 1850 50  0000 C CNN
	1    11700 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	13700 1750 13700 1850
Wire Wire Line
	11700 1750 14300 1750
Wire Wire Line
	12350 1850 12350 1750
Wire Wire Line
	11950 3500 12050 3500
Wire Wire Line
	14000 3500 14100 3500
$Comp
L R_Small R28
U 1 1 584BE115
P 11850 3500
F 0 "R28" H 11880 3520 50  0000 L CNN
F 1 "100" H 11880 3460 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 11850 3500 50  0000 C CNN
F 3 "" H 11850 3500 50  0000 C CNN
	1    11850 3500
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R34
U 1 1 584BDD0D
P 14200 3500
F 0 "R34" H 14230 3520 50  0000 L CNN
F 1 "100" H 14230 3460 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 14200 3500 50  0000 C CNN
F 3 "" H 14200 3500 50  0000 C CNN
	1    14200 3500
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R33
U 1 1 584BDC4F
P 14200 2050
F 0 "R33" H 14230 2070 50  0000 L CNN
F 1 "100" H 14230 2010 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 14200 2050 50  0000 C CNN
F 3 "" H 14200 2050 50  0000 C CNN
	1    14200 2050
	0    1    1    0   
$EndComp
$Comp
L R_Small R26
U 1 1 584BD8F5
P 11800 2050
F 0 "R26" H 11830 2070 50  0000 L CNN
F 1 "100" H 11830 2010 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 11800 2050 50  0000 C CNN
F 3 "" H 11800 2050 50  0000 C CNN
	1    11800 2050
	0    1    1    0   
$EndComp
Connection ~ 12350 2750
Wire Wire Line
	12350 2750 13000 2750
Connection ~ 13700 2750
Wire Wire Line
	13100 2750 13700 2750
Wire Wire Line
	13700 2250 13700 3300
Wire Wire Line
	12350 2250 12350 3300
$Comp
L BSS83P Q15
U 1 1 584BD24D
P 12250 2050
F 0 "Q15" H 12550 2100 50  0000 R CNN
F 1 "IRLML6402TRPbF" H 12850 2000 50  0000 R CNN
F 2 "myowndevice:SOT-23_mod" H 12450 2150 50  0000 C CNN
F 3 "" H 12250 2050 50  0000 C CNN
	1    12250 2050
	1    0    0    1   
$EndComp
$Comp
L 2N7002 Q20
U 1 1 584BD0AD
P 13800 3500
F 0 "Q20" H 14100 3550 50  0000 R CNN
F 1 "IRLML6244TRPbF" H 14400 3450 50  0000 R CNN
F 2 "myowndevice:SOT-23_mod" H 14000 3600 50  0000 C CNN
F 3 "" H 13800 3500 50  0000 C CNN
	1    13800 3500
	-1   0    0    -1  
$EndComp
$Comp
L BSS83P Q19
U 1 1 584BC617
P 13800 2050
F 0 "Q19" H 14100 2100 50  0000 R CNN
F 1 "IRLML6402TRPbF" H 14400 2000 50  0000 R CNN
F 2 "myowndevice:SOT-23_mod" H 14000 2150 50  0000 C CNN
F 3 "" H 13800 2050 50  0000 C CNN
	1    13800 2050
	-1   0    0    1   
$EndComp
$Comp
L 2N7002 Q16
U 1 1 584BC5EA
P 12250 3500
F 0 "Q16" H 12550 3550 50  0000 R CNN
F 1 "IRLML6244TRPbF" H 12850 3450 50  0000 R CNN
F 2 "myowndevice:SOT-23_mod" H 12450 3600 50  0000 C CNN
F 3 "" H 12250 3500 50  0000 C CNN
	1    12250 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 2450 1750 2450
Text Label 1150 2450 0    60   ~ 0
M2_HL
Wire Wire Line
	5500 2350 6250 2350
$Comp
L 2N7002 Q11
U 1 1 584D14BF
P 5300 2350
F 0 "Q11" H 5600 2400 50  0000 R CNN
F 1 "2n7002" H 5900 2300 50  0000 R CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 5500 2450 50  0001 C CNN
F 3 "" H 5300 2350 50  0000 C CNN
	1    5300 2350
	-1   0    0    -1  
$EndComp
Text Label 1850 3600 0    60   ~ 0
M2_NL
Wire Wire Line
	1850 3600 2200 3600
Text Label 5300 3600 2    60   ~ 0
M2_NR
Wire Wire Line
	4750 3600 5300 3600
Connection ~ 3950 3950
Wire Wire Line
	3950 3950 3950 4050
Wire Wire Line
	4150 3950 4150 3800
Wire Wire Line
	2800 3950 4150 3950
Wire Wire Line
	2800 3800 2800 3950
Connection ~ 4150 1850
$Comp
L R_Small R17
U 1 1 584D14DA
P 4450 1850
F 0 "R17" H 4480 1870 50  0000 L CNN
F 1 "200" H 4480 1810 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 4450 1850 50  0001 C CNN
F 3 "" H 4450 1850 50  0000 C CNN
	1    4450 1850
	0    -1   -1   0   
$EndComp
Connection ~ 2800 1850
$Comp
L R_Small R3
U 1 1 584D14E1
P 2450 1850
F 0 "R3" H 2480 1870 50  0000 L CNN
F 1 "200" H 2480 1810 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 2450 1850 50  0001 C CNN
F 3 "" H 2450 1850 50  0000 C CNN
	1    2450 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	4150 1850 4150 1950
Wire Wire Line
	2800 1850 2800 1950
Wire Wire Line
	2400 3600 2500 3600
Wire Wire Line
	4450 3600 4550 3600
$Comp
L R_Small R7
U 1 1 584D14F2
P 2300 3600
F 0 "R7" H 2330 3620 50  0000 L CNN
F 1 "100" H 2330 3560 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 2300 3600 50  0001 C CNN
F 3 "" H 2300 3600 50  0000 C CNN
	1    2300 3600
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R14
U 1 1 584D14F8
P 4650 3600
F 0 "R14" H 4680 3620 50  0000 L CNN
F 1 "100" H 4680 3560 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 4650 3600 50  0001 C CNN
F 3 "" H 4650 3600 50  0000 C CNN
	1    4650 3600
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R13
U 1 1 584D14FE
P 5200 1950
F 0 "R13" H 5230 1970 50  0000 L CNN
F 1 "100" H 5230 1910 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 5200 1950 50  0001 C CNN
F 3 "" H 5200 1950 50  0000 C CNN
	1    5200 1950
	-1   0    0    1   
$EndComp
$Comp
L R_Small R5
U 1 1 584D1504
P 2050 2050
F 0 "R5" H 2080 2070 50  0000 L CNN
F 1 "100" H 2080 2010 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 2050 2050 50  0001 C CNN
F 3 "" H 2050 2050 50  0000 C CNN
	1    2050 2050
	-1   0    0    1   
$EndComp
Connection ~ 2800 2850
Wire Wire Line
	2800 2850 3450 2850
Connection ~ 4150 2850
Wire Wire Line
	3550 2850 4150 2850
Wire Wire Line
	4150 2350 4150 3400
Wire Wire Line
	2800 2350 2800 3400
$Comp
L BSS83P Q3
U 1 1 584D1512
P 2700 2150
F 0 "Q3" H 3000 2200 50  0000 R CNN
F 1 "IRLML6402TRPbF" H 3300 2100 50  0000 R CNN
F 2 "myowndevice:SOT-23_mod" H 2900 2250 50  0001 C CNN
F 3 "" H 2700 2150 50  0000 C CNN
	1    2700 2150
	1    0    0    1   
$EndComp
$Comp
L 2N7002 Q8
U 1 1 584D1518
P 4250 3600
F 0 "Q8" H 4550 3650 50  0000 R CNN
F 1 "IRLML6244TRPbF" H 4950 3350 50  0000 R CNN
F 2 "myowndevice:SOT-23_mod" H 4450 3700 50  0001 C CNN
F 3 "" H 4250 3600 50  0000 C CNN
	1    4250 3600
	-1   0    0    -1  
$EndComp
$Comp
L BSS83P Q7
U 1 1 584D151E
P 4250 2150
F 0 "Q7" H 4550 2200 50  0000 R CNN
F 1 "IRLML6402TRPbF" H 4850 2100 50  0000 R CNN
F 2 "myowndevice:SOT-23_mod" H 4450 2250 50  0001 C CNN
F 3 "" H 4250 2150 50  0000 C CNN
	1    4250 2150
	-1   0    0    1   
$EndComp
$Comp
L 2N7002 Q4
U 1 1 584D1524
P 2700 3600
F 0 "Q4" H 3000 3650 50  0000 R CNN
F 1 "IRLML6244TRPbF" H 3450 3400 50  0000 R CNN
F 2 "myowndevice:SOT-23_mod" H 2900 3700 50  0001 C CNN
F 3 "" H 2700 3600 50  0000 C CNN
	1    2700 3600
	1    0    0    -1  
$EndComp
Text Label 15800 2250 2    60   ~ 0
M1_HR
Text Label 6250 2350 2    60   ~ 0
M2_HR
Wire Wire Line
	1300 8950 1900 8950
Wire Wire Line
	5650 8850 6400 8850
$Comp
L 2N7002 Q12
U 1 1 584D8D9D
P 5450 8850
F 0 "Q12" H 5750 8900 50  0000 R CNN
F 1 "2n7002" H 6050 8800 50  0000 R CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 5650 8950 50  0001 C CNN
F 3 "" H 5450 8850 50  0000 C CNN
	1    5450 8850
	-1   0    0    -1  
$EndComp
$Comp
L 2N7002 Q2
U 1 1 584D8DA4
P 2100 8950
F 0 "Q2" H 2400 9000 50  0000 R CNN
F 1 "2n7002" H 2700 8900 50  0000 R CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 2300 9050 50  0000 C CNN
F 3 "" H 2100 8950 50  0000 C CNN
	1    2100 8950
	1    0    0    -1  
$EndComp
Connection ~ 2300 8650
Text Label 2000 10100 0    60   ~ 0
M3_NL
Wire Wire Line
	2000 10100 2350 10100
Text Label 5450 10100 2    60   ~ 0
M3_NR
Wire Wire Line
	4900 10100 5450 10100
Connection ~ 4100 10450
Wire Wire Line
	4100 10450 4100 10550
Wire Wire Line
	4300 10450 4300 10300
Wire Wire Line
	2950 10450 4300 10450
Wire Wire Line
	2950 10300 2950 10450
Connection ~ 4300 8350
Wire Wire Line
	4900 8550 4900 8650
$Comp
L R_Small R18
U 1 1 584D8DB8
P 4900 8450
F 0 "R18" H 4930 8470 50  0000 L CNN
F 1 "200" H 4930 8410 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 4900 8450 50  0001 C CNN
F 3 "" H 4900 8450 50  0000 C CNN
	1    4900 8450
	-1   0    0    1   
$EndComp
Connection ~ 2950 8350
$Comp
L R_Small R4
U 1 1 584D8DBF
P 2300 8450
F 0 "R4" H 2330 8470 50  0000 L CNN
F 1 "200" H 2330 8410 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 2300 8450 50  0001 C CNN
F 3 "" H 2300 8450 50  0000 C CNN
	1    2300 8450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 8350 4300 8450
Wire Wire Line
	2300 8350 4900 8350
Wire Wire Line
	2950 8450 2950 8350
Wire Wire Line
	2550 10100 2650 10100
Wire Wire Line
	4600 10100 4700 10100
$Comp
L R_Small R8
U 1 1 584D8DD0
P 2450 10100
F 0 "R8" H 2480 10120 50  0000 L CNN
F 1 "100" H 2480 10060 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 2450 10100 50  0001 C CNN
F 3 "" H 2450 10100 50  0000 C CNN
	1    2450 10100
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R16
U 1 1 584D8DD6
P 4800 10100
F 0 "R16" H 4830 10120 50  0000 L CNN
F 1 "100" H 4830 10060 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 4800 10100 50  0001 C CNN
F 3 "" H 4800 10100 50  0000 C CNN
	1    4800 10100
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R15
U 1 1 584D8DDC
P 4800 8650
F 0 "R15" H 4830 8670 50  0000 L CNN
F 1 "100" H 4830 8610 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 4800 8650 50  0001 C CNN
F 3 "" H 4800 8650 50  0000 C CNN
	1    4800 8650
	0    1    1    0   
$EndComp
$Comp
L R_Small R6
U 1 1 584D8DE2
P 2400 8650
F 0 "R6" H 2430 8670 50  0000 L CNN
F 1 "100" H 2430 8610 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 2400 8650 50  0001 C CNN
F 3 "" H 2400 8650 50  0000 C CNN
	1    2400 8650
	0    1    1    0   
$EndComp
Connection ~ 2950 9350
Wire Wire Line
	2950 9350 3600 9350
Connection ~ 4300 9350
Wire Wire Line
	3700 9350 4300 9350
Wire Wire Line
	4300 8850 4300 9900
Wire Wire Line
	2950 8850 2950 9900
$Comp
L BSS83P Q5
U 1 1 584D8DF0
P 2850 8650
F 0 "Q5" H 3150 8700 50  0000 R CNN
F 1 "IRLML6402TRPbF" H 3450 8600 50  0000 R CNN
F 2 "myowndevice:SOT-23_mod" H 3050 8750 50  0001 C CNN
F 3 "" H 2850 8650 50  0000 C CNN
	1    2850 8650
	1    0    0    1   
$EndComp
$Comp
L Q_NPN_BEC Q10
U 1 1 584D8DF6
P 4400 10100
F 0 "Q10" H 4700 10150 50  0000 R CNN
F 1 "IRLML6244TRPbF" H 5000 10050 50  0000 R CNN
F 2 "myowndevice:SOT-23_mod" H 4600 10200 50  0000 C CNN
F 3 "" H 4400 10100 50  0000 C CNN
	1    4400 10100
	-1   0    0    -1  
$EndComp
$Comp
L BSS83P Q9
U 1 1 584D8DFC
P 4400 8650
F 0 "Q9" H 4700 8700 50  0000 R CNN
F 1 "IRLML6402TRPbF" H 5000 8600 50  0000 R CNN
F 2 "myowndevice:SOT-23_mod" H 4600 8750 50  0001 C CNN
F 3 "" H 4400 8650 50  0000 C CNN
	1    4400 8650
	-1   0    0    1   
$EndComp
$Comp
L Q_NPN_BEC Q6
U 1 1 584D8E02
P 2850 10100
F 0 "Q6" H 3150 10150 50  0000 R CNN
F 1 "IRLML6244TRPbF" H 3450 10050 50  0000 R CNN
F 2 "myowndevice:SOT-23_mod" H 3050 10200 50  0000 C CNN
F 3 "" H 2850 10100 50  0000 C CNN
	1    2850 10100
	1    0    0    -1  
$EndComp
Text Label 6400 8850 2    60   ~ 0
M3_HR
Text Label 1300 8950 0    60   ~ 0
M3_HL
Wire Wire Line
	10700 7250 11300 7250
Wire Wire Line
	15050 7150 15800 7150
$Comp
L 2N7002 Q24
U 1 1 584DEFED
P 14850 7150
F 0 "Q24" H 15150 7200 50  0000 R CNN
F 1 "2n7002" H 15450 7100 50  0000 R CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 15050 7250 50  0000 C CNN
F 3 "" H 14850 7150 50  0000 C CNN
	1    14850 7150
	-1   0    0    -1  
$EndComp
$Comp
L 2N7002 Q14
U 1 1 584DEFF4
P 11500 7250
F 0 "Q14" H 11800 7300 50  0000 R CNN
F 1 "2n7002" H 12100 7200 50  0000 R CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 11700 7350 50  0000 C CNN
F 3 "" H 11500 7250 50  0000 C CNN
	1    11500 7250
	1    0    0    -1  
$EndComp
Connection ~ 11700 6950
Text Label 11400 8400 0    60   ~ 0
M4_NL
Wire Wire Line
	11400 8400 11750 8400
Text Label 14850 8400 2    60   ~ 0
M4_NR
Wire Wire Line
	14300 8400 14850 8400
Connection ~ 13500 8750
Wire Wire Line
	13500 8750 13500 8850
Wire Wire Line
	13700 8750 13700 8600
Wire Wire Line
	12350 8750 13700 8750
Wire Wire Line
	12350 8600 12350 8750
Connection ~ 13700 6650
Wire Wire Line
	14300 6850 14300 6950
$Comp
L R_Small R38
U 1 1 584DF008
P 14300 6750
F 0 "R38" H 14330 6770 50  0000 L CNN
F 1 "200" H 14330 6710 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 14300 6750 50  0000 C CNN
F 3 "" H 14300 6750 50  0000 C CNN
	1    14300 6750
	-1   0    0    1   
$EndComp
Connection ~ 12350 6650
$Comp
L R_Small R25
U 1 1 584DF00F
P 11700 6750
F 0 "R25" H 11730 6770 50  0000 L CNN
F 1 "200" H 11730 6710 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 11700 6750 50  0000 C CNN
F 3 "" H 11700 6750 50  0000 C CNN
	1    11700 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	13700 6650 13700 6750
Wire Wire Line
	11700 6650 14300 6650
Wire Wire Line
	12350 6750 12350 6650
Wire Wire Line
	11950 8400 12050 8400
Wire Wire Line
	14000 8400 14100 8400
$Comp
L R_Small R29
U 1 1 584DF020
P 11850 8400
F 0 "R29" H 11880 8420 50  0000 L CNN
F 1 "100" H 11880 8360 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 11850 8400 50  0000 C CNN
F 3 "" H 11850 8400 50  0000 C CNN
	1    11850 8400
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R36
U 1 1 584DF026
P 14200 8400
F 0 "R36" H 14230 8420 50  0000 L CNN
F 1 "100" H 14230 8360 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 14200 8400 50  0000 C CNN
F 3 "" H 14200 8400 50  0000 C CNN
	1    14200 8400
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R35
U 1 1 584DF02C
P 14200 6950
F 0 "R35" H 14230 6970 50  0000 L CNN
F 1 "100" H 14230 6910 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 14200 6950 50  0000 C CNN
F 3 "" H 14200 6950 50  0000 C CNN
	1    14200 6950
	0    1    1    0   
$EndComp
$Comp
L R_Small R27
U 1 1 584DF032
P 11800 6950
F 0 "R27" H 11830 6970 50  0000 L CNN
F 1 "100" H 11830 6910 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 11800 6950 50  0000 C CNN
F 3 "" H 11800 6950 50  0000 C CNN
	1    11800 6950
	0    1    1    0   
$EndComp
Connection ~ 12350 7650
Wire Wire Line
	12350 7650 13000 7650
Connection ~ 13700 7650
Wire Wire Line
	13100 7650 13700 7650
Wire Wire Line
	13700 7150 13700 8200
Wire Wire Line
	12350 7150 12350 8200
$Comp
L BSS83P Q17
U 1 1 584DF040
P 12250 6950
F 0 "Q17" H 12550 7000 50  0000 R CNN
F 1 "IRLML6402TRPbF" H 12850 6900 50  0000 R CNN
F 2 "myowndevice:SOT-23_mod" H 12450 7050 50  0000 C CNN
F 3 "" H 12250 6950 50  0000 C CNN
	1    12250 6950
	1    0    0    1   
$EndComp
$Comp
L 2N7002 Q22
U 1 1 584DF046
P 13800 8400
F 0 "Q22" H 14100 8450 50  0000 R CNN
F 1 "IRLML6244TRPbF" H 14400 8350 50  0000 R CNN
F 2 "myowndevice:SOT-23_mod" H 14000 8500 50  0000 C CNN
F 3 "" H 13800 8400 50  0000 C CNN
	1    13800 8400
	-1   0    0    -1  
$EndComp
$Comp
L BSS83P Q21
U 1 1 584DF04C
P 13800 6950
F 0 "Q21" H 14100 7000 50  0000 R CNN
F 1 "IRLML6402TRPbF" H 14400 6900 50  0000 R CNN
F 2 "myowndevice:SOT-23_mod" H 14000 7050 50  0000 C CNN
F 3 "" H 13800 6950 50  0000 C CNN
	1    13800 6950
	-1   0    0    1   
$EndComp
$Comp
L 2N7002 Q18
U 1 1 584DF052
P 12250 8400
F 0 "Q18" H 12550 8450 50  0000 R CNN
F 1 "IRLML6244TRPbF" H 12850 8350 50  0000 R CNN
F 2 "myowndevice:SOT-23_mod" H 12450 8500 50  0000 C CNN
F 3 "" H 12250 8400 50  0000 C CNN
	1    12250 8400
	1    0    0    -1  
$EndComp
Text Label 15800 7150 2    60   ~ 0
M4_HR
Text Label 10700 7250 0    60   ~ 0
M4_HL
Text Label 11400 3500 0    60   ~ 0
M1_NL
Text Label 6000 5100 2    60   ~ 0
M1_NL
Text Label 8400 6600 0    60   ~ 0
M2_NR
Text Label 8400 6700 0    60   ~ 0
M3_NL
Text Label 8400 6800 0    60   ~ 0
M3_NR
Text Label 6000 5400 2    60   ~ 0
M4_NL
Text Label 6000 5500 2    60   ~ 0
M4_NR
$Comp
L C_Small C1
U 1 1 5855D6E1
P 5900 7000
F 0 "C1" H 5910 7070 50  0000 L CNN
F 1 "10u" H 5910 6920 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5900 7000 50  0001 C CNN
F 3 "" H 5900 7000 50  0000 C CNN
	1    5900 7000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 5855F3CB
P 13500 3950
F 0 "#PWR01" H 13500 3700 50  0001 C CNN
F 1 "GND" H 13500 3800 50  0000 C CNN
F 2 "" H 13500 3950 50  0000 C CNN
F 3 "" H 13500 3950 50  0000 C CNN
	1    13500 3950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 585603D5
P 3950 4050
F 0 "#PWR02" H 3950 3800 50  0001 C CNN
F 1 "GND" H 3950 3900 50  0000 C CNN
F 2 "" H 3950 4050 50  0000 C CNN
F 3 "" H 3950 4050 50  0000 C CNN
	1    3950 4050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 5856188C
P 4100 10550
F 0 "#PWR03" H 4100 10300 50  0001 C CNN
F 1 "GND" H 4100 10400 50  0000 C CNN
F 2 "" H 4100 10550 50  0000 C CNN
F 3 "" H 4100 10550 50  0000 C CNN
	1    4100 10550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 585622ED
P 13500 8850
F 0 "#PWR04" H 13500 8600 50  0001 C CNN
F 1 "GND" H 13500 8700 50  0000 C CNN
F 2 "" H 13500 8850 50  0000 C CNN
F 3 "" H 13500 8850 50  0000 C CNN
	1    13500 8850
	1    0    0    -1  
$EndComp
$Comp
L R_Small R39
U 1 1 58563003
P 14000 3650
F 0 "R39" H 14030 3670 50  0000 L CNN
F 1 "10k" H 14030 3610 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 14000 3650 50  0000 C CNN
F 3 "" H 14000 3650 50  0000 C CNN
	1    14000 3650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 58564670
P 14000 3750
F 0 "#PWR05" H 14000 3500 50  0001 C CNN
F 1 "GND" H 14000 3600 50  0000 C CNN
F 2 "" H 14000 3750 50  0000 C CNN
F 3 "" H 14000 3750 50  0000 C CNN
	1    14000 3750
	1    0    0    -1  
$EndComp
$Comp
L R_Small R11
U 1 1 585668D7
P 4500 3750
F 0 "R11" H 4530 3770 50  0000 L CNN
F 1 "10k" H 4530 3710 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 4500 3750 50  0001 C CNN
F 3 "" H 4500 3750 50  0000 C CNN
	1    4500 3750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 585668DD
P 4500 3850
F 0 "#PWR06" H 4500 3600 50  0001 C CNN
F 1 "GND" H 4500 3700 50  0000 C CNN
F 2 "" H 4500 3850 50  0000 C CNN
F 3 "" H 4500 3850 50  0000 C CNN
	1    4500 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3850 4500 3850
$Comp
L R_Small R12
U 1 1 58567D57
P 4650 10250
F 0 "R12" H 4680 10270 50  0000 L CNN
F 1 "10k" H 4680 10210 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 4650 10250 50  0000 C CNN
F 3 "" H 4650 10250 50  0000 C CNN
	1    4650 10250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 58567D5D
P 4650 10400
F 0 "#PWR07" H 4650 10150 50  0001 C CNN
F 1 "GND" H 4650 10250 50  0000 C CNN
F 2 "" H 4650 10400 50  0000 C CNN
F 3 "" H 4650 10400 50  0000 C CNN
	1    4650 10400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 10350 4650 10400
$Comp
L R_Small R32
U 1 1 5856E7A9
P 14050 8550
F 0 "R32" H 14080 8570 50  0000 L CNN
F 1 "10k" H 14080 8510 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 14050 8550 50  0000 C CNN
F 3 "" H 14050 8550 50  0000 C CNN
	1    14050 8550
	1    0    0    -1  
$EndComp
Wire Wire Line
	14050 8650 14050 8650
$Comp
L GND #PWR08
U 1 1 5856FDF8
P 14050 8650
F 0 "#PWR08" H 14050 8400 50  0001 C CNN
F 1 "GND" H 14050 8500 50  0000 C CNN
F 2 "" H 14050 8650 50  0000 C CNN
F 3 "" H 14050 8650 50  0000 C CNN
	1    14050 8650
	1    0    0    -1  
$EndComp
$Comp
L R_Small R31
U 1 1 58573CDC
P 12000 8550
F 0 "R31" H 12030 8570 50  0000 L CNN
F 1 "10k" H 12030 8510 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 12000 8550 50  0000 C CNN
F 3 "" H 12000 8550 50  0000 C CNN
	1    12000 8550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 585740D1
P 12000 8650
F 0 "#PWR09" H 12000 8400 50  0001 C CNN
F 1 "GND" H 12000 8500 50  0000 C CNN
F 2 "" H 12000 8650 50  0000 C CNN
F 3 "" H 12000 8650 50  0000 C CNN
	1    12000 8650
	1    0    0    -1  
$EndComp
Wire Wire Line
	12000 8650 12000 8650
$Comp
L R_Small R9
U 1 1 585756DB
P 2450 3750
F 0 "R9" H 2480 3770 50  0000 L CNN
F 1 "10k" H 2480 3710 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 2450 3750 50  0001 C CNN
F 3 "" H 2450 3750 50  0000 C CNN
	1    2450 3750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 585756E1
P 2450 3850
F 0 "#PWR010" H 2450 3600 50  0001 C CNN
F 1 "GND" H 2450 3700 50  0000 C CNN
F 2 "" H 2450 3850 50  0000 C CNN
F 3 "" H 2450 3850 50  0000 C CNN
	1    2450 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 3850 2450 3850
$Comp
L R_Small R30
U 1 1 5857732B
P 12000 3650
F 0 "R30" H 12030 3670 50  0000 L CNN
F 1 "10k" H 12030 3610 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 12000 3650 50  0000 C CNN
F 3 "" H 12000 3650 50  0000 C CNN
	1    12000 3650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 58577331
P 12000 3750
F 0 "#PWR011" H 12000 3500 50  0001 C CNN
F 1 "GND" H 12000 3600 50  0000 C CNN
F 2 "" H 12000 3750 50  0000 C CNN
F 3 "" H 12000 3750 50  0000 C CNN
	1    12000 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	12000 3750 12000 3750
$Comp
L R_Small R10
U 1 1 5857936E
P 2600 10250
F 0 "R10" H 2630 10270 50  0000 L CNN
F 1 "10k" H 2630 10210 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 2600 10250 50  0000 C CNN
F 3 "" H 2600 10250 50  0000 C CNN
	1    2600 10250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 58579374
P 2600 10350
F 0 "#PWR012" H 2600 10100 50  0001 C CNN
F 1 "GND" H 2600 10200 50  0000 C CNN
F 2 "" H 2600 10350 50  0000 C CNN
F 3 "" H 2600 10350 50  0000 C CNN
	1    2600 10350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 10350 2600 10350
Wire Wire Line
	12950 1400 12950 1750
Connection ~ 12950 1750
Wire Wire Line
	3450 1850 3450 1450
Connection ~ 3450 1850
Wire Wire Line
	3600 8000 3600 8350
Connection ~ 3600 8350
Wire Wire Line
	12950 6250 12950 6650
Connection ~ 12950 6650
Text Label 3450 1450 0    60   ~ 0
VMOT
Text Label 12950 6250 0    60   ~ 0
VMOT
Text Label 12950 1400 0    60   ~ 0
VMOT
Text Label 3600 8000 0    60   ~ 0
VMOT
$Comp
L CONN_01X02 P5
U 1 1 5858AC92
P 13050 2950
F 0 "P5" H 13050 3100 50  0000 C CNN
F 1 "CONN_01X02" V 13150 2950 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_bornier-2_P5.08mm" H 13050 2950 50  0001 C CNN
F 3 "" H 13050 2950 50  0000 C CNN
	1    13050 2950
	0    1    1    0   
$EndComp
Wire Wire Line
	7200 3750 7200 4600
$Comp
L CONN_01X02 P1
U 1 1 5859827C
P 3500 3050
F 0 "P1" H 3500 3200 50  0000 C CNN
F 1 "CONN_01X02" V 3600 3050 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_bornier-2_P5.08mm" H 3500 3050 50  0001 C CNN
F 3 "" H 3500 3050 50  0000 C CNN
	1    3500 3050
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02 P2
U 1 1 58599014
P 3650 9550
F 0 "P2" H 3650 9700 50  0000 C CNN
F 1 "CONN_01X02" V 3750 9550 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_bornier-2_P5.08mm" H 3650 9550 50  0001 C CNN
F 3 "" H 3650 9550 50  0000 C CNN
	1    3650 9550
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02 P6
U 1 1 5859C528
P 13050 7850
F 0 "P6" H 13050 8000 50  0000 C CNN
F 1 "CONN_01X02" V 13150 7850 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_bornier-2_P5.08mm" H 13050 7850 50  0001 C CNN
F 3 "" H 13050 7850 50  0000 C CNN
	1    13050 7850
	0    1    1    0   
$EndComp
Text Label 6000 6000 2    60   ~ 0
M1_HL
Text Label 8400 6200 0    60   ~ 0
M1_HR
Text Label 8400 5600 0    60   ~ 0
M2_HL
Text Label 8400 5500 0    60   ~ 0
M2_HR
Text Label 8400 5400 0    60   ~ 0
M3_HL
Text Label 8400 5300 0    60   ~ 0
M3_HR
Text Label 8400 6300 0    60   ~ 0
M4_HL
Text Label 8400 6400 0    60   ~ 0
M4_HR
$Comp
L GND #PWR013
U 1 1 587F22B0
P 11600 2550
F 0 "#PWR013" H 11600 2300 50  0001 C CNN
F 1 "GND" H 11600 2400 50  0000 C CNN
F 2 "" H 11600 2550 50  0000 C CNN
F 3 "" H 11600 2550 50  0000 C CNN
	1    11600 2550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 587F2913
P 14750 2450
F 0 "#PWR014" H 14750 2200 50  0001 C CNN
F 1 "GND" H 14750 2300 50  0000 C CNN
F 2 "" H 14750 2450 50  0000 C CNN
F 3 "" H 14750 2450 50  0000 C CNN
	1    14750 2450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR015
U 1 1 587F2CD3
P 11600 7450
F 0 "#PWR015" H 11600 7200 50  0001 C CNN
F 1 "GND" H 11600 7300 50  0000 C CNN
F 2 "" H 11600 7450 50  0000 C CNN
F 3 "" H 11600 7450 50  0000 C CNN
	1    11600 7450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR016
U 1 1 587F2FB8
P 14750 7350
F 0 "#PWR016" H 14750 7100 50  0001 C CNN
F 1 "GND" H 14750 7200 50  0000 C CNN
F 2 "" H 14750 7350 50  0000 C CNN
F 3 "" H 14750 7350 50  0000 C CNN
	1    14750 7350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR017
U 1 1 587F332F
P 5350 9050
F 0 "#PWR017" H 5350 8800 50  0001 C CNN
F 1 "GND" H 5350 8900 50  0000 C CNN
F 2 "" H 5350 9050 50  0000 C CNN
F 3 "" H 5350 9050 50  0000 C CNN
	1    5350 9050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR018
U 1 1 587F3415
P 2200 9150
F 0 "#PWR018" H 2200 8900 50  0001 C CNN
F 1 "GND" H 2200 9000 50  0000 C CNN
F 2 "" H 2200 9150 50  0000 C CNN
F 3 "" H 2200 9150 50  0000 C CNN
	1    2200 9150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR019
U 1 1 587F38F9
P 5200 2550
F 0 "#PWR019" H 5200 2300 50  0001 C CNN
F 1 "GND" H 5200 2400 50  0000 C CNN
F 2 "" H 5200 2550 50  0000 C CNN
F 3 "" H 5200 2550 50  0000 C CNN
	1    5200 2550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR020
U 1 1 587F3B03
P 2050 2650
F 0 "#PWR020" H 2050 2400 50  0001 C CNN
F 1 "GND" H 2050 2500 50  0000 C CNN
F 2 "" H 2050 2650 50  0000 C CNN
F 3 "" H 2050 2650 50  0000 C CNN
	1    2050 2650
	1    0    0    -1  
$EndComp
$Comp
L C_Small C3
U 1 1 587F5DDC
P 7300 4250
F 0 "C3" H 7310 4320 50  0000 L CNN
F 1 "100n" H 7300 4050 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 7300 4250 50  0001 C CNN
F 3 "" H 7300 4250 50  0000 C CNN
	1    7300 4250
	0    1    1    0   
$EndComp
$Comp
L R_Small R21
U 1 1 58593327
P 5700 4800
F 0 "R21" H 5730 4820 50  0000 L CNN
F 1 "10k" H 5730 4760 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 5700 4800 50  0001 C CNN
F 3 "" H 5700 4800 50  0000 C CNN
	1    5700 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3650 4500 3600
Connection ~ 4500 3600
Wire Wire Line
	2450 3650 2450 3600
Connection ~ 2450 3600
Wire Wire Line
	12000 3550 12000 3500
Connection ~ 12000 3500
Wire Wire Line
	14050 8450 14050 8400
Connection ~ 14050 8400
Wire Wire Line
	12000 8450 12000 8400
Connection ~ 12000 8400
Wire Wire Line
	4650 10150 4650 10100
Connection ~ 4650 10100
Wire Wire Line
	2600 10150 2600 10100
Connection ~ 2600 10100
Text Label 6900 3800 0    60   ~ 0
vdd
Wire Wire Line
	6900 3800 7200 3800
Connection ~ 7200 3800
Text Label 3350 5550 0    60   ~ 0
vmot
Wire Wire Line
	3350 5550 3800 5550
Text Label 4900 5550 0    60   ~ 0
vdd
Wire Wire Line
	4400 5550 4900 5550
$Comp
L C_Small C6
U 1 1 587F91F4
P 4600 5700
F 0 "C6" H 4610 5770 50  0000 L CNN
F 1 "10u" H 4610 5620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4600 5700 50  0001 C CNN
F 3 "" H 4600 5700 50  0000 C CNN
	1    4600 5700
	1    0    0    -1  
$EndComp
$Comp
L C_Small C5
U 1 1 587F92F1
P 3600 5700
F 0 "C5" H 3610 5770 50  0000 L CNN
F 1 "10u 25V" H 3610 5620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3600 5700 50  0001 C CNN
F 3 "" H 3600 5700 50  0000 C CNN
	1    3600 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 5850 4600 5850
Wire Wire Line
	4600 5850 4600 5800
Wire Wire Line
	3600 5850 3600 5800
Connection ~ 4100 5850
Wire Wire Line
	3600 5600 3600 5550
Connection ~ 3600 5550
Wire Wire Line
	4600 5600 4600 5550
Connection ~ 4600 5550
Wire Wire Line
	2050 2250 2050 2150
Wire Wire Line
	2050 1950 2050 1850
Wire Wire Line
	2050 1850 2350 1850
Connection ~ 2150 1850
Wire Wire Line
	11700 1950 11700 2050
Wire Wire Line
	11600 2150 11900 2150
Wire Wire Line
	11900 2150 11900 2050
Wire Wire Line
	11700 2000 12050 2000
Wire Wire Line
	12050 2000 12050 2050
Connection ~ 11700 2000
Wire Wire Line
	14100 2050 14100 2200
Wire Wire Line
	14100 2200 14650 2200
Wire Wire Line
	14650 2200 14650 2050
Wire Wire Line
	14650 2050 14750 2050
Wire Wire Line
	14000 2050 14000 2000
Wire Wire Line
	14000 2000 14300 2000
Connection ~ 14300 2000
Wire Wire Line
	14100 6950 14100 7050
Wire Wire Line
	14100 7050 14550 7050
Wire Wire Line
	14550 7050 14550 6950
Wire Wire Line
	14550 6950 14750 6950
Wire Wire Line
	14000 6950 14000 6900
Wire Wire Line
	14000 6900 14300 6900
Connection ~ 14300 6900
Wire Wire Line
	11700 6850 11700 6950
Wire Wire Line
	11900 6950 11900 7050
Wire Wire Line
	11900 7050 11600 7050
Wire Wire Line
	11700 6900 12050 6900
Wire Wire Line
	12050 6900 12050 6950
Connection ~ 11700 6900
Wire Wire Line
	4700 8650 4700 8800
Wire Wire Line
	4700 8800 5200 8800
Wire Wire Line
	5200 8800 5200 8650
Wire Wire Line
	5200 8650 5350 8650
Wire Wire Line
	4600 8650 4600 8600
Wire Wire Line
	4600 8600 4900 8600
Connection ~ 4900 8600
Wire Wire Line
	2300 8550 2300 8650
Wire Wire Line
	2300 8600 2650 8600
Wire Wire Line
	2650 8600 2650 8650
Connection ~ 2300 8600
Wire Wire Line
	2500 8650 2500 8750
Wire Wire Line
	2500 8750 2200 8750
Wire Wire Line
	14000 3550 14000 3500
Text Label 8000 2300 0    60   ~ 0
VMOT
Wire Wire Line
	8000 1750 8000 2300
$Comp
L GND #PWR021
U 1 1 5894CED8
P 7550 2250
F 0 "#PWR021" H 7550 2000 50  0001 C CNN
F 1 "GND" H 7550 2100 50  0000 C CNN
F 2 "" H 7550 2250 50  0000 C CNN
F 3 "" H 7550 2250 50  0000 C CNN
	1    7550 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 1750 7550 2250
Text Label 8400 6500 0    60   ~ 0
M2_NL
Connection ~ 2950 1850
Connection ~ 2800 2450
Connection ~ 4150 2400
Text Notes 12350 10200 0    60   ~ 0
светодиод добавить
Text Notes 12250 10350 0    60   ~ 0
выводы добавить для датчиков скоростей
$Comp
L STM8S003K3T U1
U 1 1 59F733DA
P 7200 5900
F 0 "U1" H 6150 7200 50  0000 L CNN
F 1 "STM8S005K6T6C" H 6150 7100 50  0000 L CNN
F 2 "myowndevice:LQFP-32_05" H 6150 4700 50  0001 L CIN
F 3 "" H 7200 5900 50  0001 C CNN
	1    7200 5900
	1    0    0    -1  
$EndComp
$Comp
L C_Small C2
U 1 1 59F739FB
P 7300 4500
F 0 "C2" H 7310 4570 50  0000 L CNN
F 1 "1uf" H 7300 4300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 7300 4500 50  0001 C CNN
F 3 "" H 7300 4500 50  0000 C CNN
	1    7300 4500
	0    1    1    0   
$EndComp
Connection ~ 7200 4250
Connection ~ 7200 4500
Wire Wire Line
	7400 4250 7400 4500
Wire Wire Line
	7400 4500 7500 4500
Wire Wire Line
	6000 4900 5700 4900
Text Label 5700 4550 0    60   ~ 0
vdd
Wire Wire Line
	5700 4550 5700 4700
Wire Wire Line
	5900 5200 6000 5200
Wire Wire Line
	5800 5700 6000 5700
Wire Wire Line
	5900 6900 6000 6900
Wire Wire Line
	5900 7250 7200 7250
Wire Wire Line
	7200 7250 7200 7200
Wire Wire Line
	5900 7100 5900 7250
Connection ~ 6450 7250
Text Label 6000 5300 2    60   ~ 0
M1_NR
Connection ~ 3600 2850
Connection ~ 3400 2850
Connection ~ 3750 9350
Connection ~ 3550 9350
Connection ~ 13150 7650
Connection ~ 12950 7650
Connection ~ 13150 2750
Connection ~ 12950 2750
$Comp
L AP1117-50 U2
U 1 1 5A5D9CD8
P 4100 5550
F 0 "U2" H 3950 5675 50  0000 C CNN
F 1 "NCV1117ST50T3G" H 4100 5675 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-223" H 4100 5750 50  0001 C CNN
F 3 "" H 4200 5300 50  0001 C CNN
	1    4100 5550
	1    0    0    -1  
$EndComp
$Comp
L CP C4
U 1 1 5A5DB508
P 7800 2150
F 0 "C4" H 7825 2250 50  0000 L CNN
F 1 "100uf 20v tant" H 7825 2050 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-D_EIA-7343-31_Hand" H 7838 2000 50  0001 C CNN
F 3 "" H 7800 2150 50  0001 C CNN
	1    7800 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	7950 2150 8000 2150
Wire Wire Line
	7650 2150 7550 2150
Wire Wire Line
	5800 5600 6000 5600
$Comp
L CONN_01X02 P8
U 1 1 5A5F0CD7
P 7750 1550
F 0 "P8" H 7750 1700 50  0000 C CNN
F 1 "VIN" V 7850 1550 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_bornier-2_P5.08mm" H 7750 1550 50  0001 C CNN
F 3 "" H 7750 1550 50  0000 C CNN
	1    7750 1550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7700 1750 7550 1750
Connection ~ 7550 2150
Wire Wire Line
	7800 1750 8000 1750
Connection ~ 8000 2150
Text Label 5900 5200 2    60   ~ 0
prg
Text Label 5800 5600 2    60   ~ 0
utx
Text Label 5800 5700 2    60   ~ 0
urx
Text Label 8400 5700 0    60   ~ 0
i2c_scl
Text Label 8400 5800 0    60   ~ 0
i2c_sda
$Comp
L Conn_01x07 J1
U 1 1 5A5F2F4D
P 2000 5450
F 0 "J1" H 2000 5750 50  0000 C CNN
F 1 "Conn_01x06" H 2000 5050 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x07_Pitch2.54mm" H 2000 5450 50  0001 C CNN
F 3 "" H 2000 5450 50  0001 C CNN
	1    2000 5450
	-1   0    0    1   
$EndComp
Text Label 2200 5450 0    60   ~ 0
vdd
Text Label 2200 5150 0    60   ~ 0
prg
Text Label 2200 5650 0    60   ~ 0
i2c_scl
Text Label 2200 5550 0    60   ~ 0
i2c_sda
Text Label 2200 5250 0    60   ~ 0
utx
Text Label 2200 5350 0    60   ~ 0
urx
$Comp
L GNDD #PWR022
U 1 1 5A636E80
P 6450 7250
F 0 "#PWR022" H 6450 7000 50  0001 C CNN
F 1 "GNDD" H 6450 7125 50  0000 C CNN
F 2 "" H 6450 7250 50  0001 C CNN
F 3 "" H 6450 7250 50  0001 C CNN
	1    6450 7250
	1    0    0    -1  
$EndComp
$Comp
L GNDD #PWR023
U 1 1 5A63772E
P 2200 5750
F 0 "#PWR023" H 2200 5500 50  0001 C CNN
F 1 "GNDD" H 2200 5625 50  0000 C CNN
F 2 "" H 2200 5750 50  0001 C CNN
F 3 "" H 2200 5750 50  0001 C CNN
	1    2200 5750
	1    0    0    -1  
$EndComp
$Comp
L GNDD #PWR024
U 1 1 5A638164
P 7500 4500
F 0 "#PWR024" H 7500 4250 50  0001 C CNN
F 1 "GNDD" H 7500 4375 50  0000 C CNN
F 2 "" H 7500 4500 50  0001 C CNN
F 3 "" H 7500 4500 50  0001 C CNN
	1    7500 4500
	1    0    0    -1  
$EndComp
$Comp
L GNDD #PWR025
U 1 1 5A638B0C
P 4100 5850
F 0 "#PWR025" H 4100 5600 50  0001 C CNN
F 1 "GNDD" H 4100 5725 50  0000 C CNN
F 2 "" H 4100 5850 50  0001 C CNN
F 3 "" H 4100 5850 50  0001 C CNN
	1    4100 5850
	1    0    0    -1  
$EndComp
$Comp
L R_Small R1
U 1 1 5A9D7F15
P 3050 6700
F 0 "R1" H 3080 6720 50  0000 L CNN
F 1 "net" H 3080 6660 50  0000 L CNN
F 2 "myowndevice:smd_joint" H 3050 6700 50  0001 C CNN
F 3 "" H 3050 6700 50  0001 C CNN
	1    3050 6700
	0    1    1    0   
$EndComp
$Comp
L GND #PWR026
U 1 1 5A9D80CB
P 3300 6700
F 0 "#PWR026" H 3300 6450 50  0001 C CNN
F 1 "GND" H 3300 6550 50  0000 C CNN
F 2 "" H 3300 6700 50  0001 C CNN
F 3 "" H 3300 6700 50  0001 C CNN
	1    3300 6700
	1    0    0    -1  
$EndComp
$Comp
L GNDD #PWR027
U 1 1 5A9D816F
P 2800 6700
F 0 "#PWR027" H 2800 6450 50  0001 C CNN
F 1 "GNDD" H 2800 6575 50  0000 C CNN
F 2 "" H 2800 6700 50  0001 C CNN
F 3 "" H 2800 6700 50  0001 C CNN
	1    2800 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 6700 3150 6700
Wire Wire Line
	2950 6700 2800 6700
$Comp
L 2N7002 Q1
U 1 1 584D14C6
P 1950 2450
F 0 "Q1" H 2250 2500 50  0000 R CNN
F 1 "2n7002" H 2550 2400 50  0000 R CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 2150 2550 50  0001 C CNN
F 3 "" H 1950 2450 50  0000 C CNN
	1    1950 2450
	1    0    0    -1  
$EndComp
Text Label 8450 5100 0    60   ~ 0
vdd
Wire Wire Line
	8450 5100 8400 5100
Text Label 8450 6000 0    60   ~ 0
vdd
Wire Wire Line
	8450 6000 8400 6000
$Comp
L GNDD #PWR028
U 1 1 5B4FCAF2
P 8800 5900
F 0 "#PWR028" H 8800 5650 50  0001 C CNN
F 1 "GNDD" H 8800 5775 50  0000 C CNN
F 2 "" H 8800 5900 50  0001 C CNN
F 3 "" H 8800 5900 50  0001 C CNN
	1    8800 5900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8800 5900 8400 5900
Wire Wire Line
	2150 1850 2150 2150
Wire Wire Line
	2150 2150 2500 2150
Wire Wire Line
	2550 1850 4350 1850
Wire Wire Line
	4550 1850 5200 1850
Wire Wire Line
	5200 2050 5200 2150
Wire Wire Line
	4450 2150 4800 2150
Wire Wire Line
	4800 2150 4800 1850
Connection ~ 4800 1850
$EndSCHEMATC
