#!/usr/bin/env bash


echo -e "\n------------------ startup of Blackbox Window manager ------------------"


if [ ! -f "$HOME/wm.log" ]; then
    touch $HOME/wm.log
fi

/usr/bin/blackbox > $HOME/wm.log &
sleep 1