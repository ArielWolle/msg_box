EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A2 23386 16535
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
L LED:WS2812B D2
U 1 1 6175E90E
P 5900 3500
F 0 "D2" H 6244 3546 50  0001 L CNN
F 1 "WS2812B" H 6244 3455 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 5950 3200 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 6000 3125 50  0001 L TNN
	1    5900 3500
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D1
U 1 1 6175C9E4
P 4900 3500
F 0 "D1" H 5244 3546 50  0001 L CNN
F 1 "WS2812B" H 5244 3455 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 4950 3200 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 5000 3125 50  0001 L TNN
	1    4900 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 3500 5600 3500
Wire Wire Line
	6200 3500 6600 3500
Wire Wire Line
	4900 3800 5400 3800
Connection ~ 4900 3800
Wire Wire Line
	5400 3650 5400 3800
Connection ~ 5400 3800
Wire Wire Line
	5400 3800 5900 3800
$Comp
L LED:WS2812B D3
U 1 1 617E2424
P 6900 3500
F 0 "D3" H 7244 3546 50  0001 L CNN
F 1 "WS2812B" H 7244 3455 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 6950 3200 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 7000 3125 50  0001 L TNN
	1    6900 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 3500 7600 3500
Wire Wire Line
	5900 3800 6400 3800
Wire Wire Line
	6900 3800 7400 3800
Connection ~ 6900 3800
Wire Wire Line
	5900 3200 6400 3200
Wire Wire Line
	6900 3200 7400 3200
Connection ~ 6900 3200
$Comp
L Device:C C2
U 1 1 617E2432
P 6400 3500
F 0 "C2" H 6515 3546 50  0001 L CNN
F 1 "100nf" H 6515 3500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 6438 3350 50  0001 C CNN
F 3 "~" H 6400 3500 50  0001 C CNN
	1    6400 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 3350 6400 3200
Connection ~ 6400 3200
Wire Wire Line
	6400 3200 6900 3200
Wire Wire Line
	6400 3650 6400 3800
Connection ~ 6400 3800
Wire Wire Line
	6400 3800 6900 3800
$Comp
L LED:WS2812B D4
U 1 1 617E462B
P 7900 3500
F 0 "D4" H 8244 3546 50  0001 L CNN
F 1 "WS2812B" H 8244 3455 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 7950 3200 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 8000 3125 50  0001 L TNN
	1    7900 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 3500 8600 3500
Wire Wire Line
	7900 3800 8400 3800
Connection ~ 7900 3800
Wire Wire Line
	7900 3200 8400 3200
Connection ~ 7900 3200
$Comp
L Device:C C3
U 1 1 617E4639
P 7400 3500
F 0 "C3" H 7515 3546 50  0001 L CNN
F 1 "100nf" H 7515 3500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7438 3350 50  0001 C CNN
F 3 "~" H 7400 3500 50  0001 C CNN
	1    7400 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 3350 7400 3200
Connection ~ 7400 3200
Wire Wire Line
	7400 3200 7900 3200
Wire Wire Line
	7400 3650 7400 3800
Connection ~ 7400 3800
Wire Wire Line
	7400 3800 7900 3800
$Comp
L LED:WS2812B D5
U 1 1 617E744A
P 8900 3500
F 0 "D5" H 9244 3546 50  0001 L CNN
F 1 "WS2812B" H 9244 3455 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 8950 3200 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 9000 3125 50  0001 L TNN
	1    8900 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 3500 9600 3500
Wire Wire Line
	8900 3800 9400 3800
Connection ~ 8900 3800
Wire Wire Line
	8900 3200 9400 3200
Connection ~ 8900 3200
$Comp
L Device:C C4
U 1 1 617E7458
P 8400 3500
F 0 "C4" H 8515 3546 50  0001 L CNN
F 1 "100nf" H 8515 3500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 8438 3350 50  0001 C CNN
F 3 "~" H 8400 3500 50  0001 C CNN
	1    8400 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 3350 8400 3200
Connection ~ 8400 3200
Wire Wire Line
	8400 3200 8900 3200
Wire Wire Line
	8400 3650 8400 3800
Connection ~ 8400 3800
Wire Wire Line
	8400 3800 8900 3800
$Comp
L LED:WS2812B D6
U 1 1 617E9127
P 9900 3500
F 0 "D6" H 10244 3546 50  0001 L CNN
F 1 "WS2812B" H 10244 3455 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 9950 3200 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 10000 3125 50  0001 L TNN
	1    9900 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 3500 10600 3500
Wire Wire Line
	9900 3800 10400 3800
Connection ~ 9900 3800
Wire Wire Line
	9900 3200 10400 3200
Connection ~ 9900 3200
$Comp
L Device:C C5
U 1 1 617E9135
P 9400 3500
F 0 "C5" H 9515 3546 50  0001 L CNN
F 1 "100nf" H 9515 3500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 9438 3350 50  0001 C CNN
F 3 "~" H 9400 3500 50  0001 C CNN
	1    9400 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 3350 9400 3200
Connection ~ 9400 3200
Wire Wire Line
	9400 3200 9900 3200
Wire Wire Line
	9400 3650 9400 3800
Connection ~ 9400 3800
Wire Wire Line
	9400 3800 9900 3800
$Comp
L LED:WS2812B D7
U 1 1 617EABE8
P 10900 3500
F 0 "D7" H 11244 3546 50  0001 L CNN
F 1 "WS2812B" H 11244 3455 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 10950 3200 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 11000 3125 50  0001 L TNN
	1    10900 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	11200 3500 11600 3500
Wire Wire Line
	10900 3800 11400 3800
Connection ~ 10900 3800
Wire Wire Line
	10900 3200 11400 3200
Connection ~ 10900 3200
$Comp
L Device:C C6
U 1 1 617EABF6
P 10400 3500
F 0 "C6" H 10515 3546 50  0001 L CNN
F 1 "100nf" H 10515 3500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 10438 3350 50  0001 C CNN
F 3 "~" H 10400 3500 50  0001 C CNN
	1    10400 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 3350 10400 3200
Connection ~ 10400 3200
Wire Wire Line
	10400 3200 10900 3200
Wire Wire Line
	10400 3650 10400 3800
Connection ~ 10400 3800
Wire Wire Line
	10400 3800 10900 3800
$Comp
L LED:WS2812B D8
U 1 1 617ECBEC
P 11900 3500
F 0 "D8" H 12244 3546 50  0001 L CNN
F 1 "WS2812B" H 12244 3455 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 11950 3200 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 12000 3125 50  0001 L TNN
	1    11900 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 617ECBFA
P 11400 3500
F 0 "C7" H 11515 3546 50  0001 L CNN
F 1 "100nf" H 11515 3500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 11438 3350 50  0001 C CNN
F 3 "~" H 11400 3500 50  0001 C CNN
	1    11400 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	11400 3350 11400 3200
Connection ~ 11400 3200
Wire Wire Line
	11400 3200 11900 3200
Wire Wire Line
	11400 3650 11400 3800
Connection ~ 11400 3800
Wire Wire Line
	11400 3800 11900 3800
Connection ~ 5900 3200
Connection ~ 5900 3800
$Comp
L LED:WS2812B D10
U 1 1 61804A70
P 5900 4500
F 0 "D10" H 6244 4546 50  0001 L CNN
F 1 "WS2812B" H 6244 4455 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 5950 4200 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 6000 4125 50  0001 L TNN
	1    5900 4500
	-1   0    0    1   
$EndComp
$Comp
L LED:WS2812B D9
U 1 1 61804A76
P 4900 4500
F 0 "D9" H 5244 4546 50  0001 L CNN
F 1 "WS2812B" H 5244 4455 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 4950 4200 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 5000 4125 50  0001 L TNN
	1    4900 4500
	-1   0    0    1   
$EndComp
Wire Wire Line
	5200 4500 5600 4500
Wire Wire Line
	6200 4500 6600 4500
Wire Wire Line
	4900 4800 5400 4800
Wire Wire Line
	4900 4200 5400 4200
$Comp
L Device:C C10
U 1 1 61804A88
P 5400 4500
F 0 "C10" H 5515 4546 50  0001 L CNN
F 1 "100nf" H 5515 4500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 5438 4350 50  0001 C CNN
F 3 "~" H 5400 4500 50  0001 C CNN
	1    5400 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 4350 5400 4200
Connection ~ 5400 4200
Wire Wire Line
	5400 4200 5900 4200
Wire Wire Line
	5400 4650 5400 4800
Connection ~ 5400 4800
Wire Wire Line
	5400 4800 5900 4800
$Comp
L LED:WS2812B D11
U 1 1 61804A94
P 6900 4500
F 0 "D11" H 7244 4546 50  0001 L CNN
F 1 "WS2812B" H 7244 4455 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 6950 4200 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 7000 4125 50  0001 L TNN
	1    6900 4500
	-1   0    0    1   
$EndComp
Wire Wire Line
	7200 4500 7600 4500
