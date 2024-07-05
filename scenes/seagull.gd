extends Node2D

@export var move_length : float = 100 
@export var lowest_point : float = 200
@export var move_speed : float = 0.5

@onready var debug_player = owner.find_child("TestPlayer")
@onready var bullets = owner.find_children("Bullet*")

var time_sample = 0.0
var start_point : Vector2
var end_point : Vector2
var mid_point : Vector2

func _ready():
	start_point = position
	end_point = Vector2(start_point.x + move_length,start_point.y)
	mid_point = Vector2((start_point.x + end_point.x)/2,start_point.y + lowest_point)
	
func _bezier_curve(p0: Vector2, p1: Vector2, p2: Vector2, t : float):
	var q0 = p0.lerp(p1,t)
	var q1 = p1.lerp(p2,t)
	var r = q0.lerp(q1,t)
	return r

func _physics_process(delta):
	time_sample+=delta
	position = _bezier_curve(start_point, mid_point, end_point, time_sample)
	if time_sample>=1:
		time_sample = 0.0

func _on_area_2d_body_entered(body):
	if (body == debug_player):
		debug_player._get_hit() # Replace with function body.

func get_hit():
	queue_free()
