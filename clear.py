#!/user/bin/python
# -*- coding:utf-8 -*-
import RPi.GPIO as GPIO
from neopixel import *
import time

#LED strip config
LED_COUNT  =64
LED_PIN =18
LED_FREQ_HZ =800000
LED_DMA =5
LED_BRIGHTNESS =20
LED_INVERT = False


last_proportional = 0

#object neo create
strip = Adafruit_NeoPixel(LED_COUNT, LED_PIN, LED_FREQ_HZ, LED_DMA, LED_INVERT, LED_BRIGHTNESS)
#int lib
strip.begin()
strip.show()
for i in range(0,strip.numPixels()):
	strip.setPixelColor(i, Color(0,0,0))
	strip.show()
	time.sleep(0.01)

