extends Node2D

@export var segment_leader : AnimatableBody2D

var worm_segment_scene = preload("res://WormHarmer/WormFollowingSegment.tscn")

var segments = []

func _ready():
	add_new_segments(0, 6)

func _on_new_segment_timer_timeout():
	add_new_segments(segments.size(), 1)
	
func add_new_segments(add_from_index, amount_to_add):
	
	for i in range(amount_to_add):
		
		var new_segment = worm_segment_scene.instantiate()
		var previous_segment : Node2D
		
		if (add_from_index + i) == 0:
			new_segment.get_node("FollowMover").to_follow = segment_leader
			
			new_segment.get_node("FollowMover").move_speed = \
			segment_leader.get_node("BounceMover").move_speed
		else:
			
			previous_segment = segments[(add_from_index + i) - 1]
			
			new_segment.get_node("FollowMover").to_follow = previous_segment
			
			new_segment.position = previous_segment.position
			
			new_segment.get_node("FollowMover").move_speed = \
			previous_segment.get_node("FollowMover").move_speed
			
		segments.append(new_segment)
		add_child(new_segment)
