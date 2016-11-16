set -e

cd $(dirname $0)

read -p "Apple ID email: " APPLE_ID_EMAIL
read -sp "Apple ID password: " APPLE_ID_PASSWORD

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

echo "Installing OS X command-line tools..."
xcode-select –install

echo "Installing Homebrew..."
source ./brew.sh

echo "Installing App Store apps..."
source ./appstore.sh

echo "Installing npm packages..."
source ./Packages/npm.sh

echo "Installing Atom packages..."
source ./Packages/apm.sh

echo "Installing AppleScript apps..."
source ./applications.sh

echo "Copying bundled services..."
cp -r ./Services/* ~/Library/Services/

echo "Copying application support files..."
cp -r ./Application\ Support/* ~/Library/Application\ Support/

echo "Setting atom configuration..."
source ./atom.sh

echo "Copying dotfiles..."
source ./dotfiles.sh

echo "Creating Sites directory..."
mkdir ~/Sites

echo "Setting system preferences..."
source ./Preferences/system.sh
source ./Preferences/Finder.sh
source ./Preferences/Terminal.sh
source ./Preferences/TextEdit.sh
source ./Preferences/Safari.sh
source ./Preferences/Seil.s
source ./Preferences/Karabiner.sh

echo "Reloading preferences..."
killall cfprefsd
for process in "SystemUIServer" "Finder"; do
	killall "${process}" > /dev/null 2>&1
done

echo "Creating standalone apps..."
npm install -g nativefier
mkdir -p .tmp/Applications/Google\ Docs
nativefier --name "Google Docs" --icon ./Icons/Google\ Docs.icns https://docs.google.com/ ./.tmp/Applications/Google\ Docs
cp -r "$(find .tmp/Applications/Google\ Docs -name "Google Docs.app")" /Applications/
npm uninstall -g nativefier

echo "Removing temporary files..."
rm -rf .tmp

echo "Restarting..."
shutdown -r now
