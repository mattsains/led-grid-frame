EESchema Schematic File Version 4
LIBS:1x9-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
AR Path="/5EA2606F/5EA2FB91" Ref="D82"  Part="1" 
AR Path="/5EA2FB91" Ref="D82"  Part="1" 
F 0 "D82" H 2450 2000 50  0000 L CNN
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
AR Path="/5EA2606F/5EA2FB97" Ref="C85"  Part="1" 
AR Path="/5EA2FB97" Ref="C85"  Part="1" 
F 0 "C85" V 2150 1550 50  0000 C CNN
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
AR Path="/5EA2606F/5EA2FB9D" Ref="#PWR0359"  Part="1" 
AR Path="/5EA2FB9D" Ref="#PWR0359"  Part="1" 
F 0 "#PWR0359" H 2250 1900 50  0001 C CNN
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
AR Path="/5EA2606F/5EA2FBA3" Ref="#PWR0360"  Part="1" 
AR Path="/5EA2FBA3" Ref="#PWR0360"  Part="1" 
F 0 "#PWR0360" H 2450 1300 50  0001 C CNN
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
AR Path="/5EA2606F/5EA2FBA9" Ref="#PWR0361"  Part="1" 
AR Path="/5EA2FBA9" Ref="#PWR0361"  Part="1" 
F 0 "#PWR0361" H 2250 1400 50  0001 C CNN
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
AR Path="/5EA2606F/5EA2FBB0" Ref="D85"  Part="1" 
AR Path="/5EA2FBB0" Ref="D85"  Part="1" 
F 0 "D85" H 3050 2000 50  0000 L CNN
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
AR Path="/5EA2606F/5EA2FBB6" Ref="C88"  Part="1" 
AR Path="/5EA2FBB6" Ref="C88"  Part="1" 
F 0 "C88" V 2750 1550 50  0000 C CNN
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
AR Path="/5EA2606F/5EA2FBBC" Ref="#PWR0362"  Part="1" 
AR Path="/5EA2FBBC" Ref="#PWR0362"  Part="1" 
F 0 "#PWR0362" H 2850 1900 50  0001 C CNN
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
AR Path="/5EA2606F/5EA2FBC2" Ref="#PWR0363"  Part="1" 
AR Path="/5EA2FBC2" Ref="#PWR0363"  Part="1" 
F 0 "#PWR0363" H 3050 1300 50  0001 C CNN
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
AR Path="/5EA2606F/5EA2FBC8" Ref="#PWR0364"  Part="1" 
AR Path="/5EA2FBC8" Ref="#PWR0364"  Part="1" 
F 0 "#PWR0364" H 2850 1400 50  0001 C CNN
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
AR Path="/5EA2606F/5EA2FBCF" Ref="D88"  Part="1" 
AR Path="/5EA2FBCF" Ref="D88"  Part="1" 
F 0 "D88" H 3650 2000 50  0000 L CNN
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
AR Path="/5EA2606F/5EA2FBD5" Ref="C91"  Part="1" 
AR Path="/5EA2FBD5" Ref="C91"  Part="1" 
F 0 "C91" V 3350 1550 50  0000 C CNN
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
AR Path="/5EA2606F/5EA2FBDB" Ref="#PWR0365"  Part="1" 
AR Path="/5EA2FBDB" Ref="#PWR0365"  Part="1" 
F 0 "#PWR0365" H 3450 1900 50  0001 C CNN
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
AR Path="/5EA2606F/5EA2FBE1" Ref="#PWR0366"  Part="1" 
AR Path="/5EA2FBE1" Ref="#PWR0366"  Part="1" 
F 0 "#PWR0366" H 3650 1300 50  0001 C CNN
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
AR Path="/5EA2606F/5EA2FBE7" Ref="#PWR0367"  Part="1" 
AR Path="/5EA2FBE7" Ref="#PWR0367"  Part="1" 
F 0 "#PWR0367" H 3450 1400 50  0001 C CNN
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
AR Path="/5EA2606F/5EA33BAB" Ref="D83"  Part="1" 
AR Path="/5EA33BAB" Ref="D83"  Part="1" 
F 0 "D83" H 2450 3050 50  0000 L CNN
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
AR Path="/5EA2606F/5EA33BB1" Ref="C86"  Part="1" 
AR Path="/5EA33BB1" Ref="C86"  Part="1" 
F 0 "C86" V 2150 2600 50  0000 C CNN
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
AR Path="/5EA2606F/5EA33BB7" Ref="#PWR0368"  Part="1" 
AR Path="/5EA33BB7" Ref="#PWR0368"  Part="1" 
F 0 "#PWR0368" H 2250 2950 50  0001 C CNN
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
AR Path="/5EA2606F/5EA33BBD" Ref="#PWR0369"  Part="1" 
AR Path="/5EA33BBD" Ref="#PWR0369"  Part="1" 
F 0 "#PWR0369" H 2450 2350 50  0001 C CNN
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
AR Path="/5EA2606F/5EA33BC3" Ref="#PWR0370"  Part="1" 
AR Path="/5EA33BC3" Ref="#PWR0370"  Part="1" 
F 0 "#PWR0370" H 2250 2450 50  0001 C CNN
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
AR Path="/5EA2606F/5EA33BCA" Ref="D86"  Part="1" 
AR Path="/5EA33BCA" Ref="D86"  Part="1" 
F 0 "D86" H 3050 3050 50  0000 L CNN
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
AR Path="/5EA2606F/5EA33BD0" Ref="C89"  Part="1" 
AR Path="/5EA33BD0" Ref="C89"  Part="1" 
F 0 "C89" V 2750 2600 50  0000 C CNN
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
AR Path="/5EA2606F/5EA33BD6" Ref="#PWR0371"  Part="1" 
AR Path="/5EA33BD6" Ref="#PWR0371"  Part="1" 
F 0 "#PWR0371" H 2850 2950 50  0001 C CNN
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
AR Path="/5EA2606F/5EA33BDC" Ref="#PWR0372"  Part="1" 
AR Path="/5EA33BDC" Ref="#PWR0372"  Part="1" 
F 0 "#PWR0372" H 3050 2350 50  0001 C CNN
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
AR Path="/5EA2606F/5EA33BE2" Ref="#PWR0373"  Part="1" 
AR Path="/5EA33BE2" Ref="#PWR0373"  Part="1" 
F 0 "#PWR0373" H 2850 2450 50  0001 C CNN
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
AR Path="/5EA2606F/5EA33BE9" Ref="D89"  Part="1" 
AR Path="/5EA33BE9" Ref="D89"  Part="1" 
F 0 "D89" H 3650 3050 50  0000 L CNN
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
AR Path="/5EA2606F/5EA33BEF" Ref="C92"  Part="1" 
AR Path="/5EA33BEF" Ref="C92"  Part="1" 
F 0 "C92" V 3350 2600 50  0000 C CNN
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
AR Path="/5EA2606F/5EA33BF5" Ref="#PWR0374"  Part="1" 
AR Path="/5EA33BF5" Ref="#PWR0374"  Part="1" 
F 0 "#PWR0374" H 3450 2950 50  0001 C CNN
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
AR Path="/5EA2606F/5EA33BFB" Ref="#PWR0375"  Part="1" 
AR Path="/5EA33BFB" Ref="#PWR0375"  Part="1" 
F 0 "#PWR0375" H 3650 2350 50  0001 C CNN
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
AR Path="/5EA2606F/5EA33C01" Ref="#PWR0376"  Part="1" 
AR Path="/5EA33C01" Ref="#PWR0376"  Part="1" 
F 0 "#PWR0376" H 3450 2450 50  0001 C CNN
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
AR Path="/5EA2606F/5EA393E5" Ref="D84"  Part="1" 
AR Path="/5EA393E5" Ref="D84"  Part="1" 
F 0 "D84" H 2450 4100 50  0000 L CNN
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
AR Path="/5EA2606F/5EA393EB" Ref="C87"  Part="1" 
AR Path="/5EA393EB" Ref="C87"  Part="1" 
F 0 "C87" V 2150 3650 50  0000 C CNN
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
AR Path="/5EA2606F/5EA393F1" Ref="#PWR0377"  Part="1" 
AR Path="/5EA393F1" Ref="#PWR0377"  Part="1" 
F 0 "#PWR0377" H 2250 4000 50  0001 C CNN
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
AR Path="/5EA2606F/5EA393F7" Ref="#PWR0378"  Part="1" 
AR Path="/5EA393F7" Ref="#PWR0378"  Part="1" 
F 0 "#PWR0378" H 2450 3400 50  0001 C CNN
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
AR Path="/5EA2606F/5EA393FD" Ref="#PWR0379"  Part="1" 
AR Path="/5EA393FD" Ref="#PWR0379"  Part="1" 
F 0 "#PWR0379" H 2250 3500 50  0001 C CNN
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
AR Path="/5EA2606F/5EA39404" Ref="D87"  Part="1" 
AR Path="/5EA39404" Ref="D87"  Part="1" 
F 0 "D87" H 3050 4100 50  0000 L CNN
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
AR Path="/5EA2606F/5EA3940A" Ref="C90"  Part="1" 
AR Path="/5EA3940A" Ref="C90"  Part="1" 
F 0 "C90" V 2750 3650 50  0000 C CNN
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
AR Path="/5EA2606F/5EA39410" Ref="#PWR0380"  Part="1" 
AR Path="/5EA39410" Ref="#PWR0380"  Part="1" 
F 0 "#PWR0380" H 2850 4000 50  0001 C CNN
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
AR Path="/5EA2606F/5EA39416" Ref="#PWR0381"  Part="1" 
AR Path="/5EA39416" Ref="#PWR0381"  Part="1" 
F 0 "#PWR0381" H 3050 3400 50  0001 C CNN
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
AR Path="/5EA2606F/5EA3941C" Ref="#PWR0382"  Part="1" 
AR Path="/5EA3941C" Ref="#PWR0382"  Part="1" 
F 0 "#PWR0382" H 2850 3500 50  0001 C CNN
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
AR Path="/5EA2606F/5EA39423" Ref="D90"  Part="1" 
AR Path="/5EA39423" Ref="D90"  Part="1" 
F 0 "D90" H 3650 4100 50  0000 L CNN
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
AR Path="/5EA2606F/5EA39429" Ref="C93"  Part="1" 
AR Path="/5EA39429" Ref="C93"  Part="1" 
F 0 "C93" V 3350 3650 50  0000 C CNN
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
AR Path="/5EA2606F/5EA3942F" Ref="#PWR0383"  Part="1" 
AR Path="/5EA3942F" Ref="#PWR0383"  Part="1" 
F 0 "#PWR0383" H 3450 4000 50  0001 C CNN
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
AR Path="/5EA2606F/5EA39435" Ref="#PWR0384"  Part="1" 
AR Path="/5EA39435" Ref="#PWR0384"  Part="1" 
F 0 "#PWR0384" H 3650 3400 50  0001 C CNN
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
AR Path="/5EA2606F/5EA3943B" Ref="#PWR0385"  Part="1" 
AR Path="/5EA3943B" Ref="#PWR0385"  Part="1" 
F 0 "#PWR0385" H 3450 3500 50  0001 C CNN
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
L Connector_Generic:Conn_01x05 JIN?
U 1 1 5EA3D8D9
P 6000 2050
AR Path="/5EA1A65A/5EA3D8D9" Ref="JIN?"  Part="1" 
AR Path="/5EA2606F/5EA3D8D9" Ref="JIN2"  Part="1" 
AR Path="/5EA3D8D9" Ref="JIN2"  Part="1" 
F 0 "JIN2" H 6080 2042 50  0000 L CNN
F 1 "Conn_01x05" H 6080 1951 50  0000 L CNN
F 2 "library:thick_header_01x05_3.3mm" H 6000 2050 50  0001 C CNN
F 3 "~" H 6000 2050 50  0001 C CNN
	1    6000 2050
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x05 JOUT?
U 1 1 5EA3D8DF
P 6000 3250
AR Path="/5EA1A65A/5EA3D8DF" Ref="JOUT?"  Part="1" 
AR Path="/5EA2606F/5EA3D8DF" Ref="JOUT3"  Part="1" 
AR Path="/5EA3D8DF" Ref="JOUT2"  Part="1" 
F 0 "JOUT2" H 6080 3242 50  0000 L CNN
F 1 "Conn_01x05" H 6080 3151 50  0000 L CNN
F 2 "library:thick_header_01x05_3.3mm" H 6000 3250 50  0001 C CNN
F 3 "~" H 6000 3250 50  0001 C CNN
	1    6000 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EA3D8EE
