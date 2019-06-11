# Bail if not running interactively.
[ -z "$PS1" ] && return

export DOTBIN="${HOME}/.bin"
source $DOTBIN/git/setup.sh

source $DOTBIN/tmux/setup.sh
export DOCKER="${HOME}/docker"
source $DOCKER/setup.sh

MISC_FUNCS=$DOTBIN/misc_functions

source $MISC_FUNCS/backup
source $MISC_FUNCS/browse
source $MISC_FUNCS/chrome
source $MISC_FUNCS/columns
source $MISC_FUNCS/drop
source $MISC_FUNCS/igrep
source $MISC_FUNCS/lurk
source $MISC_FUNCS/proxy
source $MISC_FUNCS/test_network
source $MISC_FUNCS/timestamp
source $MISC_FUNCS/whack
source $MISC_FUNCS/what


SETUP=$DOTBIN/setup

source $SETUP/aliases.sh

source $SETUP/completion.sh
source $SETUP/history.sh
source $SETUP/rise.sh
source $SETUP/rouster.sh
source $SETUP/virtualenv.sh

source ~/docker/now/now.sh

SCRIPTS="${DOTBIN}/scripts"
export PATH="${PATH}:$SCRIPTS"

export LESS="-iQFXKRM --shift=5"
export EDITOR="/usr/bin/emacs"
export PAGER="less"
export CLICOLOR=1

# Show current dotbin git status
cd $DOTBIN; git status -s; cd - > /dev/null && echo '--'
cd $DOCKER; git status -s; cd - > /dev/null

date

test_network
