import paho.mqtt.client as mqtt

from animations import *
from uploadSentance import *

prior_time=""

def subServer(broker_address,Box,topicName):

    def on_connect(client, userdata, flags, rc):  # The callback for when the client connects to the broker
        print("Connected with result code {0}".format(str(rc)))  # Print result of connection attempt
        client.subscribe(topicName+"/"+Box)

    def on_message(client, userdata, msg):  # The callback for when a PUBLISH message is received from the server.
        global prior_time

        topic = msg.topic.split("/")
        message = (str(msg.payload)[2:-1]).split(",")
        print("Message received-> " + msg.topic + " " + message[0]) # Print message# Print a received msg
        if topic[1]==Box:
            if prior_time!=message[-1]:
                if message[0]=="button1":#Plays heart transtion
                    button1_LED()
                    print("button1 message played")
                elif message[0]=="button2": #Plays a+e 
                    button2_LED()
                    print("button2 message played")
                elif message[0]=="button3":#Plays flashing red heart
                    button3_LED()
                    print("button3 message played")
                elif message[0]=="upload":#plays custom sentance
                    uploadLetter(message[1],message[2])
                    print("upload message played")
                else:
                    print("wrong input")
            else:
                print("message time is repeated")
            prior_time=message[-1]
        else:
            print("message not for this Box")




    client = mqtt.Client(Box)  # Create instance of client with client ID “digi_mqtt_test”
    client.on_connect = on_connect  # Define callback function for successful connection
    client.on_message = on_message  # Define callback function for receipt of a message
    client.connect(broker_address)
    client.loop_forever()
