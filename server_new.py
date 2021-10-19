import paho.mqtt.client as mqtt
import paho.mqtt.publish as publish
import time
import os
import RPi.GPIO as GPIO # Import Raspberry Pi GPIO library
from rpi_ws281x import *
import board
import busio
import adafruit_drv2605
from  adafruit_drv2605 import *
from threading import Thread

names=["ariel","emily"]

box=os.uname().nodename
if names[0] in box:
    otherBox=names[1]+"box"
else:
    otherBox=names[0]+"box"

print(box, " ", otherBox)

#Vibration motor setup
i2c = busio.I2C(board.SCL, board.SDA)

#button2 drv
drv_button1 = adafruit_drv2605.DRV2605(i2c)
drv_button1.sequence[0] = adafruit_drv2605.Effect(47)  # Set the effect on slot 0.

#button3 drv
drv = adafruit_drv2605.DRV2605(i2c)
drv2 = adafruit_drv2605.DRV2605(i2c)
drv3 = adafruit_drv2605.DRV2605(i2c)
drv.sequence[0] = adafruit_drv2605.Effect(47)  # Set the effect on slot 0.
drv.sequence[1] = adafruit_drv2605.Pause(1)  # Set the effect on slot 0.
drv.sequence[2] = adafruit_drv2605.Effect(47)  # Set the effect on slot 0.
drv.sequence[3] = adafruit_drv2605.Pause(1)   # Set the effect on slot 0.
drv.sequence[4] = adafruit_drv2605.Effect(47)  # Set the effect on slot 0.
drv.sequence[5] = adafruit_drv2605.Pause(1)   # Set the effect on slot 0.
drv.sequence[6] = adafruit_drv2605.Effect(47)  # Set the effect on slot 0.
drv2.sequence[0] = adafruit_drv2605.Effect(1)  # Set the effect on slot 0.
drv2.sequence[1] = adafruit_drv2605.Pause(0.8)  # Set the effect on slot 0.
drv2.sequence[2] = adafruit_drv2605.Effect(10)  # Set the effect on slot 0.
drv3.sequence[0] = adafruit_drv2605.Effect(1)  

#LED strip config
LED_COUNT  =64
LED_PIN =18
LED_FREQ_HZ =800000
LED_DMA =5
LED_BRIGHTNESS =20
LED_INVERT = False
#object neo create
strip = PixelStrip(LED_COUNT, LED_PIN, LED_FREQ_HZ, LED_DMA, LED_INVERT, LED_BRIGHTNESS)
#int lib
strip.begin()
strip.show()

#test one list for LED
list_test1= [0,1,2,3,4,5,6,7,8,11,12,15,40,47,48,49,54,55,56,57,58,61,62,63]

#test two list for LED
list_test2 = [1,2,8,11,16,17,18,19,20,24,27,28,29,30,31,32,35,36,44,45,46,52,60,61,62,63,]
list_a = [1, 2, 8, 11, 16, 17, 18, 19, 24, 27, 32, 35]
list_plus = [20, 27, 28, 29, 36]
list_e = [28, 29, 30, 31, 36, 44, 45, 46, 52, 60, 61, 62, 63]
list_af = []
list_ef = []

#test three list for LED
list_b=[32,24,16,9,10,19,20,13,14,23,31,39,46,53,60,59,50,41]
list_r=[33,25,17,18,26,27,28,29,21,22,30,38,45,52,51,42,43,44,37,36,35,34]

