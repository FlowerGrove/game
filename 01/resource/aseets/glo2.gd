extends Node

signal player_attr(hp:float,mp:float,attack:float,defence:float)
signal hit_player(damage:float)
signal hit_enemy(damage:float)




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
var max_hp :float = 50
var max_mp:float = 20
var current_hp:float = max_hp:
	set(value):
		current_hp = value
	get():
		return current_hp
var current_mp:float = max_mp:
	set(value):
		current_mp = value
	get():
		return current_mp
