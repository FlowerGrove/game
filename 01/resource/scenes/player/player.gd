extends CharacterBody2D
class_name  Player


#
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
