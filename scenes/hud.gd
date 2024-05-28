extends CanvasLayer

signal start_game

# Called when the node enters the scene tree for the first time.
func _ready():
	$Menu.hide()
	$HealthHearts.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("menu"):
		$Menu.show();
	if Input.is_action_pressed("close_menu"):
		$Menu.hide();

func _on_start_button_pressed():
	$StartButton.hide()
	$HealthHearts.show()
	start_game.emit()


func _on_restart_button_pressed():
	$Menu.hide();
	start_game.emit(); 


func _on_quit_button_pressed():
	get_tree().quit()
