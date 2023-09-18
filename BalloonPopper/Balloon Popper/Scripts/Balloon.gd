extends Area3D

@export var clicks_to_pop : int = 5
@export var size_increase : float = 0.2
@export var score_to_give : int = 1


func _on_input_event(camera, event, position, normal, shape_idx):
	# Increase size on mouse click
	if (event is InputEventMouseButton
		and event.button_index == MOUSE_BUTTON_LEFT
		and event.pressed):
			# Scale balloon
			scale += Vector3.ONE * size_increase
			# Subtract click
			clicks_to_pop -= 1
			
			# Pop balloon at max size
			if clicks_to_pop == 0:
				# Access root node to increase score
				get_node("/root/Main").increase_score(score_to_give)
				# Destroy balloon
				queue_free()
