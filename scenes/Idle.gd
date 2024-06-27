extends State

@export var wait_time : float = 1
@onready var IdleTimer = find_child("IdleTimer")

func enter():
	super.enter()
	IdleTimer.wait_time = wait_time
	IdleTimer.timeout.connect(on_idle_timeout)
	IdleTimer.start()

func on_idle_timeout():
	var distance = debug_player.position.distance_to(bigfoot.position)
	if (distance > bigfoot.kick_detection_range):
		transitioned.emit(self, 'jump')
	else:
		transitioned.emit(self,'kick')
