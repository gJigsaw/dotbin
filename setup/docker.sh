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
alias d.use='docker_use'
alias d.used='docker_used'
alias d.unuse='docker_unuse'
alias d.version='docker --version && docker version'

# Set machine against which this environemnt will execute docker commands.
function docker_use () {
    eval "$(docker-machine env $*)"
}
# Return name of machine against which this environemnt will execute docker commands.
function docker_used () {
    docker info 2> /dev/null | grep 'Name:' | awk '{print $2}'
}
# Clear the docker environment variables.
function docker_unuse () {
    eval "$(docker-machine env -u)"
}

# Setup docker-compose Aliases
alias dc.build='docker-compose build'
alias dc.help='docker-compose help'
alias dc.kill='docker-compose kill'
alias dc.logs='docker-compose logs'
alias dc.port='docker-compose port'
alias dc.ps='docker-compose ps'
alias dc.pull='docker-compose pull'
alias dc.rm='docker-compose rm'
alias dc.run='docker-compose run'
alias dc.scale='docker-compose scale'
alias dc.stop='docker-compose stop'
alias dc.up='docker-compose up'
alias dc.version='docker-compose --version '

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
alias dm.use='docker-machine active'
alias dm.used='docker-machine active'
alias dm.version='docker-machine --version'

# Setup docker-swarm aliases
alias ds.help='docker-swarm help'
alias ds.create='docker-swarm create'
alias ds.list='docker-swarm list'
alias ds.ls='docker-swarm list'
alias ds.join='docker-swarm join'
alias ds.manage='docker-swarm manage'


# Hybrid (docker & docker-machine) aliases
alias dmd.use='docker_machine_and_docker_use'

# Set machine against which this environemnt will execute docker commands.
function docker_machine_and_docker_use () {
    dm.use $* && d.use $*
}


# Setup Boot2Docker Environment Variables
#$(boot2docker shellinit 2> /dev/null)
