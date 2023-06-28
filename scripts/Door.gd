extends Area2D
class_name Door

signal door_opened

@export_file var level_file: String
@export var should_sound: bool

var player_inside = false

func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("ui_accept") and player_inside:
		door_opened.emit()
		if should_sound:
			$open.play()
		$Timer.start()
		player_inside = false
		# change scene


func _on_body_entered(body):
	if body.name == "Player":
		player_inside = true
		$Label.visible = true


func _on_body_exited(body):
	if body.name == "Player":
		player_inside = false
		$Label.visible = false


func _on_timer_timeout():
	get_tree().change_scene_to_file(level_file)
