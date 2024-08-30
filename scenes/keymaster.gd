extends Node

@export var Key_Items : Array[ItemData]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Key_Items.size() == 4):
		get_parent().open_final_door.emit()

func add(resource : ItemData):
	if(resource.item_type == 3):
		Key_Items.append(resource)
