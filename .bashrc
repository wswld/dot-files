case $- in
    *i*) ;;
      *) return;;
esac

if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/bin"
fi

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

HISTCONTROL=ignoreboth


export PATH=/usr/local/opt/python/libexec/bin:$PATH

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

force_color_prompt=yes

export CLICOLOR=1
export EDITOR=vim

# remove the annoying zsh warning on Mac
export BASH_SILENCE_DEPRECATION_WARNING=1

if [[ -f "/etc/salt/minion_id" ]]; then
    echo 'minion_id file found - using '$h' instead of hostname'
    h=$( cat /etc/salt/minion_id )
else
    h=$( hostname )
fi

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

echo "$(context-color)░░░▓▓▓ $(context-color --force 255)dotfiles $(context-color --context 'hostname; date +%U')$(dotfiles version)$(context-color --force 255)"

pdfcompress ()
{
   gs -q -dNOPAUSE -dBATCH -dSAFER -sDEVICE=pdfwrite -dCompatibilityLevel=1.3 -dPDFSETTINGS=/screen -dEmbedAllFonts=true -dSubsetFonts=true -dColorImageDownsampleType=/Bicubic -dColorImageResolution=144 -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=144 -dMonoImageDownsampleType=/Bicubic -dMonoImageResolution=144 -sOutputFile=$1.compressed.pdf $1; 
}

export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"


alias ll='ls -alF'
alias rc='source ~/.bashrc'
alias restart_networking='sudo ifconfig en0 down && sudo ifconfig en0 up'
alias t='tree'
PS1='$(context-color)$(whoami)\e[0m\]@$(context-color)$( echo $h )\e[0m\]:\e[0m\]$(pwd)$(context-color -c "git branch 2>/dev/null | grep "^*" | colrm 1 2")$(if git rev-parse --git-dir > /dev/null 2>&1; then echo " - ["; fi)$(git branch 2>/dev/null | grep "^*" | colrm 1 2)$(if git rev-parse --git-dir > /dev/null 2>&1; then echo "]"; fi)\[\033[0m\033[0;32m\]\[\033[0m\033[0;32m\]\[\033[0m\]\n> '
