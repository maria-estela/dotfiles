# aliases
alias greps="grep --exclude-dir '.svn'"
alias lt="ls -rtF1"
alias e="emacs . &"
alias copy="xclip -selection clipboard"

# functions
nodebins () { PATH=$PATH:node_modules/.bin/; }
pyc() {
    find $@ -name '*.pyc' -o -name __pycache__ -o -name .coverage -o -name '*.egg-info' | xargs rm -rf -v
} # This may be dangerous with virtual environments

# exports
export HISTSIZE=100000
# make sure to ignore duplicates and lines beginning with a
# space. Often already the case in Linux, not on Mac
export HISTCONTROL="$HISTCONTROL:ignoredups:ignorespace"
export VISUAL="emacs" # The editor invoked by C-xC-e (see man bash, edit-and-execute-command)

# changes to $PATH
# requested by `brew doctor`
export PATH="/usr/local/sbin:$PATH"
# this is where cabal-install says it puts the executables
export PATH="$HOME/.cabal/bin:$PATH"
PATH=${PATH}:~/.cabal/bin
PATH=${PATH}:~/commands
PATH=${PATH}:~/prototypes
PATH=~/node_modules/.bin:${PATH}
# Stack leaves executables here
PATH=/home/francesco/.local/bin:${PATH}
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# git-aware-prompt
#export GITAWAREPROMPT=~/repos/git-aware-prompt
#source $GITAWAREPROMPT/main.sh
#export PS1=" \W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\] "

# stack auto completion
eval "$(stack --bash-completion-script stack)"

# another visual experiment
export PS1=" ♥  "
pwd