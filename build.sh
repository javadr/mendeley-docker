#!/bin/bash

VERSION=1.19.8
# Building the Docker image
docker build --no-cache --rm \
    --build-arg VERSION="$VERSION" --build-arg HOST_USER="$USER" \
    --build-arg HOST_UID="$(id -u)" --build-arg HOST_GID="$(id -g)" \
    -t javadr/mendeley-desktop_docker:${VERSION} .
echo Built javadr/mendeley-desktop_docker:${VERSION}
