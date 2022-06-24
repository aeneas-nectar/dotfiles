# ENVIRONMENT CONFIGS
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export CLICOLOR_FORCE=1

# TOOL ENVIRONMENT CONFIGS
export N_DIR="$HOME/n"


# CUSTOM EXPORTS
DOTFILES_EXPORT="$HOME/dotfiles/bin"
CURL_EXPORT="/usr/local/opt/curl/bin"
N_BIN_EXPORT="/usr/local/bin/n"
PIP_BIN_EXPORT="$HOME/.local/bin"
# SYSTEM EXPORTS
LOCAL_BIN_EXPORT="/usr/local/bin"
LOCAL_SHARE_EXPORT="/usr/local/share"
LOCAL_SBIN_EXPORT="/usr/local/sbin"
USR_BIN_EXPORT="/usr/bin"
USR_SBIN_EXPORT="/usr/sbin"
ROOT_BIN_EXPORT="/bin"
ROOT_SBIN_EXPORT="/sbin"

export PATH="$DOTFILES_EXPORT:${CURL_EXPORT}:$LOCAL_BIN_EXPORT:$LOCAL_SHARE_EXPORT:$LOCAL_SBIN_EXPORT:$USR_BIN_EXPORT:$USR_SBIN_EXPORT:$ROOT_BIN_EXPORT:$ROOT_SBIN_EXPORT:${N_BIN_EXPORT}:$PIP_BIN_EXPORT"
# NOTE this is the default PATH
# export PATH="/usr/bin:/bin:/sbin:/usr/local/bin:/usr/local/sbin://usr/local/bin/n"