extends Area2D

var active = false

func _ready():
	connect("body_entered", self, "_on_PNJ_body_entered")
	connect("body_exited", self, "_on_PNJ_body_exited")

func _process(delta):
	$PressE.visible = active
		

func _input(event):
	if get_node_or_null('DialogueNode') == null:
		if event.is_action_pressed("Interact") and active and $PNJ_Animation.animation =="idle" : 
			get_tree().paused = true
			var dialog1 = Dialogic.start('timeline-4')
			dialog1.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog1.connect('timeline_end',self,'unpause')
			add_child(dialog1)
		elif event.is_action_pressed("Interact") and active and $PNJ_Animation.animation =="cheer" :
			get_tree().paused = true
			var dialog2 = Dialogic.start('timeline-fi1')
			dialog2.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog2.connect('timeline_end',self,'unpause')
			add_child(dialog2)

func unpause(timeline_name):
	get_tree().paused = false
	

func _on_PNJ_body_entered(body):
	if body.name == 'Player':
		active = true
func _on_PNJ_body_exited(body):
	if body.name == 'Player':
		active = false
