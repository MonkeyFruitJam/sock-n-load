extends Node2D

@export var wait_time : float = 3
@export var move_speed : float = 0.1
@export var move_length : float = 180
@onready var test_player = owner.find_child("TestPlayer")
@onready var moveTimer = find_child("MoveTimer")

func _on_area_2d_body_entered(body):
	if (body == test_player):
		print("hit player") # this should be change to make player lose health
	elif (body.get_class() == "Ammunition"):
		print("get hit, need to reset timer")
		
