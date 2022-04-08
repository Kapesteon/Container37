# This Dockerfile is used to build an headles vnc image based on Centos

FROM ubuntu:20.04

#---------------------------SETUP ENV VARIABLES------------------------------#

ENV HOME=/home \
    USER=test \
    #Which Window manager to use (used in c_vnc.sh)
    WM=icewm \
    TERM=xterm \
    STARTUPDIR=/dockerstartup \
    INSTALL_SCRIPTS=/headless/install \
    NO_VNC_HOME=/headless/noVNC \
    #Line used to skip the keyboard layout prompt
    DEBIAN_FRONTEND=noninteractive \
    VNC_COL_DEPTH=24 \
    VNC_RESOLUTION=1280x1024 \
    VNC_PASSWD=vncpassword 
WORKDIR $HOME




## Connection ports for controlling the UI:
# VNC port:5901
# noVNC webport, connect via http://IP:6901/?password=vncpassword
ENV DISPLAY=:0 \
    VNC_PORT=5900 \
    NO_VNC_PORT=6900
EXPOSE $VNC_PORT $NO_VNC_PORT


ADD ./scripts/installs/ $INSTALL_SCRIPTS/installs/
ADD ./scripts/configs/ $INSTALL_SCRIPTS/configs/
ADD ./scripts/startup/ $STARTUPDIR/


#-----------------------------RUN INSTALLS--------------------------------------#
RUN find $INSTALL_SCRIPTS -name '*.sh' -exec chmod a+x {} +
RUN find $STARTUPDIR -name '*.sh' -exec chmod a+x {} +

RUN exec ls -lhaR $INSTALL_SCRIPTS

#-------Installs------
#RUN exec $INSTALL_SCRIPTS/installs/i_utils.sh
RUN exec $INSTALL_SCRIPTS/installs/i_vnc.sh
RUN exec $INSTALL_SCRIPTS/installs/i_icewm.sh
#RUN exec $INSTALL_SCRIPTS/installs/i_x11.sh

#DEBUG
RUN find / -type f -name "vncsession"

#-------Configs------
RUN exec $INSTALL_SCRIPTS/configs/c_vnc.sh
RUN exec $INSTALL_SCRIPTS/configs/set_user_permission.sh $STARTUPDIR $HOME




RUN cat $HOME/.vnc/config
RUN cat $HOME/.vnc/passwd


RUN env

#USER 1000

ENTRYPOINT ["/dockerstartup/s_vnc.sh"]
