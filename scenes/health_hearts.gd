extends HBoxContainer

@onready var HeartGuiClass = preload("res://scenes/heart_gui.tscn")

var heart_full = preload("res://assets/redHeart.png")
var heart_empty = preload("res://assets/purpleHeart.png")
var heart_half = preload("res://assets/whiteHeart.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_max_hearts(max: int):
	for i in range(max):
		var heart = HeartGuiClass.instantiate()
		add_child(heart)

func update_health(value : float):
	for i in range(get_child_count()):
		if value > i * 2 + 1:
			get_child(i).get_child(0).texture = heart_full
		elif value > i * 2:
			get_child(i).get_child(0).texture = heart_half
		else:
			get_child(i).get_child(0).texture = heart_empty
	
	
