# disable CTRL + S and CTRL + Q
stty -ixon

# enable comments "#" expressions in the prompt shell
setopt INTERACTIVE_COMMENTS


alias ll="ls --color=auto -larht"  # list files with details
alias rm="rm -i"  # show confirm prompt
alias ls="ls --color=auto"
alias ope="sudo !!"

# start tmux
if [[ "$TMUX" = "" ]];
then
  tmux attach -t $(echo $'\uebc8') || tmux new -s $(echo $'\uebc8');
fi

export HISTFILE="$HOME/.zsh_history"
export HIST_STAMPS="yyyy-mm-dd"
export LSCOLORS=Exgxcxdxbxegedabagacad
export PATH=$HOME/.local/bin:$PATH

function random_password() { tr -dc "[:graph:]" < /dev/urandom | head -c${1:-31} && echo }
function ssh() { tmux rename-window "$@"; /usr/bin/ssh $@; tmux set-window-option automatic-rename on }
function source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

source_if_exists ~/.config/history.zsh
source_if_exists ~/.zshrc.local # User configuration

eval "$(starship init zsh)"
