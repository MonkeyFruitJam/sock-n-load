extends Path2D

@onready var move_curve = Curve2D.new() 

# Calculate bezier_curve through 3 points
func _bezier_curve(p0: Vector2, p1: Vector2, p2: Vector2, t: float):
	var q0 = p0.lerp(p1,t)
	var q1 = p1.lerp(p2,t)
	var r = q0.lerp(q1,t)
	return r
# Called when the node enters the scene tree for the first time.
func _ready():
	var start_point = Vector2.ZERO
	var end_point = Vector2(0,owner.move_length)
	var mid_point = Vector2((start_point.x + end_point.x)/2, owner.lowest_point)

