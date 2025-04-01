extends Control
#class_name BagManager

@onready var button: Button = $"../Button"


func _ready() -> void:
	Glo.connect("get_slot_index",index)
	show_slot()
	equip_init()
func equip_init():
	if Glo.inv.equip_wepon:%wepon.texture = Glo.inv.equip_wepon[0].texture
	if Glo.inv.equip_cloth:%cloth.texture = Glo.inv.equip_cloth[0].texture
	if Glo.inv.equip_shoe:%shoe.texture = Glo.inv.equip_shoe[0].texture
	if Glo.inv.equip_helmet:%header.texture = Glo.inv.equip_helmet[0].texture
	
	

func index(index:int):
		print(index," ",Glo.inv.bag_array[index].name)
		
		var a:ItemData=Glo.inv.bag_array[index]
		
		var b:String=a.type0_check(a)#获取类型
		#Glo.inv.detele_index(index)  ?
		if b=="WEAPON" :
			Glo.inv.add_equipment("wepon",a)
			if Glo.inv.equip_wepon:
				%wepon.texture = Glo.inv.equip_wepon[0].texture
				Glo.inv.equip_wepon.resize(1)
			else:Glo.inv.detele_index(index)
		if b=="CLOTH" :
			Glo.inv.add_equipment("cloth",a)
			if Glo.inv.equip_cloth:
				%cloth.texture = Glo.inv.equip_cloth[0].texture
				Glo.inv.equip_cloth.resize(1)
			else:Glo.inv.detele_index(index)
		if b=="SHOE" :
			Glo.inv.add_equipment("shoe",a)
			if Glo.inv.equip_shoe:
				%shoe.texture = Glo.inv.equip_shoe[0].texture
				Glo.inv.equip_shoe.resize(1)
			else:Glo.inv.detele_index(index)
		if b=="HELMET" :
			Glo.inv.add_equipment("helmet",a)
			if Glo.inv.equip_helmet:
				%header.texture = Glo.inv.equip_helmet[0].texture
				Glo.inv.equip_helmet.resize(1)
			else:Glo.inv.detele_index(index)
			
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

	#Glo.inv.add_equip(load("res://resource/aseets/item/001.tres"))

	show_slot()
	Glo._save()

func _on_button_2_pressed() -> void:
	Glo.inv.detele(load("res://resource/aseets/item/001.tres"))
	#Glo.inv.add_equip(load("res://resource/aseets/item/001.tres"))

	show_slot()
	Glo._save()
