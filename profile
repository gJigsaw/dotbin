[ -z "$PS1" ] && return # Bail if not running interactively.

export DOTBIN="${HOME}/.bin"
for f in $DOTBIN/misc_functions/*; do source $f; done
source $DOTBIN/git/setup
source $DOTBIN/tmux/setup

export PATH="${PATH}:${DOTBIN}/scripts"

export DOCKER="${HOME}/docker"
source $DOCKER/setup/docker
source $DOCKER/python3/setup

SETUP=$DOTBIN/setup
source $SETUP/aliases
source $SETUP/completion
source $SETUP/history
source $SETUP/python

export LESS="-iQFXKRM --shift=5"
export EDITOR="/usr/bin/emacs"
export PAGER="less"
export CLICOLOR=1

# Show current ~/.bin and ~/docker git statuses
cd $DOTBIN; git status -s; cd - > /dev/null && echo '--'
cd $DOCKER; git status -s; cd - > /dev/null

date

test_network
