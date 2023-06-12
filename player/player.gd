class_name Player
extends KinematicBody2D

export (float) var MAX_HEALTH = 100

onready var health = MAX_HEALTH

var dead = false

signal health_change
signal im_dead

func _ready():
	emit_signal("health_change",health)

func hurt(amount):
	health-=amount
	#esto podría ir en un setter
	if health <= 0:
		if !dead:
			emit_signal("im_dead")
			dead = true
			set_physics_process(false) 
		health = 0
		return
	elif health > 100:
		health = 100
	emit_signal("health_change",health)


func _on_button_pressed(button_name):
	get_node("StateMachine").transition_to(button_name)
