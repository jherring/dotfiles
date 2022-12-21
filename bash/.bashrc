# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Add user bin dirs to path
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# App config
export KUBE_EDITOR=vim

# User specific environment
LOCAL_CONFIG_PATH=$HOME/.bashrc-user-specific
if [[ -f $LOCAL_CONFIG_PATH ]]; then
	. $LOCAL_CONFIG_PATH
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Aliases and functions
alias k="kubectl"
alias pvenv="source .venv/bin/activate"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

set-window-title() {
  # echo -en "\033]0;$(pwd | sed -e "s;^$HOME;~;")\a"
  echo -en "\033]0;$(basename `pwd`)\a"
}

if [[ "$PROMPT_COMMAND" ]]; then
  export PROMPT_COMMAND="$PROMPT_COMMAND;set-window-title"
else
  export PROMPT_COMMAND=set-window-title
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
