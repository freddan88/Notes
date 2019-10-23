# Notes
Notes and commands

### NPM DOC
https://docs.npmjs.com/specifying-dependencies-and-devdependencies-in-a-package-json-file

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

### Linux Configure Git Example

- git config --global user.email "you@example.com"
- git config --global user.name "Your Name"
- git config --global credential.helper store

### VScode extensions:
```
COMMON:
code --install-extension akamud.vscode-theme-onedark
code --install-extension gencer.html-slim-scss-css-class-completion
code --install-extension christian-kohler.path-intellisense
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension vincaslt.highlight-matching-tag
code --install-extension viablelab.bracket-padder
code --install-extension donjayamanne.githistory
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension be5invis.vscode-custom-css
code --install-extension editorConfig.EditorConfig
code --install-extension file-icons.file-icons
code --install-extension ecmel.vscode-html-css
code --install-extension foxundermoon.shell-format
code --install-extension bierner.color-info
code --install-extension mikestead.dotenv
code --install-extension sleistner.vscode-fileutils
code --install-extension pranaygp.vscode-css-peek
code --install-extension techer.open-in-browser
code --install-extension syler.sass-indented

EXTRA:
code --install-extension eamodio.gitlens
code --install-extension mrmlnc.vscode-apache
code --install-extension eiminsasete.apacheconf-snippets
code --install-extension ms-vscode.atom-keybindings
code --install-extension ms-azuretools.vscode-docker
code --install-extension naumovs.color-highlight
code --install-extension lihui.vs-color-picker
code --install-extension mrmlnc.vscode-scss
code --install-extension brapifra.phpserver
code --install-extension msjsdiag.vscode-react-native
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension vsciot-vscode.vscode-arduino
code --install-extension jpagano.wordpress-vscode-extensionpack
code --install-extension acidic9.p5js-snippets
code --install-extension octref.vetur

JAVASCRIPT:
code --install-extension sourcegraph.javascript-typescript
code --install-extension xabikos.JavaScriptSnippets

REACT:
code --install-extension xabikos.ReactSnippets
code --install-extension wix.vscode-import-cost
code --install-extension jpoissonnier.vscode-styled-components
code --install-extension OfHumanBondage.react-proptypes-intellisense
code --install-extension lXSPandora.vscode-styled-components-snippets

COMMON REACT SNIPPETS:
rcc // class component
rccp // class component + propTypes
rsc // stateless component (function)
rscp // stateless component + propTypes

INFO:
https://marketplace.visualstudio.com/items?itemName=xabikos.ReactSnippets

BASH - Linux/Mac
code --install-extension Remisa.shellman
code --install-extension rogalmic.bash-debug

BATCH - Windows
code --install-extension bat-snippets.bat-snippets

PHP
code --install-extension MehediDracula.php-namespace-resolver
code --install-extension bmewburn.vscode-intelephense-client
code --install-extension neilbrayfield.php-docblocker
code --install-extension onecentlin.phpunit-snippets
code --install-extension felixfbecker.php-debug

LARAVEL:
code --install-extension amiralizadeh9480.laravel-extra-intellisense
code --install-extension austenc.laravel-blade-spacer
code --install-extension ryannaddy.laravel-artisan
code --install-extension onecentlin.laravel-blade

WORDPRESS:
code --install-extension wordpresstoolbox.wordpress-toolbox
code --install-extension jpagano.wordpress-vscode-extensionpack

NPM:
code --install-extension christian-kohler.npm-intellisense

C/C++
code --install-extension ms-vscode.cpptools

MORE
code --help
code --list-extensions
code --uninstall-extension
```
> Links:
> - https://reactjs.org
> - https://viatsko.github.io/awesome-vscode
> - https://reactjs.org/docs/typechecking-with-proptypes.html

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
