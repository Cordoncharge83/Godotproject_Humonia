extends Area2D


func _on_Item_body_entered(body):
	if(body.is_in_group("main_character")):
		queue_free()
		body.pickup()
		body.pickup_item()
