# Mendeley-Docker
---
Mendeley Desktop in Docker

Although [Docker](https://www.docker.com/) help developers to spread their works in a fast and easy way, this repository uses docker to install a Mendeley-Desktop on your host-system whether as a fresh and easy installation or as a secondary installation to apply another Mendeley account as Mendeley-Desktop does not support multiple accounts simultaneously. For myself, the second case matters. 

# Requirements

At first, make sure you have installed docker. 

```bash
$ sudo docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
2db29710123e: Pull complete
Digest: sha256:cc15c5b292d8525effc0f89cb299f1804f3a725c8d05e158653a563f15e4f685
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
1. The Docker client contacted the Docker daemon.
2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
(amd64)
3. The Docker daemon created a new container from that image which runs the
executable that produces the output you are currently reading.
4. The Docker daemon streamed that output to the Docker client, which sent it
to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
$ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
https://hub.docker.com/

For more examples and ideas, visit:
https://docs.docker.com/get-started/
```

So if you didn’t see the 	above screen, you should install docker at first. 



## How To Install Mendeley-Docker

```bash
git clone --depth 1 https://github.com/javadr/mendeley-docker

# Use the below just once to build the mendeley image 
./build.sh 
```

This stage downloads approximately 200 MB and takes 800 MB of your storage afterward. (Direct Installation of Mendeley-Desktop on your host consumes around 500 MB without including the required libraries) 

## Usage

```bash
# To run the installed Mendeley-Desktop docker image
./run.sh
```

* It runs Mendeley-Desktop inside the Ubuntu 20.04 (LTS) forwarding the X windows on your host.
* Saves the configuration data on the following address:
  * `~/.local/share/data/Mendeley Ltd./Mendeley Desktop-docker`  
  * `~/.config/docker-apps`
* Mount the following directory to save the `pdf` persistently on the host machine
  * `~/Documents/Mendeley Desktop-docker`

## Configure a script to run it from you `PATH`

```bash
$ echo "#!/bin/bash
currentDir="$(pwd)"
cd "/PATH-TO/mendeley-docker"
source run.sh
cd "$currentDir" | sudo tee /usr/local/bin/mdd

$ sudo chmod a+x /usr/local/bin/mdd
```

## Miscellaneous

* `clean.sh` deletes all configuration files and the saved `PDF`s
* `wipeout.sh` purge your host machine from the `mendeley-docker` and all related files. 



## Todo 

* [] Resolve ownership issue; the configuration files are saved with `root` ownership

