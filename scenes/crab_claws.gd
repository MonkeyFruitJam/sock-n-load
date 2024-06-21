extends Node2D

@export var wait_time : float = 3
@export var move_speed : float = 0.1
@onready var test_player = owner.find_child("TestPlayer")

func _on_area_2d_body_entered(body):
	if (body == test_player):
		print("get hit") # this should be change to make player lose health
		# implement player get hit back, this function maybe should be in player script
		
