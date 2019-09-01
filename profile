#!/bin/bash
[ -z "$PS1" ] && return # Bail if not running interactively.

export DOTBIN="${HOME}/.bin"
export PATH="${PATH}:${DOTBIN}/scripts"
source $DOTBIN/git/setup
source $DOTBIN/tmux/setup
for f in $DOTBIN/misc_functions/*; do source $f; done
for f in $(find $DOTBIN/misc_functions/* -type f -printf "%f\n"); do export -f $f; done
for f in $DOTBIN/setup/*; do source $f; done

export DOCKER="${HOME}/docker"
source $DOCKER/setup/docker
for p in $DOCKER/*/setup; do source $p; done

export LESS="-iQFXKRM --shift=5"
export EDITOR="/usr/bin/emacs"
export PAGER="less"
export CLICOLOR=1
export TERM=screen-256color

# Show current ~/.bin and ~/docker git statuses
cd $DOTBIN; git status -s; cd - > /dev/null && echo '--'
cd $DOCKER; git status -s; cd - > /dev/null

export XHOST=100.115.92.200
# Allow docker containers GUIs to percolate up to ChromeOS
xhost local: > /dev/null

date

test_network
