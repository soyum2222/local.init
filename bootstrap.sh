#/bin/bash

WORKPATH=$(pwd)

# vim 
if [ -f "$HOME/.vimrc" ];then
	mv $HOME/.vimrc $HOME/.vimrc.backup
	echo ":source $WORKPATH/vim.init" >> $HOME/.vimrc 
else
	echo ":source $WORKPATH/vim.init" >> $HOME/.vimrc 
fi

if [ -f "~/.vim/autoload/plug.vim" ]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# zsh
sudo apt install zsh
chsh -s /bin/zsh

if [! -d "$HOME/.oh-my-zsh" ];then
	git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi
cp .zshrc ~


# zlua
sudo apt install lua5.3

if [! -d "/opt/z.lua" ];then
	sudo git clone https://github.com/skywind3000/z.lua /opt/z.lua
fi

