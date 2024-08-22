extends Control

class_name PlayerUI

@onready var main_scene = get_parent().get_parent()
@onready var health_bar : TextureProgressBar = get_node("HealthData/PlayerHealthProg")
@onready var j_icon : TextureRect = get_node("Input/JIcon")
@onready var k_icon : TextureRect = get_node("Input/KIcon")
@onready var key_count : Label = get_node("Key/KeyCount")
@onready var coin_count : Label = get_node("Money/CoinCount")

var player_health : int
var coins 

func _ready():
	pass

func _process(delta):
	update_health()
	update_equipped()
	update_coins()
	update_keys()


func update_health():
	player_health = main_scene.player.health
	health_bar.value = player_health

func update_equipped():
	j_icon.texture = main_scene.player.equipped_items.equipped_items[0].icon
	k_icon.texture = main_scene.player.equipped_items.equipped_items[1].icon

func update_coins():
	key_count.text = str(main_scene.player.coin)

func update_keys():
	key_count.text = str(main_scene.player.key)
