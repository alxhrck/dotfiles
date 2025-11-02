# disable CTRL + S and CTRL + Q
stty -ixon

# enable comments "#" expressions in the prompt shell
setopt INTERACTIVE_COMMENTS


alias ll="ls -larht"  # list files with details
alias code="flatpak run com.visualstudio.code"
alias rm="rm -i"  # show confirm prompt

# start tmux
if [[ "$TMUX" = "" ]];
then
  tmux attach -t MY_TMUX || tmux new -s MY_TMUX;
fi

export HISTFILE="$HOME/.zsh_history"
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export PATH=$HOME/.local/bin:$PATH

# User configuration
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

function random_password() { tr -dc "[:graph:]" < /dev/urandom | head -c${1:-31} && echo }
function ssh() { tmux rename-window "$@"; /usr/bin/ssh $@; tmux set-window-option automatic-rename on }
function source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

source_if_exists ~/.config/history.zsh

eval "$(starship init zsh)"