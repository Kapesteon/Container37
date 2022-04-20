#!/bin/bash

if [[ -e  /tmp/.X0-lock || -e  /tmp/.X*-lock || -e /tmp/.X11-unix ]]; then
  echo "Removing lock"
  chattr -i /tmp/.X*-lock 
  chattr -i /tmp/.X11-unix
  rm -rfv /tmp/.X*-lock /tmp/.X11-unix 
fi

exit 0