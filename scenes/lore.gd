extends CanvasLayer

var texts = [
	"Once upon a time there was a hero. His name was Saulo.",
	"Saulo was facing a terrible fate: Ensino médio brasileiro. His main goal was to reach UNICAMP",
	"Saulo had to study very hard to reach his goal.",
	"After a long journey, Saulo had 3 days left to speedrun every stuff that Exame Nacional do Ensino Médio wanted him to know"
]

var current_slide = 0
var finished = false
# Called when the node enters the scene tree for the first time.
func _ready():
	reload()
	$Timer.start()

func reload():
	if current_slide >= len(texts):
		$TimeBeforeChanging.start()
		finished = true
		return
		
	$Slide.modulate[3] = 0
	$Slide.texture = load("res://assets/Lore/" + str(current_slide) + ".png")
	$Legend.text = texts[current_slide]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
	if finished:
		$ColorRect.modulate[3] += 0.01
		$AudioStreamPlayer.volume_db -= 0.05
	else:
		if $Slide.modulate[3] <= 1:
			$Slide.modulate[3] += 0.01
		
		$Slide.position.x -= 0.1



func _on_timer_timeout():
	$Slide.modulate[3] = 0
	$Slide.position.x = 0
	current_slide += 1
	reload()


func _on_time_before_changing_timeout():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
