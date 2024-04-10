extends Node2D

@export var segment_leader : AnimatableBody2D

var worm_segment_scene = preload("res://WormHarmer/WormFollowingSegment.tscn")

var segments = []

func _ready():
	for i in range(6):
		var new_segment = worm_segment_scene.instantiate()
		var previous_segment : Node2D
		
		if i == 0:
			new_segment.get_node("FollowMover").to_follow = segment_leader
			
			new_segment.get_node("FollowMover").move_speed = \
			segment_leader.get_node("BounceMover").move_speed
		else:
			
			previous_segment = segments[i-1]
			
			new_segment.get_node("FollowMover").to_follow = previous_segment
			
			new_segment.get_node("FollowMover").move_speed = \
			previous_segment.get_node("FollowMover").move_speed
			
		segments.append(new_segment)
		add_child(new_segment)
	

