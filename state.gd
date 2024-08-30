extends Node

class_name State

signal transitioned

signal halt

@export var body : Body

func enter():
	print("Entering ", name)
	pass

func exit():
	pass

func process_physics(delta : float):
	body.move_and_slide()

func process_misc(delta : float):
	pass
