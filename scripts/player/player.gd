extends CharacterBody2D

class_name Player

const SPEED : float = 20.0

var spawn_loc : Vector2

func _ready():
	spawn_loc = Vector2.ZERO
	# somehow, make it spawn...
	pass

func _process(delta):
	pass

func _physics_process(delta):
	
	var direction = Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")
	
	velocity.x = direction.x * SPEED
	velocity.y = direction.y * SPEED
	
	move_and_slide()
	


