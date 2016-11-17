set -e

REQUIRED_PACKAGES=(
  497799835 # Xcode
  883878097 # Server
  803453959 # Slack
  458034879 # Dash
  407963104 # Pixelmator
  403388562 # Transmit
  567740330 # JSON Editor
)

INSTALLED_PACKAGES=$(mas list | sed 's/ .*//' | tr '\n' ' ')

for PACKAGE in "${REQUIRED_PACKAGES[@]}"; do
  if [[ " ${INSTALLED_PACKAGES[@]} " =~ " $PACKAGE " ]]; then
    echo "$PACKAGE is already installed"
  else
    echo "Installing $PACKAGE..."
    mas install $PACKAGE
  fi
done
