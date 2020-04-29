if ! [ -f .gitconfig ]; then
    read -p 'Email: ' email
    sed "s/@@@/$email/g" .gitconfig_template > .gitconfig
fi

rm ~/.bash_profile ~/.bashrc ~/.vimrc ~/.gitignore_global ~/.gitconfig \
~/.inputrc

ln -s `pwd`/.bashrc ~/.bashrc
ln -s ~/.bashrc ~/.bash_profile
ln -s `pwd`/.vimrc ~/.vimrc
ln -s `pwd`/.gitignore_global ~/.gitignore_global
ln -s `pwd`/.gitconfig ~/.gitconfig
ln -s `pwd`/.inputrc ~/.inputrc