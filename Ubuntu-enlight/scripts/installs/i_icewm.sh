#!/bin/bash

set -e

#Remove Pre-installted GUI component
apt-get update
apt-get purge -y ubuntu-desktop
apt-get autoremove -y
apt-get remove -y nautilus nautilus-* gnome-power-manager gnome-screensaver gnome-termina* gnome-pane* gnome-applet* gnome-bluetooth gnome-desktop* gnome-sessio* gnome-user* gnome-shell-common zeitgeist-core libzeitgeist* gnome-control-center gnome-screenshot gnome-* && apt-get autoremove -y

apt-get install -y enlightenment
apt-get purge -y pm-utils xscreensaver

apt-get clean -y