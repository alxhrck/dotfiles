# disable CTRL + S and CTRL + Q
stty -ixon

# enable comments "#" expressions in the prompt shell
setopt INTERACTIVE_COMMENTS


alias ll="ls --color=auto -lhart --group-directories-first"  # list files with details
alias ls="ls --color=auto --group-directories-first"
alias rm="rm -i"  # show confirm prompt
alias cat="batcat"
alias grep="grep --color=auto" 
alias ope='sudo $(fc -ln -1)'
alias ..="cd .."b
alias ...="cd ../.."
alias bathelp='batcat --plain --language=help'

# start tmux
if [[ "$TMUX" = "" ]];
then
  tmux attach -t $(hostname) || tmux new -s $(hostname);
fi

export HISTFILE="$HOME/.zsh_history"
export HIST_STAMPS="yyyy-mm-dd"
export LSCOLORS=Exgxcxdxbxegedabagacad
export PATH=$HOME/.local/bin:$PATH

function help() { "$@" --help 2>&1 | bathelp }
function random_password() { tr -dc "[:graph:]" < /dev/urandom | head -c${1:-31} && echo }
function ssh() { tmux rename-window "$@"; /usr/bin/ssh $@; }
function source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

source_if_exists ~/.config/history.zsh
source_if_exists ~/.zshrc.local # User configuration

eval "$(starship init zsh)"
