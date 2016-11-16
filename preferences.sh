echo "Setting preferences..."
source ./Preferences/system.sh
source ./Preferences/Finder.sh
source ./Preferences/Terminal.sh
source ./Preferences/TextEdit.sh
source ./Preferences/Safari.sh
source ./Preferences/Seil.sh
source ./Preferences/Karabiner.sh

echo "Reloading preferences..."
killall cfprefsd
for process in "SystemUIServer" "Finder"; do
	killall "${process}" > /dev/null 2>&1
done

echo "Creating Sites directory..."
mkdir ~/Sites
