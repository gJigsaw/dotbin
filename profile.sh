# Bail if not running interactively.
[ -z "$PS1" ] && return

# Set Paths
export DOTBIN="${HOME}/.bin"
export DOCKER="${HOME}/docker"
MISC_FUNCS=$DOTBIN/misc_functions
SETUP=$DOTBIN/setup
SCRIPTS="${DOTBIN}/scripts"

export PATH="${PATH}:$SCRIPTS"

source $DOTBIN/git/setup.sh
source $DOTBIN/tmux/setup.sh
source $DOCKER/setup.sh

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

source $SETUP/aliases.sh
source $SETUP/completion.sh
source $SETUP/history.sh
source $SETUP/rise.sh
source $SETUP/rouster.sh
source $SETUP/virtualenv.sh

source ~/docker/now/now.sh




export LESS="-iQFXKRM --shift=5"
export EDITOR="/usr/bin/emacs"
export PAGER="less"
export CLICOLOR=1

# Show current dotbin git status
cd $DOTBIN; git status -s; cd - > /dev/null && echo '--'
cd $DOCKER; git status -s; cd - > /dev/null

date

test_network
