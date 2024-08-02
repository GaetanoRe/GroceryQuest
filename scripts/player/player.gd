extends CharacterBody2D

class_name Player

const SPEED : float = 20.0

func _ready():
	pass

func _process(delta):
	pass

func _physics_process(delta):
	
	var direction = Input.get_vector("left", "right", "up", "down")
	
	velocity.x = direction.x * SPEED
	velocity.y = direction.y * SPEED
	
	move_and_slide()
	


