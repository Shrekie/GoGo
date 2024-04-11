extends Node

@export var lifeforced_node : Node2D

var max_health = 100.00
var health = 100.00

signal damaged()
signal died()

func damage(amount):
	if (health > 0):
		health -= amount
		damaged.emit()
		if (health <= 0):
			health = 0
			died.emit()

