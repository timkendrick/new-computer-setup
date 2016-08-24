set -e

mkdir -p ./.tmp/Applications

osacompile -o ./.tmp/Applications/Launch\ Server\ Here.app ./Applications/Launch\ Server\ Here/main.applescript
cp ./Applications/Launch\ Server\ Here/icon.icns ./.tmp/Applications/Launch\ Server\ Here.app/Contents/Resources/applet.icns

osacompile -o ./.tmp/Applications/Open\ Terminal\ Here.app ./Applications/Open\ Terminal\ Here/main.applescript
cp ./Applications/Open\ Terminal\ Here/icon.icns ./.tmp/Applications/Open\ Terminal\ Here.app/Contents/Resources/applet.icns

cp -r ./.tmp/Applications/* /Applications/

rm -rf ./tmp/Applications
