extends Node

class_name Collectables

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	if(body.is_in_group("player")):
		await get_tree().create_timer(0.1)
		queue_free()