P 5800 2250
AR Path="/5EA1A65A/5EA3D8EE" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA3D8EE" Ref="#PWR0387"  Part="1" 
AR Path="/5EA3D8EE" Ref="#PWR0387"  Part="1" 
F 0 "#PWR0387" H 5800 2000 50  0001 C CNN
F 1 "GND" H 5805 2077 50  0000 C CNN
F 2 "" H 5800 2250 50  0001 C CNN
F 3 "" H 5800 2250 50  0001 C CNN
	1    5800 2250
	1    0    0    -1  
$EndComp
Text GLabel 5800 1850 0    50   Input ~ 0
IN1
Text GLabel 5800 1950 0    50   Input ~ 0
IN2
Text GLabel 5800 2050 0    50   Input ~ 0
IN3
$Comp
L power:GND #PWR?
U 1 1 5EA3D8FE
P 5800 3450
AR Path="/5EA1A65A/5EA3D8FE" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA3D8FE" Ref="#PWR0388"  Part="1" 
AR Path="/5EA3D8FE" Ref="#PWR0388"  Part="1" 
F 0 "#PWR0388" H 5800 3200 50  0001 C CNN
F 1 "GND" H 5805 3277 50  0000 C CNN
F 2 "" H 5800 3450 50  0001 C CNN
F 3 "" H 5800 3450 50  0001 C CNN
	1    5800 3450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EA3D905
