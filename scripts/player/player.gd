extends CharacterBody2D

class_name Player

const SPEED : float = 27.0

#Combat variables
var enemy_in_range = false
var enemy_attack_cooldown = true
var health = 100
var player_alive = true	
var current_dir = "none"

var attack_ip = false

var spawn_loc : Vector2


signal hurt

func _ready():
	spawn_loc = Vector2.ZERO
	# somehow, make it spawn...
	pass

func _process(delta):
	pass

func _physics_process(delta):
	
	var direction = Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")
	
	velocity.x = direction.x * SPEED
	velocity.y = direction.y * SPEED
	
	if Input.is_action_pressed("walk_up"):
		current_dir = "up"
		player_animation(1)
	elif Input.is_action_pressed("walk_down"):
		current_dir = "down"
		player_animation(1)
	else:
		player_animation(0)
		
#We will add these when we get the side walk animation
	#elif Input.is_action_pressed("walk_right"):
		#current_dir = "right"
		#player_animation(1)
	#elif Input.is_action_pressed("walk_left"):
		#current_dir = "left"
		#player_animation(1)
		
	enemy_attack()
	move_and_slide()
	
	if health <= 0:
		player_alive = false #add death screen and respawn here
		health = 0
		print("player has been killed")
		var main_scene = load("res://scenes/main_scene.tscn")
		get_tree().change_scene_to_packed(main_scene)

func player_animation(movement):
	var dir = current_dir
	var anim = $character_sprite
	
	#Animation for left and right 
	#if dir == "right":
		#anim.flip_h = false
		#if movement == 1:
			#anim.play("side_walk")
		#elif movement == 0:
			#anim.play("side_idle")
			
	#if dir == "left":
		#anim.flip_h = true
		#if movement == 1:
			#anim.play("side_walk")
		#elif movement == 0:
			#anim.play("side_idle")
			
	if dir == "up":
		if movement == 1:
			anim.play("walk_up")
		elif movement == 0:
			anim.play("up_idle")
			
	if dir == "down":
		if movement == 1:
			anim.play("walk_down")
		elif movement == 0:
			anim.play("down_idle")
	
	

func player():
	pass

func enemy_attack():
	if enemy_in_range and enemy_attack_cooldown == true:
		health = health - 10
		enemy_attack_cooldown = false
		$AttackCooldown.start()
		print(health)
		

func _on_attack_cooldown_timeout():
	enemy_attack_cooldown = true
	
func attack():
	var dir = current_dir
	
	#started input for attack 8/6/24
	if Input.is_action_pressed("attack"):
		global.player_current_attack = true
		attack_ip = true
		
		




func _on_player_hurtbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_in_range = true


func _on_player_hurt4box_body_exited(body):
	if body.has_method("enemy"):
		enemy_in_range = false
		
