extends KinematicBody2D
	
onready var nr_of_infected = get_node("../Infected")

var speed = 100
var velocity = Vector2()
var direction = 0
	
var rull = 100
var infect
	
func _ready():
	randomize()
	
	rull = randi()%100
	if rull < 100 && rull > 94:
		infect = 1 
		$Sprite.self_modulate = Color(0,0,255)
	elif rull < 95 && rull > 10:
		infect = 2
		$Sprite.self_modulate = Color(0,255,0)
	elif rull < 11:
		infect = 3
		$Sprite.self_modulate = Color(255,0,0)
		$"Timer2".start()
		nr_of_infected.infected += 1
	
	
func _process(_delta):
	
	velocity = Vector2()
	if direction == 1:
		velocity.x += 1
	if direction == 2:
		velocity.x -= 1
	if direction == 3:
		velocity.y += 1
	if direction == 4:
		velocity.y -= 1
	if direction == 5:
		velocity.x += 1
		velocity.y += 1
	if direction == 6:
		velocity.x -= 1
		velocity.y -= 1
	if direction == 7:
		velocity.x += 1
		velocity.y -= 1
	if direction == 8:
		velocity.x -= 1
		velocity.y += 1
	
	velocity = velocity.normalized()*speed
	
func _physics_process(_delta):
	move_and_slide(velocity)
	
	
func _on_Timer_timeout():
	direction = randi()%8+1
	
	
func _on_Area2D_body_entered(area):
	if area.get_class() == "KinematicBody2D":
		if area.infect == 3:
			if infect == 2:
				rull = randi()%2+1
				if rull == 1:
					infect = 3
					$Sprite.self_modulate = Color(255,0,0)
					$"Timer2".start()
	
	
	
func _on_Timer2_timeout():
	if infect == 3:
		rull = randi()%100+1
		if rull > 0 && rull < 5:
			infect = 4
			$Sprite.self_modulate = Color(0,0,0)
			speed = 0
		elif rull > 6 && rull < 59:
			infect = 3
			$Sprite.self_modulate = Color(255,0,0)
		elif rull > 60 && rull < 89:
			infect = 2
			$Sprite.self_modulate = Color(0,255,0)
		elif rull > 90 && rull < 100:
			infect = 1
			$Sprite.self_modulate = Color(0,0,255)

