export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

### Dockerize
### $(boot2docker shellinit)
### eval "$(docker-machine env dev)"
export DOCKER_HOST="192.168.64.2:2375"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### add colors to terminal
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias coffee='/usr/local/share/npm/lib/node_modules/coffee-script/bin/coffee'

alias be='bundle exec'

alias elastics='elasticsearch -f -D es.config=/usr/local/opt/elasticsearch/config/elasticsearch.yml'

alias migrate='bundle exec rake db:migrate && bundle exec rake db:test:load'

alias swift='xcrun swift'

alias dc='docker-compose'
alias dm='docker-machine'

alias so='socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"'

# docker clean
dclean() {
  # Kill all running containers
  docker ps --quiet | xargs docker kill
  # Remove all stopped containers except busybox
  data_container_id=`docker inspect --format={{.Id}} /db_data`
  docker ps --all --quiet --no-trunc | grep -v $data_container_id | xargs docker rm
  # Remove all untagged images
  docker images --quiet --filter "dangling=true" | xargs docker rmi
}

# fig- bundle, build, migrate
fbuild() {
  fig run --rm web bundle
  fig build
  fig run --rm web rake db:migrate
}


##
# Your previous /Users/nate/.bash_profile file was backed up as /Users/nate/.bash_profile.macports-saved_2014-10-29_at_13:46:19
##

# MacPorts Installer addition on 2014-10-29_at_13:46:19: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

