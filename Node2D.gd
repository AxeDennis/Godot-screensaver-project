extends Node2D

const window_size = Vector2(1024, 600)
var location = Vector2()
var amount = 1
	
func _ready():
	randomize()

	while amount < 50:
		var scene = load("res://Kub.tscn")
		var cube = scene.instance()
		location.x = rand_range(1, window_size.x)
		location.y = rand_range(1, window_size.y)
		amount += 1
		add_child(cube)
		cube.position = location
		print("current: ", amount)
