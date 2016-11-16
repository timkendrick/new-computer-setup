set -e

echo "Signing into App Store..."
mas signin "$APPLE_ID_EMAIL" "$APPLE_ID_PASSWORD"

echo "Installing App Store apps..."
source ./Packages/mas.sh

echo "Accepting Xcode license..."
xcodebuild -license accept
