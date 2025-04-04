extends CharacterBody2D
class_name  Player

@onready var enemy: Enemy = %enemy

func _ready() -> void:
	#Engine.
	Glo2.b.connect(func (b:float):
		if b>=0:
			%Label.visible = true
			%Label.text = "hp:"+str(b)
				)

func _enter_tree() -> void:
	Glo._load()
	self.position = Glo.inv.player_pos 
	
func _exit_tree() -> void:
	Glo.inv.player_pos =self.position 
	Glo._save()
	
	
#func _process(delta: float) -> void:
	
func _physics_process(_delta: float) -> void:
	const SPEED = 300.0
	var direction = Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	velocity = direction * SPEED

	move_and_slide()




func _on_area_2d_area_entered(area: Area2D) -> void:
	pass
	#print(area.owner.name)
	
