extends Control

func _on_health_change(amount):
	$health.text = str(amount).pad_decimals(2)


func _on_player_im_dead():
	$health.text = "DEAD"

