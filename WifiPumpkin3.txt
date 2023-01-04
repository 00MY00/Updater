#!/bin/bash
sudo su

apt update -y && apt upgrade -y

dpkg --configure -a

apt install libssl-dev libffi-dev build-essential -y

git clone https://github.com/P0cL4bs/wifipumpkin3.git  
cd wifipumpkin3
apt install python3-pyqt5

python3 -c "from PyQt5.QtCore import QSettings; print('done')"

python3 setup.py install

wifipumpkin3

######################
# Creating Wifi point
# wifipumpkin3
# set interface wlan0
# set ssid Free Wifi
# set proxy noproxy
# ignore pydns_server
# start










