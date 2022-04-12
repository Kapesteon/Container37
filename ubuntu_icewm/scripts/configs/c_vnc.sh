 #!/bin/bash

set -e

#Steps taken from https://wiki.archlinux.org/title/TigerVNC#Running_Xvnc_with_XDMCP_for_on_demand_sessions


#1
mkdir -p "$HOME/.vnc"
PASSWD_PATH="$HOME/.vnc/passwd"
echo "$VNC_PASSWD" | vncpasswd -f > $PASSWD_PATH


#2
mkdir /etc/tigerVNC
touch /etc/tigerVNC/vncserver.users
chmod 600 $PASSWD_PATH
chmod 600 $PASSWD_PATH
echo "0:${USER}" > /etc/tigerVNC/vncserver.users

#3
touch $HOME/.vnc/config
echo "session="${WM} >> $HOME/.vnc/config
echo "geometry=1920x1080" >> $HOME/.vnc/config
echo "localhost" >> $HOME/.vnc/config
echo "alwaysshared" >> $HOME/.vnc/config



#4
touch $HOME/.vnc/xstartup
echo "#!/bin/bash" >>$HOME/.vnc/xstartup
echo "PATH=/usr/bin:/usr/sbin" >>$HOME/.vnc/xstartup
echo "unset SESSION_MANAGER" >>$HOME/.vnc/xstartup
echo "unset DBUS_SESSION_BUS_ADDRESS" >>$HOME/.vnc/xstartup
echo "exec $(cat /usr/share/xsessions/${WM}.desktop | grep -w Exec | cut -d "/" -f 4) &" >>$HOME/.vnc/xstartup

##DEBUG##
#ls -lha /usr/share/xsessions/
#cat /usr/share/xsessions/icewm-session.desktop
#cat /etc/tigerVNC/vncserver.users #DEBUG
#cat $HOME/.vnc/xstartup #DEBUG
#cat $HOME/.vnc/config #DEBUG

#Run the exec value of the desktop (https://stackoverflow.com/questions/59709214/tigervncserver-crashes-unless-started-with-sudo)


#5
chmod -R 711 /etc/tigerVNC
chmod -R 711 $HOME/.vnc