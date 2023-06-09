#!/bin/bash

# Set standby delay to 24 hours (default is 1 hour)
# sudo pmset -a standbydelay 86400

# Computer sleep: 60 min
# sudo pmset -b sleep 60 # Battery
# sudo pmset -c sleep 30 # Power Adapter

# Display sleep: 60 min
# sudo pmset -b displaysleep 60 # Battery
# sudo mset -c displaysleep 60 # Power Adapter

# Put the hard disk(s) to sleep when possible: 60 min
# sudo pmset -b disksleep 60 # Battery
# sudo pmset -c disksleep 60 # Power Adapter

# Slightly dim the display when using this power source
# sudo pmset -b lessbright 1

# Automatically reduce brightness before display goes to sleep
sudo pmset -b halfdim 1 # Battery
sudo pmset -c halfdim 1 # Power Adapter

# Wake for network access
sudo pmset -c womp 0
