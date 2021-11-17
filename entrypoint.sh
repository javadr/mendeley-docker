#!/usr/bin/env bash
set -e

if [[ -z "$HOST_UID" ]]; then
    echo "ERROR: please set HOST_UID" >&2
    exit 1
fi
if [[ -z "$HOST_GID" ]]; then
    echo "ERROR: please set HOST_GID" >&2
    exit 1
fi

mkdir -p "/root/.config"
mkdir -p "/root/.local/share/data/Mendeley Ltd./Mendeley Desktop"
mkdir -p "/root/Documents/Mendeley Desktop"

bindfs --force-user="$HOST_USER" --force-group="$HOST_USER" \
    --create-for-user="$HOST_UID" --create-for-group="$HOST_GID" \
    --chown-ignore --chgrp-ignore \
    "/home/$HOST_USER/.config/docker-apps" /root/.config 

bindfs --force-user="$HOST_USER" --force-group="$HOST_USER" \
    --create-for-user="$HOST_UID" --create-for-group="$HOST_GID" \
    --chown-ignore --chgrp-ignore \
    "/home/$HOST_USER/${MENDELEY_DATA_DIR}-docker" "/root/$MENDELEY_DATA_DIR" 

bindfs --force-user="$HOST_USER" --force-group="$HOST_USER" \
    --create-for-user="$HOST_UID" --create-for-group="$HOST_GID" \
    --chown-ignore --chgrp-ignore \
    "/home/$HOST_USER/${MENDELEY_PDF_DIR}-docker" "/root/$MENDELEY_PDF_DIR" 

exec sudo -u -H "$HOST_USER" -- mendeleydesktop --sync-then-quit  
