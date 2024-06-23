extends Node2D

@export var move_length : float = 100 
@export var lowest_point : float = 200
@export var move_speed : float = 0.5

var t = 0.0
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
	t+=delta
	position = _bezier_curve(start_point, mid_point, end_point, t)
	if t>=1:
		t = 0.0

func _on_area_2d_body_entered(body):
	if (body.has_method("_get_hit")):
		body._get_hit() # Replace with function body.
