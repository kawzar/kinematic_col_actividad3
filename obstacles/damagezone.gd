extends Area2D

#con un simple parametro, el script se vuelve multiuso
export (float) var damage_per_second = 1
var trapped_body = null

func _physics_process(delta):
	if trapped_body != null:
		trapped_body.hurt(damage_per_second*delta)
	

func _on_zone_body_enter( body ):
	if body.is_in_group("player"):
		trapped_body = body

func _on_zone_body_exit(_body):
	trapped_body = null