alph=[
[[0,0,1,1,1,1,0,0],[0,1,1,1,1,1,1,0],[0,1,1,0,0,1,1,0],[0,1,1,0,0,1,1,0],[0,1,1,1,1,1,1,0],[0,1,1,0,0,1,1,0],[0,1,1,0,0,1,1,0],[0,1,1,0,0,1,1,0]],
[[0,1,1,1,1,1,1,0],[0,1,1,1,1,1,1,1],[0,1,1,0,0,0,1,1],[0,1,1,1,1,1,1,0],[0,1,1,1,1,1,1,1],[0,1,1,0,0,0,1,1],[0,1,1,1,1,1,1,0],[0,1,1,1,1,1,1,0]],
[[0,1,1,1,1,1,1,0],[0,1,1,1,1,1,1,0],[0,1,1,0,0,0,0,0],[0,1,1,0,0,0,0,0],[0,1,1,0,0,0,0,0],[0,1,1,0,0,0,0,0],[0,1,1,1,1,1,1,0],[0,1,1,1,1,1,1,0]],
[[0,1,1,1,1,1,0,0],[0,1,1,1,1,1,1,1],[0,1,1,0,0,0,1,1],[0,1,1,0,0,0,1,1],[0,1,1,0,0,0,1,1],[0,1,1,0,0,0,1,1],[0,1,1,1,1,1,1,1],[0,1,1,1,1,1,0,0]],
[[0,1,1,1,1,1,1,0],[0,1,1,1,1,1,1,0],[0,1,1,0,0,0,0,0],[0,1,1,1,1,1,0,0],[0,1,1,1,1,1,0,0],[0,1,1,0,0,0,0,0],[0,1,1,1,1,1,1,0],[0,1,1,1,1,1,1,0]],
[[0,1,1,1,1,1,1,0],[0,1,1,1,1,1,1,0],[0,1,1,0,0,0,0,0],[0,1,1,1,1,1,0,0],[0,1,1,1,1,1,0,0],[0,1,1,0,0,0,0,0],[0,1,1,0,0,0,0,0],[0,1,1,0,0,0,0,0]],
[[0,0,1,1,1,1,1,0],[0,1,1,1,1,1,1,0],[0,1,1,0,0,0,0,0],[0,1,1,0,0,0,0,0],[0,1,1,0,0,1,1,0],[0,1,1,0,0,0,1,0],[0,1,1,1,1,1,1,0],[0,0,1,1,1,1,1,0]],
[[0,1,1,0,0,1,1,0],[0,1,1,0,0,1,1,0],[0,1,1,0,0,1,1,0],[0,1,1,1,1,1,1,0],[0,1,1,1,1,1,1,0],[0,1,1,0,0,1,1,0],[0,1,1,0,0,1,1,0],[0,1,1,0,0,1,1,0]],
[[0,1,1,1,1,1,1,0],[0,1,1,1,1,1,1,0],[0,0,0,1,1,0,0,0],[0,0,0,1,1,0,0,0],[0,0,0,1,1,0,0,0],[0,0,0,1,1,0,0,0],[0,1,1,1,1,1,1,0],[0,1,1,1,1,1,1,0]],
[[0,1,1,1,1,1,1,1],[0,1,1,1,1,1,1,1],[0,0,0,0,1,1,0,0],[0,0,0,0,1,1,0,0],[0,1,1,0,1,1,0,0],[0,1,1,0,1,1,0,0],[0,1,1,1,1,1,0,0],[0,0,1,1,1,0,0,0]],
[[0,1,1,0,0,1,1,1],[0,1,1,0,1,1,1,0],[0,1,1,1,1,1,0,0],[0,1,1,1,1,0,0,0],[0,1,1,1,1,1,0,0],[0,1,1,0,1,1,1,0],[0,1,1,0,0,1,1,0],[0,1,0,0,0,1,1,0]],
[[0,1,1,0,0,0,0,0],[0,1,1,0,0,0,0,0],[0,1,1,0,0,0,0,0],[0,1,1,0,0,0,0,0],[0,1,1,0,0,0,0,0],[0,1,1,0,0,0,0,0],[0,1,1,1,1,1,1,0],[0,1,1,1,1,1,1,0]],
[[0,0,1,1,0,1,1,0],[0,1,1,1,1,1,1,1],[0,1,1,1,1,1,1,1],[0,1,1,0,1,0,1,1],[0,1,1,0,0,0,1,1],[0,1,1,0,0,0,1,1],[0,1,1,0,0,0,1,1],[0,1,1,0,0,0,1,1]],
[[0,1,1,0,0,0,1,1],[0,1,1,1,0,0,1,1],[0,1,1,1,0,0,1,1],[0,1,1,0,1,0,1,1],[0,1,1,0,1,0,1,1],[0,1,1,0,0,1,1,1],[0,1,1,0,0,1,1,1],[0,1,1,0,0,0,1,1]],
[[0,0,1,1,1,1,1,0],[0,1,1,1,1,1,1,1],[0,1,1,0,0,0,1,1],[0,1,1,0,0,0,1,1],[0,1,1,0,0,0,1,1],[0,1,1,0,0,0,1,1],[0,1,1,1,1,1,1,1],[0,0,1,1,1,1,1,0]],
[[0,1,1,1,1,1,1,0],[0,1,1,1,1,1,1,0],[0,1,1,0,0,1,1,0],[0,1,1,1,1,1,1,0],[0,1,1,1,1,1,1,0],[0,1,1,0,0,0,0,0],[0,1,1,0,0,0,0,0],[0,1,1,0,0,0,0,0]],
[[0,1,1,1,1,1,1,0],[0,1,1,1,1,1,1,0],[0,1,1,0,0,1,1,0],[0,1,1,0,0,1,1,0],[0,1,1,0,0,1,1,0],[0,1,1,0,0,1,0,0],[0,1,1,1,1,1,1,0],[0,1,1,1,1,0,1,1]],
[[0,1,1,1,1,1,0,0],[0,1,1,1,1,1,1,0],[0,1,1,0,0,1,1,0],[0,1,1,1,1,1,1,0],[0,1,1,1,1,0,0,0],[0,1,1,1,1,1,0,0],[0,1,1,0,1,1,1,0],[0,1,1,0,0,1,1,1]],
[[0,1,1,1,1,1,1,0],[0,1,1,1,1,1,1,0],[0,1,1,0,0,0,0,0],[0,1,1,1,1,1,1,0],[0,1,1,1,1,1,1,0],[0,0,0,0,0,1,1,0],[0,1,1,1,1,1,1,0],[0,1,1,1,1,1,1,0]],
[[0,1,1,1,1,1,1,0],[0,1,1,1,1,1,1,0],[0,0,0,1,1,0,0,0],[0,0,0,1,1,0,0,0],[0,0,0,1,1,0,0,0],[0,0,0,1,1,0,0,0],[0,0,0,1,1,0,0,0],[0,0,0,1,1,0,0,0]],
[[0,1,1,0,0,1,1,0],[0,1,1,0,0,1,1,0],[0,1,1,0,0,1,1,0],[0,1,1,0,0,1,1,0],[0,1,1,0,0,1,1,0],[0,1,1,0,0,1,1,0],[0,1,1,1,1,1,1,0],[0,1,1,1,1,1,1,0]],
[[0,1,1,0,0,0,1,1],[0,1,1,0,0,0,1,1],[0,1,1,0,0,0,1,1],[0,1,1,1,0,1,1,1],[0,0,1,1,0,1,1,0],[0,0,1,1,0,1,1,0],[0,0,0,1,1,1,0,0],[0,0,0,1,1,1,0,0]],
[[0,1,1,0,0,0,1,1],[0,1,1,0,0,0,1,1],[0,1,1,0,0,0,1,1],[0,1,1,0,0,0,1,1],[0,1,1,0,1,0,1,1],[0,1,1,1,1,1,1,1],[0,1,1,1,0,1,1,1],[0,0,1,0,0,0,1,0]],
[[0,1,1,0,0,0,1,1],[0,1,1,1,0,1,1,1],[0,0,1,1,0,1,1,0],[0,0,1,1,1,1,1,0],[0,0,0,1,1,1,0,0],[0,0,1,1,1,1,1,0],[0,1,1,1,0,1,1,1],[0,1,1,0,0,0,1,1]],
[[0,1,1,0,0,0,1,1],[0,1,1,0,0,0,1,1],[0,1,1,1,0,1,1,1],[0,0,1,1,1,1,1,0],[0,0,0,1,1,1,0,0],[0,0,0,1,1,1,0,0],[0,0,0,1,1,1,0,0],[0,0,0,1,1,1,0,0]],
[[0,1,1,1,1,1,1,1],[0,1,1,1,1,1,1,1],[0,0,0,0,0,1,1,1],[0,0,0,0,1,1,1,0],[0,0,0,1,1,1,0,0],[0,0,1,1,1,0,0,0],[0,1,1,1,1,1,1,1],[0,1,1,1,1,1,1,1]],
[[0,0,0,0,0,0,0,0],[0,1,1,0,0,1,1,0],[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1],[0,1,1,1,1,1,1,0],[0,0,1,1,1,1,0,0],[0,0,0,1,1,0,0,0]]]

