set -e

if [ $(which brew) ]; then
  echo "Homebrew already installed"
else
  echo "Downloading and installing Homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing Cask..."
brew tap caskroom/cask

echo "Installing Homebrew packages..."
source ./Packages/brew.sh
