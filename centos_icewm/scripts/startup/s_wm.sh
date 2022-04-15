#!/usr/bin/env bash
### every exit != 0 fails the script
#set -e

echo -e "\n------------------ startup of IceWM window manager ------------------"

#----------DEBUG------------ 
tail -f $STARTUPDIR/*.log $HOME/.vnc/*$DISPLAY.log
echo "Display=${DISPLAY}"


if [ ! -f "$HOME/wm.log" ]; then
    touch $HOME/wm.log
fi


### disable screensaver and power management
xset -dpms &
xset s noblank &
xset s off &

/usr/bin/icewm-session > $HOME/wm.log &
sleep 1
killall xterm # killed not needed terminal !
#cat $HOME/wm.log