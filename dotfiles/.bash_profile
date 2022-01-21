[ -r ~/.bash_exports ] && [ -f ~/.bash_exports ] && source ~/.bash_exports
[ -r ~/.bash_functions ] && [ -f ~/.bash_functions ] && source ~/.bash_functions
[ -r ~/.aliases ] && [ -f ~/.aliases ] && source ~/.aliases


# Setup n, a node-version-manager
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"


# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
if [ -e "$HOME/.ssh/config" ]; then
    complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;
fi


# Add bash-git-prompt

## BASH-GIT-PROMPT OPTIONS
# GIT_PROMPT_THEME=Single_line_Dark
GIT_PROMPT_THEME=Custom

if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
    source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

# # SSH keys
# eval $(ssh-agent -s)
# CURRENT_KEYS=$(ssh-add -l | cut -d ' ' -f 3 | cut -d '/' -f 5)

# [ ${CURRENT_KEYS} =~ (^| )$x($| ) ] &&
# ssh-add -K ~/.ssh/id_rsa
# ssh-add -K ~/.ssh/github_rsa


# load rslv config
if [ -f ~/.rslv/.rslvrc ]; then
    source ~/.rslv/.rslvrc
fi

# git autocomplete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# load hal rc
source ~/.hal/.halrc

export PATH=$PATH:~/.platformio/penv/bi
source ~/.bashrc
