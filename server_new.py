import paho.mqtt.client as mqtt
import time
import os
import RPi.GPIO as GPIO # Import Raspberry Pi GPIO library


box="Ariel_Box"
otherBox="Emily_Box"

GPIO.setwarnings(False) # Ignore warning for now
GPIO.setmode(GPIO.BCM) # Use physical pin numbering

button1=17
button2=27
button3=22

GPIO.setup(button1, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
GPIO.setup(button2, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
GPIO.setup(button3, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

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
        if prior_time!=message[1]:
            if message[0]=="button1":
                print("button1 received")
                os.system("bash test.sh")
            if message[0]=="button2":
                os.system("bash test2.sh")
                print("button2 received")
            if message[0]=="button3":
                print("button3 received")
                os.system("bash test3.sh")
            if message[0]=="upload":
                print("upload received")
                os.system("bash send.sh")
            if message[0]=="clear":
                print("clearing neopixels")
                os.system("bash clear.sh")
        prior_time=message[1]
    





client = mqtt.Client(box)  # Create instance of client with client ID “digi_mqtt_test”
client.on_connect = on_connect  # Define callback function for successful connection
client.on_message = on_message  # Define callback function for receipt of a message
# client.connect("m2m.eclipse.org", 1883, 60)  # Connect to (broker, port, keepalive-time)
client.connect(broker_address)
client.loop_forever()
