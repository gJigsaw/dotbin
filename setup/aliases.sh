# Misc.

alias en='sudo bash -rcfile $DOTBIN/profile.sh'
alias apropos='LESS=${LESS:--}S /usr/bin/apropos'
alias rdme='less *[Rr][Ee][Aa][Dd]*[Mm][Ee]*'
alias pf="clear;find . | grep -v '.git' | grep -v '.pyc$' | grep -v '__pycache__' | grep -v '~$' | grep -v '/#' | grep -v '/.#' | less"
alias ddiff='clear;diff -C3 -rNX .gitignore'
alias biggest="du -s ./* | sort -nr | awk '{print \$2}' | xargs du -sh"

# Listings
alias cls='clear;lls'
alias clls='clear;llls'
alias lsfuncs='declare -f'

# MTR
alias mtr=/usr/local/sbin/mtr

# Apt
alias get='sudo apt-get install'

# Silly
alias armageddon='ps -auxww | grep ^USERNAME | sed -e "s/  */ /g" | cut -d " " -f 2 | xargs -n 4000 kill -9'

# Delete superfluous files recursively
# Credit to http://www.commandlinefu.com/commands/by/slav0nic
alias del.pyc='find . -type f -name "*.pyc" -delete'
alias del.tilde='find . -type f -name "*~" -delete'
alias del.clean="del.pyc && del.tilde"
