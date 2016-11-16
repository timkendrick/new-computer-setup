# Create new documents in plain text format
defaults write com.apple.TextEdit RichText -int 0

# Turn off automatic substitutions
defaults write com.apple.TextEdit CorrectSpellingAutomatically -int 0
defaults write com.apple.TextEdit SmartCopyPaste -int 0
defaults write com.apple.TextEdit SmartQuotes -int 0
defaults write com.apple.TextEdit SmartDashes -int 0
defaults write com.apple.TextEdit TextReplacement -int 0

# Display HTML files as plain text
defaults write com.apple.TextEdit IgnoreHTML -int 1

# Prevent adding default file extension
defaults write com.apple.TextEdit AddExtensionToNewPlainTextFiles -int 0
