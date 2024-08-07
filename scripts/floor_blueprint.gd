extends Resource

class_name FloorBlueprint

@export var num_rooms : int 
@export var rooms : Array

func _ready():
	pass

func gen_floor_layout():
	var rooms_left = 0
	
	# picks which rooms to use
	while(rooms_left != num_rooms):
		pass
	
	# assigns each room to eachother via room data resource, 
	# if the rooms cannot connect, the room is deleted
	
