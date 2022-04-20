#!/bin/bash

#Remove Pre-installted GUI component
apt-get update 
apt-get remove -y --auto-remove desktop-base
apt-get remove -y --auto-remove gnome-*  
apt-get remove -y --auto-remove nautilus nautilus-* 
apt-get autoremove    

#Installing WM
apt-get install -y icewm
apt-get purge -y pm-utils xscreensaver  

apt-get clean -y
