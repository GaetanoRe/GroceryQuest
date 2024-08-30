extends State

class_name FollowState

@onready var player : Body 

func enter():
	player = get_tree().get_first_node_in_group("player")
	super()

func exit():
	super()

func process_misc(delta : float):
	super(delta)

func process_physics(delta : float):
	var direction = player.global_position - body.global_position
	
	if(direction.length() > 50):
		transitioned.emit(self, "IdleState", 0)
	
	if(direction.length() <= 0):
		transitioned.emit(self, "IdleState", 0)
	
	if body.knockback_timer > 0:
			body.knockback_timer -= delta
			body.velocity = body.knockback_velocity
	
	body.velocity += (player.position - body.position)/ body.speed
	if(!player.player_alive):
		transitioned.emit(self, "IdleState", 0)
	super(delta)

func stop_in_place():
	transitioned.emit(self, "IdleState", 0)
