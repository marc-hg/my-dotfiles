#!/bin/bash
set -e # Exit with nonzero exit code if anything fails
BASE_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; cd .. ;  pwd -P )"
[[ $1 = --yes ]] && yes_mode=1
want_act() {
    [[ $yes_mode = 1 ]] && return 0
    read -r -p "'$1' (y/n)? " answer
    [[ $answer = [Yy]* ]] && return 0
    return 1
}


echo 'Welcome to my common programs installer!'
echo 'This ONLY works for systems that use the "apt" package manager. So debian and ubuntu'
echo 'If you are not on a debian or ubuntu system, you will need to install programs manually'
if ! want_act 'I confirm that I am INDEED using ubuntu or debian' ; then
    echo 'Exiting...'
    exit 0
fi

echo 'Checking new packages in the system repositories...'
sudo apt update

# Install wget, curl, git and unzip if not installed
if ! command -v wget >/dev/null 2>&1; then
    echo "Installing wget"
    sudo apt install wget -y
fi
if ! command -v curl >/dev/null 2>&1; then
    echo "Installing curl"
    sudo apt install curl -y
fi
if ! command -v git >/dev/null 2>&1; then
    echo "Installing git"
    sudo apt install git -y
fi
if ! command -v unzip >/dev/null 2>&1; then
    echo "Installing unzip"
    sudo apt install unzip -y
fi


# Install ranger if not installed
if ! command -v ranger >/dev/null 2>&1; then
    echo "Ranger is not installed..."
    # Do you want to install ranger?
    if want_act "Do you want to install ranger?"; then
        echo "Installing ranger..."
        sudo apt install ranger -y
        echo "Done"
    fi
fi

# Install ripgrep if not installed
if ! command -v ripgrep >/dev/null 2>&1; then
    echo "ripgrep is not installed. This is needed for neovim telescope"
    if want_act "Do you want to install ripgrep?"; then
        echo "Installing ripgrep..."
        sudo apt install ripgrep -y
        echo "Done"
    fi
fi


# Install fnm if not installed
if ! command -v fnm >/dev/null 2>&1; then
    echo "fnm is not installed..."
    # Do you want to install fnm?
    if want_act "Do you want to install fnm?"; then
        echo "Installing fnm..."
        curl -fsSL https://fnm.vercel.app/install | bash
        echo "Done"
    fi
fi

# Install cargo if not installed
if ! command -v cargo >/dev/null 2>&1; then
    echo "cargo is not installed..."
    # Do you want to install cargo?
    if want_act "Do you want to install cargo?"; then
        echo "Installing cargo..."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
        echo "Done"
    fi
fi

# Install zsh if not installed
if ! command -v zsh >/dev/null 2>&1; then
    echo "zsh is not installed..."
    # Do you want to install zsh?
    if want_act "Do you want to install zsh?"; then
        echo "Installing zsh..."
        sudo apt install zsh -y
        chsh -s $(which zsh)
        echo "Done"
    fi
fi

# Install docker if not installed
if ! command -v docker >/dev/null 2>&1; then
    echo "docker is not installed..."
    # Do you want to install docker?
    echo "Do you want to install docker?"
    read -r -p "'$1' (y/n)? " answer
    if [[ $answer = [Yy]* ]]; then
        echo "Installing docker..."
        curl -fsSL https://get.docker.com | sh
        sudo usermod -aG docker $USER
        newgrp docker 
        echo "Done"
    fi
fi

# Install ncdu if not installed
if ! command -v ncdu >/dev/null 2>&1; then
    echo "ncdu is not installed..."
    # Do you want to install ncdu?
    if want_act "Do you want to install ncdu?"; then
        echo "Installing ncdu..."
        sudo apt install ncdu -y
        echo "Done"
    fi
fi

# Install fzf if not installed
if ! command -v fzf >/dev/null 2>&1; then
    echo "fzf is not installed..."
    # Do you want to install fzf?
    if want_act "Do you want to install fzf?"; then
        echo "Installing fzf..."
        sudo apt install fzf -y
        echo "Done"
    fi
fi

# Install neovim if not installed
if ! command -v nvim >/dev/null 2>&1; then
    echo "neovim is not installed..."
    # Do you want to install neovim?
    if want_act "Do you want to install neovim?"; then
        echo "Installing neovim..."
        bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/rolling/utils/installer/install-neovim-from-release)
        echo "Done"
    fi
fi

# Install zoxide if not installed
if ! command -v zoxide >/dev/null 2>&1; then
    echo "zoxide is not installed..."
    # Do you want to install zoxide?
    if want_act "Do you want to install zoxide?"; then
        echo "Installing zoxide..."
        curl -sS https://webinstall.dev/zoxide | bash
        echo "Done"
    fi
fi

# install lvim if not installed
if ! command -v lvim >/dev/null 2>&1; then
    echo "lvim is not installed..."
    # Do you want to install lvim?
    if want_act "Do you want to install lvim?"; then
        echo "Installing lvim..."
        LV_BRANCH=rolling bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh)
        echo "Done"
    fi
fi

# Install lazygit if not installed
if ! command -v lazygit >/dev/null 2>&1; then
    echo "lazygit is not installed..."
    # Do you want to install lazygit?
    if want_act "Do you want to install lazygit?"; then
        echo "Installing lazygit..."
        LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-35.]+')
        curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
        judo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
        rm -rf ./lazygit.tar.gz
        echo "Done"
    fi
fi
