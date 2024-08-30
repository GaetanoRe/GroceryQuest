extends State

class_name IdleState

var player : Body

func enter():
	player = get_tree().get_first_node_in_group("player")
	body.velocity = Vector2.ZERO
	super()

func exit():
	super()

func process_misc(delta : float):
	super(delta)

func process_physics(delta : float):
	var direction = player.global_position - body.global_position
	if(direction.length() <= 50):
		transitioned.emit(self, "FollowState", 0)
	super(delta)
