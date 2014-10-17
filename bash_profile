export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

### Dockerize
$(boot2docker shellinit)

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
