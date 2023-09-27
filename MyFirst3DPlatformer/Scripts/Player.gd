extends CharacterBody3D

var move_speed: float = 4.0
var jump_force: float = 7
var gravity: float = 25.0
var score: int

var facing_angle: float

@onready var model: MeshInstance3D = get_node("Model")

func _physics_process(delta):
	# apply gravity in air
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_force
	
	# get keyboard input and set move direction
	var input = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var dir = Vector3(input.x, 0, input.y)
	
	# set velocity
	velocity.x = dir.x * move_speed
	velocity.z = dir.z * move_speed
	
	# move player
	move_and_slide()
	
	# If moving, change facing angle
	# input.length is > 0 when moving
	if input.length() > 0:
		facing_angle = Vector2(input.y, input.x).angle()
	
	model.rotation.y = lerp_angle(model.rotation.y, facing_angle, 0.3)
	
	if global_position.y < -5:
		game_over()

func game_over():
	get_tree().reload_current_scene()

func add_score(amount):
	score += amount
	print(score)
