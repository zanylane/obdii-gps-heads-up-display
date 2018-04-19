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
Sheet 7 11
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
	6500 3850 6500 3750
Wire Wire Line
	6500 3750 5600 3750
Connection ~ 5800 3950
Wire Wire Line
	5800 3950 5800 4150
Wire Wire Line
	5800 4150 5600 4150
Wire Wire Line
	5950 3450 5600 3450
Wire Wire Line
	4550 3650 4800 3650
Connection ~ 4350 4150
Wire Wire Line
	4800 4150 4350 4150
Wire Wire Line
	4350 4250 4350 3950
Wire Wire Line
	4350 3950 4800 3950
Wire Wire Line
	4800 4050 4350 4050
Connection ~ 4350 4050
Wire Wire Line
	4550 3750 4800 3750
Wire Wire Line
	4800 3450 4550 3450
Wire Wire Line
	5950 3950 5600 3950
Wire Wire Line
	5800 4050 5600 4050
Connection ~ 5800 4050
$Comp
L GND #PWR028
U 1 1 4F36DA1C
P 6500 3850
F 0 "#PWR028" H 6500 3850 30  0001 C CNN
F 1 "GND" H 6500 3780 30  0001 C CNN
	1    6500 3850
	1    0    0    -1  
$EndComp
NoConn ~ 4800 3550
NoConn ~ 4800 3850
NoConn ~ 5600 3850
NoConn ~ 5600 3650
NoConn ~ 5600 3550
Text GLabel 5950 3950 2    60   Input ~ 0
+5V
Text GLabel 5950 3450 2    60   Input ~ 0
DISPLAY_CLOCK
$Comp
L GND #PWR029
U 1 1 4F0BB7BD
P 4350 4250
F 0 "#PWR029" H 4350 4250 30  0001 C CNN
F 1 "GND" H 4350 4180 30  0001 C CNN
	1    4350 4250
	1    0    0    -1  
$EndComp
Text GLabel 4550 3750 0    60   Input ~ 0
DISPLAY_DATA
Text GLabel 4550 3650 0    60   Input ~ 0
DISPLAY_WRITE
Text GLabel 4550 3450 0    60   Input ~ 0
DISPLAY_CHIP_SELECT
$Comp
L CONN_8X2 J7
U 1 1 4F0BB674
P 5200 3800
F 0 "J7" H 5200 4250 60  0000 C CNN
F 1 "LED DISPLAY" V 5200 3800 50  0000 C CNN
	1    5200 3800
	1    0    0    -1  
$EndComp
Text Notes 3400 1550 0    500  ~ 0
LED Display
$EndSCHEMATC
