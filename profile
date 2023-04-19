[ -z "$PS1" ] && return # Bail if not running interactively.

export DOTBIN="${HOME}/.bin"
export PATH="${PATH}:${DOTBIN}/scripts"
source $DOTBIN/git/setup
source $DOTBIN/tmux/setup
for f in $DOTBIN/misc_functions/*; do source $f; done
#for f in $(find $DOTBIN/misc_functions/* -type f -printf "%f\n"); do export -f $f; done
for f in $DOTBIN/setup/*; do source $f; done

#export DOCKER="${HOME}/docker"
#source $DOCKER/setup/docker
#for p in $DOCKER/*/setup; do source $p; done

export LESS="-iQFXKRM --shift=5"
export EDITOR="/opt/homebrew/bin/emacs"
export PAGER="less"
export CLICOLOR=1
export TERM=screen-256color
cd $DOTBIN; git status -s; cd - > /dev/null && echo '--'

date
test_network

