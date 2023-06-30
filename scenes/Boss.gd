extends Node2D


enum {
	CUTSCENE,
	IDLE,
	ATTACK,
	ATTACK2,
	ATTACK3,
	DAMAGE,
	SHRINK,
	DEAD,
}

var state = null
var attack_count = 0
var player_attack_count = 0
var health = 26
var shrinked = false

func _ready():
	state = CUTSCENE
	update_state()

func update_state():
	match state:
		CUTSCENE:
			$AnimationPlayer.play("cutscene")
		IDLE:
			$AnimationPlayer.play("idle")
			$Cooldown.start();
		ATTACK:
			$AnimationPlayer.play("attack")
		ATTACK2:
			$AnimationPlayer.play("attack2")
		ATTACK3:
			$AnimationPlayer.play("attack3")
		DAMAGE:
			$AnimationPlayer.play("damage")
		DEAD:
			$AnimationPlayer.play("dead")
		
		SHRINK:
			$AnimationPlayer.play("shrink")
			




func _on_animation_player_animation_finished(anim_name):
	if anim_name == "cutscene":
		state = IDLE
	elif anim_name == "attack":
		state = IDLE
	elif anim_name == "attack2":
		state = ATTACK3
		player_attack_count = 0
	elif anim_name == "attack3":
		state = IDLE
	elif anim_name == "shrink":
		state = IDLE
	elif anim_name == "damage":
		if health <= 0:
			state = DEAD
			print("é pra morrer")
			$Cooldown.stop()
		elif health <= 10 and health > 0 and not shrinked:
			print("vivo")
			state = SHRINK
			shrinked = true
		else:
			state = IDLE
	elif anim_name == "dead":
		print("venceu")
		$Cooldown.stop()
		return
		
	
	update_state()


func _on_cooldown_timeout():
	if attack_count >= 3:
		print("vez do player")
		$attack_eye.start()
		state = IDLE
		$Cooldown.stop();
		$Cooldown.wait_time = 4.5
		#attack_count = 0
	else:
		if player_attack_count >= 1:
			state = ATTACK2
			$Cooldown.stop();
			$Cooldown.wait_time = 4.5
		else:
			state = ATTACK
			attack_count += 1
	update_state()



func _on_attack_eye_finished_attack(damage):
	if state == IDLE:
		state = DAMAGE
		attack_count = 0
		health -= damage
		player_attack_count += 1
		print(health)
		update_state()
