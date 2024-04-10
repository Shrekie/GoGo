extends Node

@export var to_follow : AnimatableBody2D
@export var follower : AnimatableBody2D

var rotation_speed = 20.0
var move_speed = 100.0
var spacing = 40.0

func _ready():
	pass

func _process(delta):
	
	var direction_to_target = (to_follow.global_position - \
	follower.global_position)
	
	var distance_to_target = direction_to_target.length()
	
	var current_direction = Vector2.from_angle(follower.rotation)
	
	var angle_to_target = \
	current_direction.angle_to(direction_to_target.normalized())
	
	var velocity = current_direction * move_speed * delta
	
	follower.rotation += \
	clamp(angle_to_target, -rotation_speed * delta, rotation_speed * delta)
	
	if distance_to_target > spacing:
		follower.move_and_collide(velocity)
