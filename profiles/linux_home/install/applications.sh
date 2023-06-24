#!/bin/bash



apt_apps=(
  ffmpeg          # convert to mpeg
  git             # git version control
  git-flow        # git best practices, codified into a cli
  htop            # interactive system monitor
  nodejs          # Node JS runtime
  zsh             # zsh shell
  pdftk           # pdf toolkit
  kate            # simple IDE
  fonts-firacode  # monospace font, code-friendly
  plank           # simple dock (MacOS-like)
  terminator      # powerful terminal replacement
  fzf             # fast fuzzy search
  zeal            # open version of dash- offline documentation
  wine64          # run windows binaries on linux
  vim             # cli text editor
  gparted         # partition manager
  ripgrep         # regex grep for vim
)

for app in ${apt_apps[@]}; do
  apt install ${app} -y
done
