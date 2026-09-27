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
	print(chatter_username, message)
	if message.contains('!radiate'):
		print('radiate get')
		# Play a geiger counter noise
		pass
	if chatter_username == 'tinymici':
		print('tinymici radiate response')
		# Do something based off tinymici message
		var num: int = message.right(message.length()-9).to_int()
		print('rad value', num)
