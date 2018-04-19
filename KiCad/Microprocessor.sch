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
Sheet 10 11
Title ""
Date "4 apr 2012"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Connection ~ 7800 3200
Wire Wire Line
	7800 3350 7800 2600
Connection ~ 7600 3200
Wire Wire Line
	7800 3200 7600 3200
Wire Wire Line
	7600 3200 7600 3800
Connection ~ 7050 3200
Wire Wire Line
	7200 3200 6750 3200
Wire Wire Line
	6850 3500 6850 3800
Wire Wire Line
	6850 3500 5550 3500
Connection ~ 2900 2900
Wire Wire Line
	2900 2900 2900 2650
Wire Wire Line
	2900 2650 3100 2650
Connection ~ 2450 3100
Wire Wire Line
	2450 2900 2450 3400
Wire Wire Line
	5100 6050 5800 6050
Wire Wire Line
	5100 6250 5800 6250
Wire Wire Line
	6250 4800 5550 4800
Wire Wire Line
	6250 5000 5550 5000
Wire Wire Line
	6250 4400 5550 4400
Connection ~ 8700 3250
Wire Wire Line
	8400 3250 9000 3250
Connection ~ 7750 4050
Wire Wire Line
	5550 4050 8050 4050
Wire Wire Line
	8400 3750 7750 3750
Wire Wire Line
	7750 3750 7750 4050
Wire Wire Line
	6200 3650 5550 3650
Wire Wire Line
	5550 3400 6750 3400
Wire Wire Line
	4500 2050 4200 2050
Wire Wire Line
	4500 2250 4200 2250
Wire Wire Line
	4800 2250 5150 2250
Wire Wire Line
	6100 3300 5550 3300
Wire Wire Line
	6100 3100 5550 3100
Wire Wire Line
	6450 3000 5550 3000
Wire Wire Line
	7800 2600 7550 2600
Wire Wire Line
	5550 2800 5850 2800
Connection ~ 2450 2900
Wire Wire Line
	3650 4150 3100 4150
Wire Wire Line
	5550 3750 6200 3750
Wire Wire Line
	5550 3950 6200 3950
Connection ~ 3450 5000
Wire Wire Line
	3650 4900 3450 4900
Wire Wire Line
	3450 4900 3450 5300
Wire Wire Line
	3650 5100 3450 5100
Wire Wire Line
	3450 5000 3650 5000
Connection ~ 3450 5100
Wire Wire Line
	5550 4600 6200 4600
Wire Wire Line
	5550 3850 6200 3850
Wire Wire Line
	3650 4250 3100 4250
Wire Wire Line
	3650 3400 3450 3400
Wire Wire Line
	3100 3100 3100 3400
Wire Wire Line
	3650 2800 3500 2800
Wire Wire Line
	3500 2800 3500 2900
Connection ~ 3500 2900
Wire Wire Line
	3450 3850 3450 3800
Wire Wire Line
	5550 2900 5850 2900
Wire Wire Line
	7150 2600 7000 2600
Wire Wire Line
	6100 3200 5550 3200
Wire Wire Line
	4800 2150 5150 2150
Wire Wire Line
	4500 2150 4200 2150
Wire Wire Line
	3650 3100 3050 3100
Connection ~ 3100 3100
Wire Wire Line
	8700 3750 8700 3800
Wire Wire Line
	7850 4150 7850 3800
Wire Wire Line
	7850 3800 8700 3800
Wire Wire Line
	5550 4150 8050 4150
Connection ~ 7850 4150
Wire Wire Line
	5550 4250 9250 4250
Connection ~ 9000 4250
Wire Wire Line
	6250 4500 5550 4500
Wire Wire Line
	6250 5100 5550 5100
Wire Wire Line
	6250 4900 5550 4900
Wire Wire Line
	5550 4700 6250 4700
Wire Wire Line
	5800 6350 5100 6350
Wire Wire Line
	5800 6150 5100 6150
Wire Wire Line
	3450 3800 2450 3800
Connection ~ 3100 3800
Wire Wire Line
	9000 3750 9000 4400
Wire Wire Line
	9000 4400 9450 4400
Wire Wire Line
	3650 2900 2150 2900
Wire Wire Line
	4800 2050 5150 2050
