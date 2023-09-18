extends Node3D

var score : int = 0
# "@export" is like [SerializeField], exports to Inspector
@export var score_text : Label

func increase_score(amount):
	# Increase score
	score += amount
	
	# Display score
	# str() combines strings
	score_text.text = str("Score: ", score)
