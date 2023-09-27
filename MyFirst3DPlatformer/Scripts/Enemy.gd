extends Area3D

@export var move_speed: float = 1.5
@export var move_dir: Vector3

var start_pos: Vector3
var target_pos: Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	start_pos = global_position
	target_pos = start_pos + move_dir


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Move enemy to target pos
	global_position = global_position.move_toward(target_pos, move_speed * delta)
	
	# Flip target_pos when enemy reaches it
	if global_position == target_pos:
		if global_position == start_pos:
			target_pos = start_pos + move_dir
		else:
			target_pos = start_pos


func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.game_over()
