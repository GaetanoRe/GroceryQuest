extends Node

class_name Room

var type
var room_name
@export var floor = 1
@export var doors : Array[Door]

signal opened_door


var item_taken : bool = false

var room_data : Resource

func _ready():
	type = 0
	add_to_group("room")


#func save_room():
	#room_data = RoomData.new()
	#room_data.name = self.name
	#room_data.floor = floor
	#room_data.room_type = type
	#var path = "res://resources/saved_floors/" + self.name + ".tres"
	#ResourceSaver.save(room_data, path)

#func load_room():
	#if(room_data != null):
		#var loaded_room = load("res://resources/saved_floors/" + self.name + ".tres")
		#floor = loaded_room.floor
		#type = loaded_room.type
		#room_name = loaded_room.name
	#else:
		#print("ERROR: ROOM CANNOT BE LOADED")
		
