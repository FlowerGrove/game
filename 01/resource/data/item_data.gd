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




func type0_check(item:ItemData) ->String:
	match item.type:
		EquipType.NONE:    
			print("空类型")
			return "NONE"
		EquipType.WEAPON:
			print("武器类型")
			return "WEAPON"
		EquipType.CLOTH:
			print("衣服类型")
			return "CLOTH"
		EquipType.SHOE:
			print("鞋子类型")
			return "SHOE"
		EquipType.HELMET:
			print("头盔类型")
			return "HELMET"
		_:                 # 默认分支处理未知情况
			push_error("未知装备类型: %s" % str(item.type))
			return ""
