extends Node2D

var score : int = 75
var moveSpeed : float = 2.53
var gameOver : bool = true
var ability : String = "slash"

# Called when the node enters the scene tree for the first time.
# "Start()" func
func _ready():
#	if score > 80:
#		print("A")
#	elif score > 60:
#		print("B")
#	elif score > 30:
#		print("C")
#	else:
#		print("D")

	_welcome_message()
	var result = _add(10, 25)
	print("Result: ", result)


# Called every frame. 'delta' is the elapsed time since the previous frame.
# "Update()" func
func _process(delta):
	pass # empty function body


func _welcome_message():
	print("The function was called!")


func _add(a, b):
	var sum = a + b
	return(sum)
