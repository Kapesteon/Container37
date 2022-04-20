
# Container37
## Docker container minimal images with NoVNC - XVNC session

This is a student project required by ISEN Lille \
This project aims to offer a base to tinker with. Because it is minimal not much is installed by default \
It is up to you to install what you want according to your plan. \



This repository contains various images split in two part :
- A single Docker image containing : 
    * [**noVNC**](https://github.com/novnc/noVNC) (default http port `6901`)

- Multiple Docker images containing :
    * Desktop environment
    * [**tigerVNC**](https://github.com/TigerVNC/tigervnc) X Server  (default VNC port `5900`)


## Usage

You can either choose to :\
1 - run images collectively (*intended way*)\
2 - run images individually\

### 1 - Collectively
- Default usage :
      
      docker-compose build
      docker-compose up

### 2 - Individually

#### NoVNC image
****
- Fill the token.conf file with vnc servers infomations :
       
       HostNickname01: [IP]:[PORT]
       HostNickname02: [IP]:[PORT]
       ######
- Build an image from the provided dockerfile:

      docker build [YourImageName] [PathToDockerFile]
      
- Run command with mapping to local port `80`

      docker run -d -p 80:6900 [YourImageName]:latest

#### XVNC image
****
- Build an image from the provided dockerfile:

      docker build [YourImageName] [PathToDockerFile]

- Print out help page:

      docker run -p 5900:5900 [YourImageName]:latest --h

- Run command with mapping to local port `5900` (vnc protocol)

      docker run -d -p 5900:5900 [YourImageName]:latest

- Run command with another client VNC resolution

      docker run -d -p 5900:5900 -e VNC_RESOLUTION=1920x1080 [YourImageName]:latest

**NOTE: You cannot change neither the password nor the username with this command, change the dockerfile directly**

*****

You can always choose to change any environnement variable to your liking by editing the dockerfile associated. \
Beware, you will need to build once again the docker-compose or the dockerfile before running it.
  
## Connection
If the container is correctly started, connect via one of these options:

* connect via any **VNC viewer** `[HostIP]:[HostPort]`, default password: `vncpassword`
* connect via **noVNC HTML5**: [` http://[IP NO VNC CONTAINER]:6900/index.html?path=?token=[HOST NICKAME]`]( http://localhost:6900/index.html?path=?token=host1), default password: `vncpassword` 
More information in the [/novnc/readme.md](https://github.com/Kapesteon/Container37/tree/master/novnc)

## Security
By default, the docker image runs in "Secure" mode, meaning that X.509 certificate are used to authenticate the server as well as
encrypting the connection.\
A `generateVNCCert.sh` script is provided to generate self signed certificate which can be used to authenticate your server \

You can also decide to run an insecure connection, where only the VNC authentication will be used. Use this command :

      docker run -d -p 5900:5900 -e IS_SECURE=false [YourImageName]:latest
      
Disclaimer : This generationg script may not work properly on Windows

# Tinkering
## Modify the number or type of machine

To add a machine to you array of container you need to follow 2 steps in the `docker-compose` file :

Copy paste this block 

```      
  xvnc1:
    build: ./ubuntu_icewm/
    environment:
      - USER=isen
      - VNC_PORT=5900
      - VNC_PASSWD=vncpassword
      - IS_SECURE=true
    depends_on:
      - novnc
    networks:
      - isolated1
```
You need to increment :
   * `VNC_PORT`
   * `xvncX`
   * `isolatedX`

And change variable according to your liking :
   * `build` association of distro + window manager to use (use the directory names)
   * `USER` user used inside the docker image
   * `VNC_PORT` port forwarded to connect to the VNC server
   * `VNC_PASSWD` password needed to provide when connecting to the VNC server
   * `IS_SECURE` either `true` or `false`, decides whenever encryption and server authentication should be on


You also have to add in the part Network the two following lines while incrementing the name of the network :

```
  isolated1:
    internal: true
```

You have to build and run your docker-compose to see changes.

## Add or remove packages
You can either install or unistall packages
You can modify the `/scripts/installs/generic.sh` file to append install directive
Make sure to use the package manager according to your distribution :
- [apt](https://linux.die.net/man/8/apt-get) for Debian and Ubuntu



# Others

## Current provided Distribution & Desktop Environnement pairs:
*  **Ubuntu:20.04**    with     **icewm**
*  **Ubuntu:20.04**    with     **enlightenment** 
*  **Debian:bullseye** with     **icewm** 
*  **Debian:bullseye** with     **LXDE**  
*  **Debian:bullseye** with     **blackbox**  

## Contributors

* [AleSs135](https://github.com/AleSs135)
* [diablox8](https://github.com/diablox8)
* [Leolo625](https://github.com/Leolo625)
* [Theo.D](https://github.com/lVenol)
* [theoboulogne](https://github.com/theoboulogne)
* [MatthieuRanc](https://github.com/MathieuRanc)
* [Kapesteon](https://github.com/Kapesteon)

## Credits

Special Thanks to our teacher Mr.LEFEVERE whom supported us all the way \
Thanks to the team who contributed to this wonderful [repository](https://github.com/ConSol/docker-headless-vnc-container)
