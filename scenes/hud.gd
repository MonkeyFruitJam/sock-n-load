extends CanvasLayer

signal start_game

var isPaused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	# Need to be listening always for input so can use button to open/close Menu
	process_mode = Node.PROCESS_MODE_ALWAYS

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(isPaused):
		$Menu/GameStartButton.text="Restart"
	else:
		$Menu/GameStartButton.text="Start Game"
	if Input.is_action_just_released("menu"):
		if(isPaused):
			$Menu.hide();
			isPaused = false
			get_tree().paused = false
		else:
			$Menu.show();
			isPaused = true
			get_tree().paused = true


func _on_quit_button_pressed():
	get_tree().quit()

func _on_gamestart_button_pressed():
	if(isPaused):
		isPaused = false
		get_tree().paused=false
	start_game.emit() 
