#!/bin/bash

function help (){
    echo "
    USAGE:
    docker run -it -p <NOVNCPORT>:6901 -p <VNCPORT>:5901 <IMAGE> <OPTION>



    OPTIONS:
    -u=USER, --user             Sets the username used in the image, default is isen
    -p=PASSWORD, --password     Sets the VNC password to use, default is vncpassword
    -i=INTERFACE, --interface   Sets the interface to listen, defaults to all available interfaces
    -s=SECURITY, --security     Sets the security method of authentication/encryption, list options
                                here : https://tigervnc.org/doc/Xvnc.html
    -d, --debug                 Enables debug output
    -h, --help                  Print out this help

    "
}

function setUser(){
    echo "0:${USR}" > /etc/tigerVNC/vncserver.users
}

function setPassword(){

    PASSWD_PATH="$HOME/.vnc/passwd"

    echo "$PASSWORD" | vncpasswd -f > $PASSWD_PATH

}

function createLogs(){
    if [ ! -f "$HOME/.vnc/xvnc.log" ]; then
        touch $HOME/.vnc/xvnc.log
    fi
}


INTERFACE=""
SECURITY="-SecurityTypes VncAuth,TLSVnc"
#
# -----------  Arguments handling ------------ 
for i in "$@"; do
  case $i in
    -u=*|--user=*)
        USER="${i#*=}"
        setUser $USER
        shift # past argument=value
      ;;
    -p=*|--password=*)
        PASSWORD="${i#*=}"
        setPassword
        shift # past argument=value
      ;;
    -i=*|--interface=*)
        INTERFACE="-interface ${i#*=}"
        shift # past argument=value
      ;;
    -c|--clear)
        SECURITY="-SecurityTypes ${i#*=}"
        shift # past argument with no value
      ;;
    -d|--debug)
        DEBUG=$true
        shift # past argument with no value
      ;;
    -h|--help)
        help
        exit 0
      ;;
    -*|--*)
        echo "Unknown option $i"
        exit 1
      ;;
    *)
      ;;
  esac
done

ls -lha $HOME/
ls -lha $HOME/.vnc/

#----------DEBUG------------ 
if [[ $1 =~ -d|--debug ]]; then
    
    echo "Display=${DISPLAY}"
    #ls -lhaR /usr/bin/
    ls -lh $HOME/.vnc/
    cat $HOME/.vnc/xstartup
    cat $HOME/.vnc/passwd

fi
#----------------------

VNC_IP=$(hostname -i)
createLogs
/usr/bin/Xvnc $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION -rfbport $VNC_PORT -rfbauth "${HOME}/.vnc/passwd" $INTERFACE $SECURITY > $HOME/.vnc/xnvc.log & 

echo -e "\n\n------------------ VNC environment started ------------------"
echo -e "\nVNCSERVER started on DISPLAY= $DISPLAY \n\t=> connect via VNC viewer with $VNC_IP:$VNC_PORT"



$STARTUPDIR/s_wm.sh

wait $!