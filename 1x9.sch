EESchema Schematic File Version 4
LIBS:tetris-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L LED:WS2812B D?
U 1 1 5EA2FB91
P 2250 1850
AR Path="/5EA1A65A/5EA2FB91" Ref="D?"  Part="1" 
AR Path="/5EA2606F/5EA2FB91" Ref="D?"  Part="1" 
F 0 "D?" H 2450 2000 50  0000 L CNN
F 1 "WS2812B" H 2300 1600 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 2300 1550 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 2350 1475 50  0001 L TNN
	1    2250 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EA2FB97
P 2350 1550
AR Path="/5EA1A65A/5EA2FB97" Ref="C?"  Part="1" 
AR Path="/5EA2606F/5EA2FB97" Ref="C?"  Part="1" 
F 0 "C?" V 2150 1550 50  0000 C CNN
F 1 "0.1u" V 2250 1600 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2350 1550 50  0001 C CNN
F 3 "~" H 2350 1550 50  0001 C CNN
	1    2350 1550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EA2FB9D
P 2250 2150
AR Path="/5EA1A65A/5EA2FB9D" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA2FB9D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2250 1900 50  0001 C CNN
F 1 "GND" H 2350 2050 50  0000 C CNN
F 2 "" H 2250 2150 50  0001 C CNN
F 3 "" H 2250 2150 50  0001 C CNN
	1    2250 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EA2FBA3
P 2450 1550
AR Path="/5EA1A65A/5EA2FBA3" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA2FBA3" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2450 1300 50  0001 C CNN
F 1 "GND" V 2450 1450 50  0000 R CNN
F 2 "" H 2450 1550 50  0001 C CNN
F 3 "" H 2450 1550 50  0001 C CNN
	1    2450 1550
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EA2FBA9
P 2250 1550
AR Path="/5EA1A65A/5EA2FBA9" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA2FBA9" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2250 1400 50  0001 C CNN
F 1 "+5V" H 2150 1650 50  0000 C CNN
F 2 "" H 2250 1550 50  0001 C CNN
F 3 "" H 2250 1550 50  0001 C CNN
	1    2250 1550
	1    0    0    -1  
$EndComp
Connection ~ 2250 1550
$Comp
L LED:WS2812B D?
U 1 1 5EA2FBB0
P 2850 1850
AR Path="/5EA1A65A/5EA2FBB0" Ref="D?"  Part="1" 
AR Path="/5EA2606F/5EA2FBB0" Ref="D?"  Part="1" 
F 0 "D?" H 3050 2000 50  0000 L CNN
F 1 "WS2812B" H 2900 1600 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 2900 1550 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 2950 1475 50  0001 L TNN
	1    2850 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EA2FBB6
P 2950 1550
AR Path="/5EA1A65A/5EA2FBB6" Ref="C?"  Part="1" 
AR Path="/5EA2606F/5EA2FBB6" Ref="C?"  Part="1" 
F 0 "C?" V 2750 1550 50  0000 C CNN
F 1 "0.1u" V 2850 1600 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2950 1550 50  0001 C CNN
F 3 "~" H 2950 1550 50  0001 C CNN
	1    2950 1550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EA2FBBC
P 2850 2150
AR Path="/5EA1A65A/5EA2FBBC" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA2FBBC" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2850 1900 50  0001 C CNN
F 1 "GND" H 2950 2050 50  0000 C CNN
F 2 "" H 2850 2150 50  0001 C CNN
F 3 "" H 2850 2150 50  0001 C CNN
	1    2850 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EA2FBC2
P 3050 1550
AR Path="/5EA1A65A/5EA2FBC2" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA2FBC2" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3050 1300 50  0001 C CNN
F 1 "GND" V 3050 1450 50  0000 R CNN
F 2 "" H 3050 1550 50  0001 C CNN
F 3 "" H 3050 1550 50  0001 C CNN
	1    3050 1550
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EA2FBC8
P 2850 1550
AR Path="/5EA1A65A/5EA2FBC8" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA2FBC8" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2850 1400 50  0001 C CNN
F 1 "+5V" H 2750 1650 50  0000 C CNN
F 2 "" H 2850 1550 50  0001 C CNN
F 3 "" H 2850 1550 50  0001 C CNN
	1    2850 1550
	1    0    0    -1  
