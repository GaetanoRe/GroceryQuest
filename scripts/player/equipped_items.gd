extends Node2D


class_name Item

@onready var item_timer : Timer = get_parent().get_node("ItemTimer")
@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var hitbox : Area2D = $Hitbox
@onready var hitbox_col : CollisionShape2D = $Hitbox/CollisionShape2D

# basic item components
@export var equipped_items : Array[ItemData]
@onready var item_data : ItemData = equipped_items[0]






# item specific data
var animation_time : float


# data if item was a weapon
var weapon_type : int
var damage : float 
var knockback : float
var sprite_animations : SpriteFrames

func _ready():
	update_item()


func _process(delta):
	
	# if statement to distinguish between the two items
	if(Input.is_action_just_pressed("item1")):
		item_data = equipped_items[0]
		update_item()
	elif(Input.is_action_just_pressed("item2")):
		item_data = equipped_items[1]
		update_item()


	if(item_data):
		if(Input.is_action_just_pressed("item1") or Input.is_action_just_pressed("item2")):
			sprite.show()
			if(item_data is WeaponData):
				if(item_data.weapon_type == 0):
					sprite.rotation = 0
					sprite.play("swing_left")
				if(item_data.weapon_type == 1):
					sprite.rotation = 90
					sprite.play("thrust")
			item_timer.start()
			hitbox_col.disabled = false
			await item_timer.timeout
			hitbox_col.disabled = true
			sprite.hide()
		

# Function will be called when game starts with weapon and will be called when player gets new weapon
func update_item():
	if(item_data):
		sprite_animations = item_data.sprite
		animation_time = item_data.animation_time
		sprite.sprite_frames = sprite_animations
		hitbox_col.shape = item_data.hitbox_dimensions
		hitbox_col.disabled = true
		sprite.hide()
		if(item_data is WeaponData):
			weapon_type = item_data.weapon_type
			damage = item_data.damage
			hitbox.add_to_group("player_weapons")
		else:
			hitbox.add_to_group("player_items")
		

	
