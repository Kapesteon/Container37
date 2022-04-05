#!/bin/bash

set -e

apt-get update
apt-get install -y icewm
apt-get purge -y pm-utils xscreensaver
apt-get clean -y
