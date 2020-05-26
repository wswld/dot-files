if ! [ -f .gitconfig ]; then
    read -p 'Email: ' email
    sed "s/@@@/$email/g" .gitconfig_template > .gitconfig
fi

rm ~/.bash_profile ~/.bashrc ~/.vimrc ~/.gitignore_global ~/.gitconfig \
~/.inputrc

curl https://raw.githubusercontent.com/wswld/context-color/master/context-color > context-color
chmod 775 context-color

mkdir ~/bin
ln -s `pwd`/context-color ~/bin/context-color

ln -s `pwd`/.bashrc ~/.bashrc
ln -s ~/.bashrc ~/.bash_profile
ln -s `pwd`/.vimrc ~/.vimrc
ln -s `pwd`/.gitignore_global ~/.gitignore_global
ln -s `pwd`/.gitconfig ~/.gitconfig
ln -s `pwd`/.inputrc ~/.inputrc

source ~/.bashrc