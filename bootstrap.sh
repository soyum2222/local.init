#/bin/bash

WORKPATH=$(pwd)
OHMYZSH_HOME=$HOME/.oh-my-zsh
# vim 
if [ -f "$HOME/.vimrc" ];then
	mv $HOME/.vimrc $HOME/.vimrc.backup
	echo ":source $WORKPATH/vim.init" >> $HOME/.vimrc 
else
	echo ":source $WORKPATH/vim.init" >> $HOME/.vimrc 
fi

if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# zsh
sudo apt install zsh
chsh -s /bin/zsh

if [ ! -d "$OHMYZSH_HOME" ];then
	git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
fi

if [ -f "$HOME/.zshrc" ];then
	mv $HOME/.zshrc $HOME/.zshrc.backup
	echo "source $WORKPATH/.zshrc" >> $HOME/.zshrc 
else
	echo "source $WORKPATH/.zshrc" >> $HOME/.zshrc 
fi


# zsh plug
if [ ! -d "$OHMYZSH_HOME/plugins/zsh-autosuggestions" ]; then
	git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions $OHMYZSH_HOME/plugins/zsh-autosuggestions
fi


# zlua
sudo apt install lua5.3

if [ ! -d "/opt/z.lua" ];then
	sudo git clone https://github.com/skywind3000/z.lua /opt/z.lua
fi

