#!/usr/bin/env bash

echo "Install TigerVNC server"
set -e

wget -q http://tigervnc.bphinz.com/nightly/ubuntu-20.04LTS/arm64/tigervncserver_1.12.80+20220404gita97e9b11-1ubuntu1_arm64.deb > $INSTALL_SCRIPTS/tigervncserver_1.12.80+20220404gita97e9b11-1ubuntu1_arm64.deb 
dpkg -i -R $INSTALL_SCRIPTS/

#curl https://winswitch.org/gpg.asc | apt-key add -
#echo deb http://winswitch.org/dists precise main | tee /etc/apt/sources.list.d/winswitch.list
#apt-get update -y
#apt-get install -y tigervnc
#apt-get clean -y

#apt-get update
#dpkg -i tigervncserver_filename.deb
#apt-get install -f
#apt-get clean -y


#wget -qO- https://dl.bintray.com/tigervnc/stable/tigervnc-1.8.0.x86_64.tar.gz | tar xz --strip 1 -C / 
