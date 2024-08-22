extends Body

@onready var player_chase = false
var player = null
var player_in_range = false
var can_take_damage = true

func _ready():
	knockback_strength = 200

func _physics_process(delta):
	if player_chase:
		if knockback_timer > 0:
			knockback_timer -= delta
			velocity = knockback_velocity
		else:
			velocity += (player.position - position)/speed
			if(!player.player_alive):
				player_chase = false
	super(delta)



func _on_detection_area_body_entered(body):
	player = body
	player_chase = true
	

func _on_detection_area_body_exited(body):
	player_chase = false


func enemy():
	pass


func _on_enemy_hitbox_body_entered(body):
	if body.is_in_group("player"):
		player_in_range = true
		player_chase = false
		await get_tree().create_timer(0.5).timeout
		player_chase = true
func _on_enemy_hitbox_body_exited(body):
	if body.is_in_group("player"):
		player_in_range = false
		
func deal_with_damage(dam : int, knock : int) -> void:
	super(dam, knock)
	health -= dam
	# Calculate knockback direction based on player and enemy positions
	var knockback_direction = (position - player.position).normalized()
	knockback_velocity = knockback_direction * knock
	knockback_timer = knockback_time
	can_take_damage = false
	$take_damage_cooldown.start()

	print("slimehealth =", health)
	if health <= 0:
		self.queue_free()
	



func _on_take_damage_cooldown_timeout():
	can_take_damage = true
	



func _on_enemy_hurt_box_area_entered(area):
	if(area.is_in_group("player_weapons")):
		var weapon = area.get_parent()
		var weapon_dam = weapon.damage
		print("knockback ", weapon.knockback)
		deal_with_damage(weapon_dam, weapon.knockback)
