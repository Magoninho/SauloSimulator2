
extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.day == 1:
		$Door.monitoring = false
