#!/usr/bin/env bash

################################################
#---------------- TigerVNC----------------------
################################################

echo "Installing TigerVNC server"

apt update
apt install -y tigervnc-standalone-server tigervnc-common tigervnc-xorg-extension xauth xinit #tigervnc
dpkg --configure -a


apt-get clean -y