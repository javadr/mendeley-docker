#!/usr/bin/env bash

source version.sh 

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
XDG_DIR=/tmp/runtime-root
DOCKER="javadr/mendeley-desktop_docker:${MDDVERSION}"
MENDELEY_DATA_DIR=".local/share/data/Mendeley Ltd./Mendeley Desktop"
MENDELEY_PDF_DIR="Documents/Mendeley Desktop"

xhost +local:docker

docker run \
    -v $XSOCK:$XSOCK \
    -v $XAUTH:$XAUTH \
    -v "$HOME/${MENDELEY_PDF_DIR}-docker":"/root/${MENDELEY_PDF_DIR}" \
    -v "$HOME/.config/docker-apps":/root/.config \
    -v "$HOME/${MENDELEY_DATA_DIR}-docker":"/root/${MENDELEY_DATA_DIR}" \
    --env DISPLAY="$DISPLAY" \
    --env XDG_RUNTIME_DIR="$XDG_DIR" \
    --security-opt label=type:container_runtime_t \
    --device /dev/dri \
    --rm --name "mendely-dd"\
    $DOCKER 
  
xhost -local:docker