Wire Wire Line
	5900 4800 6400 4800
Wire Wire Line
	6900 4800 7400 4800
Connection ~ 6900 4800
Wire Wire Line
	5900 4200 6400 4200
Wire Wire Line
	6900 4200 7400 4200
Connection ~ 6900 4200
$Comp
L Device:C C11
U 1 1 61804AA1
P 6400 4500
F 0 "C11" H 6515 4546 50  0001 L CNN
F 1 "100nf" H 6515 4500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 6438 4350 50  0001 C CNN
F 3 "~" H 6400 4500 50  0001 C CNN
	1    6400 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 4350 6400 4200
Connection ~ 6400 4200
Wire Wire Line
	6400 4200 6900 4200
Wire Wire Line
	6400 4650 6400 4800
Connection ~ 6400 4800
Wire Wire Line
	6400 4800 6900 4800
$Comp
L LED:WS2812B D12
U 1 1 61804AAD
P 7900 4500
F 0 "D12" H 8244 4546 50  0001 L CNN
F 1 "WS2812B" H 8244 4455 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 7950 4200 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 8000 4125 50  0001 L TNN
	1    7900 4500
	-1   0    0    1   
$EndComp
Wire Wire Line
	8200 4500 8600 4500
Wire Wire Line
	7900 4800 8400 4800
Connection ~ 7900 4800
Wire Wire Line
	7900 4200 8400 4200
Connection ~ 7900 4200
$Comp
L Device:C C12
U 1 1 61804AB8
P 7400 4500
F 0 "C12" H 7515 4546 50  0001 L CNN
F 1 "100nf" H 7515 4500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7438 4350 50  0001 C CNN
F 3 "~" H 7400 4500 50  0001 C CNN
	1    7400 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 4350 7400 4200
Connection ~ 7400 4200
Wire Wire Line
	7400 4200 7900 4200
Wire Wire Line
	7400 4650 7400 4800
Connection ~ 7400 4800
Wire Wire Line
	7400 4800 7900 4800
$Comp
L LED:WS2812B D13
U 1 1 61804AC4
P 8900 4500
F 0 "D13" H 9244 4546 50  0001 L CNN
F 1 "WS2812B" H 9244 4455 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 8950 4200 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 9000 4125 50  0001 L TNN
	1    8900 4500
	-1   0    0    1   
$EndComp
Wire Wire Line
	9200 4500 9600 4500
Wire Wire Line
	8900 4800 9400 4800
Connection ~ 8900 4800
Wire Wire Line
	8900 4200 9400 4200
Connection ~ 8900 4200
$Comp
L Device:C C13
U 1 1 61804ACF
P 8400 4500
F 0 "C13" H 8515 4546 50  0001 L CNN
F 1 "100nf" H 8515 4500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 8438 4350 50  0001 C CNN
F 3 "~" H 8400 4500 50  0001 C CNN
	1    8400 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 4350 8400 4200
Connection ~ 8400 4200
Wire Wire Line
	8400 4200 8900 4200
Wire Wire Line
	8400 4650 8400 4800
Connection ~ 8400 4800
Wire Wire Line
	8400 4800 8900 4800
$Comp
L LED:WS2812B D14
U 1 1 61804ADB
P 9900 4500
F 0 "D14" H 10244 4546 50  0001 L CNN
F 1 "WS2812B" H 10244 4455 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 9950 4200 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 10000 4125 50  0001 L TNN
	1    9900 4500
	-1   0    0    1   
$EndComp
Wire Wire Line
	10200 4500 10600 4500
Wire Wire Line
	9900 4800 10400 4800
Connection ~ 9900 4800
Wire Wire Line
	9900 4200 10400 4200
Connection ~ 9900 4200
$Comp
L Device:C C14
U 1 1 61804AE6
P 9400 4500
F 0 "C14" H 9515 4546 50  0001 L CNN
F 1 "100nf" H 9515 4500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 9438 4350 50  0001 C CNN
F 3 "~" H 9400 4500 50  0001 C CNN
	1    9400 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 4350 9400 4200
Connection ~ 9400 4200
Wire Wire Line
	9400 4200 9900 4200
Wire Wire Line
	9400 4650 9400 4800
Connection ~ 9400 4800
Wire Wire Line
	9400 4800 9900 4800
$Comp
L LED:WS2812B D15
U 1 1 61804AF2
P 10900 4500
F 0 "D15" H 11244 4546 50  0001 L CNN
F 1 "WS2812B" H 11244 4455 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 10950 4200 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 11000 4125 50  0001 L TNN
	1    10900 4500
	-1   0    0    1   
$EndComp
Wire Wire Line
	11200 4500 11600 4500
Wire Wire Line
	10900 4800 11400 4800
Connection ~ 10900 4800
Wire Wire Line
	10900 4200 11400 4200
Connection ~ 10900 4200
$Comp
L Device:C C15
U 1 1 61804AFD
P 10400 4500
F 0 "C15" H 10515 4546 50  0001 L CNN
F 1 "100nf" H 10515 4500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 10438 4350 50  0001 C CNN
F 3 "~" H 10400 4500 50  0001 C CNN
	1    10400 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 4350 10400 4200
Connection ~ 10400 4200
Wire Wire Line
	10400 4200 10900 4200
Wire Wire Line
	10400 4650 10400 4800
Connection ~ 10400 4800
Wire Wire Line
	10400 4800 10900 4800
$Comp
L LED:WS2812B D16
U 1 1 61804B09
P 11900 4500
F 0 "D16" H 12244 4546 50  0001 L CNN
F 1 "WS2812B" H 12244 4455 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 11950 4200 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 12000 4125 50  0001 L TNN
	1    11900 4500
	-1   0    0    1   
$EndComp
$Comp
L Device:C C16
U 1 1 61804B0F
P 11400 4500
F 0 "C16" H 11515 4546 50  0001 L CNN
F 1 "100nf" H 11515 4500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 11438 4350 50  0001 C CNN
F 3 "~" H 11400 4500 50  0001 C CNN
	1    11400 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	11400 4350 11400 4200
Connection ~ 11400 4200
Wire Wire Line
	11400 4200 11900 4200
Wire Wire Line
	11400 4650 11400 4800
Connection ~ 11400 4800
Wire Wire Line
	11400 4800 11900 4800
Connection ~ 5900 4200
Connection ~ 5900 4800
Connection ~ 4900 4200
Wire Wire Line
	12750 3500 12750 4500
$Comp
L LED:WS2812B D18
U 1 1 6185468C
P 5900 5250
F 0 "D18" H 6244 5296 50  0001 L CNN
F 1 "WS2812B" H 6244 5205 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 5950 4950 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 6000 4875 50  0001 L TNN
	1    5900 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 5250 5600 5250
Wire Wire Line
	6200 5250 6600 5250
Wire Wire Line
	4900 5550 5400 5550
Wire Wire Line
	4900 4950 5400 4950
$Comp
L Device:C C17
U 1 1 6185469D
P 5400 5250
F 0 "C17" H 5515 5296 50  0001 L CNN
F 1 "100nf" H 5515 5250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 5438 5100 50  0001 C CNN
F 3 "~" H 5400 5250 50  0001 C CNN
	1    5400 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 5100 5400 4950
Connection ~ 5400 4950
Wire Wire Line
	5400 4950 5900 4950
Wire Wire Line
	5400 5400 5400 5550
Connection ~ 5400 5550
Wire Wire Line
	5400 5550 5900 5550
$Comp
L LED:WS2812B D19
U 1 1 618546A9
P 6900 5250
F 0 "D19" H 7244 5296 50  0001 L CNN
F 1 "WS2812B" H 7244 5205 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 6950 4950 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 7000 4875 50  0001 L TNN
	1    6900 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 5250 7600 5250
Wire Wire Line
	5900 5550 6400 5550
Wire Wire Line
	6900 5550 7400 5550
Connection ~ 6900 5550
Wire Wire Line
	5900 4950 6400 4950
Wire Wire Line
	6900 4950 7400 4950
Connection ~ 6900 4950
$Comp
L Device:C C18
U 1 1 618546B6
P 6400 5250
F 0 "C18" H 6515 5296 50  0001 L CNN
F 1 "100nf" H 6515 5250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 6438 5100 50  0001 C CNN
F 3 "~" H 6400 5250 50  0001 C CNN
	1    6400 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 5100 6400 4950
Connection ~ 6400 4950
Wire Wire Line
	6400 4950 6900 4950
Wire Wire Line
	6400 5400 6400 5550
Connection ~ 6400 5550
Wire Wire Line
	6400 5550 6900 5550
$Comp
L LED:WS2812B D20
U 1 1 618546C2
P 7900 5250
F 0 "D20" H 8244 5296 50  0001 L CNN
F 1 "WS2812B" H 8244 5205 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 7950 4950 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 8000 4875 50  0001 L TNN
	1    7900 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 5250 8600 5250
Wire Wire Line
	7900 5550 8400 5550
