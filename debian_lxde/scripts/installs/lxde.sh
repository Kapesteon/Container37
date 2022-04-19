#!/bin/bash

apt-get update
apt-get install -y lxde lxterminal
apt-get purge -y pm-utils xscreensaver

apt-get clean -y
