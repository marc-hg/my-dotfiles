export ZDOTDIR=$HOME/.config/zsh
# Update dotfiles
git -C ~/my-dotfiles pull

echo "Running once!"
source "$HOME/.config/zsh/.zshrc"
