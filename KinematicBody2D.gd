extends KinematicBody2D
	
var speed = Vector2()
var direction
	
func _ready():
	randomize()
	
func _physics_process(delta):
	if direction == 1:
		speed.x = 50
	elif direction == 2:
		speed.x = -50
	elif direction == 3:
		speed.y = 50
	elif direction == 4:
		speed.y = -50
	
	move_and_slide(speed)
	
func _on_Timer_timeout():
	direction = floor(rand_range(1,5))

func _on_Area2D_area_entered(area):
	modulate = Color(255, 0, 0)
