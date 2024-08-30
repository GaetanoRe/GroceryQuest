extends Node

class_name StateMachine

@export var initial_state : State

@onready var body_effected : Body = get_parent()
@onready var switch_timer : Timer = Timer.new()


var states : Dictionary

var current_state : State



func _ready() -> void:
	switch_timer.timeout.connect(on_switch_timer_timeout)
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.body = body_effected
			child.transitioned.connect(transition_to_new_state)
	
	if(initial_state):
		current_state = initial_state
		current_state.enter()
		

func _process(delta: float) -> void:
	current_state.process_misc(delta)

func _physics_process(delta: float) -> void:
	current_state.process_physics(delta)

func transition_to_new_state(state, new_state_name, switch_time_wait):
	#switch_timer.wait_time = switch_time_wait
	if(state != current_state):
		return
	
	var new_state = states.get(new_state_name.to_lower())
	if(!new_state):
		return
	
	
	if(current_state):
		current_state.exit()
	new_state.enter()
	#switch_timer.start()
	current_state = new_state
	#await switch_timer.timeout

func on_switch_timer_timeout():
	switch_timer.stop()
