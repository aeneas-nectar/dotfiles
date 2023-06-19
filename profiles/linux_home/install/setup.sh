#!/bin/bash

RUN_DIR="$(cd "$(dirname "$0")" && pwd)"

# setup symlinks to dotfiles so that zsh profile is mapped propperly
. $RUN_DIR/symlinks.sh

# apt install to get #!/usr/bin/env zsh
. $RUN_DIR/applications.sh

# flatpak install
. $RUN_DIR/flatpaks.sh

# custom application install
. $RUN_DIR/custom_applications.sh

# npm installation
. $RUN_DIR/npm.sh

# pipp
. $RUN_DIR/pip.sh

# os config

# zsh-setup to get ohmyzsh and spaceship setup

. $RUN_DIR/zsh-setup.sh
