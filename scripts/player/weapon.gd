extends Node2D


class_name Weapon

@export var weapon_data : WeaponData

var weapon_type : int
var animation_time : float
@export var sprite : AnimatedSprite2D
var sprite_animations : SpriteFrames
var hitbox : Area2D
var hitbox_col : CollisionShape2D
var attack_timer : Timer


func _ready():
	if(weapon_data):
		attack_timer = get_parent().get_node("deal_attack_timer")
		weapon_type = weapon_data.type
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
		hitbox.set_deferred("Disabled",true)
		sprite.hide()

func _process(delta):
	if(Input.is_action_just_pressed("attack")):
		sprite.show()
		global.player_current_attack = true
		if(weapon_data.type == 0):
			sprite.play("swing_left")
		attack_timer.start()
		hitbox.set_deferred("Disabled", false)
		await attack_timer.timeout
		hitbox.set_deferred("Disabled",true)
		global.player_current_attack = false
		sprite.hide()

# This will be used later for other weapons
func update_weapon():
	pass



