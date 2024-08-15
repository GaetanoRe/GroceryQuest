extends Node

class_name MainScene

var world
var player : Player
var animation_player : AnimationPlayer 

func _ready():
	load_world()
	player = get_tree().get_first_node_in_group("player")
	animation_player = $UI/AnimationPlayer
	world.player_dead.connect(game_over)
	

func _process(delta) -> void:
	if(Input.is_action_just_pressed("quit")) :
		get_tree().quit()
	

	##  If the player dies, call game_over function
	if !player.player_alive:
		game_over()

##  Play game over animation and wait for it to finish before changing scenes
func game_over() -> void:
  $UI.AnimationPlayer.play("FadeOut")
	animation_player.play("GameOver")
	await get_tree().create_timer(2.5).timeout
  $UI.AnimationPlayer.play("FadeIn")
	get_tree().reload_current_scene()

func load_world():
	var world_scene = load("res://scenes/generation_scenes/world.tscn")
	world = world_scene.instantiate()
	add_child(world)

func reload_world():
	pass
