#!/bin/bash

# prevent photos from opening by default on plugging devices
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true