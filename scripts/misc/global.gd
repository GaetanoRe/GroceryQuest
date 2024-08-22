extends Node

class_name Global

enum item_type {Weapon, Consumable, Tool}

enum weapon_type{Swing, Thrust, Ranged, None}

@onready var is_paused = false


func _ready():
	pass

func _process(delta):
	if((Input.is_action_just_pressed("pause") or Input.is_action_just_pressed("inventory")) and !is_paused):
		pause()
	elif((Input.is_action_just_pressed("pause") or Input.is_action_just_pressed("inventory")) and is_paused):
		unpause()

func pause():
	is_paused = true

func unpause():
	is_paused = false
