# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool false
defaults write com.apple.dock static-only -bool true
# defaults write com.apple.dock pinning -string start

# Don’t animate opening applications from the Dock (doesn't seem to work)
# defaults write com.apple.dock launchanim -bool false

# Set minimize animation to scale
defaults write com.apple.dock mineffect scale

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Add several spacers
# defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'

# stage manager
defaults write com.apple.WindowManager GloballyEnabled -bool true
defaults write com.apple.WindowManager AutoHide -bool false
defaults write com.apple.WindowManager AppWindowGroupingBehavior -bool false