$EndComp
Connection ~ 2850 1550
$Comp
L LED:WS2812B D?
U 1 1 5EA2FBCF
P 3450 1850
AR Path="/5EA1A65A/5EA2FBCF" Ref="D?"  Part="1" 
AR Path="/5EA2606F/5EA2FBCF" Ref="D?"  Part="1" 
F 0 "D?" H 3650 2000 50  0000 L CNN
F 1 "WS2812B" H 3500 1600 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 3500 1550 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 3550 1475 50  0001 L TNN
	1    3450 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EA2FBD5
P 3550 1550
AR Path="/5EA1A65A/5EA2FBD5" Ref="C?"  Part="1" 
AR Path="/5EA2606F/5EA2FBD5" Ref="C?"  Part="1" 
F 0 "C?" V 3350 1550 50  0000 C CNN
F 1 "0.1u" V 3450 1600 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3550 1550 50  0001 C CNN
F 3 "~" H 3550 1550 50  0001 C CNN
	1    3550 1550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EA2FBDB
P 3450 2150
AR Path="/5EA1A65A/5EA2FBDB" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA2FBDB" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3450 1900 50  0001 C CNN
F 1 "GND" H 3550 2050 50  0000 C CNN
F 2 "" H 3450 2150 50  0001 C CNN
F 3 "" H 3450 2150 50  0001 C CNN
	1    3450 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EA2FBE1
P 3650 1550
AR Path="/5EA1A65A/5EA2FBE1" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA2FBE1" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3650 1300 50  0001 C CNN
F 1 "GND" V 3650 1450 50  0000 R CNN
F 2 "" H 3650 1550 50  0001 C CNN
F 3 "" H 3650 1550 50  0001 C CNN
	1    3650 1550
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EA2FBE7
P 3450 1550
AR Path="/5EA1A65A/5EA2FBE7" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA2FBE7" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3450 1400 50  0001 C CNN
F 1 "+5V" H 3350 1650 50  0000 C CNN
F 2 "" H 3450 1550 50  0001 C CNN
F 3 "" H 3450 1550 50  0001 C CNN
	1    3450 1550
	1    0    0    -1  
$EndComp
Connection ~ 3450 1550
Text GLabel 1950 1850 0    50   Input ~ 0
IN1
Text GLabel 3750 1850 2    50   Input ~ 0
OUT1
$Comp
L LED:WS2812B D?
U 1 1 5EA33BAB
P 2250 2900
AR Path="/5EA1A65A/5EA33BAB" Ref="D?"  Part="1" 
AR Path="/5EA2606F/5EA33BAB" Ref="D?"  Part="1" 
F 0 "D?" H 2450 3050 50  0000 L CNN
F 1 "WS2812B" H 2300 2650 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 2300 2600 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 2350 2525 50  0001 L TNN
	1    2250 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EA33BB1
P 2350 2600
AR Path="/5EA1A65A/5EA33BB1" Ref="C?"  Part="1" 
AR Path="/5EA2606F/5EA33BB1" Ref="C?"  Part="1" 
F 0 "C?" V 2150 2600 50  0000 C CNN
F 1 "0.1u" V 2250 2650 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2350 2600 50  0001 C CNN
F 3 "~" H 2350 2600 50  0001 C CNN
	1    2350 2600
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EA33BB7
P 2250 3200
AR Path="/5EA1A65A/5EA33BB7" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA33BB7" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2250 2950 50  0001 C CNN
F 1 "GND" H 2350 3100 50  0000 C CNN
F 2 "" H 2250 3200 50  0001 C CNN
F 3 "" H 2250 3200 50  0001 C CNN
	1    2250 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EA33BBD
P 2450 2600
AR Path="/5EA1A65A/5EA33BBD" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA33BBD" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2450 2350 50  0001 C CNN
F 1 "GND" V 2450 2500 50  0000 R CNN
F 2 "" H 2450 2600 50  0001 C CNN
F 3 "" H 2450 2600 50  0001 C CNN
	1    2450 2600
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EA33BC3
P 2250 2600
AR Path="/5EA1A65A/5EA33BC3" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA33BC3" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2250 2450 50  0001 C CNN
F 1 "+5V" H 2150 2700 50  0000 C CNN
F 2 "" H 2250 2600 50  0001 C CNN
F 3 "" H 2250 2600 50  0001 C CNN
	1    2250 2600
	1    0    0    -1  
