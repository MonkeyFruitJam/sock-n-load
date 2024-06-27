extends Node2D

var current_state : State
var states: Dictionary = {}

func _ready():
	# register all states in the states dict
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.transitioned.connect(on_child_transition)
	current_state = states['idle']
	current_state.transitioned.emit(current_state, 'idle')
	
func _process(delta):
	if current_state:
		current_state.update(delta)
		
func _physics_process(delta):
	if current_state:
		current_state.physics_update(delta)

func on_child_transition(state, new_state_name):
	if state != current_state:
		return
	
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	
	if current_state:
		current_state.exit()
	
	new_state.enter()
	current_state = new_state