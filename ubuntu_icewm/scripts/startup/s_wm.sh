#!/usr/bin/env bash
echo -e "\n------------------ startup of IceWM window manager ------------------"


if [ ! -f "$HOME/wm.log" ]; then
    touch $HOME/wm.log
fi

/usr/bin/icewm-session > $HOME/wm.log &
sleep 1
#cat $HOME/wm.log

#----------BACKGROUND----------
icewmbg -p --image=/headless/install/configs/wallpaper/ISEN-Code.jpg &