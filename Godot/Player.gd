extends KinematicBody2D


export (int) var speed = 150
var picking = false
var pick_dur = 10
var pick_time = 0
export (int) var item_left = 6

func _process(delta):
	$HUD._show_item_left(item_left)
	var velocity = Vector2()
	if(Input.is_action_pressed("ui_right")):
		velocity.x += 1
	if(Input.is_action_pressed("ui_left")):
		velocity.x -= 1
	if(Input.is_action_pressed("ui_up")):
		velocity.y -= 1
	if(Input.is_action_pressed("ui_down")):
		velocity.y += 1
	velocity = velocity.normalized()
	
	move_and_collide(velocity * speed * delta)

	if (picking == false):
		if(velocity.length() > 0):

			$AnimatedSprite.animation = "walk"
			if (velocity.x != 0):
				$AnimatedSprite.flip_h = (velocity.x < 0)
		else:
			$AnimatedSprite.animation = "idle"
	else:
		$AnimatedSprite.animation = "interact"
		pick_time += 1
		if (pick_time > pick_dur):
			picking = false
			pick_time = 0


signal pickup

func pickup():
	$Item_sound.play()
	picking = true
	
	
func pickup_item():
	item_left -= 1 
	emit_signal("pickup")
