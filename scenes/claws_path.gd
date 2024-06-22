extends Path2D

@onready var move_curve = Curve2D.new() 
# Called when the node enters the scene tree for the first time.
func _ready():
	var p0 = Vector2.ZERO
	var p1 = Vector2(0,-owner.move_length)
	print(p1)
	var p2 = Vector2(p0)
	move_curve.add_point(p0)
	move_curve.add_point(p1)
	move_curve.add_point(p2)
	move_curve.bake_interval = 5
	set_curve(move_curve)
