#!/usr/bin/env bash


echo -e "\n------------------ startup of Blackbox Window manager ------------------"


if [ ! -f "$HOME/wm.log" ]; then
    touch $HOME/wm.log
fi



/usr/bin/blackbox > $HOME/wm.log &
sleep 1


#----------BACKGROUND----------
#bsetbg -d -f /headless/install/configs/wallpaper/ISEN-Code.jpg
#This command is depreciated, and doesn't work https://linux.die.net/man/1/bsetbg