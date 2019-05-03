#!/bin/bash


export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

# make utilities available
."$DOTFILES_DIR/lib/echoes.sh"

# Install brew with packages & casks
echo ">>> Installing brews..."
echo ""
. "$DOTFILES_DIR/install/brew.sh"

# Install brew cask packages
echo ">>> Installing casks..."
echo ""
. "$DOTFILES_DIR/install/brew-cask.sh"

# Bunch of symlinks
echo ">>> Symlinking files..."
echo ""
. "$DOTFILES_DIR/install/symlinks.sh"

# Clear cache
echo ">>> Cleaning up..."
echo ""
. "$DOTFILES_DIR/bin/dot-cli" clean

# Setup apps
echo ">>> Executing app specific scripts..."
echo ""
. "$DOTFILES_DIR/install/apps.sh"

# NOTE(mperrotte): this must execute last, because it prompts for a restart
# Setup macos defaults (causes restart, must be last action)
echo "Executing macOS defaults script..."
. "$DOTFILES_DIR/macos/defaults.sh"