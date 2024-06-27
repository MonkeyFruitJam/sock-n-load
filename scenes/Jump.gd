extends State

@onready var start_point : Vector2
@onready var end_point : Vector2

var t = 0.0
func _bezier_jump(p0 : Vector2, p1 : Vector2, t : float):
	var mid = (p0 + p1) / 2
	mid.y -= bigfoot.jump_height
	var q0 = p0.lerp(mid,t)
	var q1 = mid.lerp(p1,t)
	var r = q0.lerp(q1,t)
	return r

func enter():
	super.enter()
	start_point = bigfoot.position
	end_point = debug_player.position

func physics_update(delta):
	bigfoot.position = _bezier_jump(start_point, end_point, t)
	t+=delta
	if (t > 1):
		t = 0.0
		transitioned.emit(self,'idle')
