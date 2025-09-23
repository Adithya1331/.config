#!/usr/bin/env bash

sudo apt -y update
sudo apt -y install git ripgrep xclip jq tldr python3-pip build-essential

git clone https://github.com/junegunn/fzf.git $HOME/personal/fzf
$HOME/personal/fzf/install
