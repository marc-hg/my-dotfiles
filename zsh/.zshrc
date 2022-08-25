export ZDOTDIR=$HOME/.config/zsh

# Install ranger if not installed
if ! command -v ranger >/dev/null 2>&1; then
    echo "Installing ranger"
    sudo apt install -y ranger
fi

# Install fnm if not installed
if ! command -v fnm >/dev/null 2>&1; then
    echo "Installing fnm"
    curl -fsSL https://fnm.vercel.app/install | bash
fi

echo "Running once!"
source "$HOME/.config/zsh/.zshrc"
