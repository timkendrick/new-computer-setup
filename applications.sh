set -e

mkdir -p $TMPDIR/Applications

osacompile -o $TMPDIR/Applications/Launch\ Server\ Here.app ./Applications/Launch\ Server\ Here/main.applescript
cp ./Applications/Launch\ Server\ Here/icon.icns $TMPDIR/Applications/Launch\ Server\ Here.app/Contents/Resources/applet.icns

osacompile -o $TMPDIR/Applications/Open\ Terminal\ Here.app ./Applications/Open\ Terminal\ Here/main.applescript
cp ./Applications/Open\ Terminal\ Here/icon.icns $TMPDIR/Applications/Open\ Terminal\ Here.app/Contents/Resources/applet.icns

cp -r $TMPDIR/Applications/* /Applications/

rm -rf $TMPDIR/Applications
