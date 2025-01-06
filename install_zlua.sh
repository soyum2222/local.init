#/bin/bash
# zlua
apt install -y lua5.3

if [ ! -d "/opt/z.lua" ];then
	git clone --depth=1 $GITHUB_URL/skywind3000/z.lua.git /opt/z.lua
fi

