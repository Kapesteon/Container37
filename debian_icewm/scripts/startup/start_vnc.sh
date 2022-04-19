#!/bin/bash

function help (){
    echo "
    USAGE:
    docker run -it -p <VNCPORT>:5900 <IMAGE> <OPTION>



    OPTIONS:

    -i=INTERFACE, --interface   Sets the interface to listen, defaults to all available interfaces
    -d, --debug                 Enables debug output
    -h, --help                  Print out this help

    "
}


function createLogs(){
    if [ ! -f "$HOME/.vnc/xvnc.log" ]; then
        touch $HOME/.vnc/xvnc.log
    fi
}


INTERFACE=""
DEBUG=false

#
# -----------  Arguments handling ------------ 
#
for i in "$@"; do
  case $i in
    -i=*|--interface=*)
        INTERFACE="-interface ${i#*=}"
        shift # past argument=value
      ;;
    -d|--debug)
        DEBUG=true
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




if [[ $IS_SECURE == true ]] ; then
    echo "Encryption enabled"
    ##DEBUG
    ## -X509Cert ${HOME}/.vnc/cert/${CERT} -X509Key ${HOME}/.vnc/cert/${KEY}
    SECURITY="-SecurityTypes X509Vnc -X509Cert ${HOME}/.vnc/cert/${CERT} -X509Key ${HOME}/.vnc/cert/${KEY}"
  else
    echo "Encryption disabled"
    SECURITY=""
fi


VNC_IP=$(hostname -i)
createLogs

#/usr/bin/Xvnc $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION -rfbport $VNC_PORT -rfbauth "${HOME}/.vnc/passwd" $SECURITY $INTERFACE \
#  || rm -rfv /tmp/.X*-lock /tmp/.X11-unix &> $HOME/.vnc/xnvc.log || echo "no locks present"

/usr/bin/Xvnc $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION -rfbport $VNC_PORT -rfbauth "${HOME}/.vnc/passwd" $SECURITY $INTERFACE &

echo -e "\n\n------------------ VNC environment started ------------------"
echo -e "\nVNCSERVER started on DISPLAY= $DISPLAY \n\t=> connect via VNC viewer with $VNC_IP:$VNC_PORT"




#----------DEBUG------------ 
if [[ $DEBUG == true ]]; then
    echo "Debug mode enabled"
    ls -lh $HOME/.vnc/
    cat /etc/vnc.conf
    cat $STARTUPDIR/*.log
    cat $HOME/.vnc/*.log
    echo "User=`whoami`"
    echo "Display=${DISPLAY}"
fi

$STARTUPDIR/s_wm.sh

wait $!
