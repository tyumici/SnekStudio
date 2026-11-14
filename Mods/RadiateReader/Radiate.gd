extends Mod_Base
# This reacts to the !radiate command in the tyumici channel
func _ready() -> void:
	print('radiate listen')
	
func handle_channel_chat_message(
	chatter_username : String,
	chatter_display_name : String,
	message : String,
	bits_count : int
) -> void:
	if chatter_username == 'tinymici':
		
		if message.contains('received'):
			# get radiate value
			var num: int = message.right(message.length()-9).to_int()
			$RadiateNoiseClip.play()
		if message.contains('Dose administered'):
			pass