broker_address="173.230.138.220" 

prior_time=""



def on_connect(client, userdata, flags, rc):  # The callback for when the client connects to the broker
    print("Connected with result code {0}".format(str(rc)))  # Print result of connection attempt
    client.subscribe("msg_box/"+box)

def on_message(client, userdata, msg):  # The callback for when a PUBLISH message is received from the server.
    global prior_time
    topic = msg.topic.split("/")
    message = (str(msg.payload)[2:-1]).split(",")
    print("Message received-> " + msg.topic + " " + message[0]) # Print message# Print a received msg
    if topic[0]=="msg_box" and topic[1]==box:
        if prior_time!=message[-1]:
            if message[0]=="button1":#WS and Vib
                button1_LED()
                print("button1 message played")
            elif message[0]=="button2": #QS
                button2_LED()
                print("button2 message played")
            elif message[0]=="button3":#DS
                button3_LED()
                print("button3 message played")
            elif message[0]=="upload":
                uploadLetter(message[1],message[2])
                print("upload message played")
            else:
                print("wrong input")
        else:
            print("message time is repeated")
        prior_time=message[-1]
    else:
        print("message not for this box")



def button1_LED():
    counter=0
    for f in range(0,2):
        for j in range(0,256):
            for i in range(0,strip.numPixels()):
                if (i not in list_test1):
                    if j<256/2 and f==0:
                        strip.setPixelColor(i, Color(255,j,int(256/2)))
                    elif j>256/2 and f==0:
                        strip.setPixelColor(i, Color(255,int(256/2),j))
                    elif j<256/2 and f==1:
                        strip.setPixelColor(i, Color(255,int(256/2),255-j))
                    elif j>256/2 and f==1:
                        strip.setPixelColor(i, Color(255,256-j,int(256/2)))
            strip.show()
            if counter >=0.5:
                drv_button1.play()
                counter=0
            time.sleep(0.01)
            counter+=0.01
    for j in range (0,255):
        for i in range(0,strip.numPixels()):
            if (i not in list_test1):
                strip.setPixelColor(i, Color(255-j,0,int(256/2-j/2)))
        strip.show()
        time.sleep(0.01)
            
    
