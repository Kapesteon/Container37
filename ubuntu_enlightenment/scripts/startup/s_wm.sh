#!/usr/bin/env bash
### every exit != 0 fails the script
#set -e

echo -e "\n------------------ startup of Enlightenment window manager ------------------"

#----------DEBUG------------ 
tail -f $STARTUPDIR/*.log $HOME/.vnc/*$DISPLAY.log
echo "Display=${DISPLAY}"


if [ ! -f "$HOME/wm.log" ]; then
    touch $HOME/wm.log
fi



exec enlightenment_start
/usr/bin/enlightenment_start > $HOME/wm.log &
sleep 1
#cat $HOME/wm.log