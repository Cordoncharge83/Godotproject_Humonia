extends KinematicBody2D

signal pont

func _on_Contact_pont_body_entered(body):
	if(body.is_in_group("main_character")):
		emit_signal("pont")
		print("pont")


func _on_Level_repair():
	queue_free()
