extends Node2D

var can_fade = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _process(delta):
	if can_fade:
		$CanvasLayer/fade.modulate[3] += 0.01

func _on_door_door_opened():
	can_fade = true




func _on_area_2d_body_entered(body):
	if body == $Player:
		$DeadZone/StaticBody2D/Sprite2D2.visible = true
		
