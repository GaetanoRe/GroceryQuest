extends Node

class_name Global

enum item_type {Weapon, Consumable, Tool}
enum weapon_type {Swing, Thrust, Ranged, None}

@onready var is_paused = false
signal game_paused
signal game_unpaused

func _ready():
	pass

func _process(delta):
	pass