$EndComp
Connection ~ 2250 2600
$Comp
L LED:WS2812B D?
U 1 1 5EA33BCA
P 2850 2900
AR Path="/5EA1A65A/5EA33BCA" Ref="D?"  Part="1" 
AR Path="/5EA2606F/5EA33BCA" Ref="D?"  Part="1" 
F 0 "D?" H 3050 3050 50  0000 L CNN
F 1 "WS2812B" H 2900 2650 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 2900 2600 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 2950 2525 50  0001 L TNN
	1    2850 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EA33BD0
P 2950 2600
AR Path="/5EA1A65A/5EA33BD0" Ref="C?"  Part="1" 
AR Path="/5EA2606F/5EA33BD0" Ref="C?"  Part="1" 
F 0 "C?" V 2750 2600 50  0000 C CNN
F 1 "0.1u" V 2850 2650 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2950 2600 50  0001 C CNN
F 3 "~" H 2950 2600 50  0001 C CNN
	1    2950 2600
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EA33BD6
P 2850 3200
AR Path="/5EA1A65A/5EA33BD6" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA33BD6" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2850 2950 50  0001 C CNN
F 1 "GND" H 2950 3100 50  0000 C CNN
F 2 "" H 2850 3200 50  0001 C CNN
F 3 "" H 2850 3200 50  0001 C CNN
	1    2850 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EA33BDC
P 3050 2600
AR Path="/5EA1A65A/5EA33BDC" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA33BDC" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3050 2350 50  0001 C CNN
F 1 "GND" V 3050 2500 50  0000 R CNN
F 2 "" H 3050 2600 50  0001 C CNN
F 3 "" H 3050 2600 50  0001 C CNN
	1    3050 2600
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EA33BE2
P 2850 2600
AR Path="/5EA1A65A/5EA33BE2" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA33BE2" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2850 2450 50  0001 C CNN
F 1 "+5V" H 2750 2700 50  0000 C CNN
F 2 "" H 2850 2600 50  0001 C CNN
F 3 "" H 2850 2600 50  0001 C CNN
	1    2850 2600
	1    0    0    -1  
$EndComp
Connection ~ 2850 2600
$Comp
L LED:WS2812B D?
U 1 1 5EA33BE9
P 3450 2900
AR Path="/5EA1A65A/5EA33BE9" Ref="D?"  Part="1" 
AR Path="/5EA2606F/5EA33BE9" Ref="D?"  Part="1" 
F 0 "D?" H 3650 3050 50  0000 L CNN
F 1 "WS2812B" H 3500 2650 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 3500 2600 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 3550 2525 50  0001 L TNN
	1    3450 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EA33BEF
P 3550 2600
AR Path="/5EA1A65A/5EA33BEF" Ref="C?"  Part="1" 
AR Path="/5EA2606F/5EA33BEF" Ref="C?"  Part="1" 
F 0 "C?" V 3350 2600 50  0000 C CNN
F 1 "0.1u" V 3450 2650 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3550 2600 50  0001 C CNN
F 3 "~" H 3550 2600 50  0001 C CNN
	1    3550 2600
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EA33BF5
P 3450 3200
AR Path="/5EA1A65A/5EA33BF5" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA33BF5" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3450 2950 50  0001 C CNN
F 1 "GND" H 3550 3100 50  0000 C CNN
F 2 "" H 3450 3200 50  0001 C CNN
F 3 "" H 3450 3200 50  0001 C CNN
	1    3450 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EA33BFB
P 3650 2600
AR Path="/5EA1A65A/5EA33BFB" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA33BFB" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3650 2350 50  0001 C CNN
F 1 "GND" V 3650 2500 50  0000 R CNN
F 2 "" H 3650 2600 50  0001 C CNN
F 3 "" H 3650 2600 50  0001 C CNN
	1    3650 2600
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EA33C01
P 3450 2600
AR Path="/5EA1A65A/5EA33C01" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA33C01" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3450 2450 50  0001 C CNN
F 1 "+5V" H 3350 2700 50  0000 C CNN
F 2 "" H 3450 2600 50  0001 C CNN
F 3 "" H 3450 2600 50  0001 C CNN
	1    3450 2600
	1    0    0    -1  
$EndComp
Connection ~ 3450 2600
Text GLabel 1950 2900 0    50   Input ~ 0
IN2
Text GLabel 3750 2900 2    50   Input ~ 0
OUT2
$Comp
L LED:WS2812B D?
U 1 1 5EA393E5
P 2250 3950
AR Path="/5EA1A65A/5EA393E5" Ref="D?"  Part="1" 
AR Path="/5EA2606F/5EA393E5" Ref="D?"  Part="1" 
F 0 "D?" H 2450 4100 50  0000 L CNN
F 1 "WS2812B" H 2300 3700 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 2300 3650 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 2350 3575 50  0001 L TNN
	1    2250 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EA393EB
