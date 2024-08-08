extends Resource

class_name WeaponData

enum weapon_type{Swing, Thrust, Ranged}

@export var type : weapon_type
@export var sprite : SpriteFrames
@export var hitbox_dimensions : RectangleShape2D
@export var animation_time : float
