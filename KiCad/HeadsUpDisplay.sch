EESchema Schematic File Version 2  date 12/12/2011 8:23:59 PM
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
LIBS:HeadsUpDisplay_MCU-cache
EELAYER 25  0
EELAYER END
$Descr User 10998 8498
encoding utf-8
Sheet 1 1
Title "Microprocessor"
Date "13 dec 2011"
Rev "1"
Comp "OSU Senior Design 2012 Group 12 - Garmin Heads Up Display"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 5700 6650 0    60   ~ 0
Spare Connection Points
Text Notes 4950 2500 0    60   ~ 0
Download
Wire Wire Line
	6350 5950 5650 5950
Wire Wire Line
	6350 6150 5650 6150
Wire Wire Line
	6350 6350 5650 6350
Wire Wire Line
	6100 4700 6800 4700
Wire Wire Line
	6800 4900 6100 4900
Wire Wire Line
	6800 5100 6100 5100
Wire Wire Line
	6800 4500 6100 4500
Connection ~ 9550 4250
Wire Wire Line
	9800 4250 6100 4250
Connection ~ 8400 4150
Wire Wire Line
	8600 4150 6100 4150
Wire Wire Line
	8400 3800 9250 3800
Wire Wire Line
	8400 3800 8400 4150
Wire Wire Line
	9250 3800 9250 3750
Connection ~ 9100 3250
Wire Wire Line
	9100 3200 9100 3250
Connection ~ 3650 3100
Wire Wire Line
	3600 3100 4200 3100
Connection ~ 8150 3000
Wire Wire Line
	8150 3000 8150 3800
Wire Wire Line
	8150 3800 7600 3800
Wire Wire Line
	7300 3500 6100 3500
Wire Wire Line
	5050 2150 4750 2150
Wire Wire Line
	5350 2050 5700 2050
Wire Wire Line
	5350 2150 5700 2150
Wire Wire Line
	6650 3200 6100 3200
Wire Wire Line
	7650 3000 7500 3000
Wire Wire Line
	6100 2900 6400 2900
Wire Wire Line
	4000 3850 4000 3800
Connection ~ 4050 2900
Wire Wire Line
	4050 2900 4050 2800
Wire Wire Line
	4050 2800 4200 2800
Wire Wire Line
	3650 3100 3650 3400
Wire Wire Line
	4200 3400 4000 3400
Wire Wire Line
	4200 4250 3650 4250
Wire Wire Line
	6100 3850 6750 3850
Wire Wire Line
	6100 4600 6750 4600
Connection ~ 4000 5100
Wire Wire Line
	4000 5000 4200 5000
Wire Wire Line
	4000 5100 4200 5100
Wire Wire Line
	4000 5300 4000 4900
Wire Wire Line
	4000 4900 4200 4900
Connection ~ 4000 5000
Wire Wire Line
	6100 3950 6750 3950
Wire Wire Line
	6100 3750 6750 3750
Wire Wire Line
	4200 4150 3650 4150
Wire Wire Line
	4000 3800 3650 3800
Wire Wire Line
	3000 2900 3000 3100
Connection ~ 3000 2900
Wire Wire Line
	6100 2800 6400 2800
Wire Wire Line
	8300 3100 8300 3000
Wire Wire Line
	8300 3000 8050 3000
Wire Wire Line
	7000 3000 6100 3000
Wire Wire Line
	6650 3100 6100 3100
Wire Wire Line
	6650 3300 6100 3300
Wire Wire Line
	5350 2250 5700 2250
Wire Wire Line
	5050 2250 4750 2250
Wire Wire Line
	5050 2050 4750 2050
Wire Wire Line
	6100 3400 7300 3400
Wire Wire Line
	7300 3400 7300 3250
Wire Wire Line
	7300 3250 7900 3250
Wire Wire Line
	7900 3250 7900 3500
Wire Wire Line
	6750 3650 6100 3650
Wire Wire Line
	2800 2900 4200 2900
