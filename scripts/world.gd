extends Node2D


class_name World

@export var curr_room : Room
var player

func _ready():
	spawn_player()
	curr_room = get_tree().get_first_node_in_group("room")
	curr_room.entered_north.connect(change_room_scene_north)
	curr_room.entered_south.connect(change_room_scene_south)
	curr_room.entered_east.connect(change_room_scene_east)
	curr_room.entered_west.connect(change_room_scene_west)


func change_room_scene_north():
	pass

func change_room_scene_south():
	pass

func change_room_scene_east():
	pass

func change_room_scene_west():
	pass

func spawn_player():
	var player_scene = load("res://scenes/player/player.tscn")
	player = player_scene.instantiate()
	add_child(player)