def button2_LED():
    counter=0
    for j in range(0, 8):
        for i in range(0, strip.numPixels()):
            if i in list_test2:
                if i % 8 - 7 + j >= 0:
                    if i < 20 or i == 24 or i == 32 or i == 35:
                        strip.setPixelColor(i - 7 + j, Color(255,0,0))
                    elif i == 20 or i == 27 or i == 28 or i == 29 or i == 36:
                        strip.setPixelColor(i - 7 + j, Color(0,255, 0))
                    elif i == 30 or i == 31 or i > 37:
                        strip.setPixelColor(i - 7 + j, Color(0, 0, 255))
        strip.show()
        time.sleep(0.2)
        counter+=0.02
        if counter >=0.5:
                drv_button1.play()
                counter=0
        for i in range(0, strip.numPixels()):
            strip.setPixelColor(i, Color(0, 0, 0))
    for j in range(0, 4):
        for i in range(0, strip.numPixels()):
            if i in list_a:
                strip.setPixelColor(
                    (int(((i - i % 8) / 8) + j) * 8 + i % 8), Color(255,0, 0)
                )
                if j == 3:
                    list_af.append((((i - i % 8) / 8) + j) * 8 + i % 8)
            if i in list_e:
                strip.setPixelColor(
                    (int(((i - i % 8) / 8) - j) * 8 + i % 8), Color(0, 0, 255)
                )
                if j == 3:
                    list_ef.append((((i - i % 8) / 8) - j) * 8 + i % 8)

        strip.setPixelColor(20, Color(0,255, 0))
        strip.setPixelColor(27, Color(0,255, 0))
        strip.setPixelColor(28, Color(0,255, 0))
        strip.setPixelColor(29, Color(0,255, 0))
        strip.setPixelColor(36, Color(0,255, 0))
        strip.show()
        time.sleep(0.2)
        counter+=0.02
        if counter >=0.5:
                drv_button1.play()
                counter=0
        for i in range(0, strip.numPixels()):
            strip.setPixelColor(i, Color(0, 0, 0))
    for j in range(0, 255):
        for i in range(0, strip.numPixels()):
            if i in list_af:
                strip.setPixelColor(i, Color(255 - j,0, 0))
            if i in list_ef:
                strip.setPixelColor(i, Color(0, 0, 255 - j))
        strip.setPixelColor(20, Color(0,255 - j, 0))
        strip.setPixelColor(27, Color(0,255 - j, 0))
        strip.setPixelColor(28, Color(0,255 - j, 0))
        strip.setPixelColor(29, Color(0,255 - j, 0))
        strip.setPixelColor(36, Color(0,255 - j, 0))
        strip.show()
        time.sleep(0.01)
        counter+=0.01
        if counter >=0.5:
                drv_button1.play()
                counter=0

