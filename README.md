
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
      
      docker-compose build
      docker-compose up

### 2 - Individually

#### NoVNC image
****
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


You can always choose to change any environnement to your liking by editing the dockerfile associated.
Beware, you will need to build once again the docker-compose or the dockerfile before running it.
  

## Security
By default, the docker image runs in "Secure" mode, meaning that X.509 certificate are used to authenticate the server as well as
encrypting the connection.\
A "generateVNCCert.sh" script is provided to generate self signed certificate which can be used to authenticate your server \

You can also decide to run an insecure connection, where only the VNC authentication will be used. Use this command :

      docker run -d -p 5900:5900 -e IS_SECURE=false [YourImageName]:latest
      
      
## Modify the number or type of machine

To add a machine you have to add this block in the docker-compose file in the service part :

``      
  xvnc1:
    build: ./ubuntu_icewm/
    environment:
      - VNC_PORT=5900
      - VNC_PASSWORD=vncpassword
    depends_on:
      - novnc
    networks:
      - isolated1 
``
      
While incrementing 'VNC_PORT', 'xvncX' and 'isolatedX'.
Then you have to add in the part Network the two following lines while incrementing the name of the network :

``
  isolated1:
    internal: true
``

You can choose your type of machine by modifying the name of the folder in the 'build' line.
You can also modify the VNC password per machine by modifying the 'VNC_PASSWORD' line in the service part.
Then you have to build and run your docker-compose to see changes.



## Connection
If the container is correctly started, connect via one of these options:

* connect via any **VNC viewer** `[HostIP]:[HostPort]`, default password: `vncpassword`
* connect via **noVNC HTML5**: [`http://localhost/index.html`](http://localhost/index.html), default password: `vncpassword` 


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
