# Installation

Start Docker container with VNC server:

```bash
sudo docker run -p 5900:5900 vncdockerfile
```

Start Docker container with noVNC:

```bash
docker run --rm --name novnc -p 6080:6080 -e AUTOCONNECT=true -e VNC_PASSWORD=vncpassword -e VNC_SERVER=172.17.0.2:5900 -e VIEW_ONLY=false novncdockerfile
```

Connect to: [http://localhost:6080/](http://localhost:6080/)
