extends Node2D


class_name World

const room_path = "res://scenes/generation_scenes/rooms/"


@export var init_room : PackedScene
@export var rooms: Array[RoomResource]

var curr_room : Room
var player_spawned : bool = false
var player : Player
var player_health : float

signal player_dead
signal room_change
signal player_loc_change

func _ready():
	spawn_player()
	player_spawned = true
	player_health = player.health
	load_room()
	
	# Connect Signals
	room_change.connect(change_room)
	player_loc_change.connect(relocate_player)

func _process(delta):
	
	if(!player.player_alive):
		player_dead.emit()

func spawn_player():
	var player_scene = load("res://scenes/player/player.tscn")
	player = player_scene.instantiate()
	add_child(player)

func change_room(scene : String):
	# iterate each of the rooms in the array and see if the string matches that scene
	for room in rooms:
		if(room.id == scene):
			curr_room.queue_free()
			var next_room = room.scene.instantiate()
			add_child(next_room)
			curr_room = next_room
			break

func relocate_player(loc : Vector2):
	player.position = loc

func load_room():
	curr_room = init_room.instantiate()
	add_child(curr_room)