P 5350 3350
AR Path="/5EA1A65A/5EA3D905" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EA3D905" Ref="#PWR0389"  Part="1" 
AR Path="/5EA3D905" Ref="#PWR0389"  Part="1" 
F 0 "#PWR0389" H 5350 3200 50  0001 C CNN
F 1 "+5V" H 5365 3523 50  0000 C CNN
F 2 "" H 5350 3350 50  0001 C CNN
F 3 "" H 5350 3350 50  0001 C CNN
	1    5350 3350
	1    0    0    -1  
$EndComp
Text GLabel 5800 3050 0    50   Input ~ 0
OUT1
Text GLabel 5800 3150 0    50   Input ~ 0
OUT2
Text GLabel 5800 3250 0    50   Input ~ 0
OUT3
$Comp
L power:+5V #PWR01
U 1 1 5EC9037B
P 5500 2150
F 0 "#PWR01" H 5500 2000 50  0001 C CNN
F 1 "+5V" H 5515 2323 50  0000 C CNN
F 2 "" H 5500 2150 50  0001 C CNN
F 3 "" H 5500 2150 50  0001 C CNN
	1    5500 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 2150 5800 2150
Wire Wire Line
	5800 3350 5350 3350
$Comp
L Connector_Generic:Conn_01x05 JIN?
U 1 1 5EC95BB1
P 7350 2150
AR Path="/5EA1A65A/5EC95BB1" Ref="JIN?"  Part="1" 
AR Path="/5EA2606F/5EC95BB1" Ref="JIN?"  Part="1" 
AR Path="/5EC95BB1" Ref="JIN1"  Part="1" 
F 0 "JIN1" H 7430 2142 50  0000 L CNN
F 1 "Conn_01x05" H 7430 2051 50  0000 L CNN
F 2 "library:thick_header_01x05_3.3mm" H 7350 2150 50  0001 C CNN
F 3 "~" H 7350 2150 50  0001 C CNN
	1    7350 2150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x05 JOUT?
