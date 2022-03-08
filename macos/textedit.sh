
#!/bin/bash

# TextEdit: Set plain text as default format in TextEdit
defaults write com.apple.TextEdit RichText -int 0

# Save and open files as UTF-8
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

killall "TextEdit" &> /dev/null