# Disable Caps Lock modifier key
KEYBOARD_ID="$(ioreg -n IOHIDKeyboard -r | grep -e \"VendorID\" | sed 's/^.*\"VendorID\" = \([0-9]*\)/\1/')-$(ioreg -n IOHIDKeyboard -r | grep -e \"ProductID\" | sed 's/^.*\"ProductID\" = \([0-9]*\)/\1/')-0"
defaults -currentHost write NSGlobalDomain "com.apple.keyboard.modifiermapping.$KEYBOARD_ID" '( { HIDKeyboardModifierMappingSrc = 0; HIDKeyboardModifierMappingDst = -1; } )'

# Remap Caps Lock modifier key to PC application key
defaults write org.pqrs.Seil sysctl '{ "enable_capslock" = 1; "keycode_capslock" = 110; }'
