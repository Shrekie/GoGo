extends AnimatableBody2D

var move_speed = 100.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var velocity = Vector2.from_angle(rotation) * move_speed * delta
	var collision = move_and_collide(velocity)
	
	if collision:
		if randi() % 2 == 0:
			rotation = \
			velocity.bounce(collision.get_normal()).angle() + PI / 8
		else:
			rotation = \
			velocity.bounce(collision.get_normal()).angle() - PI / 8
