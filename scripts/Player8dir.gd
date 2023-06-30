extends CharacterBody2D

signal player_attacked
const SPEED = 350.0

func _physics_process(delta):
	player_movement(delta)
	
func player_movement(delta):
	var direction = Vector2i(0, 0);
	
	if Input.is_action_pressed("ui_right"):
		direction.x = 1
		player_attacked.emit()
	if Input.is_action_pressed("ui_left"):
		direction.x = -1
	if Input.is_action_pressed("ui_down"):
		direction.y = 1
	if Input.is_action_pressed("ui_up"):
		direction.y = -1
	
	velocity.x = direction.x * SPEED
	velocity.y = direction.y * SPEED
	
	if direction.x != 0 and direction.y != 0:
		velocity.x /= 1.414
		velocity.y /= 1.414
	
	move_and_slide()
