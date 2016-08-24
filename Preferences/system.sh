# Expand save panels by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Ask to keep changes when closing documents
defaults write NSGlobalDomain NSCloseAlwaysConfirmsChanges -bool true

# Show 'Save As...' menu item
defaults write NSGlobalDomain NSUserKeyEquivalents -dict-add 'Save As...' '@$S'

# Increase number of recent menu items
defaults write NSGlobalDomain NSRecentDocumentsLimit -int 20

# Set keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Enable 'Tap to click'
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Enable three-finger dragging
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# Prevent automatic text substitutions
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Enable spring-loaded directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Set the spring-loading delay
defaults write NSGlobalDomain com.apple.springing.delay -float 0.0

# Save to disk rather than iCloud by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Prevent opening an app on connecting a camera device
defaults write com.apple.ImageCapture disableHotPlug -bool true

# Reduce GUI transparency
defaults write com.apple.universalaccess reduceTransparency -bool true

# Disable cursor shake magnification
defaults write NSGlobalDomain CGDisableCursorLocationMagnification -bool true

# Auto-hide the dock
defaults write com.apple.dock autohide -bool true

# Show the date in the menu bar
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM  HH:mm"

# Set menu bar icons
defaults write com.apple.systemuiserver menuExtras -array \
  "/System/Library/CoreServices/Menu Extras/Volume.menu" \
  "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
  "/System/Library/CoreServices/Menu Extras/Battery.menu" \
  "/System/Library/CoreServices/Menu Extras/Clock.menu"

# Set Spotlight suggestion sources
defaults write com.apple.Spotlight orderedItems '( { enabled = 1; name = APPLICATIONS; }, { enabled = 0; name = "MENU_SPOTLIGHT_SUGGESTIONS"; }, { enabled = 1; name = "MENU_CONVERSION"; }, { enabled = 1; name = "MENU_EXPRESSION"; }, { enabled = 0; name = "MENU_DEFINITION"; }, { enabled = 1; name = "SYSTEM_PREFS"; }, { enabled = 0; name = DOCUMENTS; }, { enabled = 0; name = DIRECTORIES; }, { enabled = 0; name = PRESENTATIONS; }, { enabled = 0; name = SPREADSHEETS; }, { enabled = 0; name = PDF; }, { enabled = 0; name = MESSAGES; }, { enabled = 1; name = CONTACT; }, { enabled = 0; name = "EVENT_TODO"; }, { enabled = 0; name = IMAGES; }, { enabled = 0; name = BOOKMARKS; }, { enabled = 0; name = MUSIC; }, { enabled = 0; name = MOVIES; }, { enabled = 0; name = FONTS; }, { enabled = 0; name = "MENU_OTHER"; }, { enabled = 0; name = "MENU_WEBSEARCH"; }, { enabled = 0; name = SOURCE; } )'

# Set the window minimize effect
defaults write com.apple.dock mineffect -string "scale"

# Play feedback sound when volume is changed
defaults write NSGlobalDomain com.apple.sound.beep.feedback -int 1

# Ask for password after screensaver or sleep
defaults write com.apple.screensaver askForPassword -int 1

# Screensaver password grace period
defaults write com.apple.screensaver askForPasswordDelay -float 5

# Disable Mission Control 'change space' keyboard shortcuts
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 79 "{ enabled = 1; value = { parameters = (65535, 123, 262144); type = standard; }; }"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 80 "{ enabled = 1; value = { parameters = (65535, 123, 393216); type = standard; }; }"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 81 "{ enabled = 1; value = { parameters = (65535, 124, 262144); type = standard; }; }"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 82 "{ enabled = 1; value = { parameters = (65535, 124, 393216); type = standard; }; }"
