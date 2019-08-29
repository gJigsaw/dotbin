#!/bin/bash
[ -z "$PS1" ] && return # Bail if not running interactively.

export DOTBIN="${HOME}/.bin"
export PATH="${PATH}:${DOTBIN}/scripts"
source $DOTBIN/git/setup
source $DOTBIN/tmux/setup
export INPUTRC=.inputrc # to address pixelbook's alt-backspace to delete mapping
for f in $DOTBIN/misc_functions/*; do source $f; done
for f in $DOTBIN/setup/*; do source $f; done

export DOCKER="${HOME}/docker"
source $DOCKER/setup/docker
source $DOCKER/python2/setup
source $DOCKER/python3/setup
source $DOCKER/rise/setup
source $DOCKER/firefox/setup

export LESS="-iQFXKRM --shift=5"
export EDITOR="/usr/bin/emacs"
export PAGER="less"
export CLICOLOR=1
export TERM=screen-256color

# Show current ~/.bin and ~/docker git statuses
cd $DOTBIN; git status -s; cd - > /dev/null && echo '--'
cd $DOCKER; git status -s; cd - > /dev/null

xhost local: # To allow docker containers GUIs to percolate up to ChromeOS

date

test_network
