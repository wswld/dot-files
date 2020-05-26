case $- in
    *i*) ;;
      *) return;;
esac

if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/bin"
fi

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

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
PS1='$(context-color)$(whoami)\e[0m\]@$(context-color)$(hostname)\e[0m\]:\e[0m\]$(pwd)$(context-color -c "hostname; date +%V")$(if git rev-parse --git-dir > /dev/null 2>&1; then echo " - ["; fi)$(git branch 2>/dev/null | grep "^*" | colrm 1 2)$(if git rev-parse --git-dir > /dev/null 2>&1; then echo "]"; fi)\[\033[0m\033[0;32m\]\[\033[0m\033[0;32m\]\[\033[0m\]\n> '
