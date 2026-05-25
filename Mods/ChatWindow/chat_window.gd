class_name ChatWindow extends Mod_Base
var chat_messages = []

func _ready() -> void:
	pass
	
func handle_channel_chat_message(cheerer_username, cheerer_display_name, message, bits_count) -> void:
	var text_label = RichTextLabel.new()
	text_label.bbcode_enabled = true
	text_label.fit_content = true
	text_label.custom_effects = []
	text_label.text = "%s: %s" % [cheerer_username, message]
	text_label.size.x = 800
	text_label.add_theme_font_size_override("normal_font-size", 72)
	$ChatContainer.add_child(text_label)
	for msg in chat_messages: msg.position.y += text_label.get_content_height()
	chat_messages.push_front(text_label)
	if len(chat_messages) > 10:
		chat_messages[10].queue_free()
		chat_messages.remove_at(10)
	print(cheerer_username, message)
	
