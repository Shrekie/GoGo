extends Area2D

var collectable_point_scene = preload("res://PlayerScore/CollectablePoint.tscn")

signal point_collected()

func _ready():
	generate_point.call_deferred()

func _on_new_point_cooldown_timeout():
	generate_point()
	
func _on_collectable_point_collected():
	point_collected.emit()
	$NewPointCooldown.start()
		
func generate_point():
	if get_overlapping_bodies().is_empty():
		var new_collectable_point = collectable_point_scene.instantiate()
		
		new_collectable_point.global_position = global_position
		
		new_collectable_point.get_node("PointReceiver") \
		.point_collected.connect(_on_collectable_point_collected)
		
		add_sibling(new_collectable_point)
