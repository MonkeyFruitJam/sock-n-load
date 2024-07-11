extends TileMap

@onready var test_player = $TestPlayer

func _on_death_zone_body_entered(body):
	if (body == test_player):
		body.get_hit()


func _on_goal_post_body_entered(body):
	if (body == test_player):
		print("level won") # Replace with function body.
