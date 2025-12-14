# Snek Notes Internal

## How To Twitch Chat Into Snek

- In Mode_Base.gd, look for handle_channel_chat_message
- Added a TwitchChat mod, it is listed properly
- We can add it to the active mods

## Create UI element in scene when added

- So we have TwitchChat.tscn
- It is an instance of basewindow
- We need it to open when the TwitchChat mod is added
- Future: Add button in mod menu options to toggle

## Current Path
- CHat Box Button in the top bar
- Basic Window
- Need to feed in chat data
- Use mod_base in a parent element, to get chat
- Feed down to a rich text element to show each?
- How to create new elements on the fly

## Twitch Auth

If it's failing, turn off your vpn and check. It will break if you turn the vpn back on
