extends TileMap

@onready var test_player = $TestPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	test_player.remove_child(test_player.find_child("Camera2D")) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
