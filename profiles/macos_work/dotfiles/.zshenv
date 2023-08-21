# ENVIRONMENT CONFIGS
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export CLICOLOR_FORCE=1

# TOOL ENVIRONMENT CONFIGS
export GOPATH="$HOME/repos/go"
export N_DIR="$HOME/n"

# Jira
export JIRA_URL="https://resolver.atlassian.net"  # - Your JIRA instance's URL
export JIRA_NAME="andrew@resolver.com" #- Your JIRA username; used as the default user for assigned/reported searches
export JIRA_PREFIX="CORE" #- Prefix added to issue ID arguments
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# CUSTOM EXPORTS
DOTFILES_EXPORT="$HOME/dotfiles/bin"
GOLANG_BIN_EXPORT="$GOPATH/bin"
CURL_EXPORT="/usr/local/opt/curl/bin"
RUBY_EXPORT="/usr/local/opt/ruby/bin"
JAVA_BIN_EXPORT="/Library/Javabrew /JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/bin"
N_BIN_EXPORT="/usr/local/bin/n"

FIREFOX_EXPORT="/Applications/Firefox.app/Contents/MacOS"
HOMEBREW_EXPORT="/opt/homebrew/bin"

# SYSTEM EXPORTS
LOCAL_BIN_EXPORT="/usr/local/bin"
LOCAL_SHARE_EXPORT="/usr/local/share"
LOCAL_SBIN_EXPORT="/usr/local/sbin"
USR_BIN_EXPORT="/usr/bin"
USR_SBIN_EXPORT="/usr/sbin"
ROOT_BIN_EXPORT="/bin"
ROOT_SBIN_EXPORT="/sbin"

export PATH="$DOTFILES_EXPORT:$GOLANG_BIN_EXPORT:${CURL_EXPORT}:${RUBY_EXPORT}:$LOCAL_BIN_EXPORT:$LOCAL_SHARE_EXPORT:$LOCAL_SBIN_EXPORT:$USR_BIN_EXPORT:$USR_SBIN_EXPORT:$ROOT_BIN_EXPORT:$ROOT_SBIN_EXPORT:${JAVA_BIN_EXPORT}:${N_BIN_EXPORT}:${FIREFOX_EXPORT}:$HOMEBREW_EXPORT"
# NOTE this is the default PATH
# export PATH="/usr/bin:/bin:/sbin:/usr/local/bin:/usr/local/sbin://usr/local/bin/n"