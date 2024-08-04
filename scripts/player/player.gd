extends CharacterBody2D

class_name Player

const SPEED : float = 27.0

#Combat variables
var enemy_in_range = false
var enemy_attack_cooldown = true
var health = 100
var player_alive = true	

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
	
	enemy_attack()
	move_and_slide()
	
	if health <= 0:
		player_alive = false #add death screen and respawn here
		health = 0
		print("player has been killed")
		var main_scene = load("res://scenes/main_scene.tscn")
		get_tree().change_scene_to_packed(main_scene)
		
	
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


func _on_player_hurtbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_in_range = true



func _on_player_hurt4box_body_exited(body):
	if body.has_method("enemy"):
		enemy_in_range = false
		
