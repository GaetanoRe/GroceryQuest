extends CharacterBody2D

var speed = 100
var player_chase = false
var player = null
var health = 100
var player_in_range = false



func _physics_process(delta):
	deal_with_damage()
	
	if player_chase:
		position += (player.position - position)/speed



func _on_detection_area_body_entered(body):
	player = body
	player_chase = true
	

func _on_detection_area_body_exited(body):
	player = null
	player_chase = false


func enemy():
	pass


func _on_enemy_hitbox_body_entered(body):
	if body.has_method("player"):
		player_in_range = true


func _on_enemy_hitbox_body_exited(body):
	if body.has_method("player"):
		player_in_range = false
		
func deal_with_damage():
	if player_in_range and global.player_current_attack == true:
		health = health - 20
		print("slimehealth =", health)
		if health <= 0:
			self.queue_free()

