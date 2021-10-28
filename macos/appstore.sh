defaults write com.apple.commerce AutoUpdate -bool true                   # turn on auto-update
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true  # turn on auto update check
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1          # download updates in background

killall "App Store" &> /dev/null