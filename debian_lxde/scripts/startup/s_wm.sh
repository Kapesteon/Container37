#!/usr/bin/env bash
echo -e "\n------------------ startup of IceWM window manager ------------------"


if [ ! -f "$HOME/wm.log" ]; then
    touch $HOME/wm.log
fi

/usr/bin/startlxde > $HOME/wm.log &
sleep 1

#----------BACKGROUND----------
pcmanfm --set-wallpaper="/headless/install/configs/wallpaper/ISEN-Code.jpg"
