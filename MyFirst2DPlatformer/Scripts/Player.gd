extends CharacterBody2D

var move_speed: float = 100.0
var jump_force: float = 180.0
var gravity: float = 600.0
var score: int = 0

@onready var score_text: Label = get_node("CanvasLayer/ScoreText")

func _physics_process(delta):
	# Apply gravity if not on floor
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Set velocity to 0 if no input
	velocity.x = 0
	
	# Get horizontal velocity from input
	if Input.is_action_pressed("move_left"):
		velocity.x = -move_speed
		$Sprite.set_flip_h(true)
	if Input.is_action_pressed("move_right"):
		velocity.x = move_speed
		$Sprite.set_flip_h(false)
	
	# Jump when input received
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
	
	# Apply velocity and move
	move_and_slide()
	
	if global_position.y > 100:
		game_over()

func add_score(amount):
	score += amount
	score_text.text = str("Score: ", score)

func game_over():
	get_tree().reload_current_scene()
