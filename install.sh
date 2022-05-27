#!/bin/sh

# Exit inmediately if any command fails
set -e

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
ZSH_CUSTOM=~/.oh-my-zsh/custom

# Install zsh and some dependencies
apk update
apk add git curl nano vim zsh

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Move old zshrc and set symbolic link with the other one
mkdir ~/.your-old-zshrcs && mv ~/.zshrc ~/.your-old-zshrcs/.zshrc-$(date +"%FT%H%M")
ln -s $SCRIPT_DIR/.zshrc ~/.zshrc 
zsh
