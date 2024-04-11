extends Node

@export var lifeforce : Node
@onready var lifeforced_node = lifeforce.lifeforced_node

func _on_lifeforce_damaged():
	modulate_color()

func _on_lifeforce_healed():
	modulate_color()
	
func modulate_color():
	lifeforced_node.modulate = \
	Color(lifeforce.health/lifeforce.max_health, 
	lifeforce.health/lifeforce.max_health, \
	lifeforce.health/lifeforce.max_health)
