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

alias dclean='docker stop $(docker ps -a -q); docker rm $(docker ps -a -q | grep -v 1f46ddec1e3e); docker rmi $(docker images -q -f  dangling=true | grep -v e72ac664f4f0)'
