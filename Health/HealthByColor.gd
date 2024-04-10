extends Node

@onready var lifeforced_node = $Lifeforce.lifeforced_node

func _on_lifeforce_damaged():
	lifeforced_node.modulate = \
	Color($Lifeforce.health/$Lifeforce.max_health, 
	$Lifeforce.health/$Lifeforce.max_health, \
	$Lifeforce.health/$Lifeforce.max_health)
