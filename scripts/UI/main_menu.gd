extends Control


func _on_play_game_pressed():
	var main_scene = load("res://scenes/main_scene.tscn")
	get_tree().change_scene_to_packed(main_scene)


func _on_quit_pressed():
	get_tree().quit()
