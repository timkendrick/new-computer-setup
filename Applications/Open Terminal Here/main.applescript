on run
	tell application "Finder"
		try
			if ((count of (items of selection)) > 0) then
				repeat with theItem in (items of selection)
					set theFile to theItem as alias
					tell application "System Events"
						set isFolder to (kind of theFile is "Folder" or kind of theFile is "Volume") and theFile is not package folder
					end tell
					if not isFolder then set theFile to container of theFile as alias
					set theFilename to quoted form of the POSIX path of theFile
					do shell script "open -a Terminal " & theFilename
					tell application "Terminal" to activate
				end repeat
			else
				set theFolder to folder of front window as string
				set theFilename to quoted form of the POSIX path of theFolder
				do shell script "open -a Terminal " & theFilename
			end if
		on error theError
			beep
			do shell script "open -a Terminal ~/"
		end try
	end tell
end run
