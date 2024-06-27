extends State

func physics_update(delta):
	bigfoot.velocity = bigfoot.position.direction_to(debug_player.position).normalized() * bigfoot.kick_speed
	bigfoot.move_and_slide()
	transitioned.emit(self,'idle')
