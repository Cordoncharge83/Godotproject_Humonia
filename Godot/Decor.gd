extends Node2D

var hammer_picked = false
signal quest_complete

func _on_Hammer_hammer():
	hammer_picked = true
	var dialogh = Dialogic.start('timeline-indice-h')
	dialogh.pause_mode = Node.PAUSE_MODE_PROCESS
	dialogh.connect('timeline_end',self,'unpause')
	add_child(dialogh) 

signal repair

func _on_Trou_du_pont_pont():
	if (hammer_picked):
		emit_signal("repair")



func _on_Player_pickup():
	if $Player.item_left <=0 and get_node_or_null('DialogueNode') == null:
		emit_signal("quest_complete")
		var dialog1 = Dialogic.start('timeline-indice-final')
		dialog1.pause_mode = Node.PAUSE_MODE_PROCESS
		dialog1.connect('timeline_end',self,'unpause')
		add_child(dialog1) 
		$PNJs/Premier/PNJ_Animation.animation = "cheer"
		$PNJs/PNJ2/PNJ_Animation.animation = "cheer"
		$PNJs/PNJ3/PNJ_Animation.animation = "cheer"
		$PNJs/PNJ4/PNJ_Animation.animation = "cheer"
		
func unpause(timeline_name):
	get_tree().paused = false

