#/bin/bash
apt install -y zsh
chsh -s /bin/zsh

if [ ! -d "$OHMYZSH_HOME" ];then
	git clone --depth=1 $GITHUB_URL/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
fi

if [ -f "$HOME/.zshrc" ];then
	mv $HOME/.zshrc $HOME/.zshrc.backup
	echo "source $WORKPATH/.zshrc" >> $HOME/.zshrc 
else
	echo "source $WORKPATH/.zshrc" >> $HOME/.zshrc 
fi

# zsh plug
if [ ! -d "$OHMYZSH_HOME/plugins/zsh-autosuggestions" ]; then
	git clone --depth=1 $GITHUB_URL/zsh-users/zsh-autosuggestions.git $OHMYZSH_HOME/plugins/zsh-autosuggestions
fi



