#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

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

