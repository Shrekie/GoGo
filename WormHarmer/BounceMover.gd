extends Node

@export var bounce_moving_node : AnimatableBody2D

var move_speed = 300.0

func _process(delta):
	
	var velocity = \
	Vector2.from_angle(bounce_moving_node.rotation) * move_speed * delta
	
	var collision = bounce_moving_node.move_and_collide(velocity)
	
	if collision:
		if randi() % 2 == 0:
			bounce_moving_node.rotation = \
			velocity.bounce(collision.get_normal()).angle() + PI / 8
		else:
			bounce_moving_node.rotation = \
			velocity.bounce(collision.get_normal()).angle() - PI / 8
