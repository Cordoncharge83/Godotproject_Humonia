extends Area2D
signal hammer


func _on_Hammer_body_entered(body):
	if(body.is_in_group("main_character")):
		emit_signal("hammer")
		body.pickup()
		queue_free()
