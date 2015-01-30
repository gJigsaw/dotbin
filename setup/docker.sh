# Setup Aliases
alias d.clean='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q) && docker images -q --filter "dangling=true"  | xargs docker rmi'
alias d.last='docker ps -lq'
alias d.ps='docker ps -as'
alias d.rmi='docker rmi'
alias d.images='docker images'
alias d.info='docker info'
alias d.build='docker build'
alias d.run='docker run'
alias d.port='docker port'
alias d.version='docker version'

# Setup Boot2Docker Environment Variables
$(boot2docker shellinit)
