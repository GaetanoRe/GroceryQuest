extends Control



func _ready():
	hide()

func _process(delta):
	
	if(Input.is_action_just_pressed("pause") and !global.is_paused):
		hide()
	
	if(Input.is_action_just_pressed("pause") and global.is_paused):
		show()
