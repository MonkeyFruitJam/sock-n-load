extends Node2D
class_name Bullet
var speed : float = 500
#right is true; left is false
var direction_right : bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite2D.flip_v = !direction_right
	if (direction_right):
		position.x += speed * delta
	else:
		position.x -= speed * delta

func _on_area_2d_body_entered(body):
	if (body.has_method("get_hit")):
		body.get_hit() # Replace with function body.
	queue_free()
