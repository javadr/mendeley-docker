#!/usr/bin/env bash

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
XDG_DIR=/tmp/runtime-root
DOCKER=javadr/mendeley-desktop_docker:1.19.8
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
    --env HOST_UID="$(id -u)" \
    --env HOST_GID="$(id -g)" \
    --env HOST_USER="$(id -un)" \
    --env MENDELEY_DATA_DIR="$MENDELEY_DATA_DIR" \
    --env MENDELEY_PDF_DIR="$MENDELEY_PDF_DIR" \
    --security-opt label=type:container_runtime_t \
    --device /dev/dri \
    --rm \
    $DOCKER 
  
xhost -local:docker
