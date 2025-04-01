extends Resource
class_name  InventoryData


#定义存储的东西
@export var player_pos:Vector2

@export var name:String= ""
@export var bag_array:Array[ItemData] = []

@export var equip_array:Array[ItemData] = []


@export var equip_wepon:Array[ItemData] = []
@export var equip_cloth:Array[ItemData] = []
@export var equip_shoe:Array[ItemData] = []
@export var equip_helmet:Array[ItemData] = []


func add_equipment(type:String,item:ItemData):
	match type:
		"wepon":equip_wepon.append(item)
		"cloth":equip_cloth.append(item)
		"shoe":equip_shoe.append(item)
		"helmet":equip_helmet.append(item)
func detle_equipment(type:String,item:ItemData):
	match type:
		"wepon":equip_wepon.erase(item)
		"cloth":equip_cloth.erase(item)
		"shoe":equip_shoe.erase(item)
		"helmet":equip_helmet.erase(item)


func add(item:ItemData):
	bag_array.append(item)
func detele(item:ItemData):
	bag_array.erase(item)
func detele_index(index:int):
	bag_array.remove_at(index)


func add_equip(item:ItemData):
	equip_array.append(item)
func detele_equip(item:ItemData):
	equip_array.erase(item)
func insert_index_equip(index:int,item:ItemData):
	equip_array.insert(index,item)
