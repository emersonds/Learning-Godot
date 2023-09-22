extends Area2D

var bob_height: float = 5.0
var bob_speed: float = 5.0

@onready var start_y: float = global_position.y
var t: float = 0.0 # Time incrementer; timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t += delta
	
	# Create a sin wave at rate t * bob_speed
	# + 1 and / 2 at the end changes sin range from -1 to 1, to 0 to 1
	var d = (sin(t * bob_speed) + 1) / 2
	
	global_position.y = start_y + (d * bob_height)


func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.add_score(1)
		queue_free() # Destroy coin on collect
