#!/usr/bin/bash

wget https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.deb
sudo apt install ./nvim-linux64.deb
git clone https://github.com/LunarVim/nvim-basic-ide.git ~/.config/nvim