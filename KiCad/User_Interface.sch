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
Sheet 8 11
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
	5200 4100 5500 4100
Wire Wire Line
	5200 4300 5500 4300
Connection ~ 5000 4000
Connection ~ 5000 3500
Wire Wire Line
	4400 3500 5400 3500
Wire Wire Line
	5400 3500 5400 3900
Wire Wire Line
	5400 3900 5500 3900
Wire Wire Line
	5500 4000 3750 4000
Wire Wire Line
	3750 4000 3750 4050
Wire Wire Line
	5500 4400 5200 4400
Wire Wire Line
	5500 4200 5200 4200
Text GLabel 5200 4400 0    60   Input ~ 0
ROTARY_ENCODER_B
Text GLabel 5200 4300 0    60   Input ~ 0
ROTARY_ENCODER_A
Text GLabel 5200 4200 0    60   Input ~ 0
ROTARY_PUSH_BUTTON
Text GLabel 5200 4100 0    60   Input ~ 0
+5V
$Comp
L GND #PWR030
U 1 1 4F0BB8E5
P 3750 4050
F 0 "#PWR030" H 3750 4050 30  0001 C CNN
F 1 "GND" H 3750 3980 30  0001 C CNN
	1    3750 4050
	1    0    0    -1  
$EndComp
Text GLabel 4400 3500 0    60   Output ~ 0
LIGHT_SENSE
$Comp
L R R46
U 1 1 4F0BB8B6
P 5000 3750
F 0 "R46" V 5080 3750 50  0000 C CNN
F 1 "4.7k" V 5000 3750 50  0000 C CNN
	1    5000 3750
	1    0    0    -1  
$EndComp
$Comp
L CONN_6 J4
U 1 1 4F0BB886
P 5850 4150
F 0 "J4" H 5850 4500 60  0000 C CNN
F 1 "USER INTERFACE" H 5850 3700 60  0000 C CNN
	1    5850 4150
	1    0    0    -1  
$EndComp
Text Notes 2700 1300 0    500  ~ 0
User Interface
$EndSCHEMATC
