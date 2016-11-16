# Disable warning when changing file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show hard drives on the desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false

# Show status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Enable Finder column view by default
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Open new Finder windows on the user's home directory
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Search within current directory
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Show hard disks in sidebar
defaults write com.apple.sidebarlists ShowHardDisks -bool true
