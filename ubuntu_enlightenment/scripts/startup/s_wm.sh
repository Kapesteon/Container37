#!/usr/bin/env bash
echo -e "\n------------------ startup of Enlightenment window manager ------------------"


if [ ! -f "$HOME/wm.log" ]; then
    touch $HOME/wm.log
fi

/usr/bin/enlightenment_start > $HOME/wm.log &
sleep 1
