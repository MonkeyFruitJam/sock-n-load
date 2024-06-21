extends PathFollow2D

var canMove = false
@onready var moveTimer = $"../../MoveTimer"

func _ready():
	moveTimer.wait_time = owner.wait_time
	moveTimer.start()
	
func _process(_delta):
	var move_speed = owner.move_speed
	if (canMove):
		progress_ratio += _delta * move_speed
	if (progress_ratio >= 1):
		canMove = false
		moveTimer.start()
		progress_ratio = 0
		
func _on_timer_timeout():
	if (!canMove):
		canMove = true
	moveTimer.stop()