Connection ~ 7900 5550
Wire Wire Line
	7900 4950 8400 4950
Connection ~ 7900 4950
$Comp
L Device:C C19
U 1 1 618546CD
P 7400 5250
F 0 "C19" H 7515 5296 50  0001 L CNN
F 1 "100nf" H 7515 5250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7438 5100 50  0001 C CNN
F 3 "~" H 7400 5250 50  0001 C CNN
	1    7400 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 5100 7400 4950
Connection ~ 7400 4950
Wire Wire Line
	7400 4950 7900 4950
Wire Wire Line
	7400 5400 7400 5550
Connection ~ 7400 5550
Wire Wire Line
	7400 5550 7900 5550
$Comp
L LED:WS2812B D21
U 1 1 618546D9
P 8900 5250
F 0 "D21" H 9244 5296 50  0001 L CNN
F 1 "WS2812B" H 9244 5205 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 8950 4950 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 9000 4875 50  0001 L TNN
	1    8900 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 5250 9600 5250
Wire Wire Line
	8900 5550 9400 5550
Connection ~ 8900 5550
Wire Wire Line
	8900 4950 9400 4950
Connection ~ 8900 4950
$Comp
L Device:C C20
U 1 1 618546E4
P 8400 5250
F 0 "C20" H 8515 5296 50  0001 L CNN
F 1 "100nf" H 8515 5250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 8438 5100 50  0001 C CNN
F 3 "~" H 8400 5250 50  0001 C CNN
	1    8400 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 5100 8400 4950
Connection ~ 8400 4950
Wire Wire Line
	8400 4950 8900 4950
Wire Wire Line
	8400 5400 8400 5550
Connection ~ 8400 5550
Wire Wire Line
	8400 5550 8900 5550
$Comp
L LED:WS2812B D22
U 1 1 618546F0
P 9900 5250
F 0 "D22" H 10244 5296 50  0001 L CNN
F 1 "WS2812B" H 10244 5205 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 9950 4950 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 10000 4875 50  0001 L TNN
	1    9900 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 5250 10600 5250
Wire Wire Line
	9900 5550 10400 5550
Connection ~ 9900 5550
Wire Wire Line
	9900 4950 10400 4950
Connection ~ 9900 4950
$Comp
L Device:C C21
U 1 1 618546FB
P 9400 5250
F 0 "C21" H 9515 5296 50  0001 L CNN
F 1 "100nf" H 9515 5250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 9438 5100 50  0001 C CNN
F 3 "~" H 9400 5250 50  0001 C CNN
	1    9400 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 5100 9400 4950
Connection ~ 9400 4950
Wire Wire Line
	9400 4950 9900 4950
Wire Wire Line
	9400 5400 9400 5550
Connection ~ 9400 5550
Wire Wire Line
	9400 5550 9900 5550
$Comp
L LED:WS2812B D23
U 1 1 61854707
P 10900 5250
F 0 "D23" H 11244 5296 50  0001 L CNN
F 1 "WS2812B" H 11244 5205 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 10950 4950 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 11000 4875 50  0001 L TNN
	1    10900 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	11200 5250 11600 5250
Wire Wire Line
	10900 5550 11400 5550
Connection ~ 10900 5550
Wire Wire Line
	10900 4950 11400 4950
Connection ~ 10900 4950
$Comp
L Device:C C22
U 1 1 61854712
P 10400 5250
F 0 "C22" H 10515 5296 50  0001 L CNN
F 1 "100nf" H 10515 5250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 10438 5100 50  0001 C CNN
F 3 "~" H 10400 5250 50  0001 C CNN
	1    10400 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 5100 10400 4950
Connection ~ 10400 4950
Wire Wire Line
	10400 4950 10900 4950
Wire Wire Line
	10400 5400 10400 5550
Connection ~ 10400 5550
Wire Wire Line
	10400 5550 10900 5550
$Comp
L LED:WS2812B D24
U 1 1 6185471E
P 11900 5250
F 0 "D24" H 12244 5296 50  0001 L CNN
F 1 "WS2812B" H 12244 5205 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 11950 4950 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 12000 4875 50  0001 L TNN
	1    11900 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C23
U 1 1 61854724
P 11400 5250
F 0 "C23" H 11515 5296 50  0001 L CNN
F 1 "100nf" H 11515 5250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 11438 5100 50  0001 C CNN
F 3 "~" H 11400 5250 50  0001 C CNN
	1    11400 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	11400 5100 11400 4950
Connection ~ 11400 4950
Wire Wire Line
	11400 4950 11900 4950
Wire Wire Line
	11400 5400 11400 5550
Connection ~ 11400 5550
Wire Wire Line
	11400 5550 11900 5550
Connection ~ 5900 4950
Connection ~ 5900 5550
Wire Wire Line
	3950 4500 3950 5250
$Comp
L LED:WS2812B D26
U 1 1 61895910
P 5900 6250
F 0 "D26" H 6244 6296 50  0001 L CNN
F 1 "WS2812B" H 6244 6205 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 5950 5950 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 6000 5875 50  0001 L TNN
	1    5900 6250
	-1   0    0    1   
$EndComp
$Comp
L LED:WS2812B D25
U 1 1 61895916
P 4900 6250
F 0 "D25" H 5244 6296 50  0001 L CNN
F 1 "WS2812B" H 5244 6205 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 4950 5950 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 5000 5875 50  0001 L TNN
	1    4900 6250
	-1   0    0    1   
$EndComp
Wire Wire Line
	5200 6250 5600 6250
Wire Wire Line
	6200 6250 6600 6250
Wire Wire Line
	4900 6550 5400 6550
Wire Wire Line
	4900 5950 5400 5950
$Comp
L Device:C C26
U 1 1 61895920
P 5400 6250
F 0 "C26" H 5515 6296 50  0001 L CNN
F 1 "100nf" H 5515 6250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 5438 6100 50  0001 C CNN
F 3 "~" H 5400 6250 50  0001 C CNN
	1    5400 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 6100 5400 5950
Connection ~ 5400 5950
Wire Wire Line
	5400 5950 5900 5950
Wire Wire Line
	5400 6400 5400 6550
Connection ~ 5400 6550
Wire Wire Line
	5400 6550 5900 6550
$Comp
L LED:WS2812B D27
U 1 1 6189592C
P 6900 6250
F 0 "D27" H 7244 6296 50  0001 L CNN
F 1 "WS2812B" H 7244 6205 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 6950 5950 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 7000 5875 50  0001 L TNN
	1    6900 6250
	-1   0    0    1   
$EndComp
Wire Wire Line
	7200 6250 7600 6250
Wire Wire Line
	5900 6550 6400 6550
Wire Wire Line
	6900 6550 7400 6550
Connection ~ 6900 6550
Wire Wire Line
	5900 5950 6400 5950
Wire Wire Line
	6900 5950 7400 5950
Connection ~ 6900 5950
$Comp
L Device:C C27
U 1 1 61895939
P 6400 6250
F 0 "C27" H 6515 6296 50  0001 L CNN
F 1 "100nf" H 6515 6250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 6438 6100 50  0001 C CNN
F 3 "~" H 6400 6250 50  0001 C CNN
	1    6400 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 6100 6400 5950
Connection ~ 6400 5950
Wire Wire Line
	6400 5950 6900 5950
Wire Wire Line
	6400 6400 6400 6550
Connection ~ 6400 6550
Wire Wire Line
	6400 6550 6900 6550
$Comp
L LED:WS2812B D28
U 1 1 61895945
P 7900 6250
F 0 "D28" H 8244 6296 50  0001 L CNN
F 1 "WS2812B" H 8244 6205 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 7950 5950 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 8000 5875 50  0001 L TNN
	1    7900 6250
	-1   0    0    1   
$EndComp
Wire Wire Line
	8200 6250 8600 6250
Wire Wire Line
	7900 6550 8400 6550
Connection ~ 7900 6550
Wire Wire Line
	7900 5950 8400 5950
Connection ~ 7900 5950
$Comp
L Device:C C28
U 1 1 61895950
P 7400 6250
F 0 "C28" H 7515 6296 50  0001 L CNN
F 1 "100nf" H 7515 6250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7438 6100 50  0001 C CNN
F 3 "~" H 7400 6250 50  0001 C CNN
	1    7400 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 6100 7400 5950
Connection ~ 7400 5950
Wire Wire Line
	7400 5950 7900 5950
Wire Wire Line
	7400 6400 7400 6550
Connection ~ 7400 6550
Wire Wire Line
	7400 6550 7900 6550
$Comp
L LED:WS2812B D29
U 1 1 6189595C
P 8900 6250
F 0 "D29" H 9244 6296 50  0001 L CNN
F 1 "WS2812B" H 9244 6205 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 8950 5950 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 9000 5875 50  0001 L TNN
	1    8900 6250
	-1   0    0    1   
$EndComp
Wire Wire Line
	9200 6250 9600 6250
Wire Wire Line
	8900 6550 9400 6550
