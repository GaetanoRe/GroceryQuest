extends Body

var player_chase = false
var player = null
var player_in_range = false
var can_take_damage = true

func _ready():
	knockback_strength = 200

func _physics_process(delta):
	if player_chase:
		position += (player.position - position)/speed



func _on_detection_area_body_entered(body):
	player = body
	player_chase = true
	

func _on_detection_area_body_exited(body):
	player = null
	player_chase = false


func enemy():
	pass


func _on_enemy_hitbox_body_entered(body):
	if body.is_in_group("player"):
		player_in_range = true


func _on_enemy_hitbox_body_exited(body):
	if body.is_in_group("player"):
		player_in_range = false
		
func deal_with_damage(dam : int, knock : int) -> void:
	super(dam, knock)
	health = health - dam
	match current_dir:
		"up":
			knockback_velocity = Vector2(0, 1) * 100
		"down":
			knockback_velocity = Vector2(0, -1) * 100
		"left":
			knockback_velocity = Vector2(1, 0) * 100
		"right":
			knockback_velocity = Vector2(-1, 0) * 100
	$take_damage_cooldown.start()
	can_take_damage = false
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
