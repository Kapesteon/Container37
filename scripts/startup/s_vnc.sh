#!/bin/bash

set -e



#vncsession ${USER} :1

#vncserver -geometry ${VNC_RESOLUTION} -depth ${VNC_COL_DEPTH} -pixelformat rgbNNN -name ${USER}_session :1 
#vncserver $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION 

#systemctl start vncserver@:1

ls -lh /etc/init.d/

systemctl start vncserver@:1
/etc/init.d/vncserver@.service start
#service vncserver@.service start #We may not use systemctl here as the system has not been booted with systemd as init system 
#service vncserver@:1 start