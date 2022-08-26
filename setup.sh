#!/bin/bash
echo 'Welcome to my common programs installer!'
echo 'Before installing anything we need wget, curl and git'

sudo apt update

# Install wget, curl and git if not installed
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


# Install ranger if not installed
if ! command -v ranger >/dev/null 2>&1; then
    echo "Ranger is not installed..."
    # Do you want to install ranger?
    read -p "Do you want to install ranger? [y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo apt install ranger -y
    fi
fi

# Install fnm if not installed
if ! command -v fnm >/dev/null 2>&1; then
    echo "fnm is not installed..."
    # Do you want to install fnm?
    read -p "Do you want to install fnm? [y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        curl -fsSL https://fnm.vercel.app/install | bash
    fi
fi

# Install cargo if not installed
if ! command -v cargo >/dev/null 2>&1; then
    echo "cargo is not installed..."
    # Do you want to install cargo?
    read -p "Do you want to install cargo? [y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    fi
fi

# Install docker if not installed
if ! command -v docker >/dev/null 2>&1; then
    echo "docker is not installed..."
    # Do you want to install docker?
    read -p "Do you want to install docker? [y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        bash src/install_docker.sh
    fi
fi

# install nvim if not installed
if ! command -v nvim >/dev/null 2>&1; then
    echo "nvim is not installed..."
    # Do you want to install nvim?
    read -p "Do you want to install nvim? [y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        bash src/install_nvim.sh
    fi
fi

# Install zsh if not installed
if ! command -v zsh >/dev/null 2>&1; then
    echo "zsh is not installed..."
    # Do you want to install zsh?
    read -p "Do you want to install zsh? [y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo apt install zsh -y
    fi
fi

# Install z if not installed
if ! command -v z >/dev/null 2>&1; then
    echo "z is not installed..."
    # Do you want to install z?
    read -p "Do you want to install z? [y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O ~/z.sh
    fi
fi
