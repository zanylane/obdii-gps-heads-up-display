EESchema Schematic File Version 2  date 1/8/2012 4:16:32 PM
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
LIBS:special
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
LIBS:Cer_reso
LIBS:Erik
LIBS:Resonator_3pins
LIBS:SparkFun
LIBS:HeadsUpDisplay-cache
EELAYER 25  0
EELAYER END
$Descr A4 11700 8267
encoding utf-8
Sheet 9 11
Title ""
Date "9 jan 2012"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	7850 4200 7850 4350
Wire Wire Line
	7550 4000 7450 4000
Wire Wire Line
	8450 3400 8450 3500
Wire Wire Line
	7850 3250 7850 2900
Wire Wire Line
	7850 2900 7900 2900
Connection ~ 8450 2600
Wire Wire Line
	8450 3000 8450 1800
Connection ~ 7200 2600
Wire Wire Line
	6950 2600 7200 2600
Wire Wire Line
	7200 3250 7200 3300
Wire Wire Line
	7200 3300 6950 3300
Wire Wire Line
	6950 3300 6950 3000
Wire Wire Line
	7200 2600 7200 2750
Wire Wire Line
	7800 2600 7700 2600
Wire Wire Line
	1200 1800 7350 1800
Connection ~ 7050 1800
Wire Wire Line
	7050 1850 7050 1800
Connection ~ 4600 5250
Wire Wire Line
	4800 5250 4300 5250
Connection ~ 4600 2900
Wire Wire Line
	4300 2900 4800 2900
Wire Wire Line
	4600 2400 4600 2300
Wire Wire Line
	4600 4650 4600 4750
Connection ~ 3500 1800
Wire Wire Line
	3500 3650 3850 3650
Wire Wire Line
	2050 5350 2200 5350
Wire Wire Line
	3600 5150 2700 5150
Wire Wire Line
	3400 4200 3600 4200
Wire Wire Line
	3400 3000 3600 3000
Connection ~ 1350 4000
Wire Wire Line
	3600 4000 1350 4000
Wire Wire Line
	1650 3350 1650 3500
Wire Wire Line
	1350 3850 1350 4250
Wire Wire Line
	1650 2450 1650 2850
Wire Wire Line
	3850 4400 3850 4500
Wire Wire Line
	3850 5700 3850 5550
Wire Wire Line
	3850 3650 3850 3800
Wire Wire Line
	3850 4950 3850 4850
Wire Wire Line
	3850 3200 3850 3300
Wire Wire Line
	1650 1800 1650 1950
Wire Wire Line
	1350 3350 1350 1800
Connection ~ 1350 1800
Wire Wire Line
	1350 4750 1350 4850
Connection ~ 1650 2800
Wire Wire Line
	3600 2800 1650 2800
Wire Wire Line
	2750 3000 2900 3000
Wire Wire Line
	2750 4200 2900 4200
Wire Wire Line
	3600 5350 2700 5350
Wire Wire Line
	2200 5150 2050 5150
Connection ~ 1650 1800
Wire Wire Line
	3850 4850 3500 4850
Wire Wire Line
	3500 4850 3500 1800
Connection ~ 3500 3650
Wire Wire Line
	4600 3600 4600 3400
Wire Wire Line
	4800 4100 4300 4100
Connection ~ 4600 4100
Wire Wire Line
	7050 2250 7050 2300
Wire Wire Line
	3850 2600 3850 2350
Wire Wire Line
	3850 2350 3500 2350
Connection ~ 3500 2350
Wire Wire Line
	7750 2300 7750 2600
Connection ~ 7750 2600
Wire Wire Line
	6350 2450 6550 2450
Wire Wire Line
	6550 2450 6550 2800
Wire Wire Line
	6550 2800 6650 2800
Wire Wire Line
	7050 3400 7050 3300
Connection ~ 7050 3300
Wire Wire Line
	8450 1800 8150 1800
Wire Wire Line
	8450 2600 8300 2600
Wire Wire Line
	8400 2900 8450 2900
Connection ~ 8450 2900
Wire Wire Line
	8150 3200 7850 3200
Connection ~ 7850 3200
Wire Wire Line
	7850 3750 7850 3800
Wire Wire Line
	6650 3650 6800 3650
Wire Wire Line
	6800 3650 6800 4000
Wire Wire Line
	6800 4000 6950 4000
$Comp
L GND #PWR?
U 1 1 4F0A2E9F
P 7850 4350
F 0 "#PWR?" H 7850 4350 30  0001 C CNN
F 1 "GND" H 7850 4280 30  0001 C CNN
	1    7850 4350
	1    0    0    -1  
$EndComp
Text GLabel 6650 3650 0    60   Input ~ 0
OBD_LEVEL_SHIFT_SIG_5
$Comp
L NPN Q4
U 1 1 4F0A2E23
P 7750 4000
F 0 "Q4" H 7750 3850 50  0000 R CNN
F 1 "NPN" H 7750 4150 50  0000 R CNN
	1    7750 4000
	1    0    0    -1  
$EndComp
$Comp
L PNP Q3
U 1 1 4F0A2D82
P 8350 3200
F 0 "Q3" H 8350 3050 60  0000 R CNN
F 1 "PNP" H 8350 3350 60  0000 R CNN
	1    8350 3200
	1    0    0    1   
$EndComp
$Comp
L DIODE D?
U 1 1 4F0A2D6C
P 8450 3700
F 0 "D?" H 8450 3800 40  0000 C CNN
F 1 "DIODE" H 8450 3600 40  0000 C CNN
	1    8450 3700
	0    1    1    0   
$EndComp
$Comp
L R R24
U 1 1 4F0A2D5E
P 7200 4000
F 0 "R24" V 7280 4000 50  0000 C CNN
F 1 "10K" V 7200 4000 50  0000 C CNN
	1    7200 4000
	0    -1   -1   0   
$EndComp
$Comp
L R R23
U 1 1 4F0A2D54
P 7850 3500
F 0 "R23" V 7930 3500 50  0000 C CNN
F 1 "2.2K" V 7850 3500 50  0000 C CNN
	1    7850 3500
	-1   0    0    1   
$EndComp
$Comp
L R R22
U 1 1 4F0A2D46
P 8150 2900
F 0 "R22" V 8230 2900 50  0000 C CNN
F 1 "10K" V 8150 2900 50  0000 C CNN
	1    8150 2900
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 4F0A2CFC
P 7050 3400
F 0 "#PWR?" H 7050 3400 30  0001 C CNN
F 1 "GND" H 7050 3330 30  0001 C CNN
	1    7050 3400
	1    0    0    -1  
$EndComp
Text GLabel 6350 2450 0    60   Input ~ 0
OBD_LEVEL_SHIFT_SIG_8
$Comp
L MOSFET_N Q2
U 1 1 4F0A2CA8
P 6850 2800
F 0 "Q2" H 6860 2970 60  0000 R CNN
F 1 "MOSFET_N" H 6860 2650 60  0000 R CNN
	1    6850 2800
	1    0    0    -1  
$EndComp
$Comp
L R R21
U 1 1 4F0A1FAD
P 7200 3000
F 0 "R21" V 7280 3000 50  0000 C CNN
F 1 "374" V 7200 3000 50  0000 C CNN
	1    7200 3000
	-1   0    0    1   
$EndComp
$Comp
L R R19
U 1 1 4F0A1F69
P 8050 2600
F 0 "R19" V 8130 2600 50  0000 C CNN
F 1 "240" V 8050 2600 50  0000 C CNN
	1    8050 2600
	0    -1   -1   0   
$EndComp
$Comp
L R R20
U 1 1 4F0A1F60
P 7450 2600
F 0 "R20" V 7530 2600 50  0000 C CNN
F 1 "866" V 7450 2600 50  0000 C CNN
	1    7450 2600
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 4F0A1EBD
P 7050 2300
F 0 "#PWR?" H 7050 2300 30  0001 C CNN
F 1 "GND" H 7050 2230 30  0001 C CNN
	1    7050 2300
	1    0    0    -1  
$EndComp
$Comp
L C C10
U 1 1 4F0A1EAE
P 7050 2050
F 0 "C10" H 7100 2150 50  0000 L CNN
F 1 "100nF" H 7100 1950 50  0000 L CNN
	1    7050 2050
	1    0    0    -1  
$EndComp
$Comp
L LM317 IC4
U 1 1 4F0A1E84
P 7750 1950
F 0 "IC4" H 7750 2250 60  0000 C CNN
F 1 "LM317" H 7800 1700 60  0000 L CNN
	1    7750 1950
	1    0    0    -1  
$EndComp
Text GLabel 4800 2900 2    60   Output ~ 0
OBD_LEVEL_SHIFT_SIG_3
Text GLabel 4800 4100 2    60   Output ~ 0
OBD_LEVEL_SHIFT_SIG_7
Text GLabel 4800 5250 2    60   Output ~ 0
OBD_LEVEL_SHIFT_SIG_6
$Comp
L R R8
U 1 1 4F0A1D1C
P 4600 2650
F 0 "R8" V 4680 2650 50  0000 C CNN
F 1 "10K" V 4600 2650 50  0000 C CNN
	1    4600 2650
	1    0    0    -1  
$EndComp
$Comp
L R R12
U 1 1 4F0A1D16
P 4600 3850
F 0 "R12" V 4680 3850 50  0000 C CNN
F 1 "10K" V 4600 3850 50  0000 C CNN
	1    4600 3850
	1    0    0    -1  
$EndComp
$Comp
L R R16
U 1 1 4F0A1D10
P 4600 5000
F 0 "R16" V 4680 5000 50  0000 C CNN
F 1 "10K" V 4600 5000 50  0000 C CNN
	1    4600 5000
	1    0    0    -1  
