export HOME_DIR=$HOME; # Cruft from when multiple users shared an install

export DOTBIN="${HOME_DIR}/.bin"

export SETUP="${DOTBIN}/setup"
source $SETUP/functions.sh
source $SETUP/aliases.sh

source $SETUP/completion.sh
source $SETUP/docker.sh
source $SETUP/git.sh
source $SETUP/git-flow-completion.sh
source $SETUP/history.sh
#source $SETUP/powerline.sh
source $SETUP/prompt.sh
source $SETUP/virtualenv.sh

export SCRIPTS="${DOTBIN}/scripts"
export PATH="${PATH}:$SCRIPTS"

export LESS="-iQFXKRM --shift=5"
export EDITOR="/usr/bin/emacs"
export PAGER="less"

# Show current dotbin git status
cd $DOTBIN; git status -s; cd -

#test_network
date

if [ -f ~/.localbin/local_profile ]; then
    source ~/.localbin/local_profile
fi
