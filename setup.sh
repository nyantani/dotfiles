#!/usr/bin/env bash
echo "setup.sh for $HOME"

ln -fs "$PWD/.bashrc"       ~/.bashrc
ln -fs "$PWD/.zshrc"       ~/.zshrc

ln -fs "$PWD/.vimrc"        ~/.vimrc
ln -fs "$PWD/.tmux.conf"    ~/.tmux.conf

git submodule init && git submodule update

mkdir -p ~/.vim/bundle
ln -fs "$PWD/vundle" ~/.vim/bundle/vundle

echo "done."