P 2350 3650
AR Path="/5EA1A65A/5EA393EB" Ref="C?"  Part="1" 
AR Path="/5EA2606F/5EA393EB" Ref="C?"  Part="1" 
F 0 "C?" V 2150 3650 50  0000 C CNN
F 1 "0.1u" V 2250 3700 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2350 3650 50  0001 C CNN
F 3 "~" H 2350 3650 50  0001 C CNN
	1    2350 3650
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EA393F1
P 2250 4250
AR Path="/5EA1A65A/5EA393F1" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA393F1" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2250 4000 50  0001 C CNN
F 1 "GND" H 2350 4150 50  0000 C CNN
F 2 "" H 2250 4250 50  0001 C CNN
F 3 "" H 2250 4250 50  0001 C CNN
	1    2250 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EA393F7
P 2450 3650
AR Path="/5EA1A65A/5EA393F7" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA393F7" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2450 3400 50  0001 C CNN
F 1 "GND" V 2450 3550 50  0000 R CNN
F 2 "" H 2450 3650 50  0001 C CNN
F 3 "" H 2450 3650 50  0001 C CNN
	1    2450 3650
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EA393FD
P 2250 3650
AR Path="/5EA1A65A/5EA393FD" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA393FD" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2250 3500 50  0001 C CNN
F 1 "+5V" H 2150 3750 50  0000 C CNN
F 2 "" H 2250 3650 50  0001 C CNN
F 3 "" H 2250 3650 50  0001 C CNN
	1    2250 3650
	1    0    0    -1  
$EndComp
Connection ~ 2250 3650
$Comp
L LED:WS2812B D?
U 1 1 5EA39404
P 2850 3950
AR Path="/5EA1A65A/5EA39404" Ref="D?"  Part="1" 
AR Path="/5EA2606F/5EA39404" Ref="D?"  Part="1" 
F 0 "D?" H 3050 4100 50  0000 L CNN
F 1 "WS2812B" H 2900 3700 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 2900 3650 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 2950 3575 50  0001 L TNN
	1    2850 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EA3940A
P 2950 3650
AR Path="/5EA1A65A/5EA3940A" Ref="C?"  Part="1" 
AR Path="/5EA2606F/5EA3940A" Ref="C?"  Part="1" 
F 0 "C?" V 2750 3650 50  0000 C CNN
F 1 "0.1u" V 2850 3700 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2950 3650 50  0001 C CNN
F 3 "~" H 2950 3650 50  0001 C CNN
	1    2950 3650
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EA39410
P 2850 4250
AR Path="/5EA1A65A/5EA39410" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA39410" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2850 4000 50  0001 C CNN
F 1 "GND" H 2950 4150 50  0000 C CNN
F 2 "" H 2850 4250 50  0001 C CNN
F 3 "" H 2850 4250 50  0001 C CNN
	1    2850 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EA39416
P 3050 3650
AR Path="/5EA1A65A/5EA39416" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA39416" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3050 3400 50  0001 C CNN
F 1 "GND" V 3050 3550 50  0000 R CNN
F 2 "" H 3050 3650 50  0001 C CNN
F 3 "" H 3050 3650 50  0001 C CNN
	1    3050 3650
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EA3941C
P 2850 3650
AR Path="/5EA1A65A/5EA3941C" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA3941C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2850 3500 50  0001 C CNN
F 1 "+5V" H 2750 3750 50  0000 C CNN
F 2 "" H 2850 3650 50  0001 C CNN
F 3 "" H 2850 3650 50  0001 C CNN
	1    2850 3650
	1    0    0    -1  
$EndComp
Connection ~ 2850 3650
$Comp
L LED:WS2812B D?
U 1 1 5EA39423
P 3450 3950
AR Path="/5EA1A65A/5EA39423" Ref="D?"  Part="1" 
AR Path="/5EA2606F/5EA39423" Ref="D?"  Part="1" 
F 0 "D?" H 3650 4100 50  0000 L CNN
F 1 "WS2812B" H 3500 3700 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 3500 3650 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 3550 3575 50  0001 L TNN
	1    3450 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EA39429
