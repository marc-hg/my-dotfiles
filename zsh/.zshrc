export ZDOTDIR=$HOME/.config/zsh

# Update dotfiles
git -C ~/my-dotfiles pull


# Install z if not installed
# if ! command -v z >/dev/null 2>&1; then
#     echo "Installing z"
#     git clone https://github.com/rupa/z/ ~/tmp/z
#     chmod +x ~/tmp/z/z.sh
#     sudo mv ~/tmp/z/z.sh /usr/local/bin/
#     sudo mv ~/tmp/z/z.1 /usr/local/share/man/man1
#     rm -rf ~/tmp/z
# fi

echo "Running once!"
source "$HOME/.config/zsh/.zshrc"
# source ~/powerlevel10k/powerlevel10k.zsh-theme
