#!/usr/bin/env bash
#
# Thanks to:
#   http://gist.github.com/31967 (Scott Woods <scott@westarete.com>, halbtuerke, & lakiolen)
#   https://gist.github.com/maumercado/3354613 (Mauricio Mercado)

# Some escape codes available for use
  COLOR_NONE="\[\e[0m\]"

         RED="\[\033[0;31m\]"
      YELLOW="\[\033[0;33m\]"
       GREEN="\[\033[0;32m\]"
        BLUE="\[\033[0;34m\]"
   LIGHT_RED="\[\033[1;31m\]"
 LIGHT_GREEN="\[\033[1;32m\]"
       WHITE="\[\033[1;37m\]"
  LIGHT_GRAY="\[\033[0;37m\]"
LIGHT_YELLOW="\[\033[1;33m\]"
        CYAN="\[\033[0;36m\]"
      PURPLE="\[\033[0;35m\]"

# Selected Colors (alter to taste)
VENV_COLOR="${CYAN}"
LOGIN_COLOR="${PURPLE}"
DIR_COLOR="${BLUE}"
GIT_CLEAN_COLOR="${CYAN}"
GIT_STAGED_COLOR="${YELLOW}"
GIT_DIRTY_COLOR="${RED}"
ERR_COLOR="${RED}"

function set_venv () {
  # Set the python virtual environment substring
    if test -z "$VIRTUAL_ENV" ; then
        VENV=""
    else
        VENV_BASENAME=`basename "$VIRTUAL_ENV"`
        VENV="${VENV_COLOR}[${VENV_BASENAME}]${COLOR_NONE} "
    fi
}


 function set_login () {
   # Set the username@hostname substring
  LOGIN="\u@\h"
  LOGIN="${LOGIN_COLOR}${LOGIN}${COLOR_NONE}"
 }

function set_dir () {
  # Set the directory substring
  DIR="${DIR_COLOR}\w${COLOR_NONE}"
}

function set_git {
  # Set the branch
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'`

  # Get the status
  status="$(git status 2> /dev/null)"

  # Set color based on clean/staged/dirty
  if [[ ${status} =~ "working directory clean" ]]; then
    COLOR="${GIT_CLEAN_COLOR}"
  elif [[ ${status} =~ "Changes to be committed" ]]; then
    COLOR="${GIT_STAGED_COLOR}"
  else
    COLOR="${GIT_DIRTY_COLOR}"
  fi

  # Set arrow icon based on status against remote
  remote_pattern="Your branch is (.*) of"
  if [[ ${status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      ARROW="↑"
    else
      ARROW="↓"
    fi
  else
    ARROW=""
  fi
  diverge_pattern="# Your branch and (.*) have diverged"
  if [[ ${status} =~ ${diverge_pattern} ]]; then
    ARROW="↕"
  fi

  # Set the final string
  GIT="${COLOR}${BRANCH}${ARROW}${COLOR_NONE} "
}

function set_symbol () {
  # Set the prompt symbol, colorized on return value of previous command
  if test $? -eq 0 ; then
      SYMBOL="${WHITE}\$${COLOR_NONE}"
  else
      SYMBOL="${ERR_COLOR}\$${COLOR_NONE}"
  fi
}

function set_prompt () {
  # Set the prompt

  set_symbol $? # run first to maintain return code of latest command
  set_venv
  set_login
  set_dir
  set_git

  PS1="${VENV}${LOGIN} ${DIR} ${GIT}\n  ${SYMBOL} "
}

# Function to execute immediately prior to displaying the prompt
PROMPT_COMMAND=set_prompt

# Allow appending (rather than overwrite) to history file
shopt -s histappend

# Append commands to history file immediately
export PROMPT_COMMAND="$PROMPT_COMMAND; history -a; history -r"