P 3550 3650
AR Path="/5EA1A65A/5EA39429" Ref="C?"  Part="1" 
AR Path="/5EA2606F/5EA39429" Ref="C?"  Part="1" 
F 0 "C?" V 3350 3650 50  0000 C CNN
F 1 "0.1u" V 3450 3700 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3550 3650 50  0001 C CNN
F 3 "~" H 3550 3650 50  0001 C CNN
	1    3550 3650
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EA3942F
P 3450 4250
AR Path="/5EA1A65A/5EA3942F" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA3942F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3450 4000 50  0001 C CNN
F 1 "GND" H 3550 4150 50  0000 C CNN
F 2 "" H 3450 4250 50  0001 C CNN
F 3 "" H 3450 4250 50  0001 C CNN
	1    3450 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EA39435
P 3650 3650
AR Path="/5EA1A65A/5EA39435" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA39435" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3650 3400 50  0001 C CNN
F 1 "GND" V 3650 3550 50  0000 R CNN
F 2 "" H 3650 3650 50  0001 C CNN
F 3 "" H 3650 3650 50  0001 C CNN
	1    3650 3650
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EA3943B
P 3450 3650
AR Path="/5EA1A65A/5EA3943B" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA3943B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3450 3500 50  0001 C CNN
F 1 "+5V" H 3350 3750 50  0000 C CNN
F 2 "" H 3450 3650 50  0001 C CNN
F 3 "" H 3450 3650 50  0001 C CNN
	1    3450 3650
	1    0    0    -1  
$EndComp
Connection ~ 3450 3650
Text GLabel 1950 3950 0    50   Input ~ 0
IN3
Text GLabel 3750 3950 2    50   Input ~ 0
OUT3
$Comp
L Connector_Generic:Conn_01x08 JIN?
U 1 1 5EA3D8D9
P 6000 2050
F 0 "JIN?" H 6080 2042 50  0000 L CNN
F 1 "Conn_01x08_Shielded" H 6080 1951 50  0000 L CNN
F 2 "Connector_JST:JST_SUR_BM08B-SURS-TF_1x08-1MP_P0.80mm_Vertical" H 6000 2050 50  0001 C CNN
F 3 "~" H 6000 2050 50  0001 C CNN
	1    6000 2050
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x08 JOUT?
U 1 1 5EA3D8DF
P 6000 3250
F 0 "JOUT?" H 6080 3242 50  0000 L CNN
F 1 "Conn_01x08_Shielded" H 6080 3151 50  0000 L CNN
F 2 "Connector_JST:JST_SUR_BM08B-SURS-TF_1x08-1MP_P0.80mm_Vertical" H 6000 3250 50  0001 C CNN
F 3 "~" H 6000 3250 50  0001 C CNN
	1    6000 3250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EA3D8E5
P 5800 1750
F 0 "#PWR?" H 5800 1600 50  0001 C CNN
F 1 "+5V" H 5815 1923 50  0000 C CNN
F 2 "" H 5800 1750 50  0001 C CNN
F 3 "" H 5800 1750 50  0001 C CNN
	1    5800 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 1850 5800 1750
Connection ~ 5800 1750
Wire Wire Line
	5800 2350 5800 2450
$Comp
L power:GND #PWR?
U 1 1 5EA3D8EE
P 5800 2450
F 0 "#PWR?" H 5800 2200 50  0001 C CNN
F 1 "GND" H 5805 2277 50  0000 C CNN
F 2 "" H 5800 2450 50  0001 C CNN
F 3 "" H 5800 2450 50  0001 C CNN
	1    5800 2450
	1    0    0    -1  
$EndComp
Connection ~ 5800 2450
Wire Wire Line
	5800 2250 5800 2350
Connection ~ 5800 2350
Text GLabel 5800 1950 0    50   Input ~ 0
IN1
Text GLabel 5800 2050 0    50   Input ~ 0
IN2
Text GLabel 5800 2150 0    50   Input ~ 0
IN3
Wire Wire Line
	5800 3050 5800 2950
Wire Wire Line
	5800 3450 5800 3550
Connection ~ 5800 3550
Wire Wire Line
	5800 3550 5800 3650
$Comp
L power:GND #PWR?
U 1 1 5EA3D8FE
P 5800 3650
F 0 "#PWR?" H 5800 3400 50  0001 C CNN
F 1 "GND" H 5805 3477 50  0000 C CNN
F 2 "" H 5800 3650 50  0001 C CNN
F 3 "" H 5800 3650 50  0001 C CNN
	1    5800 3650
	1    0    0    -1  
