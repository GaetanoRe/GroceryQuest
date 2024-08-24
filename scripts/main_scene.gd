extends Node

class_name MainScene

@onready var world = $World
@onready var ui = $UI



var player : Player
var animation_player : AnimationPlayer
var is_paused = false


func _ready():
	player = get_tree().get_first_node_in_group("player")
	animation_player = $UI/AnimationPlayer
	world.player_dead.connect(game_over)
	
	

func _process(delta) -> void:
	if(Input.is_action_just_pressed("quit")) :
		get_tree().quit()
	
	if(Input.is_action_just_pressed("pause")):
		if(is_paused):
			is_paused = false
		else:
			is_paused = true
	
	world.get_tree().paused = is_paused
	
	#If the player dies, call game_over function
#
   ## Play game over animation and wait for it to finish before changing scenes
func game_over() -> void:
	animation_player.play("GameOver")
	await get_tree().create_timer(2.5).timeout
	get_tree().reload_current_scene()

func reload_world():
	pass
