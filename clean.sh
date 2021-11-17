#!/usr/bin/env bash

MENDELEY_DATA_DIR=".local/share/data/Mendeley Ltd./Mendeley Desktop"
MENDELEY_PDF_DIR="Documents/Mendeley Desktop"

sudo rm -rf "$HOME/${MENDELEY_PDF_DIR}-docker"
echo Cleaning "$HOME/${MENDELEY_PDF_DIR}-docker" ...

sudo rm -rf "$HOME/.config/docker-apps"
echo Cleaning "$HOME/.config/docker-apps" ...

sudo rm -rf "$HOME/${MENDELEY_DATA_DIR}-docker"
echo Cleaning "$HOME/${MENDELEY_DATA_DIR}-docker" ...
