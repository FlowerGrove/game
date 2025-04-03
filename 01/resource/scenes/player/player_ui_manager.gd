extends Control

var enemy_damage=0
func _ready() -> void:
	Glo2.connect("player_attr",player_attr)
	Glo2.connect("hit_player",hit_player)
	
func hit_player(damage:float):
	enemy_damage = damage
	
	print(enemy_damage)

func player_attr(hp,mp,attack,defence):
	#hp为装备属性+人物基础属性
	
	%HPShow.text = "HP:"+str(hp-enemy_damage)+"/%s" % [Glo2.hp1+Glo2.hp2+Glo2.hp3+Glo2.hp4+Glo2.max_hp]
	%MPShow.text = "MP:"+str(mp)+"/%s" % [Glo2.mp1+Glo2.mp2+Glo2.mp3+Glo2.mp4+Glo2.max_mp]
	%HPProgressBar.max_value = hp-Glo2.current_hp+Glo2.max_hp
	%MPProgressBar.max_value = mp-Glo2.current_mp+Glo2.max_mp
	%HPProgressBar.value = hp
	%MPProgressBar.value =  mp
