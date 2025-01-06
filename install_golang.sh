#/bin/bash

type go > /dev/null
if [ $? -ne 0 ] ;then
  add-apt-repository ppa:longsleep/golang-backports
  apt-get update
  apt-get install golang
fi
