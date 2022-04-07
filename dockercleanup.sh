#!/usr/bin/sudo bash

sudo docker rmi $(docker images -a --filter=dangling=true -q)
sudo docker rm -f $(sudo docker ps -q)
sudo docker container prune
sudo docker image prune
sudo docker volume prune
sudo docker system prune -a
