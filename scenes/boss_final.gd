extends Node2D

var player_health = 3


func _on_carboxila_body_entered(body):
	if body.name == "Player8dir":
		player_health -= 1
		print(player_health)
		$SFX/player_damage.play()
		if player_health == 0:
			get_tree().change_scene_to_file("res://scenes/game_over.tscn")

func change_to_the_end():
	get_tree().change_scene_to_file("res://scenes/ending.tscn")
