extends Node

@export var damaging_node : AnimatableBody2D

func _on_damaging_area_body_entered(body):
	if body.name == "PlayerCharacter":
		body.get_node("Lifeforce").damage(10)
