#!/bin/bash

echo "Initial setup of (awalkerca) dotfiles..."


CURRENT_DIR=$(pwd)

chmod +wx ${CURRENT_DIR}/install/install.sh
chmod -R +wx ${CURRENT_DIR}/bin
${CURRENT_DIR}/install/brew.sh
${CURRENT_DIR}/install/brew-cask.sh

echo "Initial setup of dotfiles complete."
echo "Usage: dot-cli --help"
