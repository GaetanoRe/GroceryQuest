extends TextureProgressBar

class_name PlayerHealth

var player : Player

func _ready():
	player = get_tree().get_first_node_in_group("player")
	

func _process(delta):
	value = player.health

