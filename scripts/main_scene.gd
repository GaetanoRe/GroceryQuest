extends Node

class_name MainScene

var world
var world_spawn
var player : Player

func _ready() -> void:
	var world_scene = load("res://scenes/generation_scenes/world.tscn")
	world_scene.instantiate()
	add_child(world)

func _process(delta) -> void:
	if(Input.is_action_just_pressed("quit")) :
		get_tree().quit()

