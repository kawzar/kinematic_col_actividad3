extends Control
	
func _on_health_change(amount):
	get_node("container/health").text = str(amount).pad_decimals(2)

func _on_player_im_dead():
	get_node("container/health").text = "DEAD"
