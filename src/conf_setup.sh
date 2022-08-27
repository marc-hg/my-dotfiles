#!/bin/bash
set -e # Exit with nonzero exit code if anything fails
SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; cd .. ;  pwd -P )"
CURRENT_PATH="$(pwd)"
[[ $1 = --yes ]] && yes_mode=1
want_act() {
    [[ $yes_mode = 1 ]] && return 0
    read -r -p "'$1' (y/n)? " answer
    [[ $answer = [Yy]* ]] && return 0
    return 1
}
echo $SCRIPT_PATH

# Check if stow is installed
if ! command -v stow >/dev/null 2>&1; then
    echo "USER ERROR: stow is not installed..."
    echo "Install stow and then run this script again. Example sudo apt install stow -y"
    exit 1
fi

echo 'Welcome to my configuration installer'
echo 'This will set up symlinks from the conf files in this repo to your host machine so you get the settings from this repo and can update them from here with a simple git pull'

cd $SCRIPT_PATH
if want_act "Set up conf for zsh?"; then
    echo "Setting up conf for zsh..."
    stow zsh
    echo "Done"
fi

if want_act "Set up conf for ranger?"; then
    echo "Setting up conf for ranger..."
    stow ranger
    echo "Done"
fi
cd $CURRENT_PATH