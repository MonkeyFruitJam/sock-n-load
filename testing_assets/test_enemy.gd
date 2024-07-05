extends Node2D

@onready var player = owner.find_child("PlayerPawn")
var player_pos = Vector2.ZERO

func _ready():
	player_pos = player.position
	
func _on_area_2d_body_entered(body):
	if (body == player):
		player.get_hit() # Replace with function body.
		player.position = player_pos

func get_hit():
	print("get shot")
