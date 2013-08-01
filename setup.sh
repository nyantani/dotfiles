#!/usr/bin/env bash
echo "setup.sh for $HOME"

ln -fs "$PWD/.bashrc"       ~/.bashrc
ln -fs "$PWD/.zshrc"       ~/.zshrc

ln -fs "$PWD/.vimrc"        ~/.vimrc
ln -fs "$PWD/.tmux.conf"    ~/.tmux.conf
ln -fs "$PWD/.gitconfig"    ~/.gitconfig

git submodule init && git submodule update

mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

echo "done."

