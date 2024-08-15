extends Node2D


class_name World

@export var curr_room : Room
var player_spawned : bool = false
var player : Player
var player_health : float

signal player_dead

func _ready():
	spawn_player()
	player_spawned = true
	player_health = player.health
	load_room("res://scenes/generation_scenes/rooms/a_1.tscn")

func _process(delta):
	
	if(!player.player_alive):
		player_dead.emit()

func spawn_player():
	var player_scene = load("res://scenes/player/player.tscn")
	player = player_scene.instantiate()
	add_child(player)

func load_room(room : String):
	var init_room = load(room)
	var i_room = init_room.instantiate()
	add_child(i_room)
