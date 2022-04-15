#!/bin/bash

#set -e

#Remove Pre-installted GUI component
#apt-get update
#apt-get purge ubuntu-desktop
#apt-get autoremove
#apt-get remove nautilus nautilus-* gnome-power-manager gnome-screensaver gnome-termina* gnome-pane* gnome-applet* gnome-bluetooth gnome-desktop* gnome-sessio* gnome-user* gnome-shell-common zeitgeist-core libzeitgeist* gnome-control-center gnome-screenshot && apt-get autoremove
#apt-get install -y icewm
#apt-get purge -y pm-utils xscreensaver

#apt-get clean -y


yum makecache
yum -y install icewm
yum groupremove "GNOME Desktop"
rm ~/.xinitrc

# a vérifier qu'il n'y a pas de groupe en trop
yum grouplist

yum clean all