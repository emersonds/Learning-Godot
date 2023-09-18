extends Node2D

@export var spawn_count : int = 200
# Creates a reference to star object and preloads it
var star_object = preload("res://Objects/Star.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in spawn_count:
		# Instantiate a new star
		var star = star_object.instantiate()
		
		# Add as a child node of Main
		add_child(star)
		
		# Place star at a random int position in the level
		star.position.x = randi_range(-280, 280)
		star.position.y = randi_range(-150, 150)
		
		# Make star a random float size
		var star_size = randf_range(0.25, 1.5)
		star.scale.x = star_size
		star.scale.y = star_size
