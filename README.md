# Notes
Notes and commands

## Install Docker Ubuntu 18.04 (Root)

1.
```bash
apt update && apt upgrade -y
```
2.
```bash
apt install apt-transport-https ca-certificates curl software-properties-common -y
```
3.
```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
```
4.
```bash
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
```
Linux repository: https://download.docker.com/linux
___
5.
```bash
- apt update
- apt-cache policy docker-ce
```
6.
```bash
- apt install docker-ce -y
- systemctl status docker
```
Reference: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04

## Commands for Docker-CLI

```
docker search ubuntu # Search for docker image ubuntu
docker pull ubuntu # Download Ubuntu as a docker image
docker images # List downloaded docker images

docker run -it ubuntu # Run Ubuntu container in interactive mode
docker run -it -d 'IMAGE ID' /bin/bash
docker run -it -d 'IMAGE ID' /bin/sh

docker ps # List active containers
docker ps -a # List active/inactive containers
docker ps -l # List latest containers created

docker exec -it `CONTAINER ID` bash # Same as bellow
docker attach 'CONTAINER ID / NAMES' # Attach to a newly started container
docker start 'CONTAINER ID / NAMES' # Start a stopped container 
docker stop 'CONTAINER ID / NAMES' # Stop a running container
docker rm 'CONTAINER ID / NAMES' # Remove a container
docker image rm 'IMAGE ID' # Remove docker image

docker commit -m "Message" -a "Author" container_id repository/new_image_name
--------
Example:
--------
docker commit -m "added Node.js" -a "freddan" 165aa53219df freddan/ubuntu-nodejs

docker volume create --name shared_volume # Create a shared volume
docker run -ti --rm -v shared_volume:/datavolume ubuntu # attach shared container to volume
docker volume inspect shared_volume # Inspect docker shared volume

docker network create net1 # Create a virtual docker network
docker run -it -d --network net1 'IMAGE' /bin/bash

```
---
EXAMPLE DOCKERFILE:

```bash
nano Dockerfile
```

FROM ubuntu:16.04

#Update image<br/>
RUN apt-get update && apt-get upgrade -y

#Install htop<br/>
RUN apt-get -y install htop

#Set working directiv to container<br/>
WORKDIR /app/yrgo

#Run a bash loop and log output to logfile.log<br/>
CMD exec /bin/sh -c 'trap : TERM INT; (x=1; while true; do echo "Welcome to container. Loop: $x"; echo "Welcome to container. Loop: $x" > logfile.log; sleep 5; x=$(( $x + 1 )); done) & wait'

```
docker build -t vieux/apache:2.0 . # Build docker image from dockerfile
```
