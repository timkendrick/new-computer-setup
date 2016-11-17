set -e

echo "Setting Bash configuration..."
cp ./dotfiles/.inputrc ~/.inputrc

echo "Setting Git configuration..."
cp ./dotfiles/.gitignore  ~/.gitignore
git config --global core.excludesfile ~/.gitignore
git config --global credential.helper osxkeychain

echo "Setting npm configuration..."
npm config set init-author-name Tim Kendrick
npm config set init-author-email timkendrick@gmail.com
npm config set init-version 0.0.1
