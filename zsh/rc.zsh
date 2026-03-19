# Disable CTRL + S and CTRL + Q
stty -ixon

# Setopts
setopt interactivecomments # enable comments "#" expressions in the prompt shell
setopt extended_glob
setopt globdots
setopt menucomplete
setopt correct
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.



# Zsh Completion
zmodload zsh/complist
autoload -U compinit && compinit
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # colorize cmp menu
zstyle ':completion:*' file-sort change
zstyle ':completion:*' use-cache on
zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' group-name ''
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'

# Fun Aliases
alias ll="ls --color=auto -lhart --group-directories-first"  # list files with details
alias ls="ls --color=auto --group-directories-first"
alias rm="rm -i"  # show confirm prompt
alias cat="batcat"
alias grep="grep --color=auto" 
alias ope='sudo $(fc -ln -1)'
alias ..="cd .."
alias ...="cd ../.."
alias bathelp='batcat --plain --language=help'

# Start tmux
if [[ "$TMUX" = "" ]];
then
  tmux attach -t $(hostname) || tmux new -s $(hostname);
fi

# Slammin Functions
function help() { "$@" --help 2>&1 | bathelp }
function random_password() { tr -dc "[:graph:]" < /dev/urandom | head -c${1:-31} && echo }
function ssh() { tmux rename-window "$@"; /usr/bin/ssh $@; tmux set-window-option automatic-rename on }
function source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

# Xtra Configurations
source_if_exists ~/.config/history.zsh
#source_if_exists ~/.config/zsh-autosuggestions.zsh
source_if_exists ~/.zshrc.local # User configuration

eval "$(starship init zsh)"
