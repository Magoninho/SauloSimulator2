extends StaticBody2D

var angle: float = 0.0

@export var speed = 0.1
@export var amplitude = 200
@export_color_no_alpha var color = Color(1, 1, 1)

var initial_pos = 0

func _ready():
	initial_pos = self.position.x
	$ColorRect.color = color

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	angle = angle + 0.1
	if angle > 360: angle = 0
	position.x = initial_pos + cos(angle*speed) * amplitude
