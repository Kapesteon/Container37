#!/usr/bin/env bash

echo "Install TigerVNC server"
set -e

apt update
apt install -y tigervnc-standalone-server tigervnc-common tigervnc-xorg-extension xauth xinit
dpkg --configure -a
