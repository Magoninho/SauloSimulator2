@tool
extends Area2D

@export var dialog: Dialog
@export var texture: Texture2D
var player_inside = false

func _ready():
	$Label.visible = false
	$Sprite2D.texture = texture

func _input(event):
	if event.is_action_pressed("ui_accept") and player_inside:
		dialog.play_dialog()

func _on_body_entered(body):
	if body.name == "Player":
		$Label.visible = true
		player_inside = true

func _on_body_exited(body):
	if body.name == "Player":
		dialog.finished = true
		$Label.visible = false
		player_inside = false
		dialog.reset()
