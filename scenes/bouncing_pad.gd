extends Node2D

#activate only for debug
@onready var player = owner.find_child("TestPlayer")
#@onready var player = owner.find_child("PlayerPawn")
@export var jump_velocity : int = 1000

@onready var cooldown_timer = find_child("CooldownTimer")
@export var cooldown_time : float = 1

var bouncing_pad_passive = preload("res://assets/bouncing_pad.png")
var bouncing_pad_active = preload("res://assets/bouncing_pad_actived.png")

func _ready():
	cooldown_timer.wait_time = cooldown_time
	
func _on_bounce_area_body_entered(body):
	if (body == player && cooldown_timer.is_stopped()):
		player.velocity.y -= jump_velocity
		player.move_and_slide()# Replace with function body.
		find_child("Sprite2D").texture = bouncing_pad_active
		cooldown_timer.start()

func _on_cooldown_timer_timeout():
	find_child("Sprite2D").texture = bouncing_pad_passive # Replace with function body.
