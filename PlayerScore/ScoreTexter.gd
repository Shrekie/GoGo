extends Node

@export var point_emitters : Node
@export var score_text : Label

var total_score = 0

func _ready():
	for point_emitter in point_emitters.get_children():
		point_emitter.point_collected.connect(on_point_collected)
		
func on_point_collected():
	total_score += 1
	score_text.text = str(total_score)
