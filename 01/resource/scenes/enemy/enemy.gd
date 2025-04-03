extends CharacterBody2D
class_name  Enemy
@onready var player: Player = %Player


func _ready() -> void:
	pass
	



func ProgressBar_show():
	if $ProgressBar.value == 0 :
		$ProgressBar.visible = false

func _on_area_2d_area_entered(area: Area2D) -> void:
	print(area.owner.name)
	$ProgressBar.visible =true
	Glo2.hit_player.emit(5)




func _on_area_2d_area_exited(area: Area2D) -> void:
	$ProgressBar.visible = false
