#!/bin/bash
echo "do you want install neovim ? (y/n)"
read -n 1 -p "input: " input
if [ "$input" == "y" ]; then
	type nvim > /dev/null
	if [ $? -ne 0 ] ;then 
		add-apt-repository ppa:neovim-ppa/unstable
		apt update
		apt install -y neovim
	fi

	wget https://github.com/microsoft/vscode-cpptools/releases/download/v1.20.5/cpptools-linux.vsix
	unzip cpptools-linux.vsix 
	mv extension /opt/nvim-cpptools
	rm cpptools-linux.vsix

fi

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

