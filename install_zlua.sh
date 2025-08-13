#!/bin/bash
# zlua
sudo apt install -y lua5.3


GITHUB_URL=https://github.com

if [ ! -d "/opt/z.lua" ];then
	sudo git clone --depth=1 $GITHUB_URL/skywind3000/z.lua.git /opt/z.lua
fi

