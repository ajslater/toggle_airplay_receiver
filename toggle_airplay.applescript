#!/usr/bin/osascript
# Toggle airplay reciever on and off
# Scripting the GUI is a stopgap until I can figure out how to toggle that setting directly.
# Based on https://apple.stackexchange.com/questions/431846/toggle-airplay-receiver-server-with-the-command-line-on-macos-monteray/431876#431876

on run argv
    if argv is {} then
      tell me to error "Usage: toggle_airplay <on|off|toggle>"
    end if
    if item 1 of argv is equal to "off" then
        set check to false
    else if item 1 of argv is equal to "on" then
        set check to true
    else if item 1 of argv is equal to "toggle" then
        set check to null
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
