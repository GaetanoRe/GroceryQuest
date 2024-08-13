extends Node2D


class_name Weapon

# basic weapon components
@export var weapon_data : WeaponData
var sprite : AnimatedSprite2D
var hitbox : Area2D
var hitbox_col : CollisionShape2D
var attack_timer : Timer


# weapon specific data
var weapon_type : int
var animation_time : float
var damage : float 
var knockback : float
var sprite_animations : SpriteFrames



func _ready():
	if(weapon_data):
		attack_timer = get_parent().get_node("deal_attack_timer")
		knockback = weapon_data.knockback
		update_weapon()


func _process(delta):
	if(weapon_data):
		if(Input.is_action_just_pressed("attack")):
			sprite.show()
			if(weapon_data.type == 0):
				sprite.play("swing_left")
			attack_timer.start()
			hitbox_col.disabled = false
			await attack_timer.timeout
			hitbox_col.disabled = true
			sprite.hide()

# Function will be called when game starts with weapon and will be called when player gets new weapon
func update_weapon():
	weapon_type = weapon_data.type
	damage = weapon_data.damage
	animation_time = weapon_data.animation_time
	sprite_animations = weapon_data.sprite
	sprite = AnimatedSprite2D.new()
	sprite.sprite_frames = sprite_animations
	hitbox = Area2D.new()
	hitbox_col = CollisionShape2D.new()
	hitbox_col.shape = weapon_data.hitbox_dimensions
	hitbox.add_child(hitbox_col)
	add_child(sprite)
	add_child(hitbox)
	hitbox.add_to_group("player_weapons")
	hitbox_col.disabled = true
	sprite.hide()



