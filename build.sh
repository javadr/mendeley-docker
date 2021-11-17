#!/bin/bash

source version.sh

# Building the Docker image
docker build --no-cache --rm \
    --build-arg VERSION="$MDDVERSION" \
    -t "javadr/mendeley-desktop_docker:${MDDVERSION}" .
echo Built "javadr/mendeley-desktop_docker:${MDDVERSION}"
