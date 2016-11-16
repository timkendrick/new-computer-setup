set -e

echo "Setting Bash configuration..."
cp ./dotfiles/.inputrc ~/.inputrc

echo "Setting Git configuration..."
cp ./dotfiles/.gitignore  ~/.gitignore
git config --global core.excludesfile ~/.gitignore
git config --global credential.helper osxkeychain