$EndComp
Connection ~ 5800 3650
$Comp
L power:+5V #PWR?
U 1 1 5EA3D905
P 5800 2950
F 0 "#PWR?" H 5800 2800 50  0001 C CNN
F 1 "+5V" H 5815 3123 50  0000 C CNN
F 2 "" H 5800 2950 50  0001 C CNN
F 3 "" H 5800 2950 50  0001 C CNN
	1    5800 2950
	1    0    0    -1  
$EndComp
Connection ~ 5800 2950
Text GLabel 5800 3150 0    50   Input ~ 0
OUT1
Text GLabel 5800 3250 0    50   Input ~ 0
OUT2
Text GLabel 5800 3350 0    50   Input ~ 0
OUT3
$Comp
L Connector_Generic:Conn_01x08 JIN?
U 1 1 5EA3F770
P 7700 2000
F 0 "JIN?" H 7780 1992 50  0000 L CNN
F 1 "Conn_01x08_Shielded" H 7780 1901 50  0000 L CNN
F 2 "Connector_JST:JST_SUR_BM08B-SURS-TF_1x08-1MP_P0.80mm_Vertical" H 7700 2000 50  0001 C CNN
F 3 "~" H 7700 2000 50  0001 C CNN
	1    7700 2000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x08 JOUT?
U 1 1 5EA3F776
P 7700 3200
F 0 "JOUT?" H 7780 3192 50  0000 L CNN
F 1 "Conn_01x08_Shielded" H 7780 3101 50  0000 L CNN
F 2 "Connector_JST:JST_SUR_BM08B-SURS-TF_1x08-1MP_P0.80mm_Vertical" H 7700 3200 50  0001 C CNN
F 3 "~" H 7700 3200 50  0001 C CNN
	1    7700 3200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EA3F77C
P 7500 1700
F 0 "#PWR?" H 7500 1550 50  0001 C CNN
F 1 "+5V" H 7515 1873 50  0000 C CNN
F 2 "" H 7500 1700 50  0001 C CNN
F 3 "" H 7500 1700 50  0001 C CNN
	1    7500 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 1800 7500 1700
Connection ~ 7500 1700
Wire Wire Line
	7500 2300 7500 2400
$Comp
L power:GND #PWR?
U 1 1 5EA3F785
P 7500 2400
F 0 "#PWR?" H 7500 2150 50  0001 C CNN
F 1 "GND" H 7505 2227 50  0000 C CNN
F 2 "" H 7500 2400 50  0001 C CNN
F 3 "" H 7500 2400 50  0001 C CNN
	1    7500 2400
	1    0    0    -1  
$EndComp
Connection ~ 7500 2400
Wire Wire Line
	7500 2200 7500 2300
Connection ~ 7500 2300
Text GLabel 7500 1900 0    50   Input ~ 0
IN1
Text GLabel 7500 2000 0    50   Input ~ 0
IN2
Text GLabel 7500 2100 0    50   Input ~ 0
IN3
Wire Wire Line
	7500 3000 7500 2900
Wire Wire Line
	7500 3400 7500 3500
Connection ~ 7500 3500
Wire Wire Line
	7500 3500 7500 3600
$Comp
L power:GND #PWR?
U 1 1 5EA3F795
P 7500 3600
F 0 "#PWR?" H 7500 3350 50  0001 C CNN
F 1 "GND" H 7505 3427 50  0000 C CNN
F 2 "" H 7500 3600 50  0001 C CNN
F 3 "" H 7500 3600 50  0001 C CNN
	1    7500 3600
	1    0    0    -1  
$EndComp
Connection ~ 7500 3600
$Comp
L power:+5V #PWR?
U 1 1 5EA3F79C
P 7500 2900
F 0 "#PWR?" H 7500 2750 50  0001 C CNN
F 1 "+5V" H 7515 3073 50  0000 C CNN
F 2 "" H 7500 2900 50  0001 C CNN
F 3 "" H 7500 2900 50  0001 C CNN
	1    7500 2900
	1    0    0    -1  
$EndComp
Connection ~ 7500 2900
Text GLabel 7500 3100 0    50   Input ~ 0
OUT1
Text GLabel 7500 3200 0    50   Input ~ 0
OUT2
Text GLabel 7500 3300 0    50   Input ~ 0
OUT3
$EndSCHEMATC
