extends CharacterBody2D

class_name Body

var health = 100
var speed : float = 27.0
var current_dir = "none"
var knockback_velocity
var knockback_time : float = 0.2
var knockback_timer : float = 0.0
var knockback_strength : float
var knockback_resistence : float


func deal_with_damage(dam : int, knock : int):
	health -= dam
	# Apply knockback
	match current_dir:
		"up":
			knockback_velocity = Vector2(0, 1) * 100
		"down":
			knockback_velocity = Vector2(0, -1) * 100
		"left":
			knockback_velocity = Vector2(1, 0) * 100
		"right":
			knockback_velocity = Vector2(-1, 0) * 100
	
	knockback_timer = knockback_time
