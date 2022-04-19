#!/usr/bin/env bash


echo -e "\n------------------ startup of Blackbox Window manager ------------------"

#----------DEBUG------------
tail -f $STARTUPDIR/*.log $HOME/.vnc/*$DISPLAY.log
echo "Display=${DISPLAY}"

if [ ! -f "$HOME/wm.log" ]; then
    touch $HOME/wm.log
fi

/usr/bin/blackbox > $HOME/wm.log &
sleep 1

#----------BACKGROUND----------
icewmbg -p --image=/headless/install/configs/wallpaper/ISEN-Code.jpg &
