extends Node2D

@onready var HealthHearts = $CanvasLayer/HealthHearts
@onready var player = $PlayerPawn

# Called when the node enters the scene tree for the first time.
func _ready():
	HealthHearts.set_max_hearts(player.p_health / 2) # Setting health for max hearts
