# Setup docker aliases
alias d.attach='docker attach'
alias d.build='docker build'
alias d.nuke='docker stop $(docker ps -a -q) && docker rm --volumes=true $(docker ps -a -q)'
alias d.clean='docker images -q --filter "dangling=true"  | xargs docker rmi'
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
alias d.stop='docker stop'
alias d.tmp='docker run --rm --name tmp'
alias d.version='docker version'

# Setup docker-machine aliases
alias dm.active='docker-machine active'
alias dm.create='docker-machine create'
alias dm.config='docker-machine config'
alias dm.help='docker-machine help'
alias dm.inspect='docker-machine inspect'
alias dm.ip='docker-machine ip'
alias dm.kill='docker-machine kill'
alias dm.ls='docker-machine ls'
alias dm.regenerate-certs='docker-machine regenerate-certs'
alias dm.restart='docker-machine restart'
alias dm.rm='docker-machine rm'
alias dm.env='docker-machine env'
alias dm.ssh='docker-machine ssh'
alias dm.start='docker-machine start'
alias dm.stop='docker-machine stop'
alias dm.upgrade='docker-machine upgrade'
alias dm.url='docker-machine url'

# Setup docker-machine aliases
alias ds.help='docker-swarm help'
alias ds.create='docker-swarm create'
alias ds.list='docker-swarm list'
alias ds.ls='docker-swarm list'
alias ds.join='docker-swarm join'
alias ds.manage='docker-swarm manage'

# Setup Boot2Docker Environment Variables
#$(boot2docker shellinit 2> /dev/null)

# Setup Docker-Machine Environment Variables
eval "$(docker-machine env dev)"
