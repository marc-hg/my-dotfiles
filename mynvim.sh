#!/bin/bash
set -e

wget https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.deb
sudo apt install ./nvim-linux64.deb
export PATH=$PATH:~/.local/bin
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)