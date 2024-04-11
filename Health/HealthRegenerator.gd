extends Node

@export var lifeforce : Node

func _on_regeneration_timer_timeout():
	lifeforce.heal(4)
