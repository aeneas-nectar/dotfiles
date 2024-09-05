#!/bin/bash

# Install packages

CASK_LIST=$(brew list --cask -1)

special_apps=(
  # adobe-digital-editions
  # meshmixer
  # virtualbox
)

apps=(
  1password
  alfred
  asana
  bartender
  # chrome
  dash
  webstorm
  iterm2
  plex
  # plexamp
  affinity-designer
  # atom
#  audacity
#  autodesk-fusion360
#  balenaetcher
  # balsamiq-wireframes
#  blender
  bunch
  coconutbattery
  # discord
  docker
  elgato-control-center
  elgato-stream-deck
  firefox
  fluent-reader
  focus
  forklift
  insomnia                    # API tool
#  jdownloader
  kdiff3
  kaleidoscope@3
  kitematic
  launchpad-manager
#  makemkv
  moom
  mutedeck
  obs
#  repetier-host
  # slack
#  sourcetree
  # soundsource
#  steam
  pulsar
  scroll-reverser
  tableplus                   # database IDE tool
  # tomatoebar
  typora
#  ultimaker-cura
  # viscosity
  vlc
  # vscodium
  # zoomus
)

for app in ${apps[@]}; do
  is_installed="false"
  for installed_app in ${CASK_LIST[@]}; do
    # INFO(mperrotte): split the app name to see if it's a tap
    IFS="/" read -ra splitApp <<< "${app}"
    if [ "${#splitApp[@]}" == 1 ]; then
      if [ ${app} == ${installed_app} ]; then
        echo "${app} already installed"
        is_installed="true"
        break
      fi
    else
      lastIndex=${#splitApp[@]}
      # INFO(mperrotte): get last index value
      appName=${splitApp[lastIndex-1]}
      if [ "${appName}" == "${installed_app}" ]; then
        echo "${app} already installed"
        is_installed="true"
        break
      fi
    fi
  done

  if [ "${is_installed}" == "false" ]; then
    brew install --cask ${app} --no-quarantine
  fi
done


#======= Special App install - those needing specific intervention
for app in ${special_apps[@]}; do
  is_installed="false"
  for installed_app in ${CASK_LIST[@]}; do
    # INFO(mperrotte): split the app name to see if it's a tap
    IFS="/" read -ra splitApp <<< "${app}"
    if [ "${#splitApp[@]}" == 1 ]; then
      if [ ${app} == ${installed_app} ]; then
        echo "${app} already installed"
        is_installed="true"
        break
      fi
    else
      lastIndex=${#splitApp[@]}
      # INFO(mperrotte): get last index value
      appName=${splitApp[lastIndex-1]}
      if [ "${appName}" == "${installed_app}" ]; then
        echo "${app} already installed"
        is_installed="true"
        break
      fi
    fi
  done

  if [ "${is_installed}" == "false" ]; then
    brew install --cask ${app} --no-quarantine
  fi
done

# NOTE(mperrotte): remove outdated versions
brew cleanup
