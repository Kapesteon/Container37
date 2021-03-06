#!/bin/bash

#Remove Pre-installted GUI component
apt-get update
apt-get purge ubuntu_dekstop
apt-get autoremove
apt-get remove nautilus nautilus-* gnome-power-manager gnome-screensaver gnome-termina* gnome-pane* gnome-applet* gnome-bluetooth gnome-desktop* gnome-sessio* gnome-user* gnome-shell-common zeitgeist-core libzeitgeist* gnome-control-center gnome-screenshot && apt-get autoremove
apt-get install -y enlightenment
apt-get install -y terminology
apt-get purge -y pm-utils xscreensaver

apt-get clean -y
