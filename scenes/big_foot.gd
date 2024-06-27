extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var kick_speed : float = 4000
@export var jump_height : float = 200
@export var boss_max_health : float = 500
@export var kick_detection_range : float = 200

var boss_health : float

func _ready():
	var healthbar = find_child('ProgressBar')
	if (healthbar):
		healthbar.max_value = boss_health
		healthbar.value = boss_health
	boss_health = boss_max_health
		
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()

func _on_get_hit():
	boss_health -= 50
	if (boss_health <= 0):
		var cur_state = $FSM.current_state
		cur_state.transitioned.emit(cur_state, 'death')
