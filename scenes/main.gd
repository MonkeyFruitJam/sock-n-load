extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	$HUD/HealthHearts.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hud_start_game():
	#if($HUD/StartButton.is_visible_in_tree()):
		#$HUD/StartButton.hide()
	if($HUD/Menu.is_visible_in_tree()):
		$HUD/Menu.hide()
	$HUD/HealthHearts.show()
	# TODO: When scenes for levels get put in start first level here
