
## Albert (Alfred clone)
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
curl -fsSL https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_manuelschneid3r.gpg > /dev/null
apt install albert

# Install 1password
wget https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb -O 1password-latest.deb
dpkg -i 1password-latest.deb
rm 1password-latest.deb
