extends KinematicBody2D
	
onready var nr_of_infected = get_node("../Infected")
onready var nr_of_alive = get_node("../Alive")
onready var nr_of_healthy = get_node("../Healthy")
onready var nr_of_immune = get_node("../Immune")
onready var nr_of_dead = get_node("../Dead")

var speed = 75
var velocity = Vector2()
var direction = 0
	
var rull = 100
var infect
	
func _ready():
	randomize()
	
	rull = randi()%100+1
	if rull < 101 && rull > 94:
		infect = 1 #IMMUNE
		$Sprite.self_modulate = Color(0,0,255)
		nr_of_immune.immune += 1
	elif rull < 95 && rull > 15:
		infect = 2 #HEALTHY
		$Sprite.self_modulate = Color(0,255,0)
		nr_of_healthy.healthy += 1
	elif rull < 16 && rull > 0:
		infect = 3 #INFECTED
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
					nr_of_infected.infected += 1
					nr_of_healthy.healthy -= 1
	
	
	
func _on_Timer2_timeout():
	if infect == 3:
		rull = randi()%100+1
		if rull < 60:
			infect = 4 #DEAD
			$Sprite.self_modulate = Color(0,0,0)
			speed = 0
			nr_of_alive.alive -= 1
			nr_of_dead.dead += 1
			nr_of_infected.infected -= 1
			$Sprite.hide()
			$Gravestone.show()
		elif rull > 61 && rull < 84:
			infect = 3
			$Sprite.self_modulate = Color(255,0,0)
		elif rull > 85 && rull < 90:
			infect = 2
			$Sprite.self_modulate = Color(0,255,0)
			nr_of_healthy.healthy += 1
			nr_of_infected.infected -= 1
		elif rull > 91:
			infect = 1
			$Sprite.self_modulate = Color(0,0,255)
			nr_of_immune.immune += 1
			nr_of_infected.infected -= 1

