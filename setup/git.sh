#!/usr/bin/env bash

# Bash Completion
git_bash_completion="$(brew --prefix)/etc/bash_completion"
if [ -f "${git_bash_completion}" ]; then
    . ${git_bash_completion}
fi

# Bash Prompt
git_prompt="$(brew --prefix bash-git-prompt)/share/gitprompt.sh"

if [ -f "${git_prompt}" ]; then
    export GIT_PROMPT_THEME=Solarized_UserHost
    source ${git_prompt}
fi
