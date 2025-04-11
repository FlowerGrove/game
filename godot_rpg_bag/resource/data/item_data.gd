extends Resource
class_name  ItemData


@export var name:String = ""
@export_multiline var descripition:String = ""
@export var texture:Texture2D



enum EquipType{
	NONE,   
	WEAPON,  
	CLOTH,
	SHOE,
	HELMET
}

@export_category("type")
@export var type:EquipType =EquipType.NONE
@export var hp:float
@export var mp:float
@export var attack:float
@export var defence:float




func type0_check(item:ItemData) ->String:
	match item.type:
		EquipType.NONE:    
			return "NONE"
		EquipType.WEAPON:
			return "WEAPON"
		EquipType.CLOTH:
			return "CLOTH"
		EquipType.SHOE:
			return "SHOE"
		EquipType.HELMET:
			return "HELMET"
		_:  
			push_error("未知装备类型")
			return ""