Wire Wire Line
	8950 3150 8850 3150
Wire Wire Line
	8850 3150 8850 3250
Connection ~ 8850 3250
Wire Wire Line
	6750 3400 6750 3200
Wire Wire Line
	6850 3800 7200 3800
Connection ~ 7050 3800
Wire Wire Line
	7000 2600 7000 3000
Wire Wire Line
	7000 3000 6950 3000
$Comp
L C C23
U 1 1 4F2CC3F2
P 7400 3800
F 0 "C23" H 7450 3900 50  0000 L CNN
F 1 "30pF" H 7450 3700 50  0000 L CNN
	1    7400 3800
	0    -1   -1   0   
$EndComp
$Comp
L C C22
U 1 1 4F2CC3EB
P 7400 3200
F 0 "C22" H 7450 3300 50  0000 L CNN
F 1 "30pF" H 7450 3100 50  0000 L CNN
	1    7400 3200
	0    -1   -1   0   
$EndComp
$Comp
L CRYSTAL X1
U 1 1 4F2CC3B0
P 7050 3500
F 0 "X1" H 7050 3650 60  0000 C CNN
F 1 "CRYSTAL" H 7050 3350 60  0000 C CNN
	1    7050 3500
	0    -1   -1   0   
$EndComp
Text GLabel 6200 4600 2    50   Input ~ 0
I2C_BRIDGE_IRQ
$Comp
L CONN_4 J2
U 1 1 4F18FBCE
P 6150 6200
F 0 "J2" H 6150 6450 50  0000 C CNN
F 1 "Spare Connection Points" H 6150 5950 50  0000 C CNN
	1    6150 6200
	1    0    0    -1  
$EndComp
Text Label 3100 2650 0    60   ~ 0
5V
Text GLabel 8950 3150 2    60   Input ~ 0
+5V
Text GLabel 2150 2900 0    60   Input ~ 0
+5V
Text GLabel 3100 4250 0    50   Input ~ 0
CLOCK_FROM_GPS
Text GLabel 9450 4400 2    60   Output ~ 0
RESET
$Comp
L C C5
U 1 1 4F0A0AD1
P 2450 3600
F 0 "C5" H 2500 3700 50  0000 L CNN
F 1 "100nF" H 2500 3500 50  0000 L CNN
	1    2450 3600
	1    0    0    -1  
$EndComp
$Comp
L ATMEGA328P-A IC1
U 1 1 4F0A0951
P 4550 3900
F 0 "IC1" H 3850 5150 50  0000 L BNN
F 1 "ATMEGA328P-A" H 4750 2500 50  0000 L BNN
F 2 "TQFP32" H 4000 2550 50  0001 C CNN
	1    4550 3900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR033
U 1 1 4F0A0950
P 3450 5300
F 0 "#PWR033" H 3450 5300 30  0001 C CNN
F 1 "GND" H 3450 5230 30  0001 C CNN
	1    3450 5300
	1    0    0    -1  
$EndComp
Text Label 6200 3950 2    60   ~ 0
SPARE_1
Text Label 6200 3850 2    60   ~ 0
SPARE_2
Text Label 6200 3750 2    60   ~ 0
SPARE_3
Text Label 3100 4150 0    60   ~ 0
SPARE_4
$Comp
L C C3
U 1 1 4F0A094F
P 3450 3600
F 0 "C3" H 3500 3700 50  0000 L CNN
F 1 "100nF" H 3500 3500 50  0000 L CNN
	1    3450 3600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR034
U 1 1 4F0A094E
P 3450 3850
F 0 "#PWR034" H 3450 3850 30  0001 C CNN
F 1 "GND" H 3450 3780 30  0001 C CNN
	1    3450 3850
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 4F0A094D
P 3100 3600
F 0 "C4" H 3150 3700 50  0000 L CNN
F 1 "100nF" H 3150 3500 50  0000 L CNN
	1    3100 3600
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR L1
U 1 1 4F0A094C
P 2750 3100
F 0 "L1" V 2700 3100 40  0000 C CNN
F 1 "10uH" V 2850 3100 40  0000 C CNN
	1    2750 3100
	0    -1   -1   0   
