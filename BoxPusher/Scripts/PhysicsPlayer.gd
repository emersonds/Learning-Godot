extends RigidBody2D

var hit_force : float = 50.0

func _process(delta):
	# Move player towards mouse on left click
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		# Direction to mouse
		var dir = global_position.direction_to(get_global_mouse_position())
		# Apply impulse force
		apply_impulse(dir * hit_force)
