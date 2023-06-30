extends Node2D




func _on_troll_body_entered(body):
	if get_node_or_null("StaticPlatform3") != null:
		$StaticPlatform3.queue_free()
		$Troll/Sprite2D.visible = true
