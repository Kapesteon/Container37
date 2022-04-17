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



/usr/bin/icewm-session > $HOME/wm.log &
sleep 1
#cat $HOME/wm.log

#----------BACKGROUND----------
icewmbg -p --image=/headless/install/configs/wallpaper/ISEN-Code.jpg &
