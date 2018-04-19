EESchema Schematic File Version 2  date 4/3/2012 7:00:30 PM
LIBS:power
LIBS:device
LIBS:conn
LIBS:linear
LIBS:atmel (2)
LIBS:regul
LIBS:atmel
LIBS:Cer_reso
LIBS:Erik
LIBS:Resonator_3pins
LIBS:HeadsUpDisplay-cache
EELAYER 25  0
EELAYER END
$Descr A4 11700 8267
encoding utf-8
Sheet 6 11
Title ""
Date "4 apr 2012"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Connection ~ 7150 3150
Wire Wire Line
	7150 3150 7150 2900
Wire Wire Line
	7150 2900 7050 2900
Connection ~ 4650 4300
Wire Wire Line
	4650 3600 4650 4300
Wire Wire Line
	3500 3750 3500 4300
Wire Wire Line
	3150 5900 3000 5900
Wire Wire Line
	3100 3650 3100 3750
Connection ~ 9500 3150
Wire Wire Line
	9500 3050 9500 3150
Wire Wire Line
	4800 3150 4800 2300
Wire Wire Line
	4500 6700 2700 6700
Wire Wire Line
	4500 6700 4500 6650
Connection ~ 4200 6100
Wire Wire Line
	4050 6100 4850 6100
Connection ~ 3050 6700
Wire Wire Line
	2700 6700 2700 6350
Connection ~ 3000 5800
Wire Wire Line
	3150 5800 2500 5800
Wire Wire Line
	3150 6150 3050 6150
Wire Wire Line
	3050 6150 3050 6700
Connection ~ 3600 6700
Connection ~ 10050 3150
Wire Wire Line
	8750 3150 10750 3150
Connection ~ 9050 3150
Wire Wire Line
	10050 3150 10050 3200
Wire Wire Line
	10050 4550 10050 4350
Wire Wire Line
	7700 3450 7700 3650
Wire Wire Line
	7200 3150 7200 3550
Wire Wire Line
	7200 3550 6450 3550
Connection ~ 4800 3150
Wire Wire Line
	5200 2400 4800 2400
Connection ~ 4150 3150
Connection ~ 4450 3150
Wire Wire Line
	5050 3150 4350 3150
Connection ~ 4950 4300
Connection ~ 3100 3150
Wire Wire Line
	3100 3150 3100 3250
Wire Wire Line
	1850 2900 2200 2900
Wire Wire Line
	2200 2900 2200 3550
Wire Wire Line
	2200 3550 2050 3550
Wire Wire Line
	1600 3750 1600 3650
Wire Wire Line
	1600 3650 1450 3650
Wire Wire Line
	1450 3550 1650 3550
Wire Wire Line
	1200 2900 1450 2900
Wire Wire Line
	1850 3750 1850 3950
Connection ~ 1600 3750
Wire Wire Line
	2400 3150 2200 3150
Connection ~ 2200 3150
Connection ~ 1850 3750
Connection ~ 3100 3750
Wire Wire Line
	3500 3750 1450 3750
Wire Wire Line
	5900 4800 5900 4750
Wire Wire Line
	4950 4300 4950 4800
Wire Wire Line
	4250 3150 2900 3150
Wire Wire Line
	3500 4300 5050 4300
Wire Wire Line
	6650 3150 6450 3150
Wire Wire Line
	7700 3150 7700 3250
Connection ~ 7200 3150
Wire Wire Line
	7050 3150 8150 3150
Connection ~ 7700 3150
Wire Wire Line
	9050 3550 7700 3550
Connection ~ 7700 3550
Wire Wire Line
	10050 3700 10050 3850
Wire Wire Line
	6450 4150 8150 4150
Wire Wire Line
	8150 4150 8150 3750
Wire Wire Line
	8150 3750 10050 3750
Connection ~ 10050 3750
Wire Wire Line
	3600 6600 3600 6800
Wire Wire Line
	3000 5900 3000 5800
Wire Wire Line
	2700 5800 2700 5950
Connection ~ 2700 5800
Wire Wire Line
	4200 6100 4200 6250
Wire Wire Line
	4200 6250 4050 6250
Wire Wire Line
	4500 6100 4500 6250
Connection ~ 4500 6100
Wire Wire Line
	4950 4800 6750 4800
