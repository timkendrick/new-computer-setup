set -e

echo "Downloading and installing Homebrew..."
command -v brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing Cask..."
brew tap caskroom/cask

echo "Installing Homebrew packages..."
source ./Packages/brew.sh
