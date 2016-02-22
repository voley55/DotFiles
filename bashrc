#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias ss='sudo systemctl'
alias sj='sudo journalctl -f'
alias pac='sudo pacman -S'
alias pacy='sudo pacman -Syu'
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
alias ds='sudo docker stats'

