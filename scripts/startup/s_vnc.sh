#!/bin/bash

set -e


vncserver -geometry ${VNC_RESOLUTION} -depth ${VNC_COL_DEPTH} -pixelformat rgbNNN -name ${USER}_session :1 
