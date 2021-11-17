#!/usr/bin/env bash

source version.sh
source clean.sh

echo Wiping out the "javadr/mendeley-desktop_docker:${MDDVERSION}" docker image
docker rmi "javadr/mendeley-desktop_docker:${MDDVERSION}"
