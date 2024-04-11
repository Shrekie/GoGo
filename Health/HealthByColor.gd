extends Node

@export var lifeforce : Node
@onready var lifeforced_node = lifeforce.lifeforced_node

func _on_lifeforce_damaged():
	lifeforced_node.modulate = \
	Color(lifeforce.health/lifeforce.max_health, 
	lifeforce.health/lifeforce.max_health, \
	lifeforce.health/lifeforce.max_health)
