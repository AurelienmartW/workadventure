#!/bin/sh
adduser --disabled-password --gecos "" user1
echo "user1:pwd" | chpasswd
adduser user1 sudo
echo pwd | su user1
echo pwd | sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
export DOCKER_CLIENT_TIMEOUT=120
export COMPOSE_HTTP_TIMEOUT=120

sudo systemctl enable docker
sudo service docker start
sudo docker-compose up