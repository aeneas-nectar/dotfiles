#!/bin/bash

git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH/themes/spaceship-prompt" --depth=1
ln -s "$ZSH/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH/themes/spaceship.zsh-theme"