#!/bin/bash

#set -e



#vncsession ${USER} :1

#vncserver -geometry ${VNC_RESOLUTION} -depth ${VNC_COL_DEPTH} -pixelformat rgbNNN -name ${USER}_session :1 
#vncserver $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION 

#systemctl start vncserver@:1
VNC_IP=$(hostname -i)

ls -lh $HOME/.vnc/
cat $HOME/.vnc/xstartup

vncserver $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION 
echo -e "\n\n------------------ VNC environment started ------------------"
echo -e "\nVNCSERVER started on DISPLAY= $DISPLAY \n\t=> connect via VNC viewer with $VNC_IP:$VNC_PORT"

$STARTUPDIR/s_wm.sh


#vncsession ${USER} :1
#service vncserver@.service start #We may not use systemctl here as the system has not been booted with systemd as init system 
#service vncserver@:1 start
#service vncserver@:1.service start