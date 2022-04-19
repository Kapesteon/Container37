#!/bin/bash

#set -e

#Remove Pre-installted GUI component
apt-get update 
apt-get remove -y --auto-remove desktop-base
apt-get remove -y --auto-remove gnome-*  
apt-get remove -y --auto-remove nautilus nautilus-* 
apt-get autoremove    


#apt-get remove --auto-remove ubuntu-gnome-desktop
#apt-get remove nautilus nautilus-* gnome-power-manager gnome-screensaver gnome-termina* gnome-pane* gnome-applet* gnome-bluetooth gnome-desktop* gnome-sessio* gnome-user* gnome-shell-common zeitgeist-core libzeitgeist* gnome-control-center gnome-screenshot && apt-get autoremove

#Installing WM
apt-get install -y lxde lxterminal
apt-get purge -y pm-utils xscreensaver  

apt-get clean -y
