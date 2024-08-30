extends Node

class_name Global

enum item_type {Weapon, Consumable, Tool, Key}
enum weapon_type {Swing, Thrust, Ranged, None}
enum enemy_type {Minion, MiniBoss, Boss}
enum enemy_attack_type{Shooting, Melee, Collide}

@onready var is_paused = false
signal game_paused
signal game_unpaused

func _ready():
	pass

func _process(delta):
	pass
