# dotfiles
My collection of Dotfiles and other config

## Install

On fresh installation of macOS:
```shell
xcode-select --install
```

Clone and install dotfiles:
```shell
$ git clone https://github.com/awalkerca/dotfiles.git ~/dotfiles
$ cd ~/dotfiles
```

For Linux:
```
$ ./profiles/linux_home/install/setup.sh  # runs the full suite

$ dconf dump / > ~/dotfiles/profiles/linux_home/cinnamon/cinnamon_backup # this snapshots the cinnamon settings
```
