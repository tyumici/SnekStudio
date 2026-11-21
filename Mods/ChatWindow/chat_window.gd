class_name ChatWindow extends Mod_Base
const MOD_NAME := "Chat_Window"

var chat_messages = []
var message_timeout := 25
var chat_position := "Bottom Left"
var chat_positions: Array[String] = [
	"Top Left",
	"Top Right",
	"Bottom Left",
	"Bottom Right"
]
var twitch: TwitchService

func _ready() -> void:
	twitch = get_node("/root/SnekStudio_Main/Mods/TwitchIntegration/TwitchService")
	# This works in the UI but does not actually update the values
	add_tracked_setting("message_timeout", "Message Timeout", {}, "")
	add_tracked_setting("chat_positions", "Chat positions", 
	{ 
		"combobox": true, 
		"values": chat_positions 
	})
	update_settings_ui()
	
func handle_channel_chat_message(cheerer_username, cheerer_display_name, message, bits_count) -> void:
	var message_text = create_message(cheerer_username, message)
	var pfp = await create_pfp_image(cheerer_username)
	print(pfp)
	$PanelContainer/MarginContainer/VBoxContainer.add_child(message_text)
	get_tree().create_timer(25).timeout.connect(_remove_message.bind(message_text))
	if chat_messages.size() > 0:
		for msg in chat_messages: msg.position.y += message_text.get_content_height()
	chat_messages.push_front(message_text)
	if len(chat_messages) > 10:
		chat_messages[10].queue_free()
		chat_messages.remove_at(10)
	print(cheerer_username, message)

func create_message(cheerer_username, message)-> RichTextLabel:
	var text_label = RichTextLabel.new()
	text_label.bbcode_enabled = true
	text_label.fit_content = true
	text_label.scroll_active = false
	text_label.custom_effects = []
	text_label.text = "%s: %s" % [cheerer_username, message]
	text_label.size.x = 600
	text_label.add_theme_font_size_override("normal_font-size", 72)
	return text_label
	
func create_pfp_image(user: String)-> String:
	# This works, just need to use it
	var pfp = await twitch.fetch_user_profile_image_async(user)
	return pfp

func _remove_message(message):
	if is_instance_valid(message):
		chat_messages.remove_at(chat_messages.find(message))
		message.queue_free()
		message = null
	
func _update_timeout(): 
	pass
	
func _update_position():
	pass
