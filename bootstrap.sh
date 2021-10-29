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
	mkdir -p ~/.vim/autoload/
	cp $WORKPATH/plug.vim ~/.vim/autoload/plug.vim
fi

# zsh
sudo apt install zsh
chsh -s /bin/zsh

if [ ! -d "$OHMYZSH_HOME" ];then
	git clone --depth=1 git@github.com:ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
fi

if [ -f "$HOME/.zshrc" ];then
	mv $HOME/.zshrc $HOME/.zshrc.backup
	echo "source $WORKPATH/.zshrc" >> $HOME/.zshrc 
else
	echo "source $WORKPATH/.zshrc" >> $HOME/.zshrc 
fi

# zsh plug
if [ ! -d "$OHMYZSH_HOME/plugins/zsh-autosuggestions" ]; then
	git clone --depth=1 git@github.com:zsh-users/zsh-autosuggestions.git $OHMYZSH_HOME/plugins/zsh-autosuggestions
fi

# exoprt

# zlua
sudo apt install lua5.3

if [ ! -d "/opt/z.lua" ];then
	sudo git clone --depth=1 git@github.com:skywind3000/z.lua.git /opt/z.lua
fi

# tmux
if [ ! -d "/etc/tmux.conf" ];then
	cp $WORKPATH/tmux.conf /etc/tmux.conf
else
	cat $WORKPATH/tmux.conf >> /etc/tmux.conf 
fi

# download golang
if [ ! -d "/opt/go" ];then
	sudo wget https://studygolang.com/dl/golang/go1.17.2.linux-amd64.tar.gz -o /opt/golang.gz
	tar -zxvf golang.gz -C /opt
fi
