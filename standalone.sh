echo "Creating temporary directory for standalone apps..."
mkdir -p $TMPDIR/Applications

echo "Creating standalone apps..."
mkdir -p $TMPDIR/Applications/Google\ Docs
nativefier --name "Google Docs" --icon ./Icons/Google\ Docs.icns https://docs.google.com/ $TMPDIR/Applications/Google\ Docs
cp -r "$(find $TMPDIR/Applications/Google\ Docs -name "Google Docs.app")" /Applications/

echo "Removing temporary files..."
rm -rf $TMPDIR/Applications
