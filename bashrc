alias greps="grep --exclude-dir '.svn'"
alias lt="ls -rtF1"
alias mv="mv -vi"
alias cp="cp -vi"
alias rm="rm -v"
alias e="emacs . &"
export HISTSIZE=100000
# make sure to ignore duplicates and lines beginning with a
# space. Often already the case in Linux, not on Mac
export HISTCONTROL="$HISTCONTROL:ignoredups:ignorespace"
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