def button3_LED():
    drv.play()  # play the effect#
    for j in range(0,256):
            for i in range(0,strip.numPixels()):
                strip.setPixelColor(i, Color(j,j,j))
            strip.show()
            time.sleep(0.01)
    for i in range(0,len(list_b)):
        strip.setPixelColor(list_b[i], Color(0,0,0))
        strip.show()
        time.sleep(0.1)
    for i in range(0,len(list_r)):
        strip.setPixelColor(list_r[i], Color(255,0,0))
        strip.show()
        time.sleep(0.1)

    for j in range(0,5):
        drv2.play()
        for i in range(0,len(list_b)):
            strip.setPixelColor(list_b[i], Color(255,0,0))
            strip.show()
        time.sleep(0.8)
        for i in range(0,len(list_b)):
            strip.setPixelColor(list_b[i], Color(0,0,0))
            strip.show()
        drv2.stop()
        time.sleep(.8)
    drv3.play()
    for i in range(0,len(list_b)):
        strip.setPixelColor(list_b[i], Color(255,0,0))
        strip.show()
    drv3.stop()
    for i in range(0,255):
        for j in range(0,strip.numPixels()):
            if j in list_b or j in list_r:
                strip.setPixelColor(j, Color(255-i,0,0))
            else:
                strip.setPixelColor(j, Color(255-i,255-i,255-i))
        strip.show()
        time.sleep(0.005)

def printLetter(stripPlace,wordNum,distance,letter):
	if (stripPlace%8-8*wordNum+distance)>=0:
			try:
				if (alph[letter-1][stripPlace//8][stripPlace%8-8*wordNum+distance]==1):
			 		strip.setPixelColor(stripPlace, Color(255,0,0))
			except:
				pass
                
def uploadLetter(speed,word):
    print(speed)
    print(word)
    speed=float(speed)
    word = word.upper()
    word = list (word)
    for i in range (0,len(word)):
        word[i]=ord(word[i])-64

    for j in range (0,8*(len(word)+2)+3):
        for i2 in range(0,strip.numPixels()):
            for k in range (0,len(word)):
                printLetter(i2,k+1,j,word[k])

        strip.show()
        time.sleep(speed)
        for i in range(0,strip.numPixels()):
            strip.setPixelColor(i, Color(0,0,0))

client = mqtt.Client(box)  # Create instance of client with client ID “digi_mqtt_test”
client.on_connect = on_connect  # Define callback function for successful connection
client.on_message = on_message  # Define callback function for receipt of a message
client.connect(broker_address)
client.loop_forever()
