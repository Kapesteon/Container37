#!/bin/bash
set -e

echo "Install some common tools for further installation"
apt-get update && apt-get install -y gnupg2
apt-get update 
apt-get install -y wget gnupg2 curl # vim net-tools locales bzip2 \
            #
            # curl for tigervnc
            # tee for tigervnc

apt-get clean -y
