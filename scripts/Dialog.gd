extends CanvasLayer
class_name Dialog

@export_file("*.json") var dialog_file: String
@export var NPC_name: String

signal dialog_finished

var dialogs = null
var current_dialog_id = -1
var active = false
var finished = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel.visible = false

func play_dialog():
	if active:
		return
	dialogs = load_dialog()
	$Panel.visible = true
	active = true
	next_line()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if not active:
		return
	
	if event.is_action_pressed("ui_accept") and active:
		if finished:
			next_line()

func next_line():
	if current_dialog_id + 1 >= len(dialogs):
		active = false
		$Panel.visible = false
		$Timer.start()
		return
	current_dialog_id += 1
	render()
	
func render():
	$Panel/Message.text = dialogs[current_dialog_id]
	$Panel/Message.visible_characters = 0
	finished = false
	while $Panel/Message.visible_characters < len($Panel/Message.text) and not finished:
		$Panel/Message.visible_characters += 1
		$speak.play()
		await get_tree().create_timer(0.04).timeout
	finished = true

func load_dialog():
	var file = FileAccess.open(dialog_file, FileAccess.READ)
	var content = file.get_as_text()
	var current_dialog = JSON.parse_string(content)[NPC_name]
	return current_dialog

func reset():
	$Panel.visible = false
	current_dialog_id = -1
	active = false
	dialogs = null

func _on_timer_timeout():
	dialog_finished.emit()
	reset()
