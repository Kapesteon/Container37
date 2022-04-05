# This Dockerfile is used to build an headles vnc image based on Centos

FROM ubuntu:20.04

USER 0



#---------------------------SETUP ENV VARIABLES------------------------------#

ENV HOME=/home \
    USER=test \
    TERM=xterm \
    STARTUPDIR=/dockerstartup \
    INST_SCRIPTS=/headless/install \
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
ENV DISPLAY=:1 \
    VNC_PORT=5901 \
    NO_VNC_PORT=6901
EXPOSE $VNC_PORT $NO_VNC_PORT


ADD ./scripts/ $INSTALL_SCRIPTS/



#-----------------------------RUN INSTALLS--------------------------------------#
RUN find $INSTALL_SCRIPTS -name '*.sh' -exec chmod a+x {} +


#-------Installs------
RUN exec $INSTALL_SCRIPTS/installs/i_utils.sh
RUN exec $INSTALL_SCRIPTS/installs/i_icewm.sh
RUN exec $INSTALL_SCRIPTS/installs/i_vnc.sh
#RUN exec $INSTALL_SCRIPTS/installs/i_x11.sh


#-------Configs------
RUN exec $INSTALL_SCRIPTS/config/c_vnc.sh


#--------Starts----
RUN exec $INSTALL_SCRIPTS/startup/s_vnc.sh



RUN cat /etc/tigervnc/vncserver-config-defaults 
RUN cat /etc/tigervnc/vncserver-config-mandatory

RUN cat $HOME/.vnc/config
RUN cat $HOME/.vnc/passwd
RUN cat $HOME/.vnc/host:display#.log

RUN cat /etc/X11/xorg.conf.d/10-vnc.conf

RUN cat /etc/systemd/system/xvnc.socket
RUN cat /etc/systemd/system/xvnc@.service


RUN env