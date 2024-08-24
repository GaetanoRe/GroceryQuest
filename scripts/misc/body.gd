extends CharacterBody2D

class_name Body



var health = 100
var speed : float = 27.0
var current_dir = "down"
var knockback_velocity
var knockback_time : float = 0.2
var knockback_timer : float = 0.0
var knockback_strength : float
var knockback_resistence : float

func _physics_process(delta):
	move_and_slide()
		

func deal_with_damage(dam : int, knock : int):
	health -= dam
	# Apply knockback
	
	
	knockback_timer = knockback_time
