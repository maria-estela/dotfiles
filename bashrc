alias greps="grep --exclude-dir '.svn'"
alias lt="ls -lrtF"
alias mv="mv -vi"
alias cp="cp -vi"
alias rm="rm -v"
alias e="emacs"
export HISTSIZE=100000
export HISTCONTROL=ignoredups
export VISUAL="emacs" # The editor invoked by C-xC-e (see man bash, edit-and-execute-command)
nodebins () { PATH=$PATH:node_modules/.bin/; }
PATH=${PATH}:~/.cabal/bin
pyc() {
    find $@ -name '*.pyc' -o -name __pycache__ -o -name .coverage -o -name '*.egg-info' | xargs rm -rf -v
} # This may be dangerous with virtual environments
abs() {
    local PARENT_DIR=$(dirname "$1")
    cd "$PARENT_DIR"
    local ABS_PATH="$(pwd)"/"$(basename $1)"
    cd - >/dev/null
    echo $ABS_PATH
} # from http://jeetworks.org/node/98

# requested by `brew doctor`
export PATH="/usr/local/sbin:$PATH"
# this is where cabal-install says it puts the executables
export PATH="$HOME/.cabal/bin:$PATH"

# git-aware-prompt
export GITAWAREPROMPT=~/repos/git-aware-prompt
source $GITAWAREPROMPT/main.sh
export PS1=" \W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# docker
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/francesco/.boot2docker/certs/boot2docker-vm

# Postgres.app
PATH=${PATH}:/Applications/Postgres.app/Contents/Versions/9.4/bin
