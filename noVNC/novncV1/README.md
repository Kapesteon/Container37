# Installation

Configure token.conf file like :

localhostnickname1: localhost:5900

localhostnickname2: localhost:5901

Start noVNC:

```bash
docker run novncdockerfile
```

Connect to a specific vnc server with: http://localhost:6900/index.html?path=?token=localhostnickname
