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

# Install z if not installed
if ! command -v z >/dev/null 2>&1; then
    echo "Installing z"
    git clone https://github.com/rupa/z/ ~/tmp/z
    chmod +x ~/tmp/z/z.sh
    mv ~/tmp/z/z.sh /usr/local/bin/
    mv ~/tmp/z/z.1 /usr/local/share/man/man1
    rm -rf ~/tmp/z
fi

echo "Running once!"
source "$HOME/.config/zsh/.zshrc"
