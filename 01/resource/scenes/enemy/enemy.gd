extends CharacterBody2D
class_name  Enemy
@onready var player: Player = %Player

@export var SPEED = 70.0

var flag = false
func _ready() -> void:
	mon_init()
	$ProgressBar.visible =false

func mon_init():
	self.look_at(player.position)
	self.rotation= 0

func _physics_process(delta: float) -> void:
	if flag:
		velocity = position.direction_to(player.position) * SPEED
		%anim.play("run")
		if player.position.x >self.position.x:
			%anim.flip_h = false
		else:%anim.flip_h = true
	else:
		velocity = Vector2.ZERO
		%anim.play("idle")
	move_and_slide()

func ProgressBar_show():
	#%ProgressBar.max_value = 100
	
	if $ProgressBar.value == 0 :
		$ProgressBar.visible = false

func _on_area_2d_area_entered(area: Area2D) -> void:

	print(area.owner.name)
	flag =true##进圈触发
	$ProgressBar.visible = true

	#if player:
		#%ProgressBar.value -=5
	
	#Glo2.hit_player.emit(5)  #伤害触发


func _on_area_2d_area_exited(area: Area2D) -> void:
	$ProgressBar.visible = false
	flag = false
