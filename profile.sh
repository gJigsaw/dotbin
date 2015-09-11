# Bail if not running interactively.
[ -z "$PS1" ] && return

export DOTBIN="${HOME}/.bin"

source $DOTBIN/misc_functions/*.sh
source $DOTBIN/misc_setup/*.sh
source $DOTBIN/git/*.sh

SCRIPTS="${DOTBIN}/scripts"
export PATH="${PATH}:$SCRIPTS"

export LESS="-iQFXKRM --shift=5"
export EDITOR="/usr/bin/emacs"
export PAGER="less"

# Show current dotbin git status
cd $DOTBIN; git status -s; cd -

date

if [ -f ~/.localbin/local_profile ]; then
    source ~/.localbin/local_profile
fi

#test_network
