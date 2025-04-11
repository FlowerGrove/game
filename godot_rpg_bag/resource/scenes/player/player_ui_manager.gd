extends Control
class_name PlayerUiManager

func _ready() -> void:
	Glo2.a.connect(func (a:bool):if a:show_blood())
	Glo2.connect("hit_player",hit_player)
	show_blood()
	
func hit_player(damage:float):
	Glo.inv.player_attr_dic.hp -= damage
	Glo._save()
	show_blood()
	Glo2.b.emit(Glo.inv.player_attr_dic.hp)



func show_blood():
	%HPShow.text = ""
	%MPShow.text = ""
	
	var  inv = Glo._load()
	if inv.player_attr_dic.hp >=0:
		%HPShow.text = str(inv.player_attr_dic.hp)
		%HPProgressBar.max_value = inv.player_attr_dic.max_hp
		%HPProgressBar.value = inv.player_attr_dic.hp
	else: return
	if inv.player_attr_dic.mp >=0:
		%MPShow.text = str(inv.player_attr_dic.mp)
		%MPProgressBar.max_value = inv.player_attr_dic.max_mp
		%MPProgressBar.value =  inv.player_attr_dic.mp
	else: return
	
