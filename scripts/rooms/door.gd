extends Node2D

class_name Door

@onready var room_scene = get_parent()



func _on_area_2d_body_entered(body):
	if(body is Player):
		if(global_position.y < 0 and global_position.x == 0):
			room_scene.entered_room.emit("north")
		elif(global_position.y >= 0 and global_position.x == 0):
			room_scene.entered_south.emit("south")
		elif(global_position.x < 0 and global_position.y == 0):
			room_scene.entered_west.emit("east")
		elif(global_position.x >= 0 and global_position.y == 0):
			room_scene.entered_east.emit("west")
