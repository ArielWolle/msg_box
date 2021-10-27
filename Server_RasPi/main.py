#Operating system imports
from threading import Thread


#Helper files Imports
from subServer import subServer
from pubServer import pubServer
from helper import find_names

#MQTT Broker address
broker_address="173.230.138.220" 

#Find Box names for topics
Box,otherBox=find_names()
topicName="msg_box"

#Set time limit (in ms) between button presses on pubServer
timeDifference=1

#Set button GPIO pins
button1=27
button2=17
button3=22

#sub server threading 

sub=Thread(target=subServer, args=(broker_address,Box,topicName))
pub=Thread(target=pubServer, args=(broker_address,otherBox,topicName,timeDifference,button1,button2,button3))
pub.start()
sub.start()


