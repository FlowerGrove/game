extends Control
#class_name BagManager

@onready var button: Button = $"../Button"


func _ready() -> void:
	Glo.connect("get_slot_index",index0)
	show_slot()
	equip_init()
	
func equip_init():
	if Glo.inv.equip_wepon:
		%wepon.texture = Glo.inv.equip_wepon[0].texture
	if Glo.inv.equip_cloth:
		%cloth.texture = Glo.inv.equip_cloth[0].texture
	if Glo.inv.equip_shoe:
		%shoe.texture = Glo.inv.equip_shoe[0].texture
	if Glo.inv.equip_helmet:
		%header.texture = Glo.inv.equip_helmet[0].texture
	

func index0(index:int):
		print(index," ",Glo.inv.bag_array[index].name)
		
		var a:ItemData=Glo.inv.bag_array[index]
		
		var b:String=a.type0_check(a)#获取类型
		

		if b=="WEAPON" :
			if %wepon.texture == null:
				Glo.inv.add_equipment("wepon",a)
				Glo.inv.detele_index(index)
			if Glo.inv.equip_wepon:
				%wepon.texture = Glo.inv.equip_wepon[0].texture
			
			
		if b=="CLOTH" :
			
			if %cloth.texture == null:
				Glo.inv.add_equipment("cloth",a)
				Glo.inv.detele_index(index)
			if Glo.inv.equip_cloth:
				%cloth.texture = Glo.inv.equip_cloth[0].texture

			
		if b=="SHOE" :
			
			if %shoe.texture == null:
				Glo.inv.add_equipment("shoe",a)
				Glo.inv.detele_index(index)
			if Glo.inv.equip_shoe:
				%shoe.texture = Glo.inv.equip_shoe[0].texture

		if b=="HELMET" :
			
			if %header.texture == null:
				Glo.inv.add_equipment("helmet",a)
				Glo.inv.detele_index(index)
			if Glo.inv.equip_helmet:
				%header.texture = Glo.inv.equip_helmet[0].texture
		show_slot()
		Glo._save()

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
	Glo.inv.add(load("res://resource/aseets/item/002.tres"))
	Glo.inv.add(load("res://resource/aseets/item/004.tres"))
	Glo.inv.add(load("res://resource/aseets/item/003.tres"))
	Glo.inv.add(load("res://resource/aseets/item/005.tres"))


	show_slot()
	Glo._save()

func _on_button_2_pressed() -> void:
	Glo.inv.detele(load("res://resource/aseets/item/001.tres"))

	show_slot()
	Glo._save()


func _on_wepon_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_LEFT :
			if Glo.inv.equip_wepon:
				var item =Glo.inv.equip_wepon[0]
				Glo.inv.add(item)
				Glo.inv.detle_equipment("wepon",Glo.inv.equip_wepon[0])
				%wepon.texture = null
				Glo.inv.equip_wepon.clear()
				show_slot()
				Glo._save()
func _on_cloth_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_LEFT :
			if Glo.inv.equip_cloth:
				var item =Glo.inv.equip_cloth[0]
				Glo.inv.add(item)
				Glo.inv.detle_equipment("cloth",Glo.inv.equip_cloth[0])
				%cloth.texture = null
				Glo.inv.equip_cloth.clear()
				show_slot()
				Glo._save()
func _on_shoe_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_LEFT :
			if Glo.inv.equip_shoe:
				var item =Glo.inv.equip_shoe[0]
				Glo.inv.add(item)
				Glo.inv.detle_equipment("shoe",Glo.inv.equip_shoe[0])
				%shoe.texture = null
				Glo.inv.equip_shoe.clear()
				show_slot()
				Glo._save()
func _on_header_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_LEFT :
			if Glo.inv.equip_helmet:
				var item =Glo.inv.equip_helmet[0]
				Glo.inv.add(item)
				Glo.inv.detle_equipment("helmet",Glo.inv.equip_helmet[0])
				%header.texture = null
				Glo.inv.equip_helmet.clear()
				show_slot()
				Glo._save()
