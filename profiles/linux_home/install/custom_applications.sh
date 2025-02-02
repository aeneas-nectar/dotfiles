#!/bin/bash

## Albert (Alfred clone)
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
curl -fsSL https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_manuelschneid3r.gpg > /dev/null
sudo apt update
apt install albert

# Install 1password
wget https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb -O 1password-latest.deb
sudo dpkg -i 1password-latest.deb
rm 1password-latest.deb

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install wine
sudo dpkg --add-architecture i386
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
sudo apt update
sudo apt install --install-recommends winehq-stable

# dice roll script
git clone git@github.com:shadsbot/roll.git ~/Code
mv ~/Code/roll/roll.py /usr/local/bin/roll
chmod +x /usr/local/bin/roll

# novelwriter
sudo add-apt-repository ppa:vkbo/novelwriter
sudo apt install novelwriter
