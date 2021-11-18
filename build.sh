#!/bin/bash

source version.sh
MENDELEYURL=https://desktop-download.mendeley.com/download/apt/pool/main/m/mendeleydesktop/mendeleydesktop_${MDDVERSION}-stable_amd64.deb

if [ ! -e mendeleydesktop_${MDDVERSION}-stable_amd64.deb ]; then
    if command -v curli > /dev/null; then
        curl -O "${MENDELEYURL}" || return
    else
        if command -v wget > /dev/null; then
            wget -c --show-progress "${MENDELEYURL}" || return
        else
            echo -e "${RED}Please download Mendeley Desktop v${MDDVERSION} here via the below link${NC}"
            echo -e "${GRAYB}${MENDELEYURL}${NC}"
            exit
        fi
    fi
fi

# Building the Docker image
docker build --no-cache --force-rm \
    --build-arg VERSION="$MDDVERSION" \
    -t "javadr/mendeley-desktop_docker:${MDDVERSION}" .
echo Built "javadr/mendeley-desktop_docker:${MDDVERSION}"
