extends CharacterBody2D
class_name  Player

@onready var enemy: Enemy = %enemy

func _ready() -> void:
	#Engine.
	Glo2.b.connect(func (b:float):
		if b>=0:
			%Label.visible = true
			%Label.text = "hp:"+str(b)
			#Glo.inv.player_attr_dic.hp= b
			#Glo._save()
		else:
			pass
				)

func _enter_tree() -> void:
	Glo._load()
	self.position = Glo.inv.player_pos 
	
func _exit_tree() -> void:
	Glo.inv.player_pos =self.position 
	Glo._save()
	
	

var state:String = ""	
var current_state:String = ""
func _physics_process(_delta: float) -> void:
	var SPEED = 150.0
	var direction = Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	velocity = direction * SPEED
	
	if !direction == Vector2.ZERO:
		state = "move"
		$animi.play("walk")
	else:
		state = "idle"
		$animi.play("idle")
	
	
	
	
	move_and_slide()
	
	







func _on_area_2d_area_entered(area: Area2D) -> void:
	pass
	Glo2.hit_enemy.emit(10)
	#print(area.owner.name)
	


#func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	#if event is InputEventMouseButton and event.is_pressed():
		#if event.button_index == MOUSE_BUTTON_LEFT  :
			#print("nmn")
			#velocity = position.direction_to(self.position) * SPEED
