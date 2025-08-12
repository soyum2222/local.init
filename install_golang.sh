#!/bin/bash

type go > /dev/null
if [ $? -ne 0 ] ;then


	sudo apt-get install -y jq

	#!/bin/bash

	# 获取Go版本信息
	GO_VERSIONS=$(curl -s https://go.dev/dl/?mode=json)
	
	# 解析最新稳定版本
	LATEST_VERSION=$(echo "$GO_VERSIONS" | jq -r '.[0].version')
	
	# 检查是否成功获取版本号
	if [ -z "$LATEST_VERSION" ]; then
	    echo "无法获取最新Go版本号。"
	    exit 1
	fi
	
	# 构造下载链接
	DOWNLOAD_URL="https://go.dev/dl/${LATEST_VERSION}.linux-amd64.tar.gz"
	
	echo "正在下载 Go ${LATEST_VERSION} for Linux AMD64..."
	
	# 下载文件
	wget "$DOWNLOAD_URL" -O go.tar.gz
	
	if [ $? -eq 0 ]; then
	    echo "Go ${LATEST_VERSION} 下载成功！"
	else
	    echo "Go ${LATEST_VERSION} 下载失败。"
	    exit 1
	fi

	# 解压文件
	tar -xzf go.tar.gz -C /usr/local
	rm go.tar.gz
	
	# 添加环境变量
	echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.zshrc
	
fi
