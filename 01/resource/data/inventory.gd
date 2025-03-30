extends Resource
class_name  InventoryData


#定义存储的东西
@export var player_pos:Vector2

@export var name:String= ""
@export var bag_array:Array[ItemData] = []



func add(item:ItemData):
	bag_array.append(item)
func detele(item:ItemData):
	bag_array.erase(item)
