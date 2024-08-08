extends Node2D


class_name World

@export var curr_room : Room
var player : Player

func _ready():
	spawn_player()
	curr_room = get_tree().get_first_node_in_group("room")
	curr_room.entered_north.connect(change_room_scene_north)
	curr_room.entered_south.connect(change_room_scene_south)
	curr_room.entered_east.connect(change_room_scene_east)
	curr_room.entered_west.connect(change_room_scene_west)


func change_room_scene_north():
	curr_room.get_tree().change_scene_to_packed(curr_room.room_north)
	player.global_position 

func change_room_scene_south():
	curr_room.get_tree().change_scene_to_packed(curr_room.room_south)

func change_room_scene_east():
	curr_room.get_tree().change_scene_to_packed(curr_room.room_east)

func change_room_scene_west():
	curr_room.get_tree().change_scene_to_packed(curr_room.room_west)

func spawn_player():
	var player_scene = load("res://scenes/player/player.tscn")
	player = player_scene.instantiate()
	add_child(player)
