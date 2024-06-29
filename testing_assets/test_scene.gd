extends Node2D

@onready var HealthHearts = $CanvasLayer/HealthHearts
@onready var player = $PlayerPawn
var t = 2
var cancontinue = true
# Called when the node enters the scene tree for the first time.
func _ready():
	HealthHearts.set_max_hearts(player.p_health / 2) # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t-=delta
	if (t<0 && cancontinue):
		HealthHearts.update_health(5)
		cancontinue = false
