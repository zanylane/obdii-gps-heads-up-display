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
Sheet 4 11
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
	2450 4900 2550 4900
Connection ~ 3350 3100
Connection ~ 5150 5400
Wire Wire Line
	5150 5650 5150 5400
Wire Wire Line
	4750 6300 4750 6150
Connection ~ 4750 6900
Wire Wire Line
	5150 6700 5150 6900
Wire Wire Line
	5150 6900 4750 6900
Wire Wire Line
	4550 5400 5700 5400
Wire Wire Line
	4850 5000 4850 4500
Wire Wire Line
	4850 4500 4650 4500
Wire Wire Line
	4650 4500 4650 4550
Wire Wire Line
	3350 5500 3200 5500
Wire Wire Line
	3200 5500 3200 6100
Wire Wire Line
	3200 6100 2000 6100
Wire Wire Line
	3350 5300 2900 5300
Wire Wire Line
	2900 5300 2900 5800
Wire Wire Line
	2900 5800 2550 5800
Wire Wire Line
	2550 4900 2550 5400
Wire Wire Line
	3550 1650 3350 1650
Wire Wire Line
	2850 3100 2700 3100
Connection ~ 8450 2950
Wire Wire Line
	8950 2950 8450 2950
Wire Wire Line
	8450 3050 8450 2800
Wire Wire Line
	7050 3250 7300 3250
Wire Wire Line
	2700 3100 2700 3000
Wire Wire Line
	3400 2700 2900 2700
Connection ~ 2250 2100
Wire Wire Line
	2250 2100 2250 1650
Wire Wire Line
	2250 1650 1200 1650
Wire Wire Line
	2050 2700 2500 2700
Wire Wire Line
	1100 2100 1550 2100
Wire Wire Line
	1300 2100 1300 2700
Wire Wire Line
	1300 2700 1550 2700
Connection ~ 1300 2100
Wire Wire Line
	2500 2100 2050 2100
Wire Wire Line
	1200 3100 2250 3100
Wire Wire Line
	2250 3100 2250 2700
Connection ~ 2250 2700
Wire Wire Line
	2900 2100 3400 2100
Wire Wire Line
	3400 2100 3400 2900
Connection ~ 3400 2700
Wire Wire Line
	2700 1800 2700 1650
Wire Wire Line
	7800 3250 8150 3250
Wire Wire Line
	8450 2300 8450 2100
Wire Wire Line
	8450 3650 8450 3450
Wire Wire Line
	2000 5200 3350 5200
Wire Wire Line
	3350 3100 3550 3100
Wire Wire Line
	2700 1650 2850 1650
Wire Wire Line
	2550 5800 2550 5900
Wire Wire Line
	2550 5400 3350 5400
Connection ~ 2550 5400
Connection ~ 2550 5800
Wire Wire Line
	4550 5200 4650 5200
Wire Wire Line
	4650 5200 4650 5050
Wire Wire Line
	5700 5300 4550 5300
Wire Wire Line
	4750 7050 4750 6700
Wire Wire Line
	5150 6300 5150 6150
Wire Wire Line
	4750 5650 4750 5300
Connection ~ 4750 5300
Wire Wire Line
	8300 1450 8450 1450
Wire Wire Line
	8450 1450 8450 1700
Text GLabel 2450 4900 0    60   Input ~ 0
+5V
Text GLabel 8300 1450 0    60   Input ~ 0
+5V
$Comp
L GND #PWR011
U 1 1 4F0A667A
P 4750 7050
F 0 "#PWR011" H 4750 7050 30  0001 C CNN
F 1 "GND" H 4750 6980 30  0001 C CNN
	1    4750 7050
	1    0    0    -1  
$EndComp
$Comp
L C C13
U 1 1 4F0A6646
P 5150 6500
F 0 "C13" H 5200 6600 50  0000 L CNN
F 1 "560pF" H 5200 6400 50  0000 L CNN
	1    5150 6500
	1    0    0    -1  
$EndComp
$Comp
L C C12
U 1 1 4F0A6643
P 4750 6500
F 0 "C12" H 4800 6600 50  0000 L CNN
F 1 "560pF" H 4800 6400 50  0000 L CNN
	1    4750 6500
	1    0    0    -1  
$EndComp
$Comp
L R R34
U 1 1 4F0A661A
P 5150 5900
F 0 "R34" V 5230 5900 50  0000 C CNN
F 1 "100" V 5150 5900 50  0000 C CNN
	1    5150 5900
	1    0    0    -1  
$EndComp
$Comp
L R R33
U 1 1 4F0A6612
P 4750 5900
F 0 "R33" V 4830 5900 50  0000 C CNN
F 1 "100" V 4750 5900 50  0000 C CNN
	1    4750 5900
	1    0    0    -1  
$EndComp
NoConn ~ 4550 5500
Text GLabel 5700 5400 2    60   BiDi ~ 0
CAN_LO
Text GLabel 5700 5300 2    60   BiDi ~ 0
CAN_HI
$Comp
L R R32
U 1 1 4F0A656E
P 4650 4800
F 0 "R32" V 4730 4800 50  0000 C CNN
F 1 "4.7k" V 4650 4800 50  0000 C CNN
	1    4650 4800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 4F0A6567
