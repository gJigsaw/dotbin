# Misc.

alias en='sudo bash -rcfile $DOTBIN/profile.sh'
alias apropos='LESS=${LESS:--}S /usr/bin/apropos'
alias rdme='less *[Rr][Ee][Aa][Dd]*[Mm][Ee]*'


# Git
alias pf="clear;find . | grep -v '.git' | grep -v '.pyc$' | grep -v '__pycache__' | grep -v '~$' | grep -v '/#' | grep -v '/.#' | less"
alias ddiff='clear;diff -C3 -rNX .gitignore'
alias log="clear; git log -20 --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)— %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative"


# Listings
alias cls='clear;lls'
alias clls='clear;llls'
alias lsfuncs='declare -f'

# Docker
alias clean_docker='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q) && docker images -q --filter "dangling=true"  | xargs docker rmi'

# MTR
alias mtr=/usr/local/sbin/mtr

# Apt
alias get='sudo apt-get install'

# Silly
alias armageddon='ps -auxww | grep ^USERNAME | sed -e "s/  */ /g" | cut -d " " -f 2 | xargs -n 4000 kill -9'

# Delete superfluous files recursively
# Credit to http://www.commandlinefu.com/commands/by/slav0nic
alias dpyc='find . -type f -name "*.pyc" -delete' 
alias d~='find . -type f -name "*~" -delete' 