U 1 1 5EC95BB7
P 7350 3350
AR Path="/5EA1A65A/5EC95BB7" Ref="JOUT?"  Part="1" 
AR Path="/5EA2606F/5EC95BB7" Ref="JOUT?"  Part="1" 
AR Path="/5EC95BB7" Ref="JOUT1"  Part="1" 
F 0 "JOUT1" H 7430 3342 50  0000 L CNN
F 1 "Conn_01x05" H 7430 3251 50  0000 L CNN
F 2 "library:thick_header_01x05_3.3mm" H 7350 3350 50  0001 C CNN
F 3 "~" H 7350 3350 50  0001 C CNN
	1    7350 3350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EC95BBD
P 7150 2350
AR Path="/5EA1A65A/5EC95BBD" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EC95BBD" Ref="#PWR?"  Part="1" 
AR Path="/5EC95BBD" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 7150 2100 50  0001 C CNN
F 1 "GND" H 7155 2177 50  0000 C CNN
F 2 "" H 7150 2350 50  0001 C CNN
F 3 "" H 7150 2350 50  0001 C CNN
	1    7150 2350
	1    0    0    -1  
$EndComp
Text GLabel 7150 1950 0    50   Input ~ 0
IN1
Text GLabel 7150 2050 0    50   Input ~ 0
IN2
Text GLabel 7150 2150 0    50   Input ~ 0
IN3
$Comp
L power:GND #PWR?
U 1 1 5EC95BC6
P 7150 3550
AR Path="/5EA1A65A/5EC95BC6" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EC95BC6" Ref="#PWR?"  Part="1" 
AR Path="/5EC95BC6" Ref="#PWR05"  Part="1" 
F 0 "#PWR05" H 7150 3300 50  0001 C CNN
F 1 "GND" H 7155 3377 50  0000 C CNN
F 2 "" H 7150 3550 50  0001 C CNN
F 3 "" H 7150 3550 50  0001 C CNN
	1    7150 3550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EC95BCC
