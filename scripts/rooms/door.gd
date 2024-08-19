extends Node2D

class_name Door

@export var next_room : String

@export var locked_door : bool

@export var next_room_loc : Vector2

@onready var sprite = $DoorSprite

@onready var lock = $LockSprite

@onready var world = get_parent().get_parent()

func _ready():
	if(locked_door):
		lock.show()
	else:
		lock.hide()


func _on_area_2d_body_entered(body):
	if(body is Player and !locked_door):
		sprite.play("open")
		world.player_loc_change.emit(next_room_loc)
		await get_tree().create_timer(0.5)
		world.room_change.emit(next_room)
	elif(body is Player and body.key > 0 and locked_door):
		locked_door = false
