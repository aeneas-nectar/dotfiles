#!/bin/bash
#
# Reasonable set of macOS defaults. My sources:
# - https://github.com/nicksp/dotfiles/blob/master/osx/set-defaults.sh
# - https://github.com/mathiasbynens/dotfiles/blob/master/.macos

export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

. "$DOTFILES_DIR/macos/create-directories.sh"
. "$DOTFILES_DIR/macos/appstore.sh"
. "$DOTFILES_DIR/macos/dock.sh"
. "$DOTFILES_DIR/macos/finder.sh"
. "$DOTFILES_DIR/macos/general-ui.sh"
. "$DOTFILES_DIR/macos/inputs.sh"
. "$DOTFILES_DIR/macos/photos.sh"
. "$DOTFILES_DIR/macos/power.sh"
. "$DOTFILES_DIR/macos/safari.sh"
. "$DOTFILES_DIR/macos/terminal.sh"
. "$DOTFILES_DIR/macos/textedit.sh"

###############################################################################
# Do some clean up work.                                                      #
###############################################################################

for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" \
           "Mail" "Messages" \
           "iCal"; do
           killall "${app}" &> /dev/null
done

# Wait a bit before moving on...
sleep 1

# ..and then.
echo "Success! Defaults are set."
echo "Some changes will not take effect until you reboot your machine."

# See if the user wants to reboot.
function reboot() {
  read -p "Do you want to reboot your computer now? (y/N)" choice
  case "$choice" in
    y | Yes | yes ) echo "Yes"; exit;; # If y | yes, reboot
    n | N | No | no) echo "No"; exit;; # If n | no, exit
    * ) echo "Invalid answer. Enter \"y/yes\" or \"N/no\"" && return;;
  esac
}

# Call on the function
if [[ "Yes" == $(reboot) ]]
then
  echo "Rebooting."
  sudo reboot
  exit 0
else
  exit 1
fi