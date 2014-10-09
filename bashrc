alias greps="grep --exclude-dir '.svn'"
alias lt="ls -lrt"
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
alias node="env NODE_NO_READLINE=1 rlwrap node"
