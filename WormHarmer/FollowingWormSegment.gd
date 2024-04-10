extends AnimatableBody2D

@export var to_follow : PhysicsBody2D

var rotation_speed = 20.0
var move_speed = 100.0
var spacing = 40.0

func _ready():
	pass

func _process(delta):
	
	var direction_to_target = (to_follow.global_position - global_position)
	var distance_to_target = direction_to_target.length()
	
	var current_direction = Vector2.from_angle(rotation)
	
	var angle_to_target = \
	current_direction.angle_to(direction_to_target.normalized())
	
	var velocity = current_direction * move_speed * delta
	
	rotation += \
	clamp(angle_to_target, -rotation_speed * delta, rotation_speed * delta)
	
	if distance_to_target > spacing:
		move_and_collide(velocity)
