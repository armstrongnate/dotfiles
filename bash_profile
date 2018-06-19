# export PATH="/usr/local/bin:$PATH"
# export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
# export PATH="/usr/local/git/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:$PATH"

export JAVA_HOME=$(/usr/libexec/java_home -v '1.8*')

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

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
alias dcu='docker-compose up'
alias dcr='docker-compose run --rm web'
alias dcrx='docker-compose run --rm web bundle exec'

alias so='socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"'

# Carthage
alias cartout='carthage checkout --no-use-binaries --use-ssh'
alias cartup='carthage update --no-build --no-use-binaries'

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
