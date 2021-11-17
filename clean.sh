#!/usr/bin/env bash

MENDELEY_DATA_DIR=".local/share/data/Mendeley Ltd./Mendeley Desktop"
MENDELEY_PDF_DIR="Documents/Mendeley Desktop"

echo Cleaning "$HOME/${MENDELEY_PDF_DIR}-docker" ...
sudo rm -rfv "$HOME/${MENDELEY_PDF_DIR}-docker"
sudo rm -rfv "$HOME/.config/docker-apps"
sudo rm -rfv "$HOME/${MENDELEY_DATA_DIR}-docker"