P 4850 5000
F 0 "#PWR012" H 4850 5000 30  0001 C CNN
F 1 "GND" H 4850 4930 30  0001 C CNN
	1    4850 5000
	1    0    0    -1  
$EndComp
Text GLabel 2000 6100 0    60   Input ~ 0
CAN_RX
$Comp
L GND #PWR013
U 1 1 4F0A6518
P 2550 5900
F 0 "#PWR013" H 2550 5900 30  0001 C CNN
F 1 "GND" H 2550 5830 30  0001 C CNN
	1    2550 5900
	1    0    0    -1  
$EndComp
$Comp
L C C11
U 1 1 4F0A64BA
P 2550 5600
F 0 "C11" H 2600 5700 50  0000 L CNN
F 1 "100nF" H 2600 5500 50  0000 L CNN
	1    2550 5600
	1    0    0    -1  
$EndComp
$Comp
L R R26
U 1 1 4F0A6412
P 3100 1650
F 0 "R26" V 3180 1650 50  0000 C CNN
F 1 "1k" V 3100 1650 50  0000 C CNN
	1    3100 1650
	0    -1   -1   0   
$EndComp
$Comp
L R R27
U 1 1 4F0A640B
P 3100 3100
F 0 "R27" V 3180 3100 50  0000 C CNN
F 1 "1k" V 3100 3100 50  0000 C CNN
	1    3100 3100
	0    -1   -1   0   
$EndComp
Text GLabel 2000 5200 0    60   Output ~ 0
CAN_TX
$Comp
L MCP2551 IC6
U 1 1 4F0A6352
P 3750 5500
F 0 "IC6" H 3950 5950 50  0000 C CNN
F 1 "MCP2551" H 3950 5350 50  0000 C CNN
F 2 "SparkFun-SO08" H 3750 5650 50  0001 C CNN
	1    3750 5500
	1    0    0    -1  
$EndComp
Text GLabel 8950 2950 2    60   Output ~ 0
J1850_BUS-
$Comp
L GND #PWR014
U 1 1 4F0A62E3
P 8450 3650
F 0 "#PWR014" H 8450 3650 30  0001 C CNN
F 1 "GND" H 8450 3580 30  0001 C CNN
	1    8450 3650
	1    0    0    -1  
$EndComp
Text GLabel 7050 3250 0    60   Input ~ 0
~J1850_BUS-_TX
$Comp
L R R31
U 1 1 4F0A62A2
P 7550 3250
F 0 "R31" V 7630 3250 50  0000 C CNN
F 1 "1k" V 7550 3250 50  0000 C CNN
	1    7550 3250
	0    -1   -1   0   
$EndComp
$Comp
L NPN Q1
U 1 1 4F0A6296
P 8350 3250
F 0 "Q1" H 8350 3100 50  0000 R CNN
F 1 "NPN" H 8350 3400 50  0000 R CNN
	1    8350 3250
	1    0    0    -1  
$EndComp
$Comp
L R R30
U 1 1 4F0A628D
P 8450 2550
F 0 "R30" V 8530 2550 50  0000 C CNN
F 1 "10k" V 8450 2550 50  0000 C CNN
	1    8450 2550
	1    0    0    -1  
$EndComp
$Comp
L DIODE D3
U 1 1 4F0A6283
P 8450 1900
F 0 "D3" H 8450 2000 40  0000 C CNN
F 1 "DIODE" H 8450 1800 40  0000 C CNN
	1    8450 1900
	0    1    1    0   
$EndComp
Text GLabel 3550 3100 2    60   Input ~ 0
~ISO_K_TX
Text GLabel 3550 1650 2    60   Input ~ 0
~ISO_L_TX
$Comp
L GND #PWR015
U 1 1 4F0A6150
P 3400 2900
F 0 "#PWR015" H 3400 2900 30  0001 C CNN
F 1 "GND" H 3400 2830 30  0001 C CNN
	1    3400 2900
	1    0    0    -1  
$EndComp
$Comp
L NPN Q6
U 1 1 4F0A610A
P 2700 2000
F 0 "Q6" H 2700 1850 50  0000 R CNN
F 1 "NPN" H 2700 2150 50  0000 R CNN
	1    2700 2000
	0    -1   1    0   
$EndComp
$Comp
L NPN Q5
U 1 1 4F0A60FF
P 2700 2800
F 0 "Q5" H 2700 2650 50  0000 R CNN
F 1 "NPN" H 2700 2950 50  0000 R CNN
	1    2700 2800
	0    -1   -1   0   
$EndComp
Text GLabel 1200 3100 0    60   Output ~ 0
K-LINE
Text GLabel 1200 1650 0    60   Output ~ 0
L-LINE
$Comp
L R R29
U 1 1 4F0A608C
P 1800 2700
F 0 "R29" V 1880 2700 50  0000 C CNN
F 1 "510" V 1800 2700 50  0000 C CNN
	1    1800 2700
	0    -1   -1   0   
$EndComp
$Comp
L R R28
U 1 1 4F0A606B
P 1800 2100
F 0 "R28" V 1880 2100 50  0000 C CNN
F 1 "510" V 1800 2100 50  0000 C CNN
	1    1800 2100
	0    -1   -1   0   
$EndComp
Text GLabel 1100 2100 0    60   Input ~ 0
VBAT_SW
Text Notes 1000 1250 0    500  ~ 0
OBD Voltage Shifter pg. 2
$EndSCHEMATC