$EndComp
Text GLabel 6250 5100 2    50   Output ~ 0
DISPLAY_CHIP_SELECT
Text GLabel 6250 5000 2    50   Output ~ 0
DISPLAY_CLOCK
$Comp
L R R6
U 1 1 4F0A094B
P 6700 3000
F 0 "R6" V 6780 3000 50  0000 C CNN
F 1 "1K" V 6700 3000 50  0000 C CNN
	1    6700 3000
	0    1    1    0   
$EndComp
$Comp
L LED LED1
U 1 1 4F0A094A
P 7350 2600
F 0 "LED1" H 7350 2700 50  0000 C CNN
F 1 "LED" H 7350 2500 50  0000 C CNN
	1    7350 2600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR035
U 1 1 4F0A0949
P 7800 3350
F 0 "#PWR035" H 7800 3350 30  0001 C CNN
F 1 "GND" H 7800 3280 30  0001 C CNN
	1    7800 3350
	1    0    0    -1  
$EndComp
$Comp
L AVR-ISP-6 J1
U 1 1 4F0A0948
P 4650 2150
F 0 "J1" H 4570 2390 50  0000 C CNN
F 1 "AVR-ISP-6" H 4410 1920 50  0000 L BNN
F 2 "AVR-ISP-6" V 4130 2190 50  0001 C CNN
	1    4650 2150
	1    0    0    -1  
$EndComp
Text Label 6100 3100 2    60   ~ 0
MOSI
Text Label 6100 3200 2    60   ~ 0
MISO
Text Label 6100 3300 2    60   ~ 0
SCK
Text Label 5150 2150 0    60   ~ 0
MOSI
Text Label 5150 2250 0    60   ~ 0
GND
Text Label 5150 2050 0    60   ~ 0
5V
Text Label 4200 2050 2    60   ~ 0
MISO
Text Label 4200 2150 2    60   ~ 0
SCK
Text Label 4200 2250 2    60   ~ 0
RST
Text GLabel 6200 3650 2    60   Input ~ 0
LIGHT_SENSE
$Comp
L R R5
U 1 1 4F0A0945
P 8400 3500
F 0 "R5" V 8480 3500 50  0000 C CNN
F 1 "10K" V 8400 3500 50  0000 C CNN
	1    8400 3500
	-1   0    0    1   
$EndComp
$Comp
L R R4
U 1 1 4F0A0944
P 8700 3500
F 0 "R4" V 8780 3500 50  0000 C CNN
F 1 "10K" V 8700 3500 50  0000 C CNN
	1    8700 3500
	-1   0    0    1   
$EndComp
Text GLabel 8050 4050 2    50   BiDi ~ 0
BRIDGE_I2C_SDA
Text GLabel 8050 4150 2    50   BiDi ~ 0
BRIDGE_I2C_SCL
$Comp
L R R3
U 1 1 4F0A0943
P 9000 3500
F 0 "R3" V 9080 3500 50  0000 C CNN
F 1 "10K" V 9000 3500 50  0000 C CNN
	1    9000 3500
	-1   0    0    1   
$EndComp
Text Label 9250 4250 2    50   ~ 0
RST
Text GLabel 6250 4400 2    50   Input ~ 0
OBD_MICRO_RX
Text GLabel 6250 4500 2    50   Output ~ 0
OBD_MICRO_TX
Text GLabel 6250 4700 2    50   Input ~ 0
ROTARY_PUSH_BUTTON
Text GLabel 5850 2800 2    50   Input ~ 0
ROTARY_ENCODER_A
Text GLabel 5850 2900 2    50   Input ~ 0
ROTARY_ENCODER_B
Text GLabel 6250 4900 2    50   Output ~ 0
DISPLAY_WRITE
Text GLabel 6250 4800 2    50   Output ~ 0
DISPLAY_DATA
Text Notes 2200 1400 0    400  ~ 0
Microprocessor\n
Text Label 5100 6050 0    60   ~ 0
SPARE_1
Text Label 5100 6150 0    60   ~ 0
SPARE_2
Text Label 5100 6250 0    60   ~ 0
SPARE_3
Text Label 5100 6350 0    60   ~ 0
SPARE_4
Text Notes 4400 2500 0    60   ~ 0
Download
$EndSCHEMATC
