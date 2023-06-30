extends "res://scenes/level.gd"


func _ready():
	if Global.day == 1:
		$Door.monitoring = false
		$NPC/Dialog.NPC_name = "computer2"
	elif Global.day == 2:
		$NPC3.monitoring = true
		$NPC3.visible = true
		$Door.level_file = "res://scenes/going_to_enem.tscn"

func _on_computer_dialog_finished():
	if Global.day == 1:
		get_tree().change_scene_to_file("res://scenes/OBI.tscn")
