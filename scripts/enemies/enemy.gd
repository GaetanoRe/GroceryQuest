extends Body

class_name Enemy

@onready var player_chase = false
@onready var player = get_tree().get_first_node_in_group("player")
var player_in_range = false
var can_take_damage = true

signal player_hit

func _ready():
	knockback_strength = 200
	knockback_resistence = 100

func _physics_process(delta):
	#if player_chase:
		#if knockback_timer > 0:
			#knockback_timer -= delta
			#velocity = knockback_velocity
	super(delta)



#func _on_detection_area_body_entered(body):
	#player = body
	##player_chase = true
	#
#
#func _on_detection_area_body_exited(body):
	#player_chase = false


func enemy():
	pass


func _on_enemy_hitbox_body_entered(body):
	if body.is_in_group("player"):
		await get_tree().create_timer(0.5).timeout
func _on_enemy_hitbox_body_exited(body):
	if body.is_in_group("player"):
		player_hit.emit()
	pass
		
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
		deal_with_damage(weapon_dam, weapon.knockback - knockback_resistence)