P 6700 3450
AR Path="/5EA1A65A/5EC95BCC" Ref="#PWR?"  Part="1" 
AR Path="/5EA2606F/5EC95BCC" Ref="#PWR?"  Part="1" 
AR Path="/5EC95BCC" Ref="#PWR02"  Part="1" 
F 0 "#PWR02" H 6700 3300 50  0001 C CNN
F 1 "+5V" H 6715 3623 50  0000 C CNN
F 2 "" H 6700 3450 50  0001 C CNN
F 3 "" H 6700 3450 50  0001 C CNN
	1    6700 3450
	1    0    0    -1  
$EndComp
Text GLabel 7150 3150 0    50   Input ~ 0
OUT1
Text GLabel 7150 3250 0    50   Input ~ 0
OUT2
Text GLabel 7150 3350 0    50   Input ~ 0
OUT3
$Comp
L power:+5V #PWR03
U 1 1 5EC95BD5
P 6850 2250
F 0 "#PWR03" H 6850 2100 50  0001 C CNN
F 1 "+5V" H 6865 2423 50  0000 C CNN
F 2 "" H 6850 2250 50  0001 C CNN
F 3 "" H 6850 2250 50  0001 C CNN
	1    6850 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 2250 7150 2250
Wire Wire Line
	7150 3450 6700 3450
$EndSCHEMATC
