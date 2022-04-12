#!/bin/bash

set -e

#Add the user to the 
mkdir /home/$USER
useradd $USER --uid $UID -d /home/$USER
chown -R $USER /home/$USER

