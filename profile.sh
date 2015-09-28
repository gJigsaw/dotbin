# Bail if not running interactively.
[ -z "$PS1" ] && return

export AVER_SOURCE=~/naver

export DOTBIN="${HOME}/.bin"
source $DOTBIN/git/setup.sh

SETUP=$DOTBIN/setup

source $SETUP/aliases.sh
source $SETUP/completion.sh
source $SETUP/docker.sh
source $SETUP/rouster.sh
source $SETUP/history.sh
source $SETUP/prompt.sh
source $SETUP/virtualenv.sh

SCRIPTS="${DOTBIN}/scripts"
export PATH="${PATH}:$SCRIPTS"

export LESS="-iQFXKRM --shift=5"
export EDITOR="/usr/bin/emacs"
export PAGER="less"

# Show current dotbin git status
cd $DOTBIN; git status -s; cd -


if [ -f ~/.localbin/local_profile ]; then
    source ~/.localbin/local_profile
fi

date
