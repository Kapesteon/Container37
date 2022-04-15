#!/usr/bin/env bash
# This script installs TigerVNC server & generic tools 
# Only the package manager should change if another distrib is used


################################################
#---------------- TigerVNC----------------------
################################################
echo "Installing TigerVNC server"
#set -e

yum update #apt update
yum -y install tigervnc-server # apt install -y tigervnc-standalone-server tigervnc-common tigervnc-xorg-extension xauth xinit #tigervnc
#dpkg --configure -a


yum clean all #apt-get clean -y