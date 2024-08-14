extends Node

class_name MainScene

var world
var world_spawn
var player : Player

func _ready() -> void:
	pass

func _process(delta) -> void:
	if(Input.is_action_just_pressed("quit")) :
		get_tree().quit()
	
	   # If the player dies, call game_over function
	#if !player.player_alive:
		#game_over()
#
   ## Play game over animation and wait for it to finish before changing scenes
#func game_over() -> void:
	#$UI.AnimationPlayer.play("GameOver")
	#await get_tree().create_timer(2.5).timeout
	#var world_scene = load("res://scenes/generation_scenes/world.tscn")
	#world_scene.instantiate()
	#add_child(world)
