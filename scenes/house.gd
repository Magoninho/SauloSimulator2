extends Node2D

var can_fade = false

func _process(delta):
	if can_fade:
		$Player/Camera2D/fade.modulate[3] += 0.01

func _on_door_door_opened():
	can_fade = true
