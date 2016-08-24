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
					set thePath to quoted form of the POSIX path of theFile
					my launchServer(thePath)
				end repeat
			else
				set theFolder to folder of front window as string
				set thePath to quoted form of the POSIX path of theFolder
				my launchServer(thePath)
			end if
		on error theError
			beep
			my launchServer("'~/'")
		end try
	end tell
end run

on launchServer(thePath)
	set thePort to (random number from 49152 to 65535)
	tell application "Terminal"
		activate
		if not (exists front window) then
			reopen
		else
			tell application "System Events" to keystroke "t" using command down
		end if
		repeat while contents of selected tab of front window starts with linefeed
			delay 0.01
		end repeat
		set theScript to "cd " & thePath & ";" & "python -m SimpleHTTPServer " & thePort
		do script theScript in front window
	end tell
	do shell script "open 'http://localhost:" & thePort & "/'"
end launchServer
