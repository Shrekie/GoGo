extends Node

@export var input_moving_node: CharacterBody2D
@export var input_moving_sprite: AnimatedSprite2D

@export var max_speed = 400
@export var acceleration = 1000
@export var friction = 100

func _physics_process(delta):
	movement_actions(delta)
	
func movement_actions(delta):
	
	var input : Vector2
	
	input.x = int(Input.is_action_pressed("move_right"))
	input.x = input.x - int(Input.is_action_pressed("move_left"))
	input.y = int(Input.is_action_pressed("move_down"))
	input.y = input.y - int(Input.is_action_pressed("move_up"))
	
	input = input.normalized()
	
	var velocity = input_moving_node.velocity
	var rotation = input_moving_node.rotation
	
	if input == Vector2.ZERO:
		# Add friction to velocity in cycles with no input
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * acceleration * delta)
		velocity = velocity.limit_length(max_speed)
	
	if input != Vector2.ZERO:
		input_moving_sprite.play("moving")
	elif not input_moving_sprite.is_playing():
		input_moving_sprite.play("still")
		
	if velocity != Vector2.ZERO:
		rotation = velocity.angle()

	input_moving_node.velocity = velocity
	input_moving_node.rotation = rotation
		
	input_moving_node.move_and_slide()
