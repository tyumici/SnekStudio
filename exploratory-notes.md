# Preface

I don't know godot very well and even less so this code base. Intent here is to figure out how current things work.

## CHAT

It looks like in [TwitchGD4](./addons/TwitchGD4/TwitchService.gd) handle_channel_chat_message_v2 is set and will handle the messages as a signal.

It also has a bunch of the other functions for handling emotes and user profile pictures.

The handle_channel_chat_message_v2 signal is used in [TwitchService_EventSub.gd](./addons/TwitchGD4/TwitchService_EventSub.gd)

Doesn't look like there are any built in chat windows. 

I should be able to make a 2D scene (tscn) and then hook in the signal from the above to get messages into here?

Would also need to make this a viable and positionable window within the studio.

## WORLD SCENE

In [Scene_Basic.tscn](./Mods/Scene_Basic/Scene_Basic.tscn) I should be able to alter this space with a proper room or really anything since it's the default locale of the whole gizmo.

Hopefully as easy as dragging it in once made

