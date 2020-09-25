extends Node2D

const window_size = Vector2(1024, 600)
var location = Vector2()
	
func _ready():
	randomize()

func _on_Timer_timeout():
	var scene = load("res://Kub.tscn")
	var cube = scene.instance()
	location.x = rand_range(1, window_size.x)
	location.y = rand_range(1, window_size.y)
	add_child(cube)
	cube.position = location
	
