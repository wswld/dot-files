case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

force_color_prompt=yes

export CLICOLOR=1
export EDITOR=vim

alias ll='ls -alF'
alias restart_networking='sudo ifconfig en0 down && sudo ifconfig en0 up'
alias t='tree'
PS1='$(context-color -c "whoami")$(whoami)\e[0m\]@$(context-color -c "hostname")$(hostname)\e[0m\]:$(context-color -c "hostname")$(pwd)\e[0m\]$(if git rev-parse --git-dir > /dev/null 2>&1; then echo " - ["; fi)$(git branch 2>/dev/null | grep "^*" | colrm 1 2)$(if git rev-parse --git-dir > /dev/null 2>&1; then echo "]"; fi)\[\033[0m\033[0;32m\]\[\033[0m\033[0;32m\]\[\033[0m\]\n> '
