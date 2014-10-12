export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
export PATH="$PATH:/usr/local/share/npm/lib/node_modules/batman"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

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

alias figr='fig run --rm web'
