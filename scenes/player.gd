extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var p_health : int = 6
@onready var current_health : int = p_health
@onready var healthHUD = owner.find_child("HealthHearts")
@onready var sprite2D = $Sprite2D
@export var bullet_speed : float = 1000
var player_direction = true # true is right, false is left
const bullet = preload("res://scenes/bullet.tscn")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		sprite2D.flip_h = (direction < 0)
		player_direction = (direction > 0)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if Input.is_action_just_pressed("shoot"):
		var new_bullet = bullet.instantiate()
		new_bullet.speed = bullet_speed
		new_bullet.direction_right = player_direction
		if (new_bullet.direction_right):
			new_bullet.position = $AmmunitionSpawnPoint.position
		else:
			new_bullet.position = Vector2(-$AmmunitionSpawnPoint.position.x, $AmmunitionSpawnPoint.position.y)
		add_child(new_bullet)
		
func get_hit():
	p_health -= 1
	healthHUD.update_health(p_health)
	
