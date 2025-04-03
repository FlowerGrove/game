extends CharacterBody2D
class_name  Player

@onready var enemy: Enemy = %enemy

var player_hp
var player_mp
var player_attack
var player_defence



func  _ready() -> void:
	Glo2.connect("player_attr",player_attaribute)
	#hp_down()
	
func player_attaribute(current_hp:float,current_mp:float,attack:float,defence:float):
	#player_hp = current_hp
	player_mp = current_mp 
	player_attack = attack
	player_defence = defence


func _enter_tree() -> void:
	Glo._load()
	self.position = Glo.inv.player_pos 
	
func _exit_tree() -> void:
	Glo.inv.player_pos =self.position 
	Glo._save()
	
func _physics_process(_delta: float) -> void:
	const SPEED = 300.0
	var direction = Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	velocity = direction * SPEED

	move_and_slide()




func _on_area_2d_area_entered(area: Area2D) -> void:
	print(area.owner.name)
	
