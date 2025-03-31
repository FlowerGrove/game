extends Control


@onready var button: Button = $"../Button"


func _ready() -> void:
	Glo.connect("get_slot_index",func index(index:int):
		print(index," ",Glo.inv.bag_array[index].name))
	show_slot()


func show_slot():
	for child in %GridContainer.get_children():
		%GridContainer.remove_child(child)
		child.queue_free()
		
	var  inv = Glo._load()
	for item in inv.bag_array:
		var  slot = preload("res://resource/scenes/my_bag/slot.tscn").instantiate()
		%GridContainer.add_child(slot)
		slot.show_bag_information(item)


func _on_button_pressed() -> void:
	Glo.inv.add(load("res://resource/aseets/item/001.tres"))
	show_slot()
	Glo._save()


func _on_button_2_pressed() -> void:
	Glo.inv.detele(load("res://resource/aseets/item/001.tres"))
	show_slot()
	Glo._save()