Connection ~ 8900 6550
Wire Wire Line
	8900 5950 9400 5950
Connection ~ 8900 5950
$Comp
L Device:C C29
U 1 1 61895967
P 8400 6250
F 0 "C29" H 8515 6296 50  0001 L CNN
F 1 "100nf" H 8515 6250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 8438 6100 50  0001 C CNN
F 3 "~" H 8400 6250 50  0001 C CNN
	1    8400 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 6100 8400 5950
Connection ~ 8400 5950
Wire Wire Line
	8400 5950 8900 5950
Wire Wire Line
	8400 6400 8400 6550
Connection ~ 8400 6550
Wire Wire Line
	8400 6550 8900 6550
$Comp
L LED:WS2812B D30
U 1 1 61895973
P 9900 6250
F 0 "D30" H 10244 6296 50  0001 L CNN
F 1 "WS2812B" H 10244 6205 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 9950 5950 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 10000 5875 50  0001 L TNN
	1    9900 6250
	-1   0    0    1   
$EndComp
Wire Wire Line
	10200 6250 10600 6250
Wire Wire Line
	9900 6550 10400 6550
Connection ~ 9900 6550
Wire Wire Line
	9900 5950 10400 5950
Connection ~ 9900 5950
$Comp
L Device:C C30
U 1 1 6189597E
P 9400 6250
F 0 "C30" H 9515 6296 50  0001 L CNN
F 1 "100nf" H 9515 6250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 9438 6100 50  0001 C CNN
F 3 "~" H 9400 6250 50  0001 C CNN
	1    9400 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 6100 9400 5950
Connection ~ 9400 5950
Wire Wire Line
	9400 5950 9900 5950
Wire Wire Line
	9400 6400 9400 6550
Connection ~ 9400 6550
Wire Wire Line
	9400 6550 9900 6550
$Comp
L LED:WS2812B D31
U 1 1 6189598A
P 10900 6250
F 0 "D31" H 11244 6296 50  0001 L CNN
F 1 "WS2812B" H 11244 6205 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 10950 5950 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 11000 5875 50  0001 L TNN
	1    10900 6250
	-1   0    0    1   
$EndComp
Wire Wire Line
	11200 6250 11600 6250
Wire Wire Line
	10900 6550 11400 6550
Connection ~ 10900 6550
Wire Wire Line
	10900 5950 11400 5950
Connection ~ 10900 5950
$Comp
L Device:C C31
U 1 1 61895995
P 10400 6250
F 0 "C31" H 10515 6296 50  0001 L CNN
F 1 "100nf" H 10515 6250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 10438 6100 50  0001 C CNN
F 3 "~" H 10400 6250 50  0001 C CNN
	1    10400 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 6100 10400 5950
Connection ~ 10400 5950
Wire Wire Line
	10400 5950 10900 5950
Wire Wire Line
	10400 6400 10400 6550
Connection ~ 10400 6550
Wire Wire Line
	10400 6550 10900 6550
$Comp
L LED:WS2812B D32
U 1 1 618959A1
P 11900 6250
F 0 "D32" H 12244 6296 50  0001 L CNN
F 1 "WS2812B" H 12244 6205 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 11950 5950 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 12000 5875 50  0001 L TNN
	1    11900 6250
	-1   0    0    1   
$EndComp
$Comp
L Device:C C32
U 1 1 618959A7
P 11400 6250
F 0 "C32" H 11515 6296 50  0001 L CNN
F 1 "100nf" H 11515 6250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 11438 6100 50  0001 C CNN
F 3 "~" H 11400 6250 50  0001 C CNN
	1    11400 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	11400 6100 11400 5950
Connection ~ 11400 5950
Wire Wire Line
	11400 5950 11900 5950
Wire Wire Line
	11400 6400 11400 6550
Connection ~ 11400 6550
Wire Wire Line
	11400 6550 11900 6550
Connection ~ 5900 5950
Connection ~ 5900 6550
Connection ~ 4900 5950
$Comp
L LED:WS2812B D34
U 1 1 618959B9
P 5900 7000
F 0 "D34" H 6244 7046 50  0001 L CNN
F 1 "WS2812B" H 6244 6955 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 5950 6700 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 6000 6625 50  0001 L TNN
	1    5900 7000
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D33
U 1 1 618959BF
P 4900 7000
F 0 "D33" H 5244 7046 50  0001 L CNN
F 1 "WS2812B" H 5244 6955 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 4950 6700 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 5000 6625 50  0001 L TNN
	1    4900 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 7000 5600 7000
Wire Wire Line
	6200 7000 6600 7000
Wire Wire Line
	4900 7300 5400 7300
Wire Wire Line
	4900 6700 5400 6700
$Comp
L Device:C C33
U 1 1 618959C9
P 5400 7000
F 0 "C33" H 5515 7046 50  0001 L CNN
F 1 "100nf" H 5515 7000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 5438 6850 50  0001 C CNN
F 3 "~" H 5400 7000 50  0001 C CNN
	1    5400 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 6850 5400 6700
Connection ~ 5400 6700
Wire Wire Line
	5400 6700 5900 6700
Wire Wire Line
	5400 7150 5400 7300
Connection ~ 5400 7300
Wire Wire Line
	5400 7300 5900 7300
$Comp
L LED:WS2812B D35
U 1 1 618959D5
P 6900 7000
F 0 "D35" H 7244 7046 50  0001 L CNN
F 1 "WS2812B" H 7244 6955 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 6950 6700 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 7000 6625 50  0001 L TNN
	1    6900 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 7000 7600 7000
Wire Wire Line
	5900 7300 6400 7300
Wire Wire Line
	6900 7300 7400 7300
Connection ~ 6900 7300
Wire Wire Line
	5900 6700 6400 6700
Wire Wire Line
	6900 6700 7400 6700
Connection ~ 6900 6700
$Comp
L Device:C C34
U 1 1 618959E2
P 6400 7000
F 0 "C34" H 6515 7046 50  0001 L CNN
F 1 "100nf" H 6515 7000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 6438 6850 50  0001 C CNN
F 3 "~" H 6400 7000 50  0001 C CNN
	1    6400 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 6850 6400 6700
Connection ~ 6400 6700
Wire Wire Line
	6400 6700 6900 6700
Wire Wire Line
	6400 7150 6400 7300
Connection ~ 6400 7300
Wire Wire Line
	6400 7300 6900 7300
$Comp
L LED:WS2812B D36
U 1 1 618959EE
P 7900 7000
F 0 "D36" H 8244 7046 50  0001 L CNN
F 1 "WS2812B" H 8244 6955 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 7950 6700 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 8000 6625 50  0001 L TNN
	1    7900 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 7000 8600 7000
Wire Wire Line
	7900 7300 8400 7300
Connection ~ 7900 7300
Wire Wire Line
	7900 6700 8400 6700
Connection ~ 7900 6700
$Comp
L Device:C C35
U 1 1 618959F9
P 7400 7000
F 0 "C35" H 7515 7046 50  0001 L CNN
F 1 "100nf" H 7515 7000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7438 6850 50  0001 C CNN
F 3 "~" H 7400 7000 50  0001 C CNN
	1    7400 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 6850 7400 6700
Connection ~ 7400 6700
Wire Wire Line
	7400 6700 7900 6700
Wire Wire Line
	7400 7150 7400 7300
Connection ~ 7400 7300
Wire Wire Line
	7400 7300 7900 7300
$Comp
L LED:WS2812B D37
U 1 1 61895A05
P 8900 7000
F 0 "D37" H 9244 7046 50  0001 L CNN
F 1 "WS2812B" H 9244 6955 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 8950 6700 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 9000 6625 50  0001 L TNN
	1    8900 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 7000 9600 7000
Wire Wire Line
	8900 7300 9400 7300
Connection ~ 8900 7300
Wire Wire Line
	8900 6700 9400 6700
Connection ~ 8900 6700
$Comp
L Device:C C36
U 1 1 61895A10
P 8400 7000
F 0 "C36" H 8515 7046 50  0001 L CNN
F 1 "100nf" H 8515 7000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 8438 6850 50  0001 C CNN
F 3 "~" H 8400 7000 50  0001 C CNN
	1    8400 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 6850 8400 6700
Connection ~ 8400 6700
Wire Wire Line
	8400 6700 8900 6700
Wire Wire Line
	8400 7150 8400 7300
Connection ~ 8400 7300
Wire Wire Line
	8400 7300 8900 7300
$Comp
L LED:WS2812B D38
U 1 1 61895A1C
P 9900 7000
F 0 "D38" H 10244 7046 50  0001 L CNN
F 1 "WS2812B" H 10244 6955 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 9950 6700 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 10000 6625 50  0001 L TNN
	1    9900 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 7000 10600 7000
Wire Wire Line
	9900 7300 10400 7300
Connection ~ 9900 7300
Wire Wire Line
	9900 6700 10400 6700