Wire Wire Line
	8300 4050 8300 3750
Wire Wire Line
	8300 3750 8950 3750
Wire Wire Line
	8600 4050 6100 4050
Connection ~ 8300 4050
Wire Wire Line
	9550 4250 9550 3750
Wire Wire Line
	9550 3250 8950 3250
Connection ~ 9250 3250
Wire Wire Line
	6800 4400 6100 4400
Wire Wire Line
	6800 5000 6100 5000
Wire Wire Line
	6800 4800 6100 4800
Wire Wire Line
	5650 6450 6350 6450
Wire Wire Line
	5650 6250 6350 6250
Wire Wire Line
	5650 6050 6350 6050
Text Label 5650 6450 0    60   ~ 0
SPARE_6
Text Label 5650 6350 0    60   ~ 0
SPARE_5
Text Label 5650 6250 0    60   ~ 0
SPARE_4
Text Label 5650 6150 0    60   ~ 0
SPARE_3
Text Label 5650 6050 0    60   ~ 0
SPARE_2
Text Label 5650 5950 0    60   ~ 0
SPARE_1
$Comp
L CONN_6 P?
U 1 1 4EE6CC0B
P 6700 6200
F 0 "P?" V 6650 6200 60  0000 C CNN
F 1 "CONN_6" V 6750 6200 60  0000 C CNN
	1    6700 6200
	1    0    0    -1  
$EndComp
$Comp
L RESONATEUR X?
U 1 1 4EE46BE3
P 7600 3550
F 0 "X?" H 7620 3750 60  0000 C CNN
F 1 "RESONATOR" H 8030 3350 60  0000 C CNN
	1    7600 3550
	1    0    0    -1  
$EndComp
Text Notes 2750 1400 0    400  ~ 0
Microprocessor\n
Text GLabel 6800 5000 2    50   BiDi ~ 0
DISPLAY_DATA
Text GLabel 6800 5100 2    50   Output ~ 0
DISPLAY_WRITE
Text GLabel 6800 4900 2    50   Input ~ 0
ROTARY_ENCODER_B
Text GLabel 6800 4800 2    50   Input ~ 0
ROTARY_ENCODER_A
Text GLabel 6800 4700 2    50   Input ~ 0
ROTARY_PUSH_BUTTON
Text GLabel 6800 4500 2    50   Output ~ 0
OBD_MICRO_TX
Text GLabel 6800 4400 2    50   Input ~ 0
OBD_MICRO_RX
Text Label 9800 4250 2    50   ~ 0
RST
$Comp
L R R?
U 1 1 4EE4680B
P 9550 3500
F 0 "R?" V 9630 3500 50  0000 C CNN
F 1 "10K" V 9550 3500 50  0000 C CNN
	1    9550 3500
	-1   0    0    1   
$EndComp
Text GLabel 8600 4150 2    50   BiDi ~ 0
BRIDGE_I2C_SCL
Text GLabel 8600 4050 2    50   BiDi ~ 0
BRIDGE_I2C_SDA
$Comp
L R R?
U 1 1 4EE466FB
P 9250 3500
F 0 "R?" V 9330 3500 50  0000 C CNN
F 1 "10K" V 9250 3500 50  0000 C CNN
	1    9250 3500
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 4EE466EA
P 8950 3500
F 0 "R?" V 9030 3500 50  0000 C CNN
F 1 "10K" V 8950 3500 50  0000 C CNN
	1    8950 3500
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR01
U 1 1 4EE466DD
P 9100 3200
F 0 "#PWR01" H 9100 3290 20  0001 C CNN
F 1 "+5V" H 9100 3290 30  0000 C CNN
	1    9100 3200
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR02
U 1 1 4EE46638
P 2800 2900
F 0 "#PWR02" H 2800 2990 20  0001 C CNN
F 1 "+5V" H 2800 2990 30  0000 C CNN
	1    2800 2900
	1    0    0    -1  
