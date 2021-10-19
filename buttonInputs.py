import RPi.GPIO as GPIO # Import Raspberry Pi GPIO library
import paho.mqtt.publish as publish
import time
import os

names=["ariel","emily"]

box=os.uname().nodename
if names[0] in box:
    otherBox=names[1]+"box"
else:
    otherBox=names[0]+"box"

print(box, " ", otherBox)


timeDifference=3

currentTime=time.time()
lastTime=time.time()-timeDifference

broker_address="173.230.138.220" 

GPIO.setwarnings(False) # Ignore warning for now
GPIO.setmode(GPIO.BCM) # Use physical pin numbering

button1=27
button2=17
button3=22

GPIO.setup(button1, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
GPIO.setup(button2, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
GPIO.setup(button3, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

pressed_1=False
pressed_2=False
pressed_3=False

while True:
    currentTime=time.time()
    if lastTime+timeDifference < currentTime:
        if GPIO.input(button1) and not pressed_1:
            lastTime=currentTime
            pressed_1=True
            publish.single("msg_box/"+otherBox,"button1,"+str(time.time()), hostname=broker_address)
            print("Button 1 pressed")
        if GPIO.input(button2) and not pressed_2:
            lastTime=currentTime
            pressed_2=True
            publish.single("msg_box/"+otherBox,"button2,"+str(time.time()), hostname=broker_address)
            print("button 2 pressed")
        if GPIO.input(button3) and not pressed_3:
            lastTime=currentTime
            pressed_3=True
            publish.single("msg_box/"+otherBox,"button3,"+str(time.time()), hostname=broker_address)
            print("button 3 pressed")
        if pressed_1 and not GPIO.input(button1):
            pressed_1=False
        if pressed_2 and not GPIO.input(button2):
            pressed_2=False
        if pressed_3 and not GPIO.input(button3):
            pressed_3=False

