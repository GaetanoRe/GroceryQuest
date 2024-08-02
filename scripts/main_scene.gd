extends Node

var player_spawn_loc_x : float
var player_spawn_loc_y : float

var player : Player

func _ready() -> void:
	spawn_player()
	pass

func _process(delta) -> void:
	if(Input.is_action_just_pressed("quit")) :
		get_tree().quit()




func spawn_player() -> void:
	pass