$EndComp
Text GLabel 6750 3650 2    60   Input ~ 0
LIGHT_SENSE
Text Label 4750 2250 2    60   ~ 0
RST
Text Label 4750 2150 2    60   ~ 0
SCK
Text Label 4750 2050 2    60   ~ 0
MISO
Text Label 5700 2050 0    60   ~ 0
5V
Text Label 5700 2250 0    60   ~ 0
GND
Text Label 5700 2150 0    60   ~ 0
MOSI
Text Label 6650 3300 2    60   ~ 0
SCK
Text Label 6650 3200 2    60   ~ 0
MISO
Text Label 6650 3100 2    60   ~ 0
MOSI
$Comp
L AVR-ISP-6 CON?
U 1 1 4EE45BB2
P 5200 2150
F 0 "CON?" H 5120 2390 50  0000 C CNN
F 1 "AVR-ISP-6" H 4960 1920 50  0000 L BNN
F 2 "AVR-ISP-6" V 4680 2190 50  0001 C CNN
	1    5200 2150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 4EE45B5E
P 8300 3100
F 0 "#PWR03" H 8300 3100 30  0001 C CNN
F 1 "GND" H 8300 3030 30  0001 C CNN
	1    8300 3100
	1    0    0    -1  
$EndComp
$Comp
L LED D?
U 1 1 4EE45B46
P 7850 3000
F 0 "D?" H 7850 3100 50  0000 C CNN
F 1 "LED" H 7850 2900 50  0000 C CNN
	1    7850 3000
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 4EE45B3C
P 7250 3000
F 0 "R?" V 7330 3000 50  0000 C CNN
F 1 "1K" V 7250 3000 50  0000 C CNN
	1    7250 3000
	0    1    1    0   
$EndComp
Text GLabel 6400 2900 2    50   Output ~ 0
DISPLAY_CLOCK
Text GLabel 6400 2800 2    50   Output ~ 0
DISPLAY_CHIP_SELECT
$Comp
L INDUCTOR L?
U 1 1 4EE4599F
P 3300 3100
F 0 "L?" V 3250 3100 40  0000 C CNN
F 1 "10uH" V 3400 3100 40  0000 C CNN
	1    3300 3100
	0    -1   -1   0   
$EndComp
$Comp
L C C?
U 1 1 4EE458DB
P 3650 3600
F 0 "C?" H 3700 3700 50  0000 L CNN
F 1 "100nF" H 3700 3500 50  0000 L CNN
	1    3650 3600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 4EE4585C
P 4000 3850
F 0 "#PWR04" H 4000 3850 30  0001 C CNN
F 1 "GND" H 4000 3780 30  0001 C CNN
	1    4000 3850
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 4EE45802
P 4000 3600
F 0 "C?" H 4050 3700 50  0000 L CNN
F 1 "100nF" H 4050 3500 50  0000 L CNN
	1    4000 3600
	1    0    0    -1  
$EndComp
Text Label 3650 4150 0    60   ~ 0
SPARE_6
Text Label 3650 4250 0    60   ~ 0
SPARE_5
Text Label 6750 3750 2    60   ~ 0
SPARE_4
Text Label 6750 3850 2    60   ~ 0
SPARE_3
Text Label 6750 3950 2    60   ~ 0
SPARE_2
Text Label 6750 4600 2    60   ~ 0
SPARE_1
$Comp
L GND #PWR05
U 1 1 4EE4553A
P 4000 5300
F 0 "#PWR05" H 4000 5300 30  0001 C CNN
F 1 "GND" H 4000 5230 30  0001 C CNN
	1    4000 5300
	1    0    0    -1  
$EndComp
$Comp
L ATMEGA328P-A IC?
U 1 1 4EE454F7
P 5100 3900
F 0 "IC?" H 4400 5150 50  0000 L BNN
F 1 "ATMEGA328P-A" H 5300 2500 50  0000 L BNN
F 2 "TQFP32" H 4550 2550 50  0001 C CNN
	1    5100 3900
	1    0    0    -1  
$EndComp
$EndSCHEMATC
