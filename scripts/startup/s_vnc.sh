#!/bin/bash

#set -e



#vncsession ${USER} :1

#vncserver -geometry ${VNC_RESOLUTION} -depth ${VNC_COL_DEPTH} -pixelformat rgbNNN -name ${USER}_session :1 
#vncserver $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION 

#systemctl start vncserver@:1
VNC_IP=$(hostname -i)

#----------DEBUG------------ 
tail -f $STARTUPDIR/*.log $HOME/.vnc/*$DISPLAY.log
echo "Display=${DISPLAY}"
ls -lhaR /usr/bin/
ls -lh $HOME/.vnc/
cat $HOME/.vnc/xstartup
cat $HOME/.vnc/passwd
if [ ! -f "$HOME/.vnc/xvnc.log" ]; then
    touch $HOME/.vnc/xvnc.log
fi
#----------------------

# /usr/bin/vncserver command does correctly context (had issues with $DISPLAY var) and therefor should not be used but xvnc instead  
#vncserver $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION

/usr/bin/Xvnc $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION  -rfbauth "${HOME}/.vnc/passwd" > $HOME/.vnc/xnvc.log & 

echo -e "\n\n------------------ VNC environment started ------------------"
echo -e "\nVNCSERVER started on DISPLAY= $DISPLAY \n\t=> connect via VNC viewer with $VNC_IP:$VNC_PORT"



$STARTUPDIR/s_wm.sh

wait $!

#vncsession ${USER} :1
#service vncserver@.service start #We may not use systemctl here as the system has not been booted with systemd as init system 
#service vncserver@:1 start
#service vncserver@:1.service start