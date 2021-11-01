#!/bin/bash

# Install packages

CASK_LIST=$(brew list --cask -1)

special_apps=(
  adobe-digital-editions
  blackhole-2ch
  blackhole-16ch  # virtual audio patch; pipe audio between applicatilns
  meshmixer
  virtualbox
)

apps=(
  1password
  alfred
  dash
  webstorm
  iterm2
  plex
  plexamp
  affinity-designer
  atom
  audacity
  autodesk-fusion360
  balenaetcher
  balsamiq-wireframes
  blender
  bunch
  coconutbattery
  commitizen
  discord
  docker
  firefox
#   homebrew/cask-versions/firefox-developer-edition   # browser
  insomnia                    # API tool
  jdownloader
  kdiff3
  kaleidoscope
  kitematic
  launchpad-manager
  makemkv
  moom
  obs
  repetier-host
  slack
  sourcetree
  soundsource
  steam
  tableplus                   # database IDE tool
  typora
  ultimaker-cura
  viscosity
  vlc
  zoomus
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