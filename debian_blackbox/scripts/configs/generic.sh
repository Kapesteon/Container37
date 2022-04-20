 #!/bin/bash

#set -e

################################################
#-------------- VNC & XVNC configs--------------
################################################
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

#5
chmod -R 711 /etc/tigerVNC
chmod -R 777 $HOME/.vnc
chmod -R 711 $HOME/.vnc/xstartup
chmod -R 755 $HOME/.vnc/config
chmod -R 755 $HOME/.vnc/passwd

################################################
#-------------- User permission configs---------
################################################

if [[ -n $DEBUG ]]; then
    verbose="-v"
fi

for var in ${STARTUPDIR}
do
    echo "fix permissions for: $var"
    find "$var"/ -name '*.sh' -exec chmod $verbose a+x {} +
    find "$var"/ -name '*.desktop' -exec chmod $verbose a+x {} +
    chgrp -R 0 "$var" && chmod -R $verbose a+rw "$var" && find "$var" -type d -exec chmod $verbose a+x {} +
done



for var in ${HOME}
do
    echo "fix permissions for: $var"
    find "$var"/ -name '*.sh' -exec chmod $verbose a+x {} +
    find "$var"/ -name '*.desktop' -exec chmod $verbose a+x {} +
    chgrp -R 0 "$var" && chmod -R $verbose a+rw "$var" && find "$var" -type d -exec chmod $verbose a+x {} +
done

chown root /usr/bin/Xtigervnc
chmod ug+s /usr/bin/Xtigervnc

chmod 777 -R $INSTALL_SCRIPTS/configs/wallpaper/

################################################
#------------Add user to the system -----------
################################################

mkdir /home/$USER
useradd $USER --uid $UID -d /home/$USER
chown -R $USER /home/$USER