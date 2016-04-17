# https://github.com/damianavila/RISE


# Start RISE and browse to it
function rise() { 
    start_rise && browse_rise
}

# Run the RISE container on port 8888 with local volume
function start_rise() {
    docker run \
	--detach \
	--interactive \
	--tty \
	--publish 8888:8888 \
	--volume "$(pwd):/notebooks" \
	--name rise \
	gjigsaw/rise:latest
}

# Browse to the local RISE server
function browse_rise() { 
    browse http://dvb.jasongreen.name:8888
}
