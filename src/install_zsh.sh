#!/bin/bash

# Exit inmediately if any command fails
set -e

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
ZSH_CUSTOM=~/.oh-my-zsh/custom
DATE=$(date +"%FT%H%M")

# Install zsh
sudo apt install zsh -y
chsh -s $(which zsh)

# Install oh my zsh
if [ -d ~/.oh-my-zsh ]
then
  echo The $ZSH folder already exists, cloning into ~/.your-old-oh-my-zsh-${DATE}...
  mkdir ~/.your-old-oh-my-zsh-${DATE}
  mv ~/.oh-my-zsh ~/.your-old-oh-my-zsh-${DATE}
fi
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Move old zshrc and set symbolic link with the other one
mv ~/.zshrc ~/.your-old-zshrc-${DATE}
ln -s $SCRIPT_DIR/.zshrc ~/.zshrc 
