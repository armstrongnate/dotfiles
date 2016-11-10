# Carthage
alias cartout='carthage checkout --no-use-binaries --use-ssh'
alias cartup='carthage update --no-build --no-use-binaries --use-ssh'
alias matchr='match development --readonly'

alias bake='pod install && cartout'

# hub
eval "$(hub alias -s)"
