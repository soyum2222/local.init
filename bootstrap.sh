#/bin/bash

WORKPATH=$(pwd)
OHMYZSH_HOME=$HOME/.oh-my-zsh


GITHUB_URL="https://hub.fastgit.xyz"

echo "did you want use github proxy by 'https://hub.fastgit.xyz' ? (y/n)"
read -n 1 -p "input: " input
if [ "$input" == "y" ]; then
	GITHUB_URL="https://hub.fastgit.xyz"
else
	GITHUB_URL="https://github.com"
fi

type nvim > /dev/null
if [ $? -ne 0 ] ;then 
	apt  remove vim
	add-apt-repository ppa:neovim-ppa/unstable
	apt update
	apt install -y neovim
fi

# vim 
VIMINIT_PATH=$HOME/.config/nvim
VIMINIT_FILE=init.vim
if [ -f "$VIMINIT_PATH/$VIMINIT_FILE" ];then
	mv $VIMINIT_PATH/$VIMINIT_FILE $VIMINIT_PATH/$VIMINIT_FILE.backup
	echo ":source $WORKPATH/init.vim" >> $VIMINIT_PATH/$VIMINIT_FILE 
else
	mkdir -p $VIMINIT_PATH
	echo ":source $WORKPATH/init.vim" >> $VIMINIT_PATH/$VIMINIT_FILE 
fi

# vim-plug
PLUG_PATH=${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload
PLUG_FILE=plug.vim
if [ ! -f "$PLUG_PATH/$PLUG_FILE" ]; then
	mkdir -p $PLUG_PATH
	cp $WORKPATH/plug.vim $PLUG_PATH/$PLUG_FILE
fi

# zsh
apt install -y zsh
chsh -s /bin/zsh

if [ ! -d "$OHMYZSH_HOME" ];then
	git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
fi

if [ -f "$HOME/.zshrc" ];then
	mv $HOME/.zshrc $HOME/.zshrc.backup
	echo "source $WORKPATH/.zshrc" >> $HOME/.zshrc 
else
	echo "source $WORKPATH/.zshrc" >> $HOME/.zshrc 
fi

# zsh plug
if [ ! -d "$OHMYZSH_HOME/plugins/zsh-autosuggestions" ]; then
	git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git $OHMYZSH_HOME/plugins/zsh-autosuggestions
fi

# exoprt

# zlua
apt install -y lua5.3

if [ ! -d "/opt/z.lua" ];then
	git clone --depth=1 https://github.com/skywind3000/z.lua.git /opt/z.lua
fi

# tmux
if [ ! -d "/etc/tmux.conf" ];then
	cp $WORKPATH/tmux.conf /etc/tmux.conf
else
	cat $WORKPATH/tmux.conf >> /etc/tmux.conf 
fi

echo "did you want download golang ? (y/n)"
read -n 1 -p "input: " input
if [ "$input" == "y" ]; then
	apt install -y golang
	# download golang
	if [ ! -d "/opt/go" ];then
		wget https://studygolang.com/dl/golang/go1.17.5.linux-amd64.tar.gz -O /opt/golang.gz
		tar -zxvf golang.gz -C /opt
	fi
fi

