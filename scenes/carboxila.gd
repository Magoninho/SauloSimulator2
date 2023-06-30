extends Area2D

@export var player: Node2D
var speed = 360
var aiming = true
var target
var sprites = ["res://assets/sprites/sorvete.png", "res://assets/sprites/carboxila.png", "res://assets/sprites/pitagoras.png"]
var wait = 1

#func _ready():
#	start()

func start():
	wait = randf_range(1, 4)
	self.visible = true
	aiming = true
	$Timer.wait_time = wait
	$Timer.start()
	$Sprite2D.texture = load(sprites[randi() % len(sprites)])
	position.x = randi_range(40, 160)
	position.y = randi_range(100, 500)

func close_aim():
	aiming = false
	wait = randf_range(1, 4)
	$Timer.wait_time = wait
	$Timer.stop()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if aiming:
		look_at(player.position)
		
	else:
		position += transform.x * speed * delta # transform serve pra fazer o negocio seguir no sentido que ele ta olhando
		# https://ask.godotengine.org/138885/how-to-make-my-player-move-in-facing-direction


func _on_timer_timeout():
	close_aim()
