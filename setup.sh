set -e

cd $(dirname $0)

read -p "Apple ID email: " APPLE_ID_EMAIL
read -sp "Apple ID password: " APPLE_ID_PASSWORD
echo ""

if [ -e ~/.ssh/id_rsa ]; then
  echo "SSH key already exists"
else
  read -p "SSH key identifier ($APPLE_ID_EMAIL): " SSH_COMMENT
  SSH_COMMENT=${SSH_COMMENT:-$APPLE_ID_EMAIL}
  read -sp "SSH key passphrase (blank): " SSH_PASSPHRASE

  echo "Generating SSH key..."
  mkdir -p ~/.ssh
  ssh-keygen -t rsa -C "$SSH_EMAIL" -P "$SSH_PASSPHRASE" -f ~/.ssh/id_rsa
fi

echo "Installing software updates..."
softwareupdate --install --recommended

if [ "$(xcode-select --print-path)" ]
then
  echo "OS X command-line tools already installed"
else
  echo "Installing OS X command-line tools..."
  xcode-select –-install
fi

echo "Installing Homebrew apps..."
source ./brew.sh

mas account >/dev/null || {
  echo "Signing into App Store..."
  mas signin "$APPLE_ID_EMAIL" "$APPLE_ID_PASSWORD"
}

echo "Installing App Store apps..."
source ./appstore.sh

echo "Installing npm packages..."
source ./Packages/npm.sh

echo "Installing Atom packages..."
source ./Packages/apm.sh

echo "Installing AppleScript apps..."
source ./applications.sh

echo "Installing services..."
source ./services.sh

echo "Installing application support files..."
source ./application-support.sh

echo "Setting atom configuration..."
source ./atom.sh

echo "Copying dotfiles..."
source ./dotfiles.sh

echo "Setting system preferences..."
source ./preferences.sh

echo "Installing standalone apps..."
source ./standalone.sh

echo "Restarting..."
shutdown -r now
