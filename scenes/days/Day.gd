extends Node2D

@export_file var scene_to_change

var day = Global.day
var can_fade = false

func _process(delta):
	if can_fade:
		$fade.modulate[3] += 0.01

# Called when the node enters the scene tree for the first time.
func _ready():
	day = day % 3
	day += 1
	$Timer.start()
	if day == 1:
		$Day.text = "[center]The First Day"
		$Hours.text = "- 72 Hours Remain -"
	elif day == 2:
		$Day.text = "[center]The Second Day"
		$Hours.text = "- 48 Hours Remain -"
	elif day == 3:
		$Day.text = "[center]The Final Day"
		$Hours.text = "- 24 Hours Remain -"


func _on_timer_timeout():
	can_fade = true
	$TimeBeforeChanging.start()


func _on_time_before_changing_timeout():
	get_tree().change_scene_to_file(scene_to_change)
