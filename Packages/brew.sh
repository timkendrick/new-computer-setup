set -e

REQUIRED_PACKAGES=(
  node
  mas
)

REQUIRED_CASK_PACKAGES=(
  google-chrome
  google-drive
  dropbox
  betterzip
  the-unarchiver
  namechanger
  atom
  sketch
  tower
  spotify
  macdown
  spectacle
  karabiner
  seil
  zeplin
  qlcolorcode
  qlmarkdown
  qlstephen
  quicklook-csv
  betterzipql
  suspicious-package
)

INSTALLED_PACKAGES=$(brew ls | tr '\n' ' ')
INSTALLED_CASK_PACKAGES=$(brew cask ls | tr '\n' ' ')

for PACKAGE in "${REQUIRED_PACKAGES[@]}"; do
  if [[ " ${INSTALLED_PACKAGES[@]} " =~ " $PACKAGE " ]]; then
    echo "$PACKAGE is already installed"
  else
    echo "Installing $PACKAGE..."
    brew install $PACKAGE
  fi
done


for PACKAGE in "${REQUIRED_CASK_PACKAGES[@]}"; do
  if [[ " ${INSTALLED_CASK_PACKAGES[@]} " =~ " $PACKAGE " ]]; then
    echo "$PACKAGE is already installed"
  else
    echo "Installing $PACKAGE..."
    brew cask install $PACKAGE
  fi
done
