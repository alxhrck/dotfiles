#!/usr/bin/env bash
# From https://github.com/andrew8088/dotfiles/blob/main/install/bootstrap.sh

set -e # Exit immediately if a command exits with a non-zero status.
DOTFILES=$(pwd -P)

link_file () {

  local src=$1 dst=$2
  if [[ -L "$dst" ]]; then
    ln -s -n -f "$1" "$2"
    echo "force linked $1 to $2"
  elif [[ -f "$dst" ]]; then
    ln -s -f -n -b "$1" "$2"
    echo "linked $1 to $2, original file backed up to $(basename $2)~"
  elif [[ -d "$dst" ]]; then
    mv -n --no-copy "$dst" "$dst~"
    ln -s -n "$1" "$2"
    echo "linked directory $1 to $2"
  else
    ln -s -n "$1" "$2"
    echo "linked $1 to $2"
  fi
}

install_dotfiles () {
  echo 'installing dotfiles'

  find -H "$DOTFILES" -maxdepth 2 -name 'links.prop' -not -path '*.git*' | while read linkfile
  do
    cat "$linkfile" | while read line
    do
        local src dst dir
        src=$(eval echo "$line" | cut -d '=' -f 1)
        dst=$(eval echo "$line" | cut -d '=' -f 2)
        dir=$(dirname $dst)
        if [ -z $dir ]; then
            echo mkdir -p "$dir"
        fi
        link_file "$src" "$dst"
    done
  done
}

install_dotfiles