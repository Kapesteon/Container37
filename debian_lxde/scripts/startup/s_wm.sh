#!/usr/bin/env bash

echo -e "\n------------------ startup of Lxde window manager ------------------"

#----------DEBUG------------ 
tail -f $STARTUPDIR/*.log $HOME/.vnc/*$DISPLAY.log
echo "Display=${DISPLAY}"


if [ ! -f "$HOME/wm.log" ]; then
    touch $HOME/wm.log
fi

/usr/bin/startlxde > $HOME/wm.log &
sleep 1

pcmanfm --set-wallpaper="/headless/install/configs/wallpaper/ISEN-Code.jpg"
