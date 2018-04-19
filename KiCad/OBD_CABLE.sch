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
Sheet 2 11
Title ""
Date "4 apr 2012"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Connection ~ 5450 4500
Connection ~ 5450 4400
Connection ~ 5450 4300
Connection ~ 5450 4200
Connection ~ 5450 4100
Connection ~ 5450 4000
Connection ~ 5450 3900
Connection ~ 5450 3800
Connection ~ 5450 3700
Text Notes 2000 1700 0    500  ~ 0
OBD Cable Connector
Wire Wire Line
	6800 4500 5450 4500
Wire Wire Line
	6800 4300 5450 4300
Wire Wire Line
	6800 4100 5450 4100
Wire Wire Line
	6800 3900 5450 3900
Wire Wire Line
	6800 3700 5450 3700
Wire Wire Line
	5450 3800 6100 3800
Wire Wire Line
	5450 4000 6100 4000
Wire Wire Line
	5450 4200 6100 4200
Wire Wire Line
	5450 4400 6100 4400
Text GLabel 6800 4500 2    60   BiDi ~ 0
CAN_LO
Text GLabel 6100 4400 2    60   Output ~ 0
VBAT
Text GLabel 6800 4300 2    60   BiDi ~ 0
K-LINE
Text GLabel 6100 4200 2    60   BiDi ~ 0
L-LINE
Text GLabel 6800 4100 2    60   BiDi ~ 0
CAN_HI
Text GLabel 6100 4000 2    60   BiDi ~ 0
J1850_BUS+
Text GLabel 6800 3900 2    60   Output ~ 0
GND
Text GLabel 6100 3800 2    60   BiDi ~ 0
J1850_BUS-
Text GLabel 6800 3700 2    60   Output ~ 0
GND
$Comp
L DB9 J6
U 1 1 4F0A0D0B
P 5000 4100
F 0 "J6" H 5000 4650 70  0000 C CNN
F 1 "DB9" H 5000 3550 70  0000 C CNN
	1    5000 4100
	-1   0    0    1   
$EndComp
$EndSCHEMATC
