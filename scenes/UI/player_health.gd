extends TextureProgressBar

class_name PlayerHealth

@onready var main_scene = get_parent().get_parent().get_parent()
var player_health : int

func _ready():
	pass

func _process(delta):
	player_health = main_scene.player.health
	value = player_health

