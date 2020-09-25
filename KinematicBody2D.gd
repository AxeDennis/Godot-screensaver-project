extends KinematicBody2D
	
var speed = Vector2()
var direction
	
func _ready():
	randomize()
	
func _physics_process(delta):
	if direction == 1:
		speed.x = 100
	elif direction == 2:
		speed.x = -100
	elif direction == 3:
		speed.y = 100
	elif direction == 4:
		speed.y = -100
	
	move_and_slide(speed)
	
func _on_Timer_timeout():
	direction = floor(rand_range(1,5))
	print(direction)
