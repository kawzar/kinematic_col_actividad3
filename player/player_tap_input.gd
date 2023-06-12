extends Node2D

export (float) var SPEED = 160
export (float) var ACCELERATION = 350
export (float) var MIN_MOUSE_DISTANCE = 5

var velocity = Vector2(0,0)
var isHeadedSomewhere = false
var kinematic_body
var target = Vector2(0,0)

func _ready():
	kinematic_body = get_parent()
	
func _physics_process(delta):	
	if isHeadedSomewhere:
		if global_position.distance_to(target) > MIN_MOUSE_DISTANCE:
			kinematic_body.move_and_slide(velocity * delta)
		else:
			isHeadedSomewhere = false
		
func _moveTowardsPosition(position):
	isHeadedSomewhere = true
	target = position
	var direction = global_position.direction_to(position)
	velocity = velocity.move_toward(direction * SPEED, ACCELERATION)

func _onTap(position):
	_moveTowardsPosition(position)
