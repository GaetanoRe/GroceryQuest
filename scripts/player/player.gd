extends Body

class_name Player

#Combat variables
@onready var weapon = $Weapon
@onready var animation_player = $AnimationPlayer


var enemy_in_range = false
var enemy_attack_cooldown = true
var player_alive = true	

var spawn_loc : Vector2


signal hurt

func _ready():
	knockback_resistence = 100
	knockback_strength = 200
	spawn_loc = Vector2.ZERO

func _process(delta):
	pass

func _physics_process(delta):
	var direction = Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")

	# Apply normal movement if not in knockback
	if knockback_timer <= 0:
		velocity.x = direction.x * speed
		velocity.y = direction.y * speed
	else:
		knockback_timer -= delta
		velocity = knockback_velocity
	
	# Handle animations
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
	
	# Move the player
	move_and_slide()

	if health <= 0:
		player_alive = false # Add death screen and respawn here
		health = 0
		print("player has been killed")
		var main_scene = load("res://scenes/main_scene.tscn")
		get_tree().change_scene_to_packed(main_scene)

func deal_with_damage(dam : int, knock : int):
	super(dam, knock)
	$AttackCooldown.start()
	print(health)

func _on_attack_cooldown_timeout():
	enemy_attack_cooldown = true


func _on_player_hurtbox_body_entered(body):
	if body.is_in_group("enemy"):
		enemy_in_range = true
		deal_with_damage(10, body.knockback_strength - knockback_resistence)


func _on_player_hurt4box_body_exited(body):
	if body.is_in_group("enemy"):
		enemy_in_range = false
		


func _on_deal_attack_timer_timeout():
	$deal_attack_timer.stop()
