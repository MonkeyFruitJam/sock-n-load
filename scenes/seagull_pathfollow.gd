extends PathFollow2D

func _process(_delta):
	var move_speed = owner.move_speed
	progress_ratio += _delta * move_speed
	if (progress_ratio >= 1):
		progress_ratio = 0
