extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("saulo_run")


func _on_animation_player_animation_finished(anim_name):
	Global.day += 1
	get_tree().change_scene_to_file("res://scenes/days/day.tscn")
