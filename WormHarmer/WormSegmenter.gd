extends Node2D

@export var segment_leader : AnimatableBody2D

var worm_segment_scene = preload("res://WormHarmer/WormFollowingSegment.tscn")

var segments = []

func _ready():
	for i in range(16):
		var new_segment = worm_segment_scene.instantiate()
		var previous_segment : Node2D
		
		if i == 0:
			new_segment.get_node("FollowMover").to_follow = segment_leader
		else:
			previous_segment = segments[i-1]
			new_segment.get_node("FollowMover").to_follow = previous_segment
			
		segments.append(new_segment)
		add_child(new_segment)
	

