extends Node2D


class_name Weapon

@export var weapon_data : WeaponData

var weapon_type : int
var animation_time : float
@export var sprite : AnimatedSprite2D
var sprite_animations : SpriteFrames = weapon_data.sprite
@export var animations : Array = sprite_animations.animations
var hitbox : Area2D
var hitbox_col : CollisionShape2D

func _ready():
	if(weapon_data):
		weapon_type = weapon_data.type
		animation_time = weapon_data.animation_time
		sprite_animations = weapon_data.sprite
		animations = sprite_animations.animations
		sprite = AnimatedSprite2D.new()
		sprite.sprite_frames = sprite_animations
		hitbox = Area2D.new()
		hitbox_col = CollisionShape2D.new()
		hitbox_col.shape = weapon_data.hitbox_dimensions
		hitbox.add_child(hitbox_col)
		hitbox.add_to_group("weapons")
		add_child(sprite)
		add_child(hitbox)
		sprite.hide()

func _process(delta):
	if(Input.is_action_just_pressed("attack")):
		sprite.show()

# This will be used later for other weapons
func update_weapon():
	pass



