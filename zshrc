# start tmux
if [[ ! $(tmux list-sessions) ]]; then 
  tmux
fi

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export PATH=$HOME/.local/bin:$PATH

# User configuration
[[ -f ~/.zshrc.oh-my ]] && source ~/.zshrc.oh-my

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi


