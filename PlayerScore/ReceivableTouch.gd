extends Node

@export var receiving_area : Area2D

signal point_collected()

func _ready():
	receiving_area.body_entered.connect(_on_receiving_area_body_entered)

func _on_receiving_area_body_entered(body):
	if body.name == "PlayerCharacter":
		point_collected.emit()
		receiving_area.queue_free()
