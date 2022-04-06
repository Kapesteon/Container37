 #!/bin/bash

set -e

#Steps taken from https://wiki.archlinux.org/title/TigerVNC#Running_Xvnc_with_XDMCP_for_on_demand_sessions

ls -lha /usr/share/xsessions/

#1
mkdir -p "$HOME/.vnc"
PASSWD_PATH="$HOME/.vnc/passwd"

echo "$VNC_PASSWD" | vncpasswd -f >> $PASSWD_PATH
chmod 600 $PASSWD_PATH

#2
mkdir /etc/tigerVNC
touch /etc/tigerVNC/vncserver.users
echo "1:${USER}" > /etc/tigerVNC/vncserver.users

#3
touch $HOME/.vnc/config
echo "session="${WM} >> $HOME/.vnc/config
echo "geometry=1920x1080" >> $HOME/.vnc/config
echo "localhost" >> $HOME/.vnc/config
echo "alwaysshared" >> $HOME/.vnc/config