Connection ~ 5900 4800
Connection ~ 4800 2400
Wire Wire Line
	2400 3750 2400 3800
Connection ~ 2400 3750
Wire Wire Line
	2850 5800 2850 5650
Connection ~ 2850 5800
Wire Wire Line
	4650 3200 4650 3150
Connection ~ 4650 3150
Wire Wire Line
	6650 2900 6550 2900
Wire Wire Line
	6550 2900 6550 3150
Connection ~ 6550 3150
$Comp
L C C24
U 1 1 4F7BB8D1
P 6850 2900
F 0 "C24" V 6900 3000 50  0000 L CNN
F 1 ".01uF" V 6900 2650 50  0000 L CNN
	1    6850 2900
	0    -1   -1   0   
$EndComp
$Comp
L +5V #PWR020
U 1 1 4F165ADB
P 2850 5650
F 0 "#PWR020" H 2850 5740 20  0001 C CNN
F 1 "+5V" H 2850 5740 30  0000 C CNN
	1    2850 5650
	1    0    0    -1  
$EndComp
$Comp
L ZENER D4
U 1 1 4F0BE2E5
P 3100 3450
F 0 "D4" V 3100 3550 50  0000 C CNN
F 1 "25V ZENER" V 3000 3650 40  0000 C CNN
	1    3100 3450
	0    -1   -1   0   
$EndComp
$Comp
L +5V #PWR021
U 1 1 4F0BD058
P 9500 3050
F 0 "#PWR021" H 9500 3140 20  0001 C CNN
F 1 "+5V" H 9500 3140 30  0000 C CNN
	1    9500 3050
	1    0    0    -1  
$EndComp
$Comp
L GNDPWR #PWR022
U 1 1 4F0BD02E
P 2400 3800
F 0 "#PWR022" H 2400 3850 40  0001 C CNN
F 1 "GNDPWR" H 2400 3720 40  0000 C CNN
	1    2400 3800
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR023
U 1 1 4F0BCFE1
P 4800 2300
F 0 "#PWR023" H 4800 2250 20  0001 C CNN
F 1 "+12V" H 4800 2400 30  0000 C CNN
	1    4800 2300
	1    0    0    -1  
$EndComp
Text GLabel 6750 4800 2    60   Output ~ 0
GND
Text Notes 2200 5500 0    200  ~ 0
3.3V Linear Regulator
Text Notes 6050 2650 0    200  ~ 0
5V Buck Converter
$Comp
L C C16
U 1 1 4F0A9C36
P 4500 6450
F 0 "C16" H 4550 6550 50  0000 L CNN
F 1 "10uF" H 4550 6350 50  0000 L CNN
	1    4500 6450
	1    0    0    -1  
$EndComp
Text GLabel 4850 6100 2    60   Output ~ 0
+3.3V
NoConn ~ 4050 5850
NoConn ~ 4050 5750
$Comp
L C C15
U 1 1 4F0A9B76
P 2700 6150
F 0 "C15" H 2750 6250 50  0000 L CNN
F 1 "100nF" H 2750 6050 50  0000 L CNN
	1    2700 6150
	1    0    0    -1  
$EndComp
Text GLabel 2500 5800 0    60   Input ~ 0
+5V
$Comp
L GND #PWR024
U 1 1 4F0A9B46
P 3600 6800
F 0 "#PWR024" H 3600 6800 30  0001 C CNN
F 1 "GND" H 3600 6730 30  0001 C CNN
	1    3600 6800
	1    0    0    -1  
$EndComp
$Comp
L TPS77633 IC8
U 1 1 4F0A9AFD
P 3600 6050
F 0 "IC8" H 3400 5650 60  0000 C CNN
F 1 "TPS77633" H 3600 6450 60  0000 C CNN
	1    3600 6050
	1    0    0    -1  
$EndComp
Text GLabel 10750 3150 2    60   Output ~ 0
+5V
$Comp
L GND #PWR025
U 1 1 4F0A9781
P 10050 4550
F 0 "#PWR025" H 10050 4550 30  0001 C CNN
F 1 "GND" H 10050 4480 30  0001 C CNN
	1    10050 4550
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 4F0A977C
P 10050 4100
F 0 "R1" V 10130 4100 50  0000 C CNN
F 1 "3.24k" V 10050 4100 50  0000 C CNN
	1    10050 4100
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 4F0A9772
P 10050 3450
F 0 "R2" V 10130 3450 50  0000 C CNN
F 1 "10k" V 10050 3450 50  0000 C CNN
	1    10050 3450
	1    0    0    -1  
