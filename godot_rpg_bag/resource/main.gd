extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("bag"):
		%BagManager.visible = !%BagManager.visible
		#get_tree().paused = !get_tree().paused

	
