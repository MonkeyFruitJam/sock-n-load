extends Node2D

@export var wait_time : float = 3
@export var move_speed : float = 0.1
@export var move_length : float = 180
#@onready var player = owner.find_child("TestPlayer")
@onready var player = owner.find_child("PlayerPawn")
@onready var moveTimer = find_child("MoveTimer")
var initial_pos = Vector2.ZERO

func _ready():
	initial_pos = position

func _on_area_2d_body_entered(body):
	if (body == player):
		player.get_hit()
	elif (body.get_class() == "Ammunition"):
		position = initial_pos
		moveTimer.stop()
		moveTimer.start()
		
