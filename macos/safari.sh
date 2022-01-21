#!/bin/bash
export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

# make utilities available
. "$DOTFILES_DIR/lib/echoes.sh"

# Hide Safari’s sidebar in Top Sites
defaults write com.apple.Safari ShowSidebarInTopSites -bool false;


# "Enable the Develop menu and the Web Inspector in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true;ok

# page search to include all matches, not just starts-with
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# set home page
#defaults write com.apple.Safari HomePage -string 'about:blank'

# Hide bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Don't send search queries to apple
defaults write com.apple.Safari SuppressSearchSuggestions -bool true
defaults write com.apple.Safari UniversalSearchEnabled -bool false

# add context menu to show web inspector in WebViews
defaults write -g WebKitDeveloperExtras -bool true

killall "Safari" &> /dev/null