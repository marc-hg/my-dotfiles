#!/bin/bash
echo 'Welcome to my common programs installer!'

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
        sudo apt install docker.io -y
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
