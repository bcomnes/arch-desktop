#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

## Default RC Above ^^ Custom below vv

# Colored PS1
#PS1='[\u@\h \W]\$ '  # To leave the default one
#DO NOT USE RAW ESCAPES, USE TPUT
reset=$(tput sgr0)
red=$(tput setaf 1)
blue=$(tput setaf 4)
green=$(tput setaf 2)

PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '

# Colored man page
man() {
   env LESS_TERMCAP_mb=$'\E[01;31m' \
   LESS_TERMCAP_md=$'\E[01;38;5;74m' \
   LESS_TERMCAP_me=$'\E[0m' \
   LESS_TERMCAP_se=$'\E[0m' \
   LESS_TERMCAP_so=$'\E[38;5;246m' \
   LESS_TERMCAP_ue=$'\E[0m' \
   LESS_TERMCAP_us=$'\E[04;38;5;146m' \
   man "$@"
}

# path ammends
export PATH=~/.gem/ruby/2.2.0/bin:$PATH
export PATH=~/npm-global/bin:$PATH
export PATH=~/bin:$PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Editors
export EDITOR='vim'
#export VISUAL='subl3'
export GIT_EDITOR='vim'

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

alias open='gnome-open'
alias subl='subl3'
alias pbcopy='xclip'

