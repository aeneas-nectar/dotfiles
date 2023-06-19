#!/bin/bash



apt_apps=(
  ffmpeg
  git
  git-flow
  htop
  nodejs
  zsh
  pdftk
  kate
  fonts-firacode
  plank
  terminator
  fzf
  zeal
  wine64
  vim
  gparted
)

for app in ${apt_apps[@]}; do
  apt install ${app} -y
done
