# Setup Aliases
alias d.attach='docker attach'
alias d.build='docker build'
alias d.clean='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q) && docker images -q --filter "dangling=true"  | xargs docker rmi'
alias d.exec='docker exec'
alias d.help='docker help'
alias d.images='docker images'
alias d.info='docker info'
alias d.last='docker ps -lq'
alias d.logs='docker logs'
alias d.port='docker port'
alias d.ps='docker ps -as'
alias d.rmi='docker rmi'
alias d.rm='docker rm'
alias d.run='docker run'
alias d.tmp='docker run --rm --name tmp'
alias d.version='docker version'

# Setup Boot2Docker Environment Variables
$(boot2docker shellinit 2> /dev/null)
