set -e

if [ ! -f ./.tmp/bin/mas ]; then
  echo "Downloading App Store helper..."
  mkdir -p .tmp/bin
  mkdir -p .tmp/mas
  curl -Lk -o ./.tmp/mas/mas-cli.zip https://github.com/argon/mas/releases/download/v1.2.0/mas-cli.zip
  unzip ./.tmp/mas/mas-cli.zip -d .tmp/bin
fi

echo "Signing into App Store..."
PATH=$PATH:$PWD/.tmp/bin
mas signin "$APPLE_ID_EMAIL" "$APPLE_ID_PASSWORD"

echo "Installing App Store apps..."
source ./Packages/mas.sh
