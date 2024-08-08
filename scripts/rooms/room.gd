extends Node

class_name Room

var type
var room_name
@export var floor = 1
@export var room_north : PackedScene
@export var room_south : PackedScene
@export var room_east : PackedScene
@export var room_west : PackedScene

signal entered_north
signal entered_south
signal entered_east
signal entered_west


var item_taken : bool = false

var room_data : Resource

func _ready():
	type = 0
	


func save_room():
	room_data = RoomData.new()
	room_data.name = self.name
	room_data.floor = floor
	room_data.room_type = type
	room_data.room_north = room_north
	room_data.room_south = room_south
	room_data.room_east = room_east
	room_data.room_west = room_west
	var path = "res://resources/saved_floors/" + self.name + ".tres"
	ResourceSaver.save(room_data, path)

func load_room():
	if(room_data != null):
		var loaded_room = load("res://resources/saved_floors/" + self.name + ".tres")
		floor = loaded_room.floor
		type = loaded_room.type
		room_north = loaded_room.room_north
		room_south = loaded_room.room_south
		room_east = loaded_room.room_east
		room_west = loaded_room.room_west
		room_name = loaded_room.name
	else:
		print("ERROR: ROOM CANNOT BE LOADED")
		

func load_new_room(dir : String):
	var dir_low = dir.to_lower()
	if(dir_low == "north"):
		entered_north.emit()
	if(dir_low == "south"):
		entered_south.emit()
	if(dir_low == "east"):
		entered_east.emit()
	if(dir_low == "west"):
		entered_west.emit()

