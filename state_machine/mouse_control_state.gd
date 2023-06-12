class_name MouseControlState
extends PlayerState

export (float) var SPEED = 160
export (float) var ACCELERATION = 350
export (float) var MIN_MOUSE_DISTANCE = 5

var velocity = Vector2(0,0)
var isHeadedSomewhere = false
var target = Vector2(0,0)

func enter(_msg := {}) -> void:
	pass
	
func physics_update(delta: float) -> void:
	if isHeadedSomewhere:
		if player.global_position.distance_to(target) > MIN_MOUSE_DISTANCE:
			player.move_and_slide(velocity)
		else:
			isHeadedSomewhere = false
			player.velocity = Vector2.ZERO
	
func handle_input(event: InputEvent) -> void:
   # Mouse in viewport coordinates.
	if event is InputEventMouseMotion:
		var view_to_world = player.get_canvas_transform().affine_inverse()
		var world_position = view_to_world * event.position
		_moveTowardsPosition(world_position)

func _moveTowardsPosition(position):
	isHeadedSomewhere = true
	player.look_at(position)
	target = position
	var direction = player.global_position.direction_to(position)
	velocity = velocity.move_toward(direction * SPEED, ACCELERATION)
