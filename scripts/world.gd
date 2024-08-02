extends Node2D


class_name World

func _ready():
	var player_scene = load("res://scenes/player/player.tscn")
	var player = player_scene.instantiate()
	add_child(player)
