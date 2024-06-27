extends Node2D

@onready var debug_player = owner.find_child("TestPlayer")

func _on_area_2d_body_entered(body):
	if (body == debug_player):
		debug_player.velocity.y -= 1000
		debug_player.move_and_slide()
