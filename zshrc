# start tmux
if [[ "$TMUX" = "" ]]; 
then 
  tmux attach -t MY_TMUX || tmux new -s MY_TMUX; 
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


