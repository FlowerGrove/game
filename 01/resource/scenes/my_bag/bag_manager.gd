extends Control
class_name BagManager

@onready var button: Button = $"../Button"

func _ready() -> void:
	Glo.connect("get_slot_index",index0)
	show_slot()
	equip_init()

##武器纹理及其属性显示到面板
func equip_init():
	if Glo.inv.equip_wepon:
		%wepon.texture = Glo.inv.equip_wepon[0].texture
		Glo2.hp1 = Glo.inv.equip_wepon[0].hp
		Glo2.mp1 =Glo.inv.equip_wepon[0].mp
		Glo2.attack1 =Glo.inv.equip_wepon[0].attack
		Glo2.defence1 =Glo.inv.equip_wepon[0].defence
	else :
		Glo2.hp1=0 
		Glo2.mp1=0
		Glo2.attack1=0
		Glo2.defence1=0

	if Glo.inv.equip_cloth:
		%cloth.texture = Glo.inv.equip_cloth[0].texture
		Glo2.hp2 = Glo.inv.equip_cloth[0].hp
		Glo2.mp2 =Glo.inv.equip_cloth[0].mp
		Glo2.attack2 =Glo.inv.equip_cloth[0].attack
		Glo2.defence2 =Glo.inv.equip_cloth[0].defence
	else :
		Glo2.hp2=0
		Glo2.mp2=0
		Glo2.attack2=0
		Glo2.defence2=0

	if Glo.inv.equip_shoe:
		%shoe.texture = Glo.inv.equip_shoe[0].texture
		Glo2.hp3 = Glo.inv.equip_shoe[0].hp
		Glo2.mp3 =Glo.inv.equip_shoe[0].mp
		Glo2.attack3 =Glo.inv.equip_shoe[0].attack
		Glo2.defence3 =Glo.inv.equip_shoe[0].defence
	else :
		Glo2.hp3=0
		Glo2.mp3=0
		Glo2.attack3=0
		Glo2.defence3=0
	
	if Glo.inv.equip_helmet:
		%header.texture = Glo.inv.equip_helmet[0].texture
		Glo2.hp4 = Glo.inv.equip_helmet[0].hp
		Glo2.mp4 =Glo.inv.equip_helmet[0].mp
		Glo2.attack4 =Glo.inv.equip_helmet[0].attack
		Glo2.defence4 =Glo.inv.equip_helmet[0].defence
	else :
		Glo2.hp4=0
		Glo2.mp4=0
		Glo2.attack4=0
		Glo2.defence4=0
	
	
	%hp.text = "HP:" +str(Glo2.hp1+Glo2.hp2+Glo2.hp3+Glo2.hp4+Glo2.current_hp)
	%mp.text = "MP:" +str(Glo2.mp1+Glo2.mp2+Glo2.mp3+Glo2.mp4+Glo2.current_mp)
	%attack.text= "攻击:" +str(Glo2.attack1+Glo2.attack2+Glo2.attack3+Glo2.attack4)
	%defence.text="防御:" +str(Glo2.defence1+Glo2.defence2+Glo2.defence3+Glo2.defence4)
	Glo2.player_attr.emit((Glo2.hp1+Glo2.hp2+Glo2.hp3+Glo2.hp4+Glo2.current_hp)\
						,(Glo2.mp1+Glo2.mp2+Glo2.mp3+Glo2.mp4+Glo2.current_mp)\
						,(Glo2.attack1+Glo2.attack2+Glo2.attack3+Glo2.attack4)\
						,(Glo2.defence1+Glo2.defence2+Glo2.defence3+Glo2.defence4))



##装备到装备槽
func index0(index:int):
		var a:ItemData=Glo.inv.bag_array[index]##获取item
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
		equip_init()

##显示纹理
func show_slot():
	for child in %GridContainer.get_children():
		%GridContainer.remove_child(child)
		child.queue_free()
		
	var  inv = Glo._load()
	for item in inv.bag_array:
		var  slot = preload("res://resource/scenes/my_bag/slot.tscn").instantiate()
		%GridContainer.add_child(slot)
		slot.show_bag_information(item)
##添加物品到背包
func _on_button_pressed() -> void:
	Glo.inv.add(load("res://resource/aseets/item/001.tres"))
	Glo.inv.add(load("res://resource/aseets/item/002.tres"))
	Glo.inv.add(load("res://resource/aseets/item/004.tres"))
	Glo.inv.add(load("res://resource/aseets/item/003.tres"))
	Glo.inv.add(load("res://resource/aseets/item/005.tres"))

	show_slot()
	Glo._save()
##删除物品
func _on_button_2_pressed() -> void:
	Glo.inv.detele(load("res://resource/aseets/item/001.tres"))

	show_slot()
	Glo._save()

##卸下装备
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
