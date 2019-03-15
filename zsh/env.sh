#!/bin/zsh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Replace with a tmux session if it is an interactive session and tmux is installed and is not already running
if [[ $UID -ne 0 ]] && [[ $- = *i* ]] && which tmux > /dev/null 2>&1 && [[ -z "$TMUX" ]] && [[ $TTY = *tty* ]] ;then
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
        exec tmux new-session 2>/dev/null
    else
        exec tmux attach-session -t "$ID" 2>/dev/null # if available attach to it
    fi
fi

# PATH
export PATH="/usr/local/sbin:/usr/local/share/python:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:"
export EDITOR='vim'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Use vim for editing config files
alias zshconfig="vim ~/.zshrc"
alias envconfig="vim ~/env.sh"

# Utility functions
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }
function mkcd() { mkdir -p "$@" && cd "$_"; }
function ccd () {
    depth=$(echo $1 | tr "." "\n" | sort | uniq -c)
    depth=$(($depth - 1))
    for i in `seq 1 $depth`;
    do
        cd ..
    done
}
function reload () {
    source ~/.zshrc
    echo "zshrc reloaded !!!"
}

# Command aliases
alias s='sudo'
alias ll='ls -l'
alias lal='ls -la'
alias lart='ls -lart'
alias l1='ls -1'
alias l.='ls -laghFG'
alias ps='ps -aux'
alias psg="ps -aux | grep -v grep | grep $1"
alias ns='sudo netstat -lnt'
alias nsg="sudo netstat -lnt | grep -v grep | grep $1"
alias ..='cd ..'

# Git
alias gl='git log'
alias gco='git checkout'
alias gin='git init'
alias gs='git status'
alias gdif='git diff'
alias gdifs='git diff --staged'
alias gb='git branch'
alias gm='git merge'
alias gshow='git show'
alias gad='git add'
alias grem='git remote'
alias grm='git rm'
alias gcl='git clone'
alias gc='git commit'
alias gg='gitk --all'
alias gpl='git pull'
alias gpu='git push'
alias gpr='git pull --rebase'
alias gppu='git pull --rebase && git push'
alias gst='git stash'
alias gstp='git stash pop'

# Docker
alias d='sudo docker'
alias dr='sudo docker run'
alias di='sudo docker images'
alias dps='sudo docker ps -a'
alias da='sudo docker attach'
alias dst='sudo docker stats'
alias ds='sudo docker start'

# Vagrant
alias vgs='vagrant global-status'
alias vu='vagrant up'
alias vh='vagrant halt'
alias vsh='vagrant ssh'

# MAC Programs
alias bu='brew update'
alias bi="brew install $1"
alias bci="brew cask install $1"
alias xcode='open -a xcode'
alias text='open -a TextEdit'
alias notes='open -a Notes'
alias atom='open -a Atom'
# Finder: show hiddeh files
defaults write com.apple.finder AppleShowAllFiles TRUE

# Troubleshooting
alias logs="sudo find /var/log/ -type f | xargs sudo ls -Slh | grep -E '.log$|.bz2$' | head"
