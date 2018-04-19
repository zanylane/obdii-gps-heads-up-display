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
Sheet 11 11
Title ""
Date "4 apr 2012"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Connection ~ 3750 4000
Wire Wire Line
	3550 4000 5000 4000
Connection ~ 7950 4100
Wire Wire Line
	7950 3100 7750 3100
Wire Wire Line
	6450 3800 6200 3800
Wire Wire Line
	6200 3600 6450 3600
Connection ~ 6850 3250
Wire Wire Line
	6200 3500 6350 3500
Wire Wire Line
	6350 3500 6350 3250
Wire Wire Line
	6350 3250 7150 3250
Wire Wire Line
	7350 2800 7150 2800
Wire Wire Line
	7150 2800 7150 2650
Connection ~ 3750 3050
Wire Wire Line
	3750 3300 3750 3050
Wire Wire Line
	4800 3800 5000 3800
Wire Wire Line
	3250 3050 4900 3050
Wire Wire Line
	4900 3050 4900 3600
Wire Wire Line
	4900 3400 5000 3400
Connection ~ 4900 3400
Wire Wire Line
	4900 3600 5000 3600
Wire Wire Line
	5000 3500 4900 3500
Connection ~ 4900 3500
Wire Wire Line
	4600 3450 4600 3500
Wire Wire Line
	5000 3900 4800 3900
Wire Wire Line
	3750 4000 3750 3800
Wire Wire Line
	5000 4100 3650 4100
Wire Wire Line
	3650 4100 3650 3050
Connection ~ 3650 3050
Wire Wire Line
	7150 3250 7150 3100
Wire Wire Line
	7150 3100 7350 3100
Wire Wire Line
	6200 3400 6200 2650
Wire Wire Line
	6200 2650 7150 2650
Connection ~ 6850 2650
Wire Wire Line
	6200 3700 6450 3700
Wire Wire Line
	7950 4100 6200 4100
Wire Wire Line
	7950 4150 7950 2800
Wire Wire Line
	7950 2800 7750 2800
Connection ~ 7950 3100
Connection ~ 4600 3050
Connection ~ 4600 3050
Text GLabel 3550 4000 0    50   Input ~ 0
I2C_BRIDGE_IRQ
$Comp
L GND #PWR036
U 1 1 4F0BC2C6
P 7950 4150
F 0 "#PWR036" H 7950 4150 30  0001 C CNN
F 1 "GND" H 7950 4080 30  0001 C CNN
	1    7950 4150
	1    0    0    -1  
$EndComp
Text GLabel 6450 3800 2    60   Output ~ 0
GPS_RX_FROM_BRIDGE
Text GLabel 6450 3700 2    60   Input ~ 0
GPS_TX_TO_BRIDGE
Text GLabel 6450 3600 2    60   Input ~ 0
RESET
NoConn ~ 6200 4000
NoConn ~ 6200 3900
$Comp
L C C9
U 1 1 4F0BC1D5
P 7550 3100
F 0 "C9" V 7600 3200 50  0000 L CNN
F 1 "30pF" V 7600 2850 50  0000 L CNN
	1    7550 3100
	0    -1   -1   0   
$EndComp
$Comp
L C C8
U 1 1 4F0BC19C
P 7550 2800
F 0 "C8" V 7600 2900 50  0000 L CNN
F 1 "30pF" V 7600 2550 50  0000 L CNN
	1    7550 2800
	0    -1   -1   0   
$EndComp
$Comp
L CRYSTAL X3
U 1 1 4F0BC12A
P 6850 2950
F 0 "X3" V 7050 3050 60  0000 C CNN
F 1 "1.8432 MHz CRYSTAL" V 7300 2900 60  0000 C CNN
	1    6850 2950
	0    -1   -1   0   
$EndComp
$Comp
L R R7
U 1 1 4F0BBFF3
P 3750 3550
F 0 "R7" V 3830 3550 50  0000 C CNN
F 1 "1k" V 3750 3550 50  0000 C CNN
	1    3750 3550
	1    0    0    -1  
$EndComp
Text GLabel 4800 3900 0    60   BiDi ~ 0
BRIDGE_I2C_SDA
Text GLabel 4800 3800 0    60   BiDi ~ 0
BRIDGE_I2C_SCL
$Comp
L GND #PWR037
U 1 1 4F0BBF31
P 4600 3500
F 0 "#PWR037" H 4600 3500 30  0001 C CNN
F 1 "GND" H 4600 3430 30  0001 C CNN
	1    4600 3500
	1    0    0    -1  
$EndComp
$Comp
L C C7
U 1 1 4F0BBF2C
P 4600 3250
F 0 "C7" H 4650 3350 50  0000 L CNN
F 1 "100nF" H 4650 3150 50  0000 L CNN
	1    4600 3250
	1    0    0    -1  
$EndComp
Text GLabel 3250 3050 0    60   Input ~ 0
+3.3V
$Comp
L SC16IS740 IC2
U 1 1 4F0BBE7E
P 5600 3750
F 0 "IC2" H 5450 4250 60  0000 C CNN
F 1 "SC16IS740" H 5600 3200 60  0000 C CNN
	1    5600 3750
	1    0    0    -1  
$EndComp
Text Notes 2250 1450 0    500  ~ 0
I²C Bridge Module
$EndSCHEMATC
