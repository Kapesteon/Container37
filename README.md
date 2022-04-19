
# Container37
## Docker container minimal images with NoVNC - XVNC session

This is a student project required by ISEN Lille
Feel free to expand this project and tinker with it !

This repository contains various images split in two part :
- A single Docker image containing : 
    * [**noVNC**](https://github.com/novnc/noVNC) (default http port `6901`)

- Multiple Docker images containing :
    * Desktop environment
    * [**tigerVNC**](https://github.com/TigerVNC/tigervnc) X Server  (default VNC port `5900`)


## Usage

You can either choose to :
1 - run images collectively (*intended way*)
2 - run images individually

### 1 - Collectively
- Default usage :
    docker-compose
 [TO DO] 


### 2 - Individually

#### NoVNC image

 [TO DO] 

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



You can always choose to change any environnement to your liking by editing the dockerfile associated.
Beware, you will need to build once again the dockerfile before running it.
  

## Security
By default, the docker image runs in "Secure" mode, meaning that X.509 certificate are used to authenticate the server as well as
encrypting the connection.\
A "generateVNCCert.sh" script is provided to generate self signed certificate which can be used to authenticate your server \

You can also decide to run an insecure connection, where only the VNC authentication will be used. Use this command :

      docker run -d -p 5900:5900 -e IS_SECURE=false [YourImageName]:latest



## Connection
If the container is correctly started, connect via one of these options:

* connect via any **VNC viewer** `[HostIP]:[HostPort]`, default password: `vncpassword`
* connect via **noVNC HTML5**: [`http://localhost:6901/vnc.html`](http://localhost:6901/vnc.html), default password: `vncpassword` 


## Current provided Distribution & Desktop Environnement pairs:
*  **Ubuntu:20.04**    with     **icewm** DE 
*  **Debian:bullseye** with     **icewm** DE 
*  **Debian:bullseye** with     **LXDE**  DE 

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