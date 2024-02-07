extends Area2D

var active = false
var quest_complete = false

func _ready():
	connect("body_entered", self, "_on_PNJ_body_entered")
	connect("body_exited", self, "_on_PNJ_body_exited")


func _process(delta):
	$PressE.visible = active

func _on_Level_quest_complete():
	quest_complete = true

		
func _input(event):
	if get_node_or_null('DialogueNode') == null:
		if event.is_action_pressed("Interact") and active : 
			get_tree().paused = true
			var dialog1 = Dialogic.start('timeline-merci')
			dialog1.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog1.connect('timeline_end',self,'unpause')
			add_child(dialog1)

func unpause(timeline_name):
	get_tree().paused = false

func _on_PNJ_body_entered(body):
	print(body.name)
	if body.name == 'Player' and quest_complete:
		active = true

func _on_PNJ_body_exited(body):
	if body.name == 'Player':
		active = false



