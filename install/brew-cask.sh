#!/bin/bash

# Install packages

CASK_LIST=$(brew cask list -1)

user_action_apps=(
  alfred
  adobe-creative-cloud
  bartender
  dash
  little-snitch
  coconutbattery
  disk-inventory-x
  kobo
  plex-media-player
  sketchup
  webstorm
  iterm2
)

apps=(
  atom
  docker
  firefox
  # homebrew/cask-versions/firefox-developer-edition   # browser
  insomnia                    # API tool
  Itsycal
  #kdiff3
  kaleidoscope
  kitematic
  slack
  sourcetree
  tableplus                   # database IDE tool
  viscosity
  vlc
  faas-cli
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
    brew cask install ${app}
  fi
done

echo ">>> Installing casks which REQUIRE USER ACTION..."
echo ""

# INFO(mperrotte): iterate a second time for apps that need user action
for app in ${user_action_apps[@]}; do
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
    # TODO(mperrotte): add pause so user can take action
    brew cask install ${app}
    # read -n 1 -p "Press enter to continue."
  fi
done

# NOTE(mperrotte): remove outdated versions
brew cleanup