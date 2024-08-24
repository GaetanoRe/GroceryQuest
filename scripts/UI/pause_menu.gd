extends Control

@onready var main_scene = get_parent().get_parent()

signal game_paused

func _ready():
	hide()
	

func _process(delta):
	if(main_scene.is_paused):
		show()
	else:
		hide()

func _on_resume_pressed():
	main_scene.is_paused = false

func _on_settings_pressed():
	pass # Replace with function body.

func _on_quit_pressed():
	main_scene.get_tree().quit()
