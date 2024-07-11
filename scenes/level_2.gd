extends TileMap

@onready var test_player = $TestPlayer

func _on_death_zone_1_body_entered(body):
	if (body == test_player):
		body.get_hit()

func _on_launch_pad_body_entered(body):
	if (body == test_player && !body.is_on_floor()):
		body.velocity.y -= 700# Replace with function body.


func _on_goal_post_body_entered(body):
	if (body == test_player):
		print("level won") #
