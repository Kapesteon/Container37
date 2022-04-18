#!/usr/bin/env bash
# This script installs TigerVNC server & generic tools 
# Only the package manager should change if another distrib is used


################################################
#---------------- TigerVNC----------------------
################################################
echo "Installing TigerVNC server"
#set -e

yum update #apt update
# yum makecache
yum -y install tigervnc-server # xorg-x11-xauth # xorg-x11-fonts-Type1 xorg-x11-server-utils x11-xserver-utils xorg-xset # xorg-xset # apt install -y tigervnc-standalone-server tigervnc-common tigervnc-xorg-extension xauth xinit #tigervnc
#dpkg --configure -a


yum clean all #apt-get clean -y