#!/bin/bash

set -e

apt-get update
apt-get install -y xvnc 
apt-get clean -y

#start the server X & VNC



echo "$VNC_PW" | vncpasswd -f >> $PASSWD_PATH
chmod 600 $PASSWD_PATH

vncpasswd #Create a hashed password
vncserver -geometry 640x480 -depth 24 -pixelformat rgbNNN -name {$USER}-session :1
