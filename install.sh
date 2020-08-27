#!/usr/bin/env bash

if ! [ -f .email ]; then
    read -p 'Email: ' email
    echo $email > .email
else
    email=$( cat .email )
    echo $email
fi

if hash apt-get 2>/dev/null; then
    sudo apt-get install bash-completion
    sudo apt-get install tree
    sudo apt-get install rg
elif hash brew 2>/dev/null; then
    brew install bash-completion
    brew install tree
    brew install rg
fi

rm ~/.bash_profile ~/.bashrc ~/.vimrc ~/.gitignore_global ~/.gitconfig \
~/.inputrc

sed "s/@@@/$email/g" .gitconfig_template > .gitconfig

curl https://raw.githubusercontent.com/wswld/context-color/master/context-color > context-color
chmod 744 context-color

mkdir ~/bin
ln -s `pwd`/context-color ~/bin/context-color
ln -s `pwd`/dotfiles ~/bin/dotfiles

ln -s `pwd`/.bashrc ~/.bashrc
ln -s ~/.bashrc ~/.bash_profile
ln -s `pwd`/.vimrc ~/.vimrc
ln -s `pwd`/.gitignore_global ~/.gitignore_global
ln -s `pwd`/.gitconfig ~/.gitconfig
ln -s `pwd`/.inputrc ~/.inputrc
