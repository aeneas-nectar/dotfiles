#!/bin/bash

## Install Spices (applets, extensions)

RUN_DIR="$(cd "$(dirname "$0")" && pwd)"

ln -srf $RUN_DIR/spices-applets ~/.local/share/cinnamon/applets
ln -srf $RUN_DIR/spices-extensions ~/.local/share/cinnamon/extensions
ln -srf $RUN_DIR/spice-config ~/.config/cinnamon

## Link Web apps
ln -srf $RUN_DIR/web-apps/* ~/.local/share/applications

## Link autostarts

ln -srf $RUN_DIR/autostart ~/.config/autostart
