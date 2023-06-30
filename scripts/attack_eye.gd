extends Node2D

signal finished_attack(damage)

@export var enabled = false
var attacked = false

func _ready():
	self.visible = false
# Called when the node enters the scene tree for the first time.
func start():
	enabled = true
	attacked = false
	self.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not attacked and enabled:
		$ColorRect.start()
		if Input.is_action_just_pressed("ui_accept"):
			var angle = $ColorRect.angle
			var damage = floor((1 - abs(sin(angle))) * 10)
			print(sin(angle))
			print("your damage: " + str(damage))
			$ColorRect.stop()
			enabled = false
			attacked = true
			self.visible = false
			finished_attack.emit(damage)
