extends State

@export var wait_time : float = 1
@onready var IdleTimer = find_child("IdleTimer")

func enter():
	super.enter()
	IdleTimer.wait_time = wait_time
	IdleTimer.timeout.connect(on_idle_timeout)
	IdleTimer.start()

func on_idle_timeout():
	var distance = debug_player.global_position.distance_to(bigfoot.global_position)
	if (distance > 200):
		transitioned.emit(self, 'jump')
	else:
		transitioned.emit(self,'kick')
