#!/usr/bin/osascript

on run argv
    set check to null
    if not argv is {} then
      if item 1 of argv is equal to "off" then
          set check to false
      else if item 1 of argv is equal to "on" then
          set check to true
      end if
    end if

    tell application "System Preferences" to reveal pane id "com.apple.preferences.sharing"
    tell application "System Events" to tell window 1 of application process "System Preferences"
        repeat until exists checkbox 1 of (first row of table 1 of scroll area 1 of group 1 whose value of static text 1 is "AirPlay Receiver")
            delay 0.1
        end repeat
        if check is null or (check is not value of checkbox 1 of (first row of table 1 of scroll area 1 of group 1 whose value of static text 1 is "AirPlay Receiver") as boolean) then
            click checkbox 1 of (first row of table 1 of scroll area 1 of group 1 whose value of static text 1 is "AirPlay Receiver")
        end if
    end tell
    tell application "System Preferences" to quit
end run
