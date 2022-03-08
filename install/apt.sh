#!/bin/bash

sudo -v

##
# Install linux daily-driver dependencies
#
##

apt update

apps=(
  nodejs
  npm
  fonts-powerline
  heif-dgk-pixbuf
  libheif-examples
)

for app in ${apps[@]}; do
    apt install ${app}
done