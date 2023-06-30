extends Control

var score = 10
var current_question = -1

const questions = [
	"[center]what is python?",
	'[center]what is the result of the code:\nprint("2+2")',
	"[center]is javascript a good language?",
	"[center]is HTML a programming language at all?",
	"[center]what color is #fff?"
]

const answers = [
	"a programming language",
	'"2+2"',
	"no",
	"no",
	"white"
]

const button_texts = [
	["a snake", "a programming language"],
	['"2+2"', "4"],
	["yes", "no"],
	["yes", "no"],
	["white", "red"],
]

# Called when the node enters the scene tree for the first time.
func _ready():
	next_question()
	
func show_results():
	var passed_or_not = "you passed :D" if score >= 6 else "you did not pass :( try again"
	$Panel/Result.visible = true
	$Panel/Result.text = "RESULTS:\n" + "Your score: " + str(score) + "\nSituation: " + passed_or_not
	$Panel/VBoxContainer.visible = false
	if score < 6:
		$Panel/TryAgain.visible = true
	else:
		$Panel/Finish.visible = true

func next_question():
	if current_question + 1 >= len(questions):
		show_results()
		return
	current_question += 1
	$Panel/VBoxContainer/RichTextLabel.text = questions[current_question]
	$Panel/VBoxContainer/Button1.text = button_texts[current_question][0]
	$Panel/VBoxContainer/Button2.text = button_texts[current_question][1]

func _on_button_pressed(extra_arg_0):
	if extra_arg_0 == "btn1":
		if answers[current_question] != $Panel/VBoxContainer/Button1.text:
			score -= 2
		next_question()

	elif extra_arg_0 == "btn2":
		if answers[current_question] != $Panel/VBoxContainer/Button2.text:
			score -= 2
		next_question()



func _on_try_again_pressed():
	get_tree().change_scene_to_file("res://scenes/OBI.tscn")


func _on_finish_pressed():
	Global.day += 1
	get_tree().change_scene_to_file("res://scenes/days/day.tscn")
