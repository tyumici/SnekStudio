class_name ChatWindow extends Mod_Base
var chat_messages = []

func _ready() -> void:
	pass
	
func handle_channel_chat_message(cheerer_username, cheerer_display_name, message, bits_count) -> void:
	var message_text = create_message(cheerer_username, message)
	$PanelContainer/MarginContainer/VBoxContainer.add_child(message_text)
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
