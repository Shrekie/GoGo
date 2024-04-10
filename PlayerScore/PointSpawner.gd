extends Area2D

var collectable_point_scene = preload("res://PlayerScore/CollectablePoint.tscn")

func _on_new_point_cooldown_timeout():
	
	if get_overlapping_bodies().is_empty():
		var new_collectable_point = collectable_point_scene.instantiate()
		new_collectable_point.global_position = global_position
		add_sibling(new_collectable_point)
