extends Node2D

@onready var debug_player = owner.find_child("TestPlayer")
@export var jump_velocity = 1000

func _on_area_2d_body_entered(body):
	if (body == debug_player):
		debug_player.velocity.y -= jump_velocity
		debug_player.move_and_slide()
