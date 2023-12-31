class_name KeyboardControlState
extends PlayerState

export (float) var SPEED = 160

func enter(_msg := {}) -> void:
	pass
	
func _physics_process(_delta):
	var motion = Vector2(0,0)
	
	if (Input.is_action_pressed("move_up")):
		motion += Vector2(0, -1)
	if (Input.is_action_pressed("move_bottom")):
		motion += Vector2(0, 1)
	if (Input.is_action_pressed("move_left")):
		motion += Vector2(-1, 0)
	if (Input.is_action_pressed("move_right")):
		motion += Vector2(1, 0)
		
	motion = motion.normalized()*SPEED
	motion = player.move_and_slide(motion)