$EndComp
$Comp
L CP1 C6
U 1 1 4F0A973B
P 9050 3350
F 0 "C6" H 9100 3450 50  0000 L CNN
F 1 "220uF" H 9100 3250 50  0000 L CNN
	1    9050 3350
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR L2
U 1 1 4F0A96E4
P 8450 3150
F 0 "L2" V 8400 3150 40  0000 C CNN
F 1 "100uH" V 8550 3150 40  0000 C CNN
	1    8450 3150
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR026
U 1 1 4F0A96D1
P 7700 3650
F 0 "#PWR026" H 7700 3650 30  0001 C CNN
F 1 "GND" H 7700 3580 30  0001 C CNN
	1    7700 3650
	1    0    0    -1  
$EndComp
$Comp
L DIODE-SCHOTTKY D5
U 1 1 4F0A96A8
P 7700 3350
F 0 "D5" V 7700 3450 50  0000 L BNN
F 1 "40V 3A SCHOTTKY" V 7700 2600 50  0000 L BNN
F 2 "SparkFun-SMA-DIODE" H 7700 3150 50  0001 C CNN
	1    7700 3350
	0    -1   -1   0   
$EndComp
$Comp
L C C2
U 1 1 4F0A9666
P 6850 3150
F 0 "C2" V 6900 3250 50  0000 L CNN
F 1 ".01uF" V 6900 2900 50  0000 L CNN
	1    6850 3150
	0    -1   -1   0   
$EndComp
Text GLabel 5200 2400 2    60   Output ~ 0
VBAT_SW
$Comp
L CONN_4 J5
U 1 1 4F0A806A
P 4300 2800
F 0 "J5" V 4250 2800 50  0000 C CNN
F 1 "Power Switch Connector" V 4450 2800 50  0000 C CNN
	1    4300 2800
	0    -1   -1   0   
$EndComp
NoConn ~ 5050 3450
$Comp
L TPS5430 IC7
U 1 1 4F0A8003
P 5750 3850
F 0 "IC7" H 5400 4750 60  0000 C CNN
F 1 "TPS5430" H 5550 3100 60  0000 C CNN
	1    5750 3850
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 4F0A7909
P 4650 3400
F 0 "C1" H 4700 3500 50  0000 L CNN
F 1 "10uF" H 4700 3300 50  0000 L CNN
	1    4650 3400
	1    0    0    -1  
$EndComp
$Comp
L FUSE F1
U 1 1 4F0A78BF
P 2650 3150
F 0 "F1" H 2750 3200 40  0000 C CNN
F 1 "3.6A" H 2550 3100 40  0000 C CNN
	1    2650 3150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR027
U 1 1 4F0A78A6
P 1850 3950
F 0 "#PWR027" H 1850 3950 30  0001 C CNN
F 1 "GND" H 1850 3880 30  0001 C CNN
	1    1850 3950
	1    0    0    -1  
$EndComp
$Comp
L DIODE D7
U 1 1 4F0A788C
P 1850 3550
F 0 "D7" H 1850 3650 40  0000 C CNN
F 1 "DIODE" H 1850 3450 40  0000 C CNN
	1    1850 3550
	1    0    0    -1  
$EndComp
$Comp
L POWER_JACKPTH J8
U 1 1 4F0A7877
P 1350 3850
F 0 "J8" H 1350 4250 50  0000 C CNN
F 1 "POWER_JACKPTH" H 1350 3850 50  0000 C CNN
F 2 "SparkFun-POWER_JACK_PTH" H 1350 4000 50  0001 C CNN
	1    1350 3850
	1    0    0    -1  
$EndComp
$Comp
L DIODE D6
U 1 1 4F0A77ED
P 1650 2900
F 0 "D6" H 1650 3000 40  0000 C CNN
F 1 "DIODE" H 1650 2800 40  0000 C CNN
	1    1650 2900
	1    0    0    -1  
$EndComp
Text GLabel 1200 2900 0    60   Input ~ 0
VBAT
Text Notes 8150 1200 2    500  ~ 0
Power Supply
$EndSCHEMATC
