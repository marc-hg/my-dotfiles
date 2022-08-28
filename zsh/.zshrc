export ZDOTDIR=$HOME/.config/zsh
# Update dotfiles
git -C ~/my-dotfiles pull

echo "Running once!"
source "$HOME/.config/zsh/.zshrc"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

