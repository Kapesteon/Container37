#!/usr/bin/env bash

echo "Install TigerVNC server"
set -e

apt-get update
apt-get install -y tigervnc-standalone-server tigervnc-common tigervnc-xorg-extension xauth xinit #tigervnc
dpkg --configure -a
