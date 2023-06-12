extends Node2D

export (float) var SPEED = 160
export (float) var ACCELERATION = 350
export (float) var MIN_MOUSE_DISTANCE = 5


var velocity = Vector2(0,0)
var kinematic_body

func _ready():
	kinematic_body = get_parent()
	
func _physics_process(delta):
	_apply_motion(Inputmanager.get("movement_input"))			
	kinematic_body.move_and_slide(velocity * delta)
		
func _apply_motion(motion):
	velocity += motion.normalized() * SPEED

func _onKeyPressed(movement_vector):
	_apply_motion(movement_vector)
