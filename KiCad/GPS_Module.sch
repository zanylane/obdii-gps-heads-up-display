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
Sheet 9 11
Title ""
Date "4 apr 2012"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	4950 4500 6600 4500
Wire Wire Line
	4500 2850 6700 2850
Wire Wire Line
	5550 5500 5300 5500
Wire Wire Line
	6600 5700 6600 5900
Connection ~ 4950 2850
Wire Wire Line
	4950 4500 4950 2850
Wire Wire Line
	6600 4500 6600 4650
Wire Wire Line
	6700 4250 6700 4300
Wire Wire Line
	6700 2850 6700 3300
Wire Wire Line
	6700 3800 6700 3850
Wire Wire Line
	7150 4050 7000 4050
Wire Wire Line
	9300 3850 7400 3850
Wire Wire Line
	9300 3950 7950 3950
Connection ~ 7950 4150
Wire Wire Line
	7950 3950 7950 4200
Wire Wire Line
	9150 3750 9300 3750
Wire Wire Line
	3700 2850 4000 2850
Connection ~ 9300 3750
Wire Wire Line
	7650 4050 9300 4050
Wire Wire Line
	9300 4150 7750 4150
Wire Wire Line
	6700 3300 7400 3300
Wire Wire Line
	7400 3300 7400 3850
Wire Wire Line
	6700 3850 6300 3850
Connection ~ 6700 3850
Wire Wire Line
	6700 4300 7750 4300
Wire Wire Line
	7750 4300 7750 4150
Wire Wire Line
	6600 5150 6600 5300
Wire Wire Line
	6300 5500 6050 5500
Wire Wire Line
	6600 5250 8600 5250
Connection ~ 6600 5250
Wire Wire Line
	8600 5250 8600 4250
Wire Wire Line
	8600 4250 9300 4250
$Comp
L GND #PWR031
U 1 1 4F359584
P 6600 5900
F 0 "#PWR031" H 6600 5900 30  0001 C CNN
F 1 "GND" H 6600 5830 30  0001 C CNN
	1    6600 5900
	1    0    0    -1  
$EndComp
$Comp
L R R48
U 1 1 4F359579
P 5800 5500
F 0 "R48" V 5880 5500 50  0000 C CNN
F 1 "10k" V 5800 5500 50  0000 C CNN
	1    5800 5500
	0    -1   -1   0   
$EndComp
$Comp
L R R49
U 1 1 4F35956D
P 6600 4900
F 0 "R49" V 6680 4900 50  0000 C CNN
F 1 "1k" V 6600 4900 50  0000 C CNN
	1    6600 4900
	1    0    0    -1  
$EndComp
$Comp
L NPN Q7
U 1 1 4F359549
P 6500 5500
F 0 "Q7" H 6500 5350 50  0000 R CNN
F 1 "NPN" H 6500 5650 50  0000 R CNN
	1    6500 5500
	1    0    0    -1  
$EndComp
$Comp
L R R50
U 1 1 4F3594D5
P 6700 3550
F 0 "R50" V 6780 3550 50  0000 C CNN
F 1 "1k" V 6700 3550 50  0000 C CNN
	1    6700 3550
	1    0    0    -1  
$EndComp
$Comp
L R R47
U 1 1 4F3594AE
P 7400 4050
F 0 "R47" V 7480 4050 50  0000 C CNN
F 1 "10k" V 7400 4050 50  0000 C CNN
	1    7400 4050
	0    -1   -1   0   
$EndComp
$Comp
L NPN Q8
U 1 1 4F359444
P 6800 4050
F 0 "Q8" H 6800 3900 50  0000 R CNN
F 1 "NPN" H 6800 4200 50  0000 R CNN
	1    6800 4050
	-1   0    0    -1  
$EndComp
Text GLabel 3700 2850 0    60   Input ~ 0
+5V
$Comp
L FUSE F2
U 1 1 4F0BBA9E
P 4250 2850
F 0 "F2" H 4350 2900 40  0000 C CNN
F 1 "1A" H 4150 2800 40  0000 C CNN
	1    4250 2850
	1    0    0    -1  
$EndComp
Text GLabel 5300 5500 0    60   Input ~ 0
GPS_RX_FROM_BRIDGE
$Comp
L GND #PWR032
U 1 1 4F0BBA5C
P 7950 4200
F 0 "#PWR032" H 7950 4200 30  0001 C CNN
F 1 "GND" H 7950 4130 30  0001 C CNN
	1    7950 4200
	1    0    0    -1  
$EndComp
Text GLabel 6300 3850 0    60   Output ~ 0
GPS_TX_TO_BRIDGE
Text GLabel 9150 3750 0    60   Output ~ 0
CLOCK_FROM_GPS
NoConn ~ 9300 4350
NoConn ~ 9300 3650
$Comp
L CONN_8 J3
U 1 1 4F0BB9D1
P 9650 4000
F 0 "J3" H 9650 4450 60  0000 C CNN
F 1 "RJ45 GPS CONNECTOR" H 9650 3500 60  0000 C CNN
	1    9650 4000
	1    0    0    -1  
$EndComp
Text Notes 3100 1250 0    500  ~ 0
GPS Module
$EndSCHEMATC
