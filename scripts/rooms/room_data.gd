extends Resource


class_name RoomData

enum room_type {Regular, Item, Passage}

# Name of room
@export var name : String
@export var type : room_type

# References to rooms adjacent to this one
@export var room_north : PackedScene
@export var room_south : PackedScene
@export var room_east : PackedScene
@export var room_west : PackedScene

# Room Specific Variables
@export var room_pos : Vector2
@export var room_length : float
@export var room_width : float





