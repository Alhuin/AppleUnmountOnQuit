use AppleScript version "2.4"
use framework "AppKit"
use scripting additions

property NSWorkspace : class "NSWorkspace"

on run
	set workSp to NSWorkspace's sharedWorkspace()
	set notifCent to workSp's notificationCenter()
	tell notifCent to addObserver:me selector:"someAppHasTerminated:" |name|:"NSWorkspaceDidTerminateApplicationNotification" object:(missing value)
end run

on idle
	-- we don't use the idle loop, so tell the system let the app sleep. this comes out of idle once an hour
	return 3600
end idle

on someAppHasTerminated:notif
	set termedApp to (notif's userInfo's valueForKey:"NSWorkspaceApplicationKey")
	set termedAppName to (termedApp's localizedName) as text
	--- if the specified App was terminated. (replace with the desired App name)
	if termedAppName is "Obsidian" then
		tell application "Finder"
			--- if the specified Volume is mounted. (replace with the desired Volume name)
			if exists "ObsidianVolume" then
				--- detach the specified Volume. (replace with the path of the desired Volume path).
				do shell script "hdiutil detach /Volumes/Obsidian"
			end if
		end tell
	end if
end someAppHasTerminated:
