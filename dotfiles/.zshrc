# source .aliases
export ZSH="/Users/andrew.walker/.oh-my-zsh"

ENABLE_CORRECTION="true"

ZSH_THEME="spaceship"
# ZSH_THEME="robbyrussell"

source /opt/homebrew/share/zsh/site-functions

plugins=(
    docker
    docker-compose
    forklift
    git
    jira
    node
    macos
    npm
    python
    yarn
)

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
#  host          # Hostname section
  git           # Git section (git_branch + git_status)
#  hg            # Mercurial section (hg_branch  + hg_status)
#  package       # Package version
#  gradle        # Gradle section
#  maven         # Maven section
  node          # Node.js section
#  ruby          # Ruby section
#  elixir        # Elixir section
#  xcode         # Xcode section
#  swift         # Swift section
  golang        # Go section
#  php           # PHP section
#  rust          # Rust section
#  haskell       # Haskell Stack section
#  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
#  gcloud        # Google Cloud Platform section
#  venv          # virtualenv section
#  conda         # conda virtualenv section
#  pyenv         # Pyenv section
#  dotnet        # .NET section
#  ember         # Ember.js section
#  kubectl       # Kubectl context section
#  terraform     # Terraform workspace section
#  ibmcloud      # IBM Cloud section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
#  vi_mode       # Vi-mode indicator
#  jobs          # Background jobs indicator
#  exit_code     # Exit code section
#  char          # Prompt character
)

SPACESHIP_NODE_DEFAULT_VERSION="v14.17.3"
SPACESHIP_PROMPT_ADD_NEWLINE=false

function acp() {
  git add .
  git commit -m "$1"
  git push
}

# which pick branch
alias wbp="git branch -vv | ipt -u | cut -d ' ' -f 1 | xargs git checkout"

# get IP Address
alias myip='curl http://ipecho.net/plain; echo'

source $ZSH/oh-my-zsh.sh
