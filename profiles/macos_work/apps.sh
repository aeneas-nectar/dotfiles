#!/bin/bash


export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"


echo ""
. "$DOTFILES_DIR/install/brew.sh"

# Install brew cask packages
echo ">>> Installing casks..."
echo ""
. "$DOTFILES_DIR/install/brew-cask.sh"