Connection ~ 9900 6700
$Comp
L Device:C C37
U 1 1 61895A27
P 9400 7000
F 0 "C37" H 9515 7046 50  0001 L CNN
F 1 "100nf" H 9515 7000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 9438 6850 50  0001 C CNN
F 3 "~" H 9400 7000 50  0001 C CNN
	1    9400 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 6850 9400 6700
Connection ~ 9400 6700
Wire Wire Line
	9400 6700 9900 6700
Wire Wire Line
	9400 7150 9400 7300
Connection ~ 9400 7300
Wire Wire Line
	9400 7300 9900 7300
$Comp
L LED:WS2812B D39
U 1 1 61895A33
P 10900 7000
F 0 "D39" H 11244 7046 50  0001 L CNN
F 1 "WS2812B" H 11244 6955 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 10950 6700 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 11000 6625 50  0001 L TNN
	1    10900 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	11200 7000 11600 7000
Wire Wire Line
	10900 7300 11400 7300
Connection ~ 10900 7300
Wire Wire Line
	10900 6700 11400 6700
Connection ~ 10900 6700
$Comp
L Device:C C38
U 1 1 61895A3E
P 10400 7000
F 0 "C38" H 10515 7046 50  0001 L CNN
F 1 "100nf" H 10515 7000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 10438 6850 50  0001 C CNN
F 3 "~" H 10400 7000 50  0001 C CNN
	1    10400 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 6850 10400 6700
Connection ~ 10400 6700
Wire Wire Line
	10400 6700 10900 6700
Wire Wire Line
	10400 7150 10400 7300
Connection ~ 10400 7300
Wire Wire Line
	10400 7300 10900 7300
$Comp
L LED:WS2812B D40
U 1 1 61895A4A
P 11900 7000
F 0 "D40" H 12244 7046 50  0001 L CNN
F 1 "WS2812B" H 12244 6955 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 11950 6700 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 12000 6625 50  0001 L TNN
	1    11900 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C39
U 1 1 61895A50
P 11400 7000
F 0 "C39" H 11515 7046 50  0001 L CNN
F 1 "100nf" H 11515 7000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 11438 6850 50  0001 C CNN
F 3 "~" H 11400 7000 50  0001 C CNN
	1    11400 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	11400 6850 11400 6700
Connection ~ 11400 6700
Wire Wire Line
	11400 6700 11900 6700
Wire Wire Line
	11400 7150 11400 7300
Connection ~ 11400 7300
Wire Wire Line
	11400 7300 11900 7300
Connection ~ 5900 6700
Connection ~ 5900 7300
Wire Wire Line
	3950 6250 3950 7000
$Comp
L LED:WS2812B D42
U 1 1 618D749E
P 5900 8000
F 0 "D42" H 6244 8046 50  0001 L CNN
F 1 "WS2812B" H 6244 7955 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 5950 7700 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 6000 7625 50  0001 L TNN
	1    5900 8000
	-1   0    0    1   
$EndComp
$Comp
L LED:WS2812B D41
U 1 1 618D74A4
P 4900 8000
F 0 "D41" H 5244 8046 50  0001 L CNN
F 1 "WS2812B" H 5244 7955 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 4950 7700 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 5000 7625 50  0001 L TNN
	1    4900 8000
	-1   0    0    1   
$EndComp
Wire Wire Line
	5200 8000 5600 8000
Wire Wire Line
	6200 8000 6600 8000
Wire Wire Line
	4900 8300 5400 8300
Wire Wire Line
	4900 7700 5400 7700
$Comp
L Device:C C42
U 1 1 618D74AE
P 5400 8000
F 0 "C42" H 5515 8046 50  0001 L CNN
F 1 "100nf" H 5515 8000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 5438 7850 50  0001 C CNN
F 3 "~" H 5400 8000 50  0001 C CNN
	1    5400 8000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 7850 5400 7700
Connection ~ 5400 7700
Wire Wire Line
	5400 7700 5900 7700
Wire Wire Line
	5400 8150 5400 8300
Connection ~ 5400 8300
Wire Wire Line
	5400 8300 5900 8300
$Comp
L LED:WS2812B D43
U 1 1 618D74BA
P 6900 8000
F 0 "D43" H 7244 8046 50  0001 L CNN
F 1 "WS2812B" H 7244 7955 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 6950 7700 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 7000 7625 50  0001 L TNN
	1    6900 8000
	-1   0    0    1   
$EndComp
Wire Wire Line
	7200 8000 7600 8000
Wire Wire Line
	5900 8300 6400 8300
Wire Wire Line
	6900 8300 7400 8300
Connection ~ 6900 8300
Wire Wire Line
	5900 7700 6400 7700
Wire Wire Line
	6900 7700 7400 7700
Connection ~ 6900 7700
$Comp
L Device:C C43
U 1 1 618D74C7
P 6400 8000
F 0 "C43" H 6515 8046 50  0001 L CNN
F 1 "100nf" H 6515 8000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 6438 7850 50  0001 C CNN
F 3 "~" H 6400 8000 50  0001 C CNN
	1    6400 8000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 7850 6400 7700
Connection ~ 6400 7700
Wire Wire Line
	6400 7700 6900 7700
Wire Wire Line
	6400 8150 6400 8300
Connection ~ 6400 8300
Wire Wire Line
	6400 8300 6900 8300
$Comp
L LED:WS2812B D44
U 1 1 618D74D3
P 7900 8000
F 0 "D44" H 8244 8046 50  0001 L CNN
F 1 "WS2812B" H 8244 7955 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 7950 7700 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 8000 7625 50  0001 L TNN
	1    7900 8000
	-1   0    0    1   
$EndComp
Wire Wire Line
	8200 8000 8600 8000
Wire Wire Line
	7900 8300 8400 8300
Connection ~ 7900 8300
Wire Wire Line
	7900 7700 8400 7700
Connection ~ 7900 7700
$Comp
L Device:C C44
U 1 1 618D74DE
P 7400 8000
F 0 "C44" H 7515 8046 50  0001 L CNN
F 1 "100nf" H 7515 8000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7438 7850 50  0001 C CNN
F 3 "~" H 7400 8000 50  0001 C CNN
	1    7400 8000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 7850 7400 7700
Connection ~ 7400 7700
Wire Wire Line
	7400 7700 7900 7700
Wire Wire Line
	7400 8150 7400 8300
Connection ~ 7400 8300
Wire Wire Line
	7400 8300 7900 8300
$Comp
L LED:WS2812B D45
U 1 1 618D74EA
P 8900 8000
F 0 "D45" H 9244 8046 50  0001 L CNN
F 1 "WS2812B" H 9244 7955 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 8950 7700 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 9000 7625 50  0001 L TNN
	1    8900 8000
	-1   0    0    1   
$EndComp
Wire Wire Line
	9200 8000 9600 8000
Wire Wire Line
	8900 8300 9400 8300
Connection ~ 8900 8300
Wire Wire Line
	8900 7700 9400 7700
Connection ~ 8900 7700
$Comp
L Device:C C45
U 1 1 618D74F5
P 8400 8000
F 0 "C45" H 8515 8046 50  0001 L CNN
F 1 "100nf" H 8515 8000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 8438 7850 50  0001 C CNN
F 3 "~" H 8400 8000 50  0001 C CNN
	1    8400 8000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 7850 8400 7700
Connection ~ 8400 7700
Wire Wire Line
	8400 7700 8900 7700
Wire Wire Line
	8400 8150 8400 8300
Connection ~ 8400 8300
Wire Wire Line
	8400 8300 8900 8300
$Comp
L LED:WS2812B D46
U 1 1 618D7501
P 9900 8000
F 0 "D46" H 10244 8046 50  0001 L CNN
F 1 "WS2812B" H 10244 7955 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 9950 7700 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 10000 7625 50  0001 L TNN
	1    9900 8000
	-1   0    0    1   
$EndComp
Wire Wire Line
	10200 8000 10600 8000
Wire Wire Line
	9900 8300 10400 8300
Connection ~ 9900 8300
Wire Wire Line
	9900 7700 10400 7700
Connection ~ 9900 7700
$Comp
L Device:C C46
U 1 1 618D750C
P 9400 8000
F 0 "C46" H 9515 8046 50  0001 L CNN
F 1 "100nf" H 9515 8000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 9438 7850 50  0001 C CNN
F 3 "~" H 9400 8000 50  0001 C CNN
	1    9400 8000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 7850 9400 7700
Connection ~ 9400 7700
Wire Wire Line
	9400 7700 9900 7700
Wire Wire Line
	9400 8150 9400 8300
Connection ~ 9400 8300
Wire Wire Line
	9400 8300 9900 8300
$Comp
L LED:WS2812B D47
U 1 1 618D7518
P 10900 8000
F 0 "D47" H 11244 8046 50  0001 L CNN
F 1 "WS2812B" H 11244 7955 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 10950 7700 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 11000 7625 50  0001 L TNN
	1    10900 8000
	-1   0    0    1   
$EndComp
Wire Wire Line
	11200 8000 11600 8000
