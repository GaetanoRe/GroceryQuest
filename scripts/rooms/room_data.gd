extends Resource


class_name RoomData

enum room_type {Regular, Item , Switch ,Passage}

# Name of room
@export var name : String
@export var type : room_type
@export var floor : int
@export var doors : Array

# Room Specific data

# Item and Passage
@export var has_item : bool
@export var item_taken : bool

# Switch
@export var switch_activated : bool

#Passage
@export var boss_defeated : bool
