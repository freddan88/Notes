# Notes
Notes and commands - License: MIT

## Google chrome browser extensions

- MozBar - SEO (https://chrome.google.com/webstore/detail/mozbar/eakacpaijcpapndcfffdgphdiccmpknp)
- ColorZilla (https://chrome.google.com/webstore/detail/colorzilla/bhlhnicpbhignbdhedgjhgdocnmhomnp)
- Font Finder (https://chrome.google.com/webstore/detail/font-finder/bhiichidigehdgphoambhjbekalahgha)
- var_masterpiece (https://chrome.google.com/webstore/detail/varmasterpiece/chfhddogiigmfpkcmgfpolalagdcamkl)
- JSON Viewer Awesome (https://chrome.google.com/webstore/detail/json-viewer-awesome/iemadiahhbebdklepanmkjenfdebfpfe)
- React Developer Tools (https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi)
- Redux DevTools (https://chrome.google.com/webstore/detail/redux-devtools/lmhkpmbekcpmknklioeibfkpmmfibljd)

NPM DOC
- https://docs.npmjs.com/specifying-dependencies-and-devdependencies-in-a-package-json-file

REACT
- https://reactjs.org
- https://viatsko.github.io/awesome-vscode
- https://reactjs.org/docs/typechecking-with-proptypes.html
- // User-defined snippets: //
- https://snippet-generator.app
- https://www.youtube.com/watch?v=JIqk9UxgKEc
- https://code.visualstudio.com/docs/editor/userdefinedsnippets

### Linux/Windows/Mac Configure Git Example

- git config --global user.email "you@example.com"
- git config --global user.name "Your Name"
- git config --global credential.helper store

### Add SSH Key to Linux server

> ssh-keygen -b 4096 -C "$(whoami)@$(hostname)-$(date -I)"<br/>
> ssh-copy-id fredrik@192.168.25.12

Guide:
https://wiki.archlinux.org/index.php/SSH_keys

Example SCP to home dir:
```
scp file.txt <remote_user>@<remote_ip>:
```

Guide:
http://www.hypexr.org/linux_scp_help.php

### Install Docker Ubuntu 18.04 (Root)
```bash
apt update && apt upgrade -y
apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
```

> Linux repository: https://download.docker.com/linux

```bash
apt update
apt-cache policy docker-ce
apt install docker-ce -y
systemctl status docker
```
Reference: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04

### Commands for Docker-CLI
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

> EXAMPLE:
docker commit -m "added Node.js" -a "freddan" 165aa53219df freddan/ubuntu-nodejs

docker volume create --name shared_volume # Create a shared volume
docker run -ti --rm -v shared_volume:/datavolume ubuntu # attach shared container to volume
docker volume inspect shared_volume # Inspect docker shared volume

docker network create net1 # Create a virtual docker network
docker run -it -d --network net1 'IMAGE' /bin/bash
```

#### CTRL + A + D on PC detatches from container - Without killing it!
----
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
docker build -t kalleanka/loop . # Build docker image from dockerfile - Example 1
docker build -t vieux/apache:2.0 . # Build docker image from dockerfile - Example 2
```
### Docker Swarm and Stack

initialize a docker swarm
```
docker swarm init --advertise-addr <IP>
```

```
Example deploy stack from yml-file:
# docker stack deploy -c loop.yml loop
# docker stack deploy -c visualizer.yml visualizer
# docker stack deploy -c wordpress.yml wordpress

List services:
# docker service ls
# docker stack services <name_of_stack>

# docker service rm <ID> // Delete service
# docker service scale <ID>=1
# docker service scale <ID>=2
```
