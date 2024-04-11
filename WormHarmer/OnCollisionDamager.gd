extends Node

@export var damaging_area : Area2D

func _ready():
	damaging_area.body_entered.connect(_on_damaging_area_body_entered)

func _on_damaging_area_body_entered(body):
	if body.name == "PlayerCharacter":
		body.get_node("Lifeforce").damage(15)
