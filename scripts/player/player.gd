extends CharacterBody2D

class_name Player

const SPEED : float = 27.0

#Combat variables
@onready var weapon = $Weapon
@onready var animation_player = $AnimationPlayer
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

func _process(delta):
	pass

func _physics_process(delta):
	
	var direction = Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")
	
	velocity.x = direction.x * SPEED
	velocity.y = direction.y * SPEED
	
	if Input.is_action_pressed("walk_up"):
		current_dir = "up"
		animation_player.play("walk_up")
	elif Input.is_action_pressed("walk_down"):
		current_dir = "down"
		animation_player.play("walk_down")
	elif Input.is_action_pressed("walk_right"):
		current_dir = "right"
		animation_player.play("walk_right")
	elif Input.is_action_pressed("walk_left"):
		current_dir = "left"
		animation_player.play("walk_left")
	else:
		animation_player.play("idle_" + current_dir)
		
	#attack()
	enemy_attack(10)
	move_and_slide()
	
	if health <= 0:
		player_alive = false #add death screen and respawn here
		health = 0
		print("player has been killed")
		var main_scene = load("res://scenes/main_scene.tscn")
		get_tree().change_scene_to_packed(main_scene)

#func player_animation(movement):
	#var dir = current_dir
	#var anim = $character_sprite
	#var weapon_pos :  Vector2
	#
	##Animation for left and right 
	#if dir == "right":
		#weapon_pos = Vector2(3, 0)
		#weapon.global_rotation = 0
		#anim.flip_h = false
		#if movement == 1:
			#anim.play("side_walk")
		#elif movement == 0:
			#anim.play("side_idle")
			#
	#if dir == "left":
		#weapon_pos = Vector2(-3,0)
		#weapon.global_rotation = 180
		#anim.flip_h = true
		#if movement == 1:
			#anim.play("side_walk")
		#elif movement == 0:
			#anim.play("side_idle")
			#
	#if dir == "up":
		#weapon_pos = Vector2(0, -3)
		#weapon.global_rotation = -90
		#if movement == 1:
			#anim.play("walk_up")
		#elif movement == 0:
			#anim.play("up_idle")
			#
	#if dir == "down":
		#weapon_pos = Vector2(0, 3)
		#weapon.global_rotation = 90
		#if movement == 1:
			#anim.play("walk_down")
		#elif movement == 0:
			#anim.play("down_idle")
	#weapon.global_position = Vector2(anim.global_position.x + weapon_pos.x, anim.global_position.y + weapon_pos.y)
	#

func enemy_attack(dam : int):
	if enemy_in_range and enemy_attack_cooldown == true:
		health = health - dam
		enemy_attack_cooldown = false
		$AttackCooldown.start()
		print(health)
		

func _on_attack_cooldown_timeout():
	enemy_attack_cooldown = true
	
#func attack():
	#var dir = current_dir
	
	#started input for attack 8/6/24
	#if Input.is_action_pressed("attack"):
		#global.player_current_attack = true
		#attack_ip = true
		#if dir == "right":
			#$melee_weapons/sword_side.visible = true
			#$deal_attack_timer.start()
		#if dir == "left":
			#$melee_weapons/sword_left.visible = true
			#$deal_attack_timer.start()
		#if dir == "up":
			#$melee_weapons/sword_up.visible = true
			#$deal_attack_timer.start()
		#if dir == "down":
			#$melee_weapons/sword_down.visible = true
			#$deal_attack_timer.start()
			#


func _on_player_hurtbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_in_range = true


func _on_player_hurt4box_body_exited(body):
	if body.has_method("enemy"):
		enemy_in_range = false
		


func _on_deal_attack_timer_timeout():
	$deal_attack_timer.stop()
	#$melee_weapons/sword_up.visible = false
	#$melee_weapons/sword_side.visible = false
	#$melee_weapons/sword_down.visible = false
	#$melee_weapons/sword_left.visible = false
	#global.player_current_attack = false
	#attack_ip = false
