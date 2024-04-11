extends Node

@export var new_game_button : Button
@export var mortal_character: CharacterBody2D

func _ready():
	mortal_character.get_node("Lifeforce").died.connect(_on_mortal_character_died)
	new_game_button.button_up.connect(_on_button_button_up)
	
func _on_mortal_character_died():
	new_game_button.show()

func _on_button_button_up():
	get_tree().reload_current_scene()
