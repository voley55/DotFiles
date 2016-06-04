#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias ss='sudo systemctl'
alias sj='sudo journalctl -f'
alias pac='sudo pacman -Sy'
alias pacy='sudo pacman -Syyu'
#git shortcuts
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
alias gpl='git pull'
alias gpu='git push'
alias grm='git rm'
alias gcl='git clone'
alias gc='git commit'
alias gg='gitg --all'
alias s='sudo'

#docker shortcuts
alias dr='sudo docker run'
alias di='sudo docker images'
alias dps='sudo docker ps -a'
alias da='sudo docker attach'
alias d='sudo docker'
alias dst='sudo docker stats'
alias ds='sudo docker start'

#python virtualenv
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh
alias mkv2='mkvirtualenv -p /usr/bin/python2.7'
alias mkv3='mkvirtualenv -p /usr/bin/python3.5'
alias wrk='workon'

#python pip
alias spi='sudo pip install'
alias spiu='sudo pip install --upgrade'
#Set JAVA Path for saiku server
export JAVA_HOME="/usr/lib/jvm/default"
