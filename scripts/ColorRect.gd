extends ColorRect

var angle = 0
var can_move = true

func _physics_process(delta):
	if can_move:
		angle += 0.052
		position.x  = 200 * sin(angle)
	
func start():
	can_move = true
func stop():
	can_move = false
