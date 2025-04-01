extends MarginContainer

@onready var texture_rect: TextureRect = $TextureRect



func show_bag_information(item:ItemData) -> void:
	texture_rect.texture = item.texture
	
	tooltip_text = "%s\n%s\n%s" %[item.name,item.descripition,item.type0_check(item)]
	



func _on_gui_input(event: InputEvent) -> void:
	
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_LEFT :
			var index = get_index()
			Glo.get_slot_index.emit(index)
			

		if event.button_index == MOUSE_BUTTON_RIGHT:
			pass
