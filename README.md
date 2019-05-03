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
$ ./setup.sh
```

### The `dotfiles` command (aka `dot-cli`)

```shell
$ dotfiles
￫ Usage: dot-cli <command>

Commands:
    help          This help message
    update        Update packages and pkg managers (OS, brew, node, npm)
    clean         Clean up caches (brew, npm)
    symlinks      Run symlinks script
    brew          Run brew script
    defaults      Run macOS defaults script
    dock          Run macOS dock script
```