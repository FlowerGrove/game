extends Control
#class_name BagManager

@onready var button: Button = $"../Button"

signal equip
signal upload
func _ready() -> void:
	Glo.connect("get_slot_index",index0)
	show_slot()
	equip_init()
	
var hp1
var hp2
var hp3
var hp4
var mp1
var mp2
var mp3
var mp4
var attack1
var attack2
var attack3
var attack4
var defence1
var defence2
var defence3
var defence4

func equip_init():
	if Glo.inv.equip_wepon:
		%wepon.texture = Glo.inv.equip_wepon[0].texture
		hp1 = Glo.inv.equip_wepon[0].hp
		mp1 =Glo.inv.equip_wepon[0].mp
		attack1 =Glo.inv.equip_wepon[0].attack
		defence1 =Glo.inv.equip_wepon[0].defence
	else :
		hp1=0 
		mp1=0
		attack1=0
		defence1=0

	if Glo.inv.equip_cloth:
		%cloth.texture = Glo.inv.equip_cloth[0].texture
		hp2 = Glo.inv.equip_cloth[0].hp
		mp2 =Glo.inv.equip_cloth[0].mp
		attack2 =Glo.inv.equip_cloth[0].attack
		defence2 =Glo.inv.equip_cloth[0].defence
	else :
		hp2=0
		mp2=0
		attack2=0
		defence2=0

	if Glo.inv.equip_shoe:
		%shoe.texture = Glo.inv.equip_shoe[0].texture
		hp3 = Glo.inv.equip_shoe[0].hp
		mp3 =Glo.inv.equip_shoe[0].mp
		attack3 =Glo.inv.equip_shoe[0].attack
		defence3 =Glo.inv.equip_shoe[0].defence
	else :
		hp3=0
		mp3=0
		attack3=0
		defence3=0
	
	if Glo.inv.equip_helmet:
		%header.texture = Glo.inv.equip_helmet[0].texture
		hp4 = Glo.inv.equip_helmet[0].hp
		mp4 =Glo.inv.equip_helmet[0].mp
		attack4 =Glo.inv.equip_helmet[0].attack
		defence4 =Glo.inv.equip_helmet[0].defence
	else :
		hp4=0
		mp4=0
		attack4=0
		defence4=0
	
	%hp.text = "HP:" +str(hp1+hp2+hp3+hp4)
	%mp.text = "MP:" +str(mp1+mp2+mp3+mp4)
	%attack.text= "攻击:" +str(attack1+attack2+attack3+attack4)
	%defence.text="防御:" +str(defence1+defence2+defence3+defence4)

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
		#player_type()
		Glo._save()
		equip_init()

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
				#player_type()
				Glo._save()
				equip_init()
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
				#player_type()
				Glo._save()
				equip_init()
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
				#player_type()
				Glo._save()
				equip_init()
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
				#player_type()
				Glo._save()
				equip_init()
