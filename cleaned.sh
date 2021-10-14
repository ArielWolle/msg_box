#!/bin/bash
# ip.sh
HOST=www.arielwolle.com
USER=pi
PASSWD=1527TADDo

dig +short myip.opendns.com @resolver1.opendns.com > my_ip.txt

scp -P 2021 my_ip.txt pi@www.arielwolle.com:/home/pi