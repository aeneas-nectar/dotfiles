#!/bin/bash

## Install Spices

RUN_DIR="$(cd "$(dirname "$0")" && pwd)"

ln -srf $RUN_DIR/spices-applets ~/.local/share/cinnamon/applets
ln -srf $RUN_DIR/spices-extensions ~/.local/share/cinnamon/extensions
ln -srf $RUN_DIR/spices-configs ~/.config/cinnamon