Wire Wire Line
	10900 8300 11400 8300
Connection ~ 10900 8300
Wire Wire Line
	10900 7700 11400 7700
Connection ~ 10900 7700
$Comp
L Device:C C47
U 1 1 618D7523
P 10400 8000
F 0 "C47" H 10515 8046 50  0001 L CNN
F 1 "100nf" H 10515 8000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 10438 7850 50  0001 C CNN
F 3 "~" H 10400 8000 50  0001 C CNN
	1    10400 8000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 7850 10400 7700
Connection ~ 10400 7700
Wire Wire Line
	10400 7700 10900 7700
Wire Wire Line
	10400 8150 10400 8300
Connection ~ 10400 8300
Wire Wire Line
	10400 8300 10900 8300
$Comp
L LED:WS2812B D48
U 1 1 618D752F
P 11900 8000
F 0 "D48" H 12244 8046 50  0001 L CNN
F 1 "WS2812B" H 12244 7955 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 11950 7700 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 12000 7625 50  0001 L TNN
	1    11900 8000
	-1   0    0    1   
$EndComp
$Comp
L Device:C C48
U 1 1 618D7535
P 11400 8000
F 0 "C48" H 11515 8046 50  0001 L CNN
F 1 "100nf" H 11515 8000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 11438 7850 50  0001 C CNN
F 3 "~" H 11400 8000 50  0001 C CNN
	1    11400 8000
	1    0    0    -1  
$EndComp
Wire Wire Line
	11400 7850 11400 7700
Connection ~ 11400 7700
Wire Wire Line
	11400 7700 11900 7700
Wire Wire Line
	11400 8150 11400 8300
Connection ~ 11400 8300
Wire Wire Line
	11400 8300 11900 8300
Connection ~ 5900 7700
Connection ~ 5900 8300
Connection ~ 4900 7700
$Comp
L LED:WS2812B D50
U 1 1 618D7547
P 5900 8750
F 0 "D50" H 6244 8796 50  0001 L CNN
F 1 "WS2812B" H 6244 8705 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 5950 8450 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 6000 8375 50  0001 L TNN
	1    5900 8750
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D49
U 1 1 618D754D
P 4900 8750
F 0 "D49" H 5244 8796 50  0001 L CNN
F 1 "WS2812B" H 5244 8705 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 4950 8450 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 5000 8375 50  0001 L TNN
	1    4900 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 8750 5600 8750
Wire Wire Line
	6200 8750 6600 8750
Wire Wire Line
	4900 9050 5400 9050
Wire Wire Line
	4900 8450 5400 8450
$Comp
L Device:C C49
U 1 1 618D7557
P 5400 8750
F 0 "C49" H 5515 8796 50  0000 L CNN
F 1 "100nf" H 5515 8705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 5438 8600 50  0001 C CNN
F 3 "~" H 5400 8750 50  0001 C CNN
	1    5400 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 8600 5400 8450
Connection ~ 5400 8450
Wire Wire Line
	5400 8450 5900 8450
Wire Wire Line
	5400 8900 5400 9050
Connection ~ 5400 9050
Wire Wire Line
	5400 9050 5900 9050
$Comp
L LED:WS2812B D51
U 1 1 618D7563
P 6900 8750
F 0 "D51" H 7244 8796 50  0001 L CNN
F 1 "WS2812B" H 7244 8705 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 6950 8450 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 7000 8375 50  0001 L TNN
	1    6900 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 8750 7600 8750
Wire Wire Line
	5900 9050 6400 9050
Wire Wire Line
	6900 9050 7400 9050
Connection ~ 6900 9050
Wire Wire Line
	5900 8450 6400 8450
Wire Wire Line
	6900 8450 7400 8450
Connection ~ 6900 8450
$Comp
L Device:C C50
U 1 1 618D7570
P 6400 8750
F 0 "C50" H 6515 8796 50  0001 L CNN
F 1 "100nf" H 6515 8750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 6438 8600 50  0001 C CNN
F 3 "~" H 6400 8750 50  0001 C CNN
	1    6400 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 8600 6400 8450
Connection ~ 6400 8450
Wire Wire Line
	6400 8450 6900 8450
Wire Wire Line
	6400 8900 6400 9050
Connection ~ 6400 9050
Wire Wire Line
	6400 9050 6900 9050
$Comp
L LED:WS2812B D52
U 1 1 618D757C
P 7900 8750
F 0 "D52" H 8244 8796 50  0001 L CNN
F 1 "WS2812B" H 8244 8705 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 7950 8450 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 8000 8375 50  0001 L TNN
	1    7900 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 8750 8600 8750
Wire Wire Line
	7900 9050 8400 9050
Connection ~ 7900 9050
Wire Wire Line
	7900 8450 8400 8450
Connection ~ 7900 8450
$Comp
L Device:C C51
U 1 1 618D7587
P 7400 8750
F 0 "C51" H 7515 8796 50  0001 L CNN
F 1 "100nf" H 7515 8750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7438 8600 50  0001 C CNN
F 3 "~" H 7400 8750 50  0001 C CNN
	1    7400 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 8600 7400 8450
Connection ~ 7400 8450
Wire Wire Line
	7400 8450 7900 8450
Wire Wire Line
	7400 8900 7400 9050
Connection ~ 7400 9050
Wire Wire Line
	7400 9050 7900 9050
$Comp
L LED:WS2812B D53
U 1 1 618D7593
P 8900 8750
F 0 "D53" H 9244 8796 50  0001 L CNN
F 1 "WS2812B" H 9244 8705 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 8950 8450 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 9000 8375 50  0001 L TNN
	1    8900 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 8750 9600 8750
Wire Wire Line
	8900 9050 9400 9050
Connection ~ 8900 9050
Wire Wire Line
	8900 8450 9400 8450
Connection ~ 8900 8450
$Comp
L Device:C C52
U 1 1 618D759E
P 8400 8750
F 0 "C52" H 8515 8796 50  0001 L CNN
F 1 "100nf" H 8515 8750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 8438 8600 50  0001 C CNN
F 3 "~" H 8400 8750 50  0001 C CNN
	1    8400 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 8600 8400 8450
Connection ~ 8400 8450
Wire Wire Line
	8400 8450 8900 8450
Wire Wire Line
	8400 8900 8400 9050
Connection ~ 8400 9050
Wire Wire Line
	8400 9050 8900 9050
$Comp
L LED:WS2812B D54
U 1 1 618D75AA
P 9900 8750
F 0 "D54" H 10244 8796 50  0001 L CNN
F 1 "WS2812B" H 10244 8705 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 9950 8450 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 10000 8375 50  0001 L TNN
	1    9900 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 8750 10600 8750
Wire Wire Line
	9900 9050 10400 9050
Connection ~ 9900 9050
Wire Wire Line
	9900 8450 10400 8450
Connection ~ 9900 8450
$Comp
L Device:C C53
U 1 1 618D75B5
P 9400 8750
F 0 "C53" H 9515 8796 50  0001 L CNN
F 1 "100nf" H 9515 8750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 9438 8600 50  0001 C CNN
F 3 "~" H 9400 8750 50  0001 C CNN
	1    9400 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 8600 9400 8450
Connection ~ 9400 8450
Wire Wire Line
	9400 8450 9900 8450
Wire Wire Line
	9400 8900 9400 9050
Connection ~ 9400 9050
Wire Wire Line
	9400 9050 9900 9050
$Comp
L LED:WS2812B D55
U 1 1 618D75C1
P 10900 8750
F 0 "D55" H 11244 8796 50  0001 L CNN
F 1 "WS2812B" H 11244 8705 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 10950 8450 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 11000 8375 50  0001 L TNN
	1    10900 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	11200 8750 11600 8750
Wire Wire Line
	10900 9050 11400 9050
Connection ~ 10900 9050
Wire Wire Line
	10900 8450 11400 8450
Connection ~ 10900 8450
$Comp
L Device:C C54
U 1 1 618D75CC
P 10400 8750
F 0 "C54" H 10515 8796 50  0001 L CNN
F 1 "100nf" H 10515 8750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 10438 8600 50  0001 C CNN
F 3 "~" H 10400 8750 50  0001 C CNN
	1    10400 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 8600 10400 8450
Connection ~ 10400 8450
Wire Wire Line
	10400 8450 10900 8450
Wire Wire Line
	10400 8900 10400 9050
Connection ~ 10400 9050
Wire Wire Line
	10400 9050 10900 9050
$Comp
L LED:WS2812B D56
U 1 1 618D75D8
P 11900 8750
F 0 "D56" H 12244 8796 50  0001 L CNN
F 1 "WS2812B" H 12244 8705 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 11950 8450 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 12000 8375 50  0001 L TNN
	1    11900 8750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C55
U 1 1 618D75DE
P 11400 8750
F 0 "C55" H 11515 8796 50  0001 L CNN
F 1 "100nf" H 11515 8750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 11438 8600 50  0001 C CNN
F 3 "~" H 11400 8750 50  0001 C CNN
	1    11400 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	11400 8600 11400 8450
Connection ~ 11400 8450
Wire Wire Line
	11400 8450 11900 8450
Wire Wire Line
	11400 8900 11400 9050
Connection ~ 11400 9050
Wire Wire Line
	11400 9050 11900 9050
Connection ~ 5900 8450
Connection ~ 5900 9050
Wire Wire Line
	3950 8000 3950 8750
Connection ~ 4900 7300
Connection ~ 4900 9050
$Comp
L LED:WS2812B D58
U 1 1 61A83894
P 5900 9750
F 0 "D58" H 6244 9796 50  0001 L CNN
F 1 "WS2812B" H 6244 9705 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 5950 9450 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 6000 9375 50  0001 L TNN
	1    5900 9750
	-1   0    0    1   
$EndComp
$Comp
L LED:WS2812B D57
U 1 1 61A8389A
P 4900 9750
F 0 "D57" H 5244 9796 50  0001 L CNN
F 1 "WS2812B" H 5244 9705 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 4950 9450 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 5000 9375 50  0001 L TNN
	1    4900 9750
	-1   0    0    1   
$EndComp
Wire Wire Line
	5200 9750 5600 9750
Wire Wire Line
	6200 9750 6600 9750
Wire Wire Line
	4900 10050 5400 10050
Wire Wire Line
	4900 9450 5400 9450
$Comp
L Device:C C58
U 1 1 61A838A4
P 5400 9750
F 0 "C58" H 5515 9796 50  0001 L CNN
F 1 "100nf" H 5515 9750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 5438 9600 50  0001 C CNN
F 3 "~" H 5400 9750 50  0001 C CNN
	1    5400 9750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 9600 5400 9450
Connection ~ 5400 9450
Wire Wire Line
	5400 9450 5900 9450
Wire Wire Line
	5400 9900 5400 10050
Connection ~ 5400 10050
Wire Wire Line
	5400 10050 5900 10050
$Comp
L LED:WS2812B D59
U 1 1 61A838B0
P 6900 9750
F 0 "D59" H 7244 9796 50  0001 L CNN
F 1 "WS2812B" H 7244 9705 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 6950 9450 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 7000 9375 50  0001 L TNN
	1    6900 9750
	-1   0    0    1   
$EndComp
Wire Wire Line
	7200 9750 7600 9750
Wire Wire Line
	5900 10050 6400 10050
Wire Wire Line
	6900 10050 7400 10050
Connection ~ 6900 10050
Wire Wire Line
	5900 9450 6400 9450
Wire Wire Line
	6900 9450 7400 9450
Connection ~ 6900 9450
$Comp
L Device:C C59
U 1 1 61A838BD
P 6400 9750
F 0 "C59" H 6515 9796 50  0001 L CNN
F 1 "100nf" H 6515 9750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 6438 9600 50  0001 C CNN
F 3 "~" H 6400 9750 50  0001 C CNN
	1    6400 9750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 9600 6400 9450
Connection ~ 6400 9450
Wire Wire Line
	6400 9450 6900 9450
Wire Wire Line
	6400 9900 6400 10050
Connection ~ 6400 10050
Wire Wire Line
	6400 10050 6900 10050
$Comp
L LED:WS2812B D60
U 1 1 61A838C9
P 7900 9750
F 0 "D60" H 8244 9796 50  0001 L CNN
F 1 "WS2812B" H 8244 9705 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 7950 9450 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 8000 9375 50  0001 L TNN
	1    7900 9750
	-1   0    0    1   
$EndComp
Wire Wire Line
	8200 9750 8600 9750
Wire Wire Line
	7900 10050 8400 10050
Connection ~ 7900 10050
Wire Wire Line
	7900 9450 8400 9450
Connection ~ 7900 9450
$Comp
L Device:C C60
U 1 1 61A838D4
P 7400 9750
F 0 "C60" H 7515 9796 50  0001 L CNN
F 1 "100nf" H 7515 9750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7438 9600 50  0001 C CNN
F 3 "~" H 7400 9750 50  0001 C CNN
	1    7400 9750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 9600 7400 9450
Connection ~ 7400 9450
Wire Wire Line
	7400 9450 7900 9450
Wire Wire Line
	7400 9900 7400 10050
Connection ~ 7400 10050
Wire Wire Line
	7400 10050 7900 10050
$Comp
L LED:WS2812B D61
U 1 1 61A838E0
P 8900 9750
F 0 "D61" H 9244 9796 50  0001 L CNN
F 1 "WS2812B" H 9244 9705 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 8950 9450 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 9000 9375 50  0001 L TNN
	1    8900 9750
	-1   0    0    1   
$EndComp
Wire Wire Line
	9200 9750 9600 9750
Wire Wire Line
	8900 10050 9400 10050
Connection ~ 8900 10050
Wire Wire Line
	8900 9450 9400 9450
Connection ~ 8900 9450
$Comp
L Device:C C61
U 1 1 61A838EB
P 8400 9750
F 0 "C61" H 8515 9796 50  0001 L CNN
F 1 "100nf" H 8515 9750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 8438 9600 50  0001 C CNN
F 3 "~" H 8400 9750 50  0001 C CNN
	1    8400 9750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 9600 8400 9450
Connection ~ 8400 9450
Wire Wire Line
	8400 9450 8900 9450
Wire Wire Line
	8400 9900 8400 10050
Connection ~ 8400 10050
Wire Wire Line
	8400 10050 8900 10050
$Comp
L LED:WS2812B D62
U 1 1 61A838F7
P 9900 9750
F 0 "D62" H 10244 9796 50  0001 L CNN
F 1 "WS2812B" H 10244 9705 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 9950 9450 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 10000 9375 50  0001 L TNN
	1    9900 9750
	-1   0    0    1   
$EndComp
Wire Wire Line
	10200 9750 10600 9750
Wire Wire Line
	9900 10050 10400 10050
Connection ~ 9900 10050
Wire Wire Line
	9900 9450 10400 9450
Connection ~ 9900 9450
$Comp
L Device:C C62
U 1 1 61A83902
P 9400 9750
F 0 "C62" H 9515 9796 50  0001 L CNN
F 1 "100nf" H 9515 9750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 9438 9600 50  0001 C CNN
F 3 "~" H 9400 9750 50  0001 C CNN
	1    9400 9750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 9600 9400 9450
Connection ~ 9400 9450
Wire Wire Line
	9400 9450 9900 9450
Wire Wire Line
	9400 9900 9400 10050
Connection ~ 9400 10050
Wire Wire Line
	9400 10050 9900 10050
$Comp
L LED:WS2812B D63
U 1 1 61A8390E
P 10900 9750
F 0 "D63" H 11244 9796 50  0001 L CNN
F 1 "WS2812B" H 11244 9705 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 10950 9450 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 11000 9375 50  0001 L TNN
	1    10900 9750
	-1   0    0    1   
$EndComp
Wire Wire Line
	11200 9750 11600 9750
Wire Wire Line
	10900 10050 11400 10050
Connection ~ 10900 10050
Wire Wire Line
	10900 9450 11400 9450
Connection ~ 10900 9450
$Comp
L Device:C C63
U 1 1 61A83919
P 10400 9750
F 0 "C63" H 10515 9796 50  0001 L CNN
F 1 "100nf" H 10515 9750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 10438 9600 50  0001 C CNN
F 3 "~" H 10400 9750 50  0001 C CNN
	1    10400 9750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 9600 10400 9450
Connection ~ 10400 9450
Wire Wire Line
	10400 9450 10900 9450
Wire Wire Line
	10400 9900 10400 10050
Connection ~ 10400 10050
Wire Wire Line
	10400 10050 10900 10050
$Comp
L LED:WS2812B D64
U 1 1 61A83925
P 11900 9750
F 0 "D64" H 12244 9796 50  0001 L CNN
F 1 "WS2812B" H 12244 9705 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 11950 9450 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 12000 9375 50  0001 L TNN
	1    11900 9750
	-1   0    0    1   
$EndComp
$Comp
L Device:C C64
U 1 1 61A8392B
P 11400 9750
F 0 "C64" H 11515 9796 50  0001 L CNN
F 1 "100nf" H 11515 9750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 11438 9600 50  0001 C CNN
F 3 "~" H 11400 9750 50  0001 C CNN
	1    11400 9750
	1    0    0    -1  
$EndComp
Wire Wire Line
	11400 9600 11400 9450
Connection ~ 11400 9450
Wire Wire Line
	11400 9450 11900 9450
Wire Wire Line
	11400 9900 11400 10050
Connection ~ 11400 10050
Wire Wire Line
	11400 10050 11900 10050
Connection ~ 5900 9450
Connection ~ 5900 10050
Connection ~ 4900 9450
$Comp
L Connector:Conn_01x03_Male J1
U 1 1 61AF49A9
P 3500 3500
F 0 "J1" H 3472 3432 50  0000 R CNN
F 1 "Conn_01x03_Male" H 3472 3523 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3500 3500 50  0001 C CNN
F 3 "~" H 3500 3500 50  0001 C CNN
	1    3500 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 3500 4600 3500
Wire Wire Line
	3700 3600 4600 3600
Wire Wire Line
	4600 3600 4600 3800
Wire Wire Line
	4600 3800 4900 3800
Wire Wire Line
	11900 3200 12350 3200
Wire Wire Line
	12950 3200 12950 4800
Connection ~ 11900 3200
Connection ~ 11900 4800
Connection ~ 4900 5550
$Comp
L LED:WS2812B D17
U 1 1 61854692
P 4900 5250
F 0 "D17" H 5244 5296 50  0001 L CNN
F 1 "WS2812B" H 5244 5205 50  0001 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 4950 4950 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 5000 4875 50  0001 L TNN
	1    4900 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 3400 4450 3400
Wire Wire Line
	4450 3400 4450 3200
Wire Wire Line
	4450 3200 4900 3200
Connection ~ 4900 3200
Wire Wire Line
	5400 3200 5900 3200
Connection ~ 5400 3200
Wire Wire Line
	4900 3200 5400 3200
Wire Wire Line
	5400 3350 5400 3200
$Comp
L Device:C C1
U 1 1 617DB1EB
P 5400 3500
F 0 "C1" H 5515 3546 50  0001 L CNN
F 1 "100nf" H 5515 3500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 5438 3350 50  0001 C CNN
F 3 "~" H 5400 3500 50  0001 C CNN
	1    5400 3500
	1    0    0    -1  
$EndComp
Text Notes 6150 2300 0    50   ~ 0
8x8 Neopixel Array
$Comp
L Device:C C8
U 1 1 620CDE6E
P 12350 3500
F 0 "C8" H 12465 3546 50  0001 L CNN
F 1 "100nf" H 12465 3500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 12388 3350 50  0001 C CNN
F 3 "~" H 12350 3500 50  0001 C CNN
	1    12350 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	11900 3800 12350 3800
Wire Wire Line
	12350 3800 12350 3650
Connection ~ 11900 3800
Wire Wire Line
	12350 3350 12350 3200
Connection ~ 12350 3200
Wire Wire Line
	11900 4800 12950 4800
Wire Wire Line
	12200 4500 12750 4500
Wire Wire Line
	12200 3500 12750 3500
Wire Wire Line
	12350 3200 12950 3200
Wire Wire Line
	12750 5250 12750 6250
Wire Wire Line
	11900 4950 12350 4950
Wire Wire Line
	12950 4950 12950 6550
$Comp
L Device:C C24
U 1 1 623002A8
P 12350 5250
F 0 "C24" H 12465 5296 50  0001 L CNN
F 1 "100nf" H 12465 5250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 12388 5100 50  0001 C CNN
F 3 "~" H 12350 5250 50  0001 C CNN
	1    12350 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	11900 5550 12350 5550
Wire Wire Line
	12350 5550 12350 5400
Wire Wire Line
	12350 5100 12350 4950
Connection ~ 12350 4950
Wire Wire Line
	11900 6550 12950 6550
Wire Wire Line
	12200 6250 12750 6250
Wire Wire Line
	12200 5250 12750 5250
Wire Wire Line
	12350 4950 12950 4950
Wire Wire Line
	12750 7000 12750 8000
Wire Wire Line
	11900 6700 12350 6700
Wire Wire Line
	12950 6700 12950 8300
$Comp
L Device:C C40
U 1 1 6233C628
P 12350 7000
F 0 "C40" H 12465 7046 50  0001 L CNN
F 1 "100nf" H 12465 7000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 12388 6850 50  0001 C CNN
F 3 "~" H 12350 7000 50  0001 C CNN
	1    12350 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	11900 7300 12350 7300
Wire Wire Line
	12350 7300 12350 7150
Wire Wire Line
	12350 6850 12350 6700
Connection ~ 12350 6700
Wire Wire Line
	11900 8300 12950 8300
Wire Wire Line
	12200 8000 12750 8000
Wire Wire Line
	12200 7000 12750 7000
Wire Wire Line
	12350 6700 12950 6700
Wire Wire Line
	12750 8750 12750 9750
Wire Wire Line
	11900 8450 12350 8450
Wire Wire Line
	12950 8450 12950 10050
$Comp
L Device:C C56
U 1 1 6237A79E
P 12350 8750
F 0 "C56" H 12465 8796 50  0001 L CNN
F 1 "100nf" H 12465 8750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 12388 8600 50  0001 C CNN
F 3 "~" H 12350 8750 50  0001 C CNN
	1    12350 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	11900 9050 12350 9050
Wire Wire Line
	12350 9050 12350 8900
Wire Wire Line
	12350 8600 12350 8450
Connection ~ 12350 8450
Wire Wire Line
	11900 10050 12950 10050
Wire Wire Line
	12200 9750 12750 9750
Wire Wire Line
	12200 8750 12750 8750
Wire Wire Line
	12350 8450 12950 8450
Wire Wire Line
	4900 7300 4900 7500
Wire Wire Line
	4900 3800 4900 4050
Wire Wire Line
	4900 9050 4900 9250
$Comp
L Device:C C9
U 1 1 6240061A
P 4250 4500
F 0 "C9" H 4365 4546 50  0001 L CNN
F 1 "100nf" H 4365 4500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4288 4350 50  0001 C CNN
F 3 "~" H 4250 4500 50  0001 C CNN
	1    4250 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 4350 4250 4200
Wire Wire Line
	4250 4800 4250 4650
Connection ~ 4900 4800
Wire Wire Line
	3950 5250 4600 5250
Wire Wire Line
	3950 4500 4600 4500
Wire Wire Line
	3800 4050 4900 4050
Connection ~ 4900 4050
Wire Wire Line
	4900 4050 4900 4200
Wire Wire Line
	4250 4800 4900 4800
Wire Wire Line
	4250 4200 4900 4200
$Comp
L Device:C C25
U 1 1 626D74E3
P 4250 6250
F 0 "C25" H 4365 6296 50  0001 L CNN
F 1 "100nf" H 4365 6250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4288 6100 50  0001 C CNN
F 3 "~" H 4250 6250 50  0001 C CNN
	1    4250 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 6100 4250 5950
Wire Wire Line
	4250 6550 4250 6400
Wire Wire Line
	4250 6550 4900 6550
Wire Wire Line
	4250 5950 4900 5950
Wire Wire Line
	3950 7000 4600 7000
Wire Wire Line
	4900 5550 4900 5750
Wire Wire Line
	3950 6250 4600 6250
$Comp
L Device:C C41
U 1 1 6275F9CB
P 4250 8000
F 0 "C41" H 4365 8046 50  0001 L CNN
F 1 "100nf" H 4365 8000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4288 7850 50  0001 C CNN
F 3 "~" H 4250 8000 50  0001 C CNN
	1    4250 8000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 7850 4250 7700
Wire Wire Line
	4250 8300 4250 8150
Wire Wire Line
	4250 8300 4900 8300
Wire Wire Line
	4250 7700 4900 7700
Wire Wire Line
	3950 8750 4600 8750
Wire Wire Line
	3950 8000 4600 8000
Wire Wire Line
	3800 4050 3800 5750
Wire Wire Line
	3800 9250 4900 9250
Connection ~ 4900 9250
Wire Wire Line
	4900 9250 4900 9450
Wire Wire Line
	4900 7500 3800 7500
Connection ~ 4900 7500
Wire Wire Line
	4900 7500 4900 7700
Connection ~ 3800 7500
Wire Wire Line
	3800 7500 3800 9250
Wire Wire Line
	4900 5750 3800 5750
Connection ~ 4900 5750
Wire Wire Line
	4900 5750 4900 5950
Connection ~ 3800 5750
Wire Wire Line
	3800 5750 3800 7500
$Comp
L Device:C C57
U 1 1 62A0CD2A
P 4250 9750
F 0 "C57" H 4365 9796 50  0001 L CNN
F 1 "100nf" H 4365 9750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4288 9600 50  0001 C CNN
F 3 "~" H 4250 9750 50  0001 C CNN
	1    4250 9750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 9600 4250 9450
Wire Wire Line
	4250 10050 4250 9900
Wire Wire Line
	4250 10050 4900 10050
Wire Wire Line
	4250 9450 4900 9450
Wire Wire Line
	12950 4800 12950 4950
Connection ~ 12950 4800
Connection ~ 12950 4950
Wire Wire Line
	12950 6550 12950 6700
Connection ~ 12950 6550
Connection ~ 12950 6700
Wire Wire Line
	12950 8300 12950 8450
Connection ~ 12950 8300
Connection ~ 12950 8450
Text Label 4250 3600 0    50   ~ 0
Ground
Text Label 4200 3400 0    50   ~ 0
Power
Text Label 4150 3500 0    50   ~ 0
Data
$EndSCHEMATC