$EndComp
Text GLabel 2050 5350 0    60   Input ~ 0
CAR_SIG_6
Text GLabel 2050 5150 0    60   Input ~ 0
CAR_SIG_5
Text GLabel 2750 4200 0    60   Input ~ 0
CAR_SIG_5
Text GLabel 2750 3000 0    60   Input ~ 0
CAR_SIG_2
$Comp
L R R13
U 1 1 4F0A1AF6
P 3150 4200
F 0 "R13" V 3230 4200 50  0000 C CNN
F 1 "10K" V 3150 4200 50  0000 C CNN
	1    3150 4200
	0    -1   -1   0   
$EndComp
$Comp
L R R11
U 1 1 4F0A1AF3
P 3150 3000
F 0 "R11" V 3230 3000 50  0000 C CNN
F 1 "10K" V 3150 3000 50  0000 C CNN
	1    3150 3000
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 4F0A1ACE
P 1350 4850
F 0 "#PWR?" H 1350 4850 30  0001 C CNN
F 1 "GND" H 1350 4780 30  0001 C CNN
	1    1350 4850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 4F0A1ACA
P 1650 3500
F 0 "#PWR?" H 1650 3500 30  0001 C CNN
F 1 "GND" H 1650 3430 30  0001 C CNN
	1    1650 3500
	1    0    0    -1  
$EndComp
Text GLabel 1200 1800 0    60   Input ~ 0
VBAT_SW
$Comp
L R R18
U 1 1 4F0A1A6F
P 2450 5350
F 0 "R18" V 2530 5350 50  0000 C CNN
F 1 "10K" V 2450 5350 50  0000 C CNN
	1    2450 5350
	0    -1   -1   0   
$EndComp
$Comp
L R R17
U 1 1 4F0A1A65
P 2450 5150
F 0 "R17" V 2530 5150 50  0000 C CNN
F 1 "10K" V 2450 5150 50  0000 C CNN
	1    2450 5150
	0    -1   -1   0   
$EndComp
$Comp
L R R15
U 1 1 4F0A1A5C
P 1350 4500
F 0 "R15" V 1430 4500 50  0000 C CNN
F 1 "10K" V 1350 4500 50  0000 C CNN
	1    1350 4500
	1    0    0    -1  
$EndComp
$Comp
L R R14
U 1 1 4F0A1A4F
P 1350 3600
F 0 "R14" V 1430 3600 50  0000 C CNN
F 1 "10K" V 1350 3600 50  0000 C CNN
	1    1350 3600
	1    0    0    -1  
$EndComp
$Comp
L R R10
U 1 1 4F0A1A3C
P 1650 3100
F 0 "R10" V 1730 3100 50  0000 C CNN
F 1 "10K" V 1650 3100 50  0000 C CNN
	1    1650 3100
	1    0    0    -1  
$EndComp
$Comp
L R R9
U 1 1 4F0A1A2D
P 1650 2200
F 0 "R9" V 1730 2200 50  0000 C CNN
F 1 "10K" V 1650 2200 50  0000 C CNN
	1    1650 2200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 4F0A17F4
P 3850 5700
F 0 "#PWR?" H 3850 5700 30  0001 C CNN
F 1 "GND" H 3850 5630 30  0001 C CNN
	1    3850 5700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 4F0A17EB
P 3850 3300
F 0 "#PWR?" H 3850 3300 30  0001 C CNN
F 1 "GND" H 3850 3230 30  0001 C CNN
	1    3850 3300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 4F0A17E3
P 3850 4500
F 0 "#PWR?" H 3850 4500 30  0001 C CNN
F 1 "GND" H 3850 4430 30  0001 C CNN
	1    3850 4500
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 4F0A17CE
P 4600 4650
F 0 "#PWR?" H 4600 4610 30  0001 C CNN
F 1 "+3.3V" H 4600 4760 30  0000 C CNN
	1    4600 4650
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 4F0A17C7
P 4600 2300
F 0 "#PWR?" H 4600 2260 30  0001 C CNN
F 1 "+3.3V" H 4600 2410 30  0000 C CNN
	1    4600 2300
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 4F0A17C2
P 4600 3400
F 0 "#PWR?" H 4600 3360 30  0001 C CNN
F 1 "+3.3V" H 4600 3510 30  0000 C CNN
	1    4600 3400
	1    0    0    -1  
$EndComp
$Comp
L LM339 IC3
U 3 1 4F0A142A
P 3950 5250
F 0 "IC3" H 4000 5450 60  0000 C CNN
F 1 "LM339" H 4050 5050 50  0000 C CNN
	3    3950 5250
	1    0    0    -1  
$EndComp
$Comp
L LM339 IC3
U 2 1 4F0A1426
P 3950 4100
F 0 "IC3" H 4000 4300 60  0000 C CNN
F 1 "LM339" H 4050 3900 50  0000 C CNN
	2    3950 4100
	1    0    0    -1  
$EndComp
$Comp
L LM339 IC3
U 1 1 4F0A127D
P 3950 2900
F 0 "IC3" H 4000 3100 60  0000 C CNN
F 1 "LM339" H 4050 2700 50  0000 C CNN
	1    3950 2900
	1    0    0    -1  
$EndComp
Text Notes 9200 1250 2    500  ~ 0
OBD Voltage Shifter
$EndSCHEMATC
